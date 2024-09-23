@implementation PHAGraphForceGraphRebuildTask

- (id)name
{
  return CFSTR("PHAGraphForceGraphRebuildTask");
}

- (double)period
{
  return -1.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHAGraphForceGraphRebuildTask;
  if (-[PHAGraphRebuildTask shouldRunWithGraphManager:](&v10, sel_shouldRunWithGraphManager_, v4)
    && (objc_msgSend(v4, "isReady") & 1) == 0)
  {
    objc_msgSend(v4, "workingContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CAC16000, v7, OS_LOG_TYPE_INFO, "[PHAGraphForceGraphRebuildTask] Graph is not available, forcing to rebuild", v9, 2u);
    }

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
