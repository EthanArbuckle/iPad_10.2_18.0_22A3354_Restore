@implementation AppUninstallationCallback

void __AppUninstallationCallback_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  char v6;
  CFIndex v7;
  const void *ValueAtIndex;
  NSObject *logger;
  os_log_type_t v10;
  const __SCPreferences *v11;
  uint64_t v12;
  CFIndex v13;
  const void *v14;
  uint64_t v15;
  __int128 context;
  uint64_t v17;

  v1 = a1;
  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(const __CFArray **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  Count = CFArrayGetCount(v2);
  v13 = Count - 1;
  if (Count >= 1)
  {
    v4 = Count;
    v5 = 0;
    v6 = 1;
    while (2)
    {
      v7 = v5;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v7);
        v14 = ValueAtIndex;
        if (S_plugins)
        {
          v15 = 0;
          *(_QWORD *)&context = CompareAppIDWithPluginID;
          *((_QWORD *)&context + 1) = &v14;
          CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, &context);
          if (v15 == 1)
            break;
        }
        if (v4 == ++v7)
        {
          if ((v6 & 1) != 0)
            goto LABEL_16;
          goto LABEL_15;
        }
      }
      v12 = v1;
      logger = mysyslog_get_logger();
      v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v10))
      {
        LODWORD(context) = 138412290;
        *(_QWORD *)((char *)&context + 4) = ValueAtIndex;
        _os_log_impl(&dword_219EF1000, logger, v10, "cleaning up data for app %@", (uint8_t *)&context, 0xCu);
      }
      NetIFWiFiNetworkForgetAppOwnedNetworks();
      if (S_plugins)
        CFDictionaryRemoveValue((CFMutableDictionaryRef)S_plugins, ValueAtIndex);
      v11 = (const __SCPreferences *)prefs_get();
      prefs_remove_entry(v11, ValueAtIndex);
      v6 = 0;
      v5 = v7 + 1;
      v1 = v12;
      if (v13 != v7)
        continue;
      break;
    }
LABEL_15:
    CNPluginMonitorHandlerPluginListChanged();
  }
LABEL_16:
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24));
}

@end
