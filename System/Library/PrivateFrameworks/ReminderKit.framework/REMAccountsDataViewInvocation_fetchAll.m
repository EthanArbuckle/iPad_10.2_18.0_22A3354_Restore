@implementation REMAccountsDataViewInvocation_fetchAll

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountsDataViewInvocation_fetchAll)initWithPurpose:(int64_t)a3
{
  REMAccountsDataViewInvocation_fetchAll *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMAccountsDataViewInvocation_fetchAll;
  result = -[REMStoreInvocationValueStorage init](&v5, sel_init);
  if (result)
    result->_purpose = a3;
  return result;
}

- (REMAccountsDataViewInvocation_fetchAll)initWithCoder:(id)a3
{
  unint64_t v4;
  NSObject *v5;

  v4 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("purpose"));
  if (v4 >= 3)
  {
    v5 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[REMAccountsDataViewInvocation_fetchAll initWithCoder:].cold.1(v4, v5);

    v4 = 0;
  }
  return -[REMAccountsDataViewInvocation_fetchAll initWithPurpose:](self, "initWithPurpose:", v4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountsDataViewInvocation_fetchAll purpose](self, "purpose"), CFSTR("purpose"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[REMAccountsDataViewInvocation_fetchAll purpose](self, "purpose");
    v6 = v5 == objc_msgSend(v4, "purpose");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  objc_class *v2;
  void *v3;
  unint64_t v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAccountsDataViewInvocation_fetchAll_purpose %ld", (uint8_t *)&v2, 0xCu);
}

@end
