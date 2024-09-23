@implementation REMAccountSortDescriptor

- (REMAccountSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4
{
  REMAccountSortDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMAccountSortDescriptor;
  result = -[REMAccountSortDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_ascending = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountSortDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  REMAccountSortDescriptor *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5)
  {
    v6 = v5;
    v7 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[REMAccountSortDescriptor initWithCoder:].cold.1(v6, v7);

  }
  v8 = -[REMAccountSortDescriptor initWithType:ascending:](self, "initWithType:ascending:", 0, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending")));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountSortDescriptor type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountSortDescriptor ascending](self, "ascending"), CFSTR("ascending"));

}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMAccountSortDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end
