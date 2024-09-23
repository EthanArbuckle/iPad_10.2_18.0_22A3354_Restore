@implementation REMReminderSortDescriptor

- (REMReminderSortDescriptor)initWithType:(int64_t)a3 ascending:(BOOL)a4
{
  REMReminderSortDescriptor *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMReminderSortDescriptor;
  result = -[REMReminderSortDescriptor init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_ascending = a4;
  }
  return result;
}

+ (id)sortDescriptorSortingByTitleAscending:(BOOL)a3
{
  return -[REMReminderSortDescriptor initWithType:ascending:]([REMReminderSortDescriptor alloc], "initWithType:ascending:", 0, a3);
}

+ (id)sortDescriptorSortingByCreationDateAscending:(BOOL)a3
{
  return -[REMReminderSortDescriptor initWithType:ascending:]([REMReminderSortDescriptor alloc], "initWithType:ascending:", 1, a3);
}

+ (id)sortDescriptorSortingByDueDateAscending:(BOOL)a3
{
  return -[REMReminderSortDescriptor initWithType:ascending:]([REMReminderSortDescriptor alloc], "initWithType:ascending:", 2, a3);
}

+ (id)sortDescriptorSortingByPriorityAscending:(BOOL)a3
{
  return -[REMReminderSortDescriptor initWithType:ascending:]([REMReminderSortDescriptor alloc], "initWithType:ascending:", 3, a3);
}

+ (id)sortDescriptorSortingByOrderingInListAscending:(BOOL)a3
{
  return -[REMReminderSortDescriptor initWithType:ascending:]([REMReminderSortDescriptor alloc], "initWithType:ascending:", 4, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderSortDescriptor)initWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  REMReminderSortDescriptor *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if (v5 >= 5)
  {
    v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[REMReminderSortDescriptor initWithCoder:].cold.1(v5, v6);

    v5 = 1;
  }
  v7 = -[REMReminderSortDescriptor initWithType:ascending:](self, "initWithType:ascending:", v5, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ascending")));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMReminderSortDescriptor type](self, "type"), CFSTR("type"));
  objc_msgSend(v4, "encodeBool:forKey:", -[REMReminderSortDescriptor ascending](self, "ascending"), CFSTR("ascending"));

}

- (BOOL)isEqual:(id)a3
{
  REMReminderSortDescriptor *v4;
  REMReminderSortDescriptor *v5;
  REMReminderSortDescriptor *v6;
  int64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (REMReminderSortDescriptor *)a3;
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
      && (v7 = -[REMReminderSortDescriptor type](self, "type"), v7 == -[REMReminderSortDescriptor type](v6, "type")))
    {
      v8 = -[REMReminderSortDescriptor ascending](self, "ascending");
      v9 = v8 ^ -[REMReminderSortDescriptor ascending](v6, "ascending") ^ 1;
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
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMReminderSortDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end
