@implementation PXBackgroundSystemSchedulerWrapper

+ (BOOL)signalTaskStartedWithError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "taskParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "taskStartedWithParameters:error:", v4, a3);

  return (char)a3;
}

+ (BOOL)signalTaskStoppedWithError:(id *)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "taskParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "taskStoppedWithParameters:error:", v4, a3);

  return (char)a3;
}

+ (NSDictionary)taskParameters
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0D00E88];
  v9[0] = *MEMORY[0x1E0D00E78];
  v9[1] = v4;
  v10[0] = &unk_1E53EEA90;
  v10[1] = CFSTR("com.apple.photos:memoryCreation");
  v9[2] = *MEMORY[0x1E0D00E80];
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

@end
