@implementation SBFAuthenticationAssertionTracker

- (SBFAuthenticationAssertionTracker)init
{
  SBFAuthenticationAssertionTracker *v2;
  uint64_t v3;
  NSHashTable *assertions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFAuthenticationAssertionTracker;
  v2 = -[SBFAuthenticationAssertionTracker init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;

    v2->_mkbAssertion = 0;
  }
  return v2;
}

- (void)dealloc
{
  __MKBAssertion *mkbAssertion;
  objc_super v4;

  mkbAssertion = self->_mkbAssertion;
  if (mkbAssertion)
  {
    CFRelease(mkbAssertion);
    self->_mkbAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFAuthenticationAssertionTracker;
  -[SBFAuthenticationAssertionTracker dealloc](&v4, sel_dealloc);
}

- (void)addAssertion:(id)a3
{
  id v4;
  void *v5;
  uint64_t (*MKBDeviceLockAssertion)(uint64_t, uint64_t);
  NSObject *v7;
  int v8;
  __MKBAssertion *mkbAssertion;
  CFTypeRef cf;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  CFTypeRef v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_mkbAssertion)
  {
    -[SBFAuthenticationAssertionTracker mkbAssertionOptions](self, "mkbAssertionOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      cf = 0;
      MKBDeviceLockAssertion = _get_MKBDeviceLockAssertion();
      self->_mkbAssertion = (__MKBAssertion *)MKBDeviceLockAssertion((uint64_t)v5, (uint64_t)&cf);
      if (cf)
      {
        SBLogAuthenticationAssertions();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = objc_msgSend((id)cf, "code");
          *(_DWORD *)buf = 138412802;
          v12 = v4;
          v13 = 1024;
          v14 = v8;
          v15 = 2112;
          v16 = cf;
          _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "Failed to take MKBDeviceLockAssertion (%@) due to error: %d - %@", buf, 0x1Cu);
        }

        CFRelease(cf);
        mkbAssertion = self->_mkbAssertion;
        if (mkbAssertion)
        {
          CFRelease(mkbAssertion);
          self->_mkbAssertion = 0;
        }
      }
    }

  }
  -[NSHashTable addObject:](self->_assertions, "addObject:", v4);

}

- (void)removeAssertion:(id)a3
{
  __MKBAssertion *mkbAssertion;

  -[NSHashTable removeObject:](self->_assertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_assertions, "count"))
  {
    mkbAssertion = self->_mkbAssertion;
    if (mkbAssertion)
    {
      CFRelease(mkbAssertion);
      self->_mkbAssertion = 0;
    }
  }
}

- (BOOL)hasActiveAssertions
{
  return -[NSHashTable count](self->_assertions, "count") != 0;
}

- (BOOL)isAssertionValid:(id)a3
{
  return -[NSHashTable containsObject:](self->_assertions, "containsObject:", a3);
}

- (id)mkbAssertionOptions
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[SBFAuthenticationAssertionTracker descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFAuthenticationAssertionTracker succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSHashTable count](self->_assertions, "count"), CFSTR("assertionCount"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFAuthenticationAssertionTracker descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  SBFAuthenticationAssertionTracker *v9;

  v4 = a3;
  -[SBFAuthenticationAssertionTracker succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_mkbAssertion || -[NSHashTable count](self->_assertions, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__SBFAuthenticationAssertionTracker_descriptionBuilderWithMultilinePrefix___block_invoke;
    v7[3] = &unk_1E200E2A0;
    v8 = v5;
    v9 = self;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

  }
  return v5;
}

void __75__SBFAuthenticationAssertionTracker_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("mkbAssertion"), 1);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("assertions"), 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
