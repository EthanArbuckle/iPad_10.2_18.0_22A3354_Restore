@implementation _SFAccessPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accessPolicyWithSecAccessibility:(__CFString *)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68E8]))
  {
    v7 = 2;
LABEL_3:
    v8 = 1;
LABEL_6:
    v15 = 0uLL;
    v13 = v8;
    v14 = 0uLL;
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAccessibility:sharingPolicy:", &v13, v7);
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68A8]))
  {
    v8 = 0;
    v7 = 2;
    goto LABEL_6;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68F0]))
  {
    v7 = 0;
    goto LABEL_3;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CD68B0]))
  {
    v8 = 0;
    v7 = 0;
    goto LABEL_6;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid secAccessibility for SFAccessPolicy: %@"), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 10, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (_SFAccessPolicy)init
{
  _QWORD v3[3];

  v3[1] = 0;
  v3[2] = 0;
  v3[0] = 1;
  return -[_SFAccessPolicy initWithAccessibility:sharingPolicy:](self, "initWithAccessibility:sharingPolicy:", v3, 2);
}

- (_SFAccessPolicy)initWithAccessibility:(id *)a3 sharingPolicy:(int64_t)a4
{
  _SFAccessPolicy *result;
  int64_t var1;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFAccessPolicy;
  result = -[_SFAccessPolicy init](&v8, sel_init);
  if (result)
  {
    var1 = a3->var1.var1;
    *(_OWORD *)&result->_accessibility.mode = *(_OWORD *)&a3->var0;
    result->_accessibility.authenticationPolicy.subsetCount = var1;
    result->_sharingPolicy = a4;
  }
  return result;
}

- (_SFAccessPolicy)initWithCoder:(id)a3
{
  id v4;
  _SFAccessPolicy *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *accessGroup;
  _SFAccessPolicy *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFAccessPolicy;
  v5 = -[_SFAccessPolicy init](&v15, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("SFAccessPolicyAccessibilityMode")))
      v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SFAccessPolicyAccessibilityMode"));
    else
      v6 = -1;
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("SFAccessPolicySharingMode"))
      || (v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SFAccessPolicySharingMode")), v6 < 0)
      || v7 < 0)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2D50];
      v17[0] = CFSTR("failed to deserialize SFAccessPolicy instance");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 4, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v13);

      v10 = 0;
      goto LABEL_11;
    }
    v5->_accessibility.mode = v6;
    v5->_accessibility.authenticationPolicy.authenticationRequirements = 0;
    v5->_accessibility.authenticationPolicy.subsetCount = 0;
    v5->_sharingPolicy = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SFAccessPolicyAccessGroup"));
    v8 = objc_claimAutoreleasedReturnValue();
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v8;

  }
  v10 = v5;
LABEL_11:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessGroup;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessibility.mode, CFSTR("SFAccessPolicyAccessibilityMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sharingPolicy, CFSTR("SFAccessPolicySharingMode"));
  accessGroup = self->_accessGroup;
  if (accessGroup)
    objc_msgSend(v5, "encodeObject:forKey:", accessGroup, CFSTR("SFAccessPolicyAccessGroup"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t sharingPolicy;
  void *v6;
  __int128 v8;
  int64_t subsetCount;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v8 = *(_OWORD *)&self->_accessibility.mode;
  sharingPolicy = self->_sharingPolicy;
  subsetCount = self->_accessibility.authenticationPolicy.subsetCount;
  v6 = (void *)objc_msgSend(v4, "initWithAccessibility:sharingPolicy:", &v8, sharingPolicy);
  objc_msgSend(v6, "setAccessGroup:", self->_accessGroup);
  objc_msgSend(v6, "setAccessControlList:", self->_accessControlList);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _SFAccessPolicy *v4;
  _SFAccessPolicy *v5;
  _SFAccessPolicy *v6;
  int64_t mode;
  void *sharingPolicy;
  NSString *accessGroup;
  NSString *v10;
  void *v11;
  char v12;
  uint64_t v14;

  v4 = (_SFAccessPolicy *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        mode = self->_accessibility.mode;
        -[_SFAccessPolicy accessibility](v6, "accessibility");
        if (mode == v14
          && (sharingPolicy = (void *)self->_sharingPolicy,
              sharingPolicy == (void *)-[_SFAccessPolicy sharingPolicy](v6, "sharingPolicy")))
        {
          accessGroup = self->_accessGroup;
          v10 = accessGroup;
          if (!accessGroup)
          {
            -[_SFAccessPolicy accessGroup](v6, "accessGroup");
            sharingPolicy = (void *)objc_claimAutoreleasedReturnValue();
            if (!sharingPolicy)
            {
              v12 = 1;
LABEL_17:

              goto LABEL_14;
            }
            v10 = self->_accessGroup;
          }
          -[_SFAccessPolicy accessGroup](v6, "accessGroup");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

          if (!accessGroup)
            goto LABEL_17;
        }
        else
        {
          v12 = 0;
        }
LABEL_14:

        goto LABEL_15;
      }
    }
    v12 = 0;
  }
LABEL_15:

  return v12;
}

- (__CFDictionary)secAccessibilityAttributes
{
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  int64_t sharingPolicy;
  int64_t mode;
  const void **v7;
  id v8;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = Mutable;
  sharingPolicy = self->_sharingPolicy;
  if (sharingPolicy)
  {
    if (sharingPolicy != 1)
    {
      if (sharingPolicy != 2)
        goto LABEL_16;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
    }
    mode = self->_accessibility.mode;
    if (!mode)
    {
      v7 = (const void **)MEMORY[0x1E0CD68A8];
      goto LABEL_15;
    }
    if (mode == 1)
    {
      v7 = (const void **)MEMORY[0x1E0CD68E8];
LABEL_15:
      CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E0CD68A0], *v7);
      goto LABEL_16;
    }
  }
  else
  {
    mode = self->_accessibility.mode;
    if (!mode)
    {
      v7 = (const void **)MEMORY[0x1E0CD68B0];
      goto LABEL_15;
    }
    if (mode == 1)
    {
      v7 = (const void **)MEMORY[0x1E0CD68F0];
      goto LABEL_15;
    }
  }
  if (mode == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("SFAccessPolicy does not support SFAccessibleWithAuthentication at present - please file a radar if you need it"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
LABEL_16:
  CFAutorelease(v4);
  return v4;
}

- ($909E7E1822DED34025FCFF16911CCF70)accessibility
{
  *($FE5126324A5092C0FD3D5E3C997958B5 *)retstr = *($FE5126324A5092C0FD3D5E3C997958B5 *)&self->var1.var0;
  return self;
}

- (void)setAccessibility:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_accessibility.authenticationPolicy.subsetCount = a3->var1.var1;
  *(_OWORD *)&self->_accessibility.mode = v3;
}

- (int64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (void)setSharingPolicy:(int64_t)a3
{
  self->_sharingPolicy = a3;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)accessControlList
{
  return self->_accessControlList;
}

- (void)setAccessControlList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlList, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end
