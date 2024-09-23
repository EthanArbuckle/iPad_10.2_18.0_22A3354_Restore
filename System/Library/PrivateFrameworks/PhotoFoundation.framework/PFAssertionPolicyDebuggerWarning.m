@implementation PFAssertionPolicyDebuggerWarning

- (void)notifyAssertion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (!+[PFAssertionHandler runningUnderDebugger](PFAssertionHandler, "runningUnderDebugger")
    || !objc_msgSend(v14, "isWarning"))
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("__skipWarningAssertions")))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 86400.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKey:", CFSTR("PFAssertSkipWarningExpirationDate"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = v6;
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("PFAssertSkipWarningExpirationDate"));
    }
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    if (v10 <= 86400.0)
    {
      if (v10 >= 0.0)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("PFAssertSkipWarningExpirationDate"));
      v13 = (void *)MEMORY[0x1E0C9AAA0];
      v11 = CFSTR("__skipWarningAssertions");
      v12 = v3;
    }
    else
    {
      v11 = CFSTR("PFAssertSkipWarningExpirationDate");
      v12 = v3;
      v13 = v6;
    }
    objc_msgSend(v12, "setObject:forKey:", v13, v11);
    goto LABEL_11;
  }
LABEL_12:
  if ((objc_msgSend(v3, "BOOLForKey:", CFSTR("__skipWarningAssertions")) & 1) == 0)
    __debugbreak();

LABEL_15:
}

@end
