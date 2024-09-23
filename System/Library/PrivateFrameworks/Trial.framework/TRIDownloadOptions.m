@implementation TRIDownloadOptions

- (TRIDownloadOptions)init
{
  return -[TRIDownloadOptions initWithAllowsCellular:discretionaryBehavior:](self, "initWithAllowsCellular:discretionaryBehavior:", 0, 0);
}

- (TRIDownloadOptions)initWithAllowsCellular:(BOOL)a3 discretionaryBehavior:(unint64_t)a4
{
  TRIDownloadOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRIDownloadOptions;
  result = -[TRIDownloadOptions init](&v7, sel_init);
  if (result)
  {
    result->_allowsCellularAccess = a3;
    result->_allowsBatteryUsage = 0;
    result->_discretionaryBehavior = a4;
  }
  return result;
}

- (TRIDownloadOptions)initWithAllowsCellular:(BOOL)a3 discretionaryBehavior:(unint64_t)a4 activity:(id)a5
{
  id v9;
  TRIDownloadOptions *v10;
  TRIDownloadOptions *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TRIDownloadOptions;
  v10 = -[TRIDownloadOptions init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_allowsCellularAccess = a3;
    v10->_allowsBatteryUsage = 0;
    v10->_discretionaryBehavior = a4;
    objc_storeStrong((id *)&v10->_activity, a5);
  }

  return v11;
}

- (unint64_t)requiredCapability
{
  unint64_t v2;

  v2 = 1;
  if (self->_allowsCellularAccess)
    v2 = 2;
  if (self->_discretionaryBehavior - 1 >= 2)
    return v2;
  else
    return v2 | 0x10;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  void *v3;
  _xpc_activity_s *v4;
  xpc_object_t v5;

  -[TRIDownloadOptions activity](self, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess");
  -[TRIDownloadOptions activity](self, "activity");
  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_activity_copy_criteria(v4);

  LOBYTE(v4) = !xpc_dictionary_get_BOOL(v5, (const char *)*MEMORY[0x1E0C808C8]);
  return (char)v4;
}

+ (id)inexpensiveOptions
{
  if (qword_1ECED7DA0 != -1)
    dispatch_once(&qword_1ECED7DA0, &__block_literal_global_7);
  return (id)_MergedGlobals_7;
}

void __40__TRIDownloadOptions_inexpensiveOptions__block_invoke()
{
  void *v0;
  TRIDownloadOptions *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  v1 = -[TRIDownloadOptions initWithAllowsCellular:discretionaryBehavior:]([TRIDownloadOptions alloc], "initWithAllowsCellular:discretionaryBehavior:", 0, 2);
  v2 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromPersistedBehavior:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  TRIDownloadOptions *v9;

  v4 = a3;
  if (objc_msgSend(v4, "hasAllowsCellular") && objc_msgSend(v4, "hasNetworkBehavior"))
  {
    v5 = objc_msgSend(v4, "allowsCellular");
    v6 = objc_msgSend(v4, "networkBehavior");
    v7 = 1;
    if (v6 != 2)
      v7 = 2;
    if (v6 == 3)
      v8 = 0;
    else
      v8 = v7;
    self = -[TRIDownloadOptions initWithAllowsCellular:discretionaryBehavior:](self, "initWithAllowsCellular:discretionaryBehavior:", v5, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (TRIDownloadOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cellular"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("networkBehavior"));

  return -[TRIDownloadOptions initWithAllowsCellular:discretionaryBehavior:](self, "initWithAllowsCellular:discretionaryBehavior:", v5, v6);
}

- (id)serializeToPersistedBehavior
{
  void *v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAllowsCellular:", -[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess"));
  v4 = -[TRIDownloadOptions discretionaryBehavior](self, "discretionaryBehavior");
  if (v4 == 1)
    v5 = 2;
  else
    v5 = 3;
  if (v4 == 2)
    v6 = 1;
  else
    v6 = v5;
  objc_msgSend(v3, "setNetworkBehavior:", v6);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess"), CFSTR("cellular"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TRIDownloadOptions discretionaryBehavior](self, "discretionaryBehavior"), CFSTR("networkBehavior"));

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)TRIDownloadOptions;
  -[TRIDownloadOptions description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = -[TRIDownloadOptions discretionaryBehavior](self, "discretionaryBehavior");
  v7 = CFSTR("non-discretionary");
  if (v6 == 1)
    v7 = CFSTR("discretionary when backgrounded");
  if (v6 == 2)
    v7 = CFSTR("discretionary");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ cellular:%@ network:%@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TRIDownloadOptions *v4;
  TRIDownloadOptions *v5;
  _BOOL4 v6;
  BOOL v7;
  unint64_t v8;

  v4 = (TRIDownloadOptions *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess");
      if (v6 == -[TRIDownloadOptions allowsCellularAccess](v5, "allowsCellularAccess"))
      {
        v8 = -[TRIDownloadOptions discretionaryBehavior](self, "discretionaryBehavior");
        v7 = v8 == -[TRIDownloadOptions discretionaryBehavior](v5, "discretionaryBehavior");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess"))
    v3 = 31;
  else
    v3 = 0;
  return v3 + -[TRIDownloadOptions discretionaryBehavior](self, "discretionaryBehavior");
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)allowsBatteryUsage
{
  return self->_allowsBatteryUsage;
}

- (void)setAllowsBatteryUsage:(BOOL)a3
{
  self->_allowsBatteryUsage = a3;
}

- (unint64_t)discretionaryBehavior
{
  return self->_discretionaryBehavior;
}

- (void)setDiscretionaryBehavior:(unint64_t)a3
{
  self->_discretionaryBehavior = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
