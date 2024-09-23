@implementation REMListsDataViewInvocation_fetchDefaultList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMListsDataViewInvocation_fetchDefaultList)initWithDebugUseInMemoryPreferredDefaultListStorage:(BOOL)a3
{
  REMListsDataViewInvocation_fetchDefaultList *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMListsDataViewInvocation_fetchDefaultList;
  result = -[REMStoreInvocationValueStorage init](&v5, sel_init);
  if (result)
    result->_debug_useInMemoryPreferredDefaultListStorage = a3;
  return result;
}

- (REMListsDataViewInvocation_fetchDefaultList)initWithCoder:(id)a3
{
  return -[REMListsDataViewInvocation_fetchDefaultList initWithDebugUseInMemoryPreferredDefaultListStorage:](self, "initWithDebugUseInMemoryPreferredDefaultListStorage:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("debug_useInMemoryPreferredDefaultListStorage")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMListsDataViewInvocation_fetchDefaultList debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage"), CFSTR("debug_useInMemoryPreferredDefaultListStorage"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[REMListsDataViewInvocation_fetchDefaultList debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage");
    v7 = objc_msgSend(v5, "debug_useInMemoryPreferredDefaultListStorage");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMListsDataViewInvocation_fetchDefaultList;
  v3 = -[REMStoreInvocationValueStorage hash](&v5, sel_hash);
  return (unint64_t)v3
       + -[REMListsDataViewInvocation_fetchDefaultList debug_useInMemoryPreferredDefaultListStorage](self, "debug_useInMemoryPreferredDefaultListStorage");
}

- (BOOL)debug_useInMemoryPreferredDefaultListStorage
{
  return self->_debug_useInMemoryPreferredDefaultListStorage;
}

- (void)setDebug_useInMemoryPreferredDefaultListStorage:(BOOL)a3
{
  self->_debug_useInMemoryPreferredDefaultListStorage = a3;
}

@end
