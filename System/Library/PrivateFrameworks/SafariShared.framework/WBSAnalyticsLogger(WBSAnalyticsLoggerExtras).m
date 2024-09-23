@implementation WBSAnalyticsLogger(WBSAnalyticsLoggerExtras)

- (void)reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded:()WBSAnalyticsLoggerExtras
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_dateForKey:", CFSTR("WBSLastWeakPasswordReportTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_msgSend(v6, "safari_timeIntervalUntilNow"), v7 <= 43200.0))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_setDate:forKey:", v9, CFSTR("WBSLastWeakPasswordReportTime"));

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __111__WBSAnalyticsLogger_WBSAnalyticsLoggerExtras__reportNumberOfFlaggedPasswordsUsingSavedAccountAuditorIfNeeded___block_invoke;
    v10[3] = &unk_1E4B29A28;
    v11 = v4;
    objc_msgSend(a1, "_sendEvent:usingBlock:", CFSTR("com.apple.Safari.WeakPasswordReport"), v10);

  }
}

@end
