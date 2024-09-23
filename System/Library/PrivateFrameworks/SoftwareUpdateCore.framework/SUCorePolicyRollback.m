@implementation SUCorePolicyRollback

- (SUCorePolicyRollback)init
{
  char *v2;
  SUCorePolicyRollback *v3;
  void *v4;
  NSDictionary *baseRollbackOptions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUCorePolicyRollback;
  v2 = -[SUCorePolicyRollback init](&v7, sel_init);
  v3 = (SUCorePolicyRollback *)v2;
  if (v2)
  {
    v2[8] = 0;
    *(_DWORD *)(v2 + 9) = 16843009;
    v2[13] = 0;
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = 0;

    baseRollbackOptions = v3->_baseRollbackOptions;
    v3->_baseRollbackOptions = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCorePolicyRollback)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyRollback *v5;
  NSDictionary *additionalOptions;
  NSDictionary *baseRollbackOptions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyRollback;
  v5 = -[SUCorePolicyRollback init](&v9, sel_init);
  if (v5)
  {
    v5->_performPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformPhase"));
    v5->_performRollbackPreparePhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformPreparePhase"));
    v5->_performRollbackSuspendPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformSuspendPhase"));
    v5->_performRollbackResumePhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformResumePhase"));
    v5->_performRollbackApplyPhase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformApplyPhase"));
    v5->_skipCancelPreviousUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SkipCancelPreviousUpdate"));
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = 0;

    baseRollbackOptions = v5->_baseRollbackOptions;
    v5->_baseRollbackOptions = 0;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyRollback performPhase](self, "performPhase"), CFSTR("PerformPhase"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"), CFSTR("PerformPreparePhase"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"), CFSTR("PerformSuspendPhase"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"), CFSTR("PerformResumePhase"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"), CFSTR("PerformApplyPhase"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"), CFSTR("SkipCancelPreviousUpdate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setPerformPhase:", -[SUCorePolicyRollback performPhase](self, "performPhase"));
  objc_msgSend(v5, "setPerformRollbackPreparePhase:", -[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"));
  objc_msgSend(v5, "setPerformRollbackSuspendPhase:", -[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"));
  objc_msgSend(v5, "setPerformRollbackResumePhase:", -[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"));
  objc_msgSend(v5, "setPerformRollbackApplyPhase:", -[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"));
  objc_msgSend(v5, "setSkipCancelPreviousUpdate:", -[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"));
  -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setBaseRollbackOptions:", v7);

  -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setAdditionalOptions:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyRollback *v4;
  SUCorePolicyRollback *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  _BOOL4 v13;

  v4 = (SUCorePolicyRollback *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SUCorePolicyRollback performPhase](v5, "performPhase");
      if (v6 == -[SUCorePolicyRollback performPhase](self, "performPhase")
        && (v7 = -[SUCorePolicyRollback performRollbackPreparePhase](v5, "performRollbackPreparePhase"),
            v7 == -[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"))
        && (v8 = -[SUCorePolicyRollback performRollbackSuspendPhase](v5, "performRollbackSuspendPhase"),
            v8 == -[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"))
        && (v9 = -[SUCorePolicyRollback performRollbackResumePhase](v5, "performRollbackResumePhase"),
            v9 == -[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"))
        && (v10 = -[SUCorePolicyRollback performRollbackApplyPhase](v5, "performRollbackApplyPhase"),
            v10 == -[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase")))
      {
        v13 = -[SUCorePolicyRollback skipCancelPreviousUpdate](v5, "skipCancelPreviousUpdate");
        v11 = v13 ^ -[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate") ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }

    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = CFSTR("NO");
  if (-[SUCorePolicyRollback performPhase](self, "performPhase"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v15 = v4;
  if (-[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"))
    v3 = CFSTR("YES");
  -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("none");
  if (v9)
  {
    -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("SUCorePolicyRollback(performPhase:%@|performRollbackPreparePhase:%@|performRollbackSuspendPhase:%@|performRollbackResumePhase:%@|performRollbackApplyPhase:%@|skipCancelPreviousUpdate:%@|baseRollbackOptions:%@|additionalOptions:%@)"), v15, v5, v6, v7, v8, v3, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v16, "stringWithFormat:", CFSTR("SUCorePolicyRollback(performPhase:%@|performRollbackPreparePhase:%@|performRollbackSuspendPhase:%@|performRollbackResumePhase:%@|performRollbackApplyPhase:%@|skipCancelPreviousUpdate:%@|baseRollbackOptions:%@|additionalOptions:%@)"), v15, v5, v6, v7, v8, v3, v10, CFSTR("none"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
  return v13;
}

- (id)summary
{
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (-[SUCorePolicyRollback performPhase](self, "performPhase"))
  {
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", CFSTR("|performPhase"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicyRollback performRollbackPreparePhase](self, "performRollbackPreparePhase"))
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|performRollbackPreparePhase"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v4;
  }
  if (-[SUCorePolicyRollback performRollbackSuspendPhase](self, "performRollbackSuspendPhase"))
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|performRollbackSuspendPhase"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v5;
  }
  if (-[SUCorePolicyRollback performRollbackResumePhase](self, "performRollbackResumePhase"))
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|performRollbackResumePhase"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v6;
  }
  if (-[SUCorePolicyRollback performRollbackApplyPhase](self, "performRollbackApplyPhase"))
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|performRollbackApplyPhase"));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v7;
  }
  if (-[SUCorePolicyRollback skipCancelPreviousUpdate](self, "skipCancelPreviousUpdate"))
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|skipCancelPreviousUpdate"));
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v8;
  }
  -[SUCorePolicyRollback baseRollbackOptions](self, "baseRollbackOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = CFSTR("|withBaseRollbackOptions");
  else
    v10 = CFSTR("|noBaseRollbackOptions");
  -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicyRollback additionalOptions](self, "additionalOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = CFSTR("|withAdditionalOptions");
  else
    v13 = CFSTR("|noAdditionalOptions");
  objc_msgSend(v11, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v14, "stringByAppendingString:", CFSTR("|"));
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  return v14;
}

- (BOOL)performPhase
{
  return self->_performPhase;
}

- (void)setPerformPhase:(BOOL)a3
{
  self->_performPhase = a3;
}

- (BOOL)performRollbackPreparePhase
{
  return self->_performRollbackPreparePhase;
}

- (void)setPerformRollbackPreparePhase:(BOOL)a3
{
  self->_performRollbackPreparePhase = a3;
}

- (BOOL)performRollbackSuspendPhase
{
  return self->_performRollbackSuspendPhase;
}

- (void)setPerformRollbackSuspendPhase:(BOOL)a3
{
  self->_performRollbackSuspendPhase = a3;
}

- (BOOL)performRollbackResumePhase
{
  return self->_performRollbackResumePhase;
}

- (void)setPerformRollbackResumePhase:(BOOL)a3
{
  self->_performRollbackResumePhase = a3;
}

- (BOOL)performRollbackApplyPhase
{
  return self->_performRollbackApplyPhase;
}

- (void)setPerformRollbackApplyPhase:(BOOL)a3
{
  self->_performRollbackApplyPhase = a3;
}

- (BOOL)skipCancelPreviousUpdate
{
  return self->_skipCancelPreviousUpdate;
}

- (void)setSkipCancelPreviousUpdate:(BOOL)a3
{
  self->_skipCancelPreviousUpdate = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptions, a3);
}

- (NSDictionary)baseRollbackOptions
{
  return self->_baseRollbackOptions;
}

- (void)setBaseRollbackOptions:(id)a3
{
  objc_storeStrong((id *)&self->_baseRollbackOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseRollbackOptions, 0);
  objc_storeStrong((id *)&self->_additionalOptions, 0);
}

@end
