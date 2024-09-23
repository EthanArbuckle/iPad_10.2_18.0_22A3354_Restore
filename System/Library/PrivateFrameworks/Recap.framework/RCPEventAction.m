@implementation RCPEventAction

- (RCPEventAction)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCPEventAction;
  return -[RCPEventAction init](&v4, sel_init, a3);
}

+ (id)actionToSetPointerCurrentAbsoluteLocation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D00D78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globalPointerPosition");
  v5 = v4;
  v7 = v6;
  +[RCPEventEnvironment currentEnvironment](RCPEventEnvironment, "currentEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionToSetPointerAbsoluteLocation:environment:", v8, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)actionToSetPointerAbsoluteLocation:(CGPoint)a3 environment:(id)a4
{
  double y;
  double x;
  id v6;
  _RCPEventActionSetPointerLocation *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  const char *v15;
  FILE **v16;
  id result;
  void *v18;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = objc_alloc_init(_RCPEventActionSetPointerLocation);
  objc_msgSend(v6, "screens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "pointSize");
  if (v10 == 0.0 || v11 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Normalization failed due to the screen width and height was unexpectedly 0 or NaN."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[RCPEventAction actionToSetPointerAbsoluteLocation:environment:].cold.1((uint64_t)v18);
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v12 = x / v10;
    v13 = y / v11;
    -[_RCPEventActionSetPointerLocation setModelPoint:](v7, "setModelPoint:", x / v10, y / v11);
    if (_CLTLogLevel >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("get model point: %g,%g -> %g,%g \n"), *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v12, *(_QWORD *)&v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      v16 = (FILE **)MEMORY[0x1E0C80C20];
      fputs(v15, (FILE *)*MEMORY[0x1E0C80C20]);

      fflush(*v16);
    }

    return v7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchiveObjectWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)actionToSetPointerAbsoluteLocation:(uint64_t)a1 environment:.cold.1(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[RCPEventAction actionToSetPointerAbsoluteLocation:environment:]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("RCPEvent.m");
  v7 = 1024;
  v8 = 301;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1A5E84000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

@end
