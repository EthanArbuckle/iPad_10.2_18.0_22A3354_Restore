@implementation TICryptographer

- (TICryptographer)init
{
  TICryptographer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TICryptographer;
  v2 = -[TICryptographer init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.TextInput.crypto", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (NSData)deviceSalt
{
  NSData *deviceSalt;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSData *v12;
  void *v14;
  CFTypeRef result;
  int __buf;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  deviceSalt = self->_deviceSalt;
  if (!deviceSalt)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CC0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6900], CFSTR("deviceSalt"));
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.TextInput"));
    result = 0;
    SecItemCopyMatching(Mutable, &result);
    if (result)
    {
      v6 = self->_deviceSalt;
      self->_deviceSalt = (NSData *)result;

    }
    if (!self->_deviceSalt)
    {
      arc4random_buf(&__buf, 0x14uLL);
      v7 = (NSData *)CFDataCreate(v4, (const UInt8 *)&__buf, 20);
      v8 = self->_deviceSalt;
      self->_deviceSalt = v7;

      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], self->_deviceSalt);
      v9 = SecItemAdd(Mutable, 0);
      if ((_DWORD)v9)
      {
        v10 = v9;
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to write to keychain with error %d"), "-[TICryptographer deviceSalt]", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          __buf = 138412290;
          v17 = v14;
          _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&__buf, 0xCu);

        }
        v12 = self->_deviceSalt;
        self->_deviceSalt = 0;

      }
    }
    CFRelease(Mutable);
    deviceSalt = self->_deviceSalt;
  }
  return deviceSalt;
}

- (id)stringDigestForName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20977;
  v14 = __Block_byref_object_dispose__20978;
  v15 = 0;
  -[TICryptographer dispatchQueue](self, "dispatchQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  v6 = v4;
  TIDispatchSync();

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)cachedRecipientName
{
  return self->_cachedRecipientName;
}

- (void)setCachedRecipientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cachedRecipientDigest
{
  return self->_cachedRecipientDigest;
}

- (void)setCachedRecipientDigest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecipientDigest, 0);
  objc_storeStrong((id *)&self->_cachedRecipientName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceSalt, 0);
}

void __39__TICryptographer_stringDigestForName___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFData *v9;
  const __CFData *StringDigest;
  uint64_t v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "cachedRecipientName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedRecipientDigest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = *(const __CFString **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "deviceSalt");
    v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    StringDigest = TICryptographerCreateStringDigest(v8, v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = StringDigest;

    objc_msgSend(*(id *)(a1 + 32), "setCachedRecipientName:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setCachedRecipientDigest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_20996 != -1)
    dispatch_once(&singletonInstance_onceToken_20996, &__block_literal_global_20997);
  return (id)singletonInstance_singletonInstance_20998;
}

+ (id)sharedCryptographer
{
  if (__testingInstance_20994)
    return (id)__testingInstance_20994;
  +[TICryptographer singletonInstance](TICryptographer, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __36__TICryptographer_singletonInstance__block_invoke()
{
  TICryptographer *v0;
  void *v1;

  v0 = objc_alloc_init(TICryptographer);
  v1 = (void *)singletonInstance_singletonInstance_20998;
  singletonInstance_singletonInstance_20998 = (uint64_t)v0;

}

+ (void)setSharedCryptographer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance_20994 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance_20994, a3);
    v4 = v5;
  }

}

@end
