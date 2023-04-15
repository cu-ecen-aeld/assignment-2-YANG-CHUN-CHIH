#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

#define LOG_TAG "writer"

int main(int argc, char *argv[]) {
    openlog(LOG_TAG, LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Usage: %s <text> <filename>", argv[0]);
        exit(EXIT_FAILURE);
    }

    char *filename = argv[1];
    char *text = argv[2];

    FILE *fp = fopen(filename, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "Failed to open file %s", filename);
        exit(EXIT_FAILURE);
    }

    fprintf(fp, "%s\n", text);

    if (fclose(fp) != 0) {
        syslog(LOG_ERR, "Failed to close %s", filename);
        exit(EXIT_FAILURE);
    }

    syslog(LOG_DEBUG, "Writing %s to %s", text, filename);

    closelog();

    return 0;
} 
