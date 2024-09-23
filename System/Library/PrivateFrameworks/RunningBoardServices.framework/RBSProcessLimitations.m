@implementation RBSProcessLimitations

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)setRunTime:(double)a3
{
  self->_runTime = a3;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[RBSProcessLimitations runTime](self, "runTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_runTime"));

}

- (double)runTime
{
  return self->_runTime;
}

- (RBSProcessLimitations)init
{
  RBSProcessLimitations *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSProcessLimitations;
  result = -[RBSProcessLimitations init](&v3, sel_init);
  if (result)
    result->_runTime = -1.0;
  return result;
}

- (RBSProcessLimitations)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessLimitations *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSProcessLimitations;
  v5 = -[RBSProcessLimitations init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_runTime"));
    v5->_runTime = v6;
  }

  return v5;
}

- (NSString)description
{
  double runTime;
  __CFString *v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_7);
  runTime = self->_runTime;
  if (runTime == -1.0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %fms"), (runTime - (double)(uint64_t)runTime) * 1000.0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_runTime != -1.0)
    {
      objc_msgSend((id)description_decomposedIntervalFormatter, "stringFromTimeInterval:");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v5 = CFSTR("(unlimited)");
LABEL_8:
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E2D183D0;
  if (v4)
    v9 = v4;
  v10 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@| runTime:%@%@>"), v7, v5, v9);

  return (NSString *)v10;
}

uint64_t __36__RBSProcessLimitations_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)description_decomposedIntervalFormatter;
  description_decomposedIntervalFormatter = (uint64_t)v0;

  return objc_msgSend((id)description_decomposedIntervalFormatter, "setUnitsStyle:", 1);
}

@end
