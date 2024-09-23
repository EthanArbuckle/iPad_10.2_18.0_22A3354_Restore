@implementation _UIActivityDiscoveryContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contextFromExtensionItem:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_UIActivityViewDiscoveryContextKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (_UIActivityDiscoveryContext)initWithCoder:(id)a3
{
  id v4;
  _UIActivityDiscoveryContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *activityItemValueExtensionMatchingDictionaries;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIActivityDiscoveryContext;
  v5 = -[_UIActivityDiscoveryContext init](&v11, sel_init);
  if (v5)
  {
    _UISecureStandardPropertyListClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    activityItemValueExtensionMatchingDictionaries = v5->_activityItemValueExtensionMatchingDictionaries;
    v5->_activityItemValueExtensionMatchingDictionaries = (NSArray *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *activityItemValueExtensionMatchingDictionaries;
  id v4;
  id v5;

  activityItemValueExtensionMatchingDictionaries = self->_activityItemValueExtensionMatchingDictionaries;
  v4 = a3;
  NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", activityItemValueExtensionMatchingDictionaries, v5);

}

- (id)newExtensionItem
{
  void *v2;
  id v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  v6 = CFSTR("_UIActivityViewDiscoveryContextKey");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v4);

  return v3;
}

- (NSArray)activityItemValueExtensionMatchingDictionaries
{
  return self->_activityItemValueExtensionMatchingDictionaries;
}

- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, 0);
}

@end
