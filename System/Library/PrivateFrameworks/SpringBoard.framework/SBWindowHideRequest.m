@implementation SBWindowHideRequest

+ (id)hideRequestWithWindowLevelRange:(SBWindowLevelRange_struct)a3 reason:(id)a4
{
  double end;
  double start;
  id v6;
  SBWindowHideRequest *v7;

  end = a3.end;
  start = a3.start;
  v6 = a4;
  v7 = objc_alloc_init(SBWindowHideRequest);
  -[SBWindowHideRequest setWindowLevelRange:](v7, "setWindowLevelRange:", start, end);
  -[SBWindowHideRequest setReason:](v7, "setReason:", v6);

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SBWindowHideRequest windowLevelRange](self, "windowLevelRange");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.f, %.f)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWindowHideRequest reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SBWindowHideRequest: range = %@; reason = %@>"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SBWindowLevelRange_struct)windowLevelRange
{
  double v2;
  double v3;
  _QWORD v4[2];
  SBWindowLevelRange_struct result;

  objc_copyStruct(v4, &self->_windowLevelRange, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.end = v3;
  result.start = v2;
  return result;
}

- (void)setWindowLevelRange:(SBWindowLevelRange_struct)a3
{
  SBWindowLevelRange_struct v3;

  v3 = a3;
  objc_copyStruct(&self->_windowLevelRange, &v3, 16, 1, 0);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
