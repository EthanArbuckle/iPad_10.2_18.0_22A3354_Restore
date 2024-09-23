uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  FILE *v5;
  FILE *v6;
  size_t v7;
  size_t v8;
  __CFDictionary *v9;
  io_service_t MatchingService;
  io_object_t v11;
  mach_error_t v12;
  FILE *v13;
  char *v14;
  uint64_t v15;
  FILE *v16;
  const char *v17;
  FILE *v18;
  const char *v19;
  mach_error_t v20;
  const char *v21;
  io_connect_t connect;
  _BYTE __ptr[30976];

  v4 = objc_autoreleasePoolPush();
  if (a1 == 2)
  {
    v5 = fopen(*(const char **)(a2 + 8), "r");
    if (v5)
    {
      v6 = v5;
      v7 = fread(__ptr, 1uLL, 0x7900uLL, v5);
      if ((v7 & 0xFFFFFFFFFFFFFEFFLL) == 0x7800)
      {
        v8 = v7;
        fclose(v6);
        v9 = IOServiceNameMatching("AppleOrionMicro");
        CFDictionarySetValue(v9, CFSTR("IOClass"), CFSTR("AppleOrionMCU"));
        MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v9);
        if (MatchingService)
        {
          v11 = MatchingService;
          connect = 0;
          v12 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
          if (v12)
          {
            v13 = __stderrp;
            v14 = mach_error_string(v12);
            fprintf(v13, "Could not open service: %s\n", v14);
            v15 = 4294967291;
LABEL_33:
            IOObjectRelease(v11);
            goto LABEL_34;
          }
          v20 = IOConnectCallMethod(connect, 0, 0, 0, __ptr, v8, 0, 0, 0, 0);
          if (v20 > -536870184)
          {
            if (v20 > -536870163)
            {
              if (v20 == -536870162)
              {
                v21 = "Firmware image is older than current firmware. Update aborted";
                goto LABEL_30;
              }
              if (!v20)
              {
                v21 = "Orion firmware successfully updated";
                goto LABEL_30;
              }
            }
            else
            {
              if (v20 == -536870183)
              {
                v21 = "Could not find Orion microcontroller. Update failed.";
                goto LABEL_30;
              }
              if (v20 == -536870174)
              {
                v21 = "Firmware update failed due to invalid image";
                goto LABEL_30;
              }
            }
          }
          else if (v20 > -536870188)
          {
            if (v20 == -536870187)
            {
              v21 = "Firmware update already in progress. Update aborted.";
              goto LABEL_30;
            }
            if (v20 == -536870186)
            {
              printf("Orion microcontroller unresponsive. Update may have failed.");
LABEL_32:
              IOServiceClose(connect);
              v15 = 0;
              goto LABEL_33;
            }
          }
          else
          {
            if (v20 == -536870211)
            {
              v21 = "Unable to send firmware to kernel. Update failed.";
              goto LABEL_30;
            }
            if (v20 == -536870206)
            {
              v21 = "Firmware image is incorrect size. Update aborted.";
LABEL_30:
              puts(v21);
              goto LABEL_32;
            }
          }
          mach_error_string(v20);
          printf("Firmware update failed with result: %s\n");
          goto LABEL_32;
        }
        fwrite("Could not find device AppleOrionMicro\n", 0x26uLL, 1uLL, __stderrp);
        v15 = 4294967292;
      }
      else
      {
        fprintf(__stderrp, "error reading firmware from file %s\n", *(const char **)(a2 + 8));
        fclose(v6);
        v15 = 4294967293;
      }
    }
    else
    {
      printf("application file %s not found\n", *(const char **)(a2 + 8));
      v15 = 4294967294;
    }
  }
  else
  {
    v16 = __stderrp;
    v17 = getprogname();
    fprintf(v16, "%s version %s\n", v17, "1.1");
    v18 = __stderrp;
    v19 = getprogname();
    fprintf(v18, "usage: %s <image>\n", v19);
    v15 = 0xFFFFFFFFLL;
  }
LABEL_34:
  objc_autoreleasePoolPop(v4);
  return v15;
}
