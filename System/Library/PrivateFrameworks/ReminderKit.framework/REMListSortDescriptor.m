@implementation REMListSortDescriptor

+ (id)sortDescriptorSortingByNameAscending:(BOOL)a3
{
  return -[REMListSortDescriptor initWithType:ascending:]([REMListSortDescriptor alloc], "initWithType:ascending:", 0, a3);
}

+ (id)sortDescriptorSortingByOrderingInAccountAscending:(BOOL)a3
{
  return -[REMListSortDescriptor initWithType:ascending:]([REMListSortDescriptor alloc], "initWithType:ascending:", 1, a3);
}

- (REMListSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4
{
  REMListSortDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMListSortDescriptor;
  result = -[REMListSortDescriptor init](&v7, sel_init);
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

- (REMListSortDescriptor)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  REMListSortDescriptor *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5 >= 2)
  {
    v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[REMListSortDescriptor initWithCoder:].cold.1(v5, v6);

    v5 = 0;
  }
  v7 = -[REMListSortDescriptor initWithType:ascending:](self, "initWithType:ascending:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending")));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMListSortDescriptor type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListSortDescriptor ascending](self, "ascending"), CFSTR("ascending"));

}

- (BOOL)isEqual:(id)a3
{
  REMListSortDescriptor *v4;
  REMListSortDescriptor *v5;
  REMListSortDescriptor *v6;
  uint64_t v7;
  _BOOL4 v8;
  int v9;

  v4 = (REMListSortDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v7 = -[REMListSortDescriptor type](v6, "type"), v7 == -[REMListSortDescriptor type](self, "type")))
    {
      v8 = -[REMListSortDescriptor ascending](v6, "ascending");
      v9 = v8 ^ -[REMListSortDescriptor ascending](self, "ascending") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  return v9;
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
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMListSortDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end
