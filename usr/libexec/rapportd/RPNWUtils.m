@implementation RPNWUtils

+ (id)getBundleIDForPID:(int)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _OWORD buffer[3];
  uint64_t v19;

  if (!a3)
  {
    if (dword_10012FF20 <= 30
      && (dword_10012FF20 != -1 || _LogCategory_Initialize(&dword_10012FF20, 30)))
    {
      LogPrintF(&dword_10012FF20, "+[RPNWUtils getBundleIDForPID:]", 30, "Invalid PID provided (%d)");
    }
    goto LABEL_17;
  }
  v3 = *(_QWORD *)&a3;
  v19 = 0;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(a3, 17, 1uLL, buffer, 56) == 56 && !uuid_is_null((const unsigned __int8 *)buffer))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", buffer);
    if (dword_10012FF20 <= 30
      && (dword_10012FF20 != -1 || _LogCategory_Initialize(&dword_10012FF20, 30)))
    {
      LogPrintF(&dword_10012FF20, "+[RPNWUtils getBundleIDForPID:]", 30, "Looked up PID (%d) -> UUID (%@)", v3, v4);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
    v8 = -[objc_class defaultWorkspace](off_10012FF90(), "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v17 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifiersForMachOUUIDs:error:", v7, &v17));
    v11 = v17;

    if (v11)
    {
      if (dword_10012FF20 <= 30
        && (dword_10012FF20 != -1 || _LogCategory_Initialize(&dword_10012FF20, 30)))
      {
        LogPrintF(&dword_10012FF20, "+[RPNWUtils getBundleIDForPID:]", 30, "bundleIdentifiersForMachOUUIDs failed for %@ [%@]", v4, v11);
      }
    }
    else
    {
      if (objc_msgSend(v10, "count"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v4));
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v4));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));

          if (dword_10012FF20 <= 30
            && (dword_10012FF20 != -1 || _LogCategory_Initialize(&dword_10012FF20, 30)))
          {
            LogPrintF(&dword_10012FF20, "+[RPNWUtils getBundleIDForPID:]", 30, "Looked up UUID (%@) -> bundleID (%@)", v4, v5);
          }
          goto LABEL_37;
        }
      }
      if (dword_10012FF20 <= 30
        && (dword_10012FF20 != -1 || _LogCategory_Initialize(&dword_10012FF20, 30)))
      {
        LogPrintF(&dword_10012FF20, "+[RPNWUtils getBundleIDForPID:]", 30, "No bundleID found for UUID %@", v4, v16);
      }
    }
    v5 = 0;
LABEL_37:

    return v5;
  }
  if (dword_10012FF20 <= 30 && (dword_10012FF20 != -1 || _LogCategory_Initialize(&dword_10012FF20, 30)))
    LogPrintF(&dword_10012FF20, "+[RPNWUtils getBundleIDForPID:]", 30, "Failed to convert from PID (%d) to UUID");
LABEL_17:
  v5 = 0;
  return v5;
}

@end
