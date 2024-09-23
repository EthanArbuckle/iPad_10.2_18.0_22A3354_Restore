@implementation SBContinuitySessionSystemEvent

+ (id)eventWithType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:", a3);
}

- (SBContinuitySessionSystemEvent)initWithType:(int64_t)a3
{
  SBContinuitySessionSystemEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBContinuitySessionSystemEvent;
  result = -[SBContinuitySessionSystemEvent init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (SBContinuitySessionSystemEvent)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBContinuitySessionSystemEvent *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  SBContinuitySessionSystemEvent *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed for SBContinuitySessionSystemEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("SBContinuitySessionSystemEvent.m");
    v17 = 1024;
    v18 = 27;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBContinuitySessionSystemEvent *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[1];

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end
