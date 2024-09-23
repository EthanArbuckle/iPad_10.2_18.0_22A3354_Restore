@implementation PCCancelAllProcessWakesOperation

- (void)main
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFArrayRef v15;
  CFArrayRef v16;
  CFTypeID v17;
  const __CFArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  const __CFArray *v26;
  unint64_t v27;
  const __CFDate *v28;
  IOReturn v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  const __CFArray *v33;
  __CFString *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  IOReturn v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  AssertionID = 0;
  v2 = 0x1ECFF4000uLL;
  v3 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("schedulingwake-PCCancelAllProcessWakesOperation(%p)"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCPersistentIdentifiers processNamePidAndStringIdentifier:](PCPersistentIdentifiers, "processNamePidAndStringIdentifier:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, v5, &AssertionID);
  if ((_DWORD)v6)
  {
    v7 = v6;
    +[PCLog wakeManager](PCLog, "wakeManager");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[PCScheduleSystemWakeOperation main].cold.3(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  v15 = IOPMCopyScheduledPowerEvents();
  if (v15)
  {
    v16 = v15;
    v17 = CFGetTypeID(v15);
    if (v17 == CFArrayGetTypeID())
    {
      v33 = v16;
      v34 = v5;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v18 = v16;
      v19 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v37 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v23, "objectForKey:", CFSTR("eventtype"));
            v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKey:", CFSTR("scheduledby"));
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (-[__CFString isEqual:](v24, "isEqual:", CFSTR("wake")))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend((id)(v2 + 2296), "pidFromMatchingIdentifer:", v25) & 0x80000000) == 0)
              {
                v26 = v18;
                v27 = v3;
                objc_msgSend(v23, "objectForKey:", CFSTR("time"));
                v28 = (const __CFDate *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v29 = IOPMCancelScheduledPowerEvent(v28, v25, v24);
                    +[PCLog wakeManager](PCLog, "wakeManager");
                    v30 = objc_claimAutoreleasedReturnValue();
                    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
                    if (v29)
                    {
                      if (v31)
                      {
                        PCStringFromDate(v28);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v42 = v25;
                        v43 = 2112;
                        v44 = v35;
                        v45 = 1024;
                        v46 = v29;
                        _os_log_impl(&dword_1CBC1B000, v30, OS_LOG_TYPE_DEFAULT, "Unable to unschedule orphaned wake with identifier '%@' and date [%@]. IOPMCancelScheduledPowerEvent() returned: %i", buf, 0x1Cu);

                      }
                    }
                    else if (v31)
                    {
                      PCStringFromDate(v28);
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v42 = v25;
                      v43 = 2112;
                      v44 = v32;
                      _os_log_impl(&dword_1CBC1B000, v30, OS_LOG_TYPE_DEFAULT, "Unscheduled orphaned wake with identifier '%@' and date [%@]", buf, 0x16u);

                    }
                    v2 = 0x1ECFF4000;
                  }
                }

                v3 = v27;
                v18 = v26;
              }
            }

          }
          v20 = -[__CFArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        }
        while (v20);
      }

      v16 = v33;
      v5 = v34;
    }
    CFRelease(v16);
  }
  IOPMAssertionRelease(AssertionID);

}

@end
