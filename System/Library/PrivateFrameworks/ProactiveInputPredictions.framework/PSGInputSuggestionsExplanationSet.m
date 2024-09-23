@implementation PSGInputSuggestionsExplanationSet

- (PSGInputSuggestionsExplanationSet)init
{
  void *v3;
  PSGInputSuggestionsExplanationSet *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[PSGInputSuggestionsExplanationSet initWithSet:](self, "initWithSet:", v3);

  return v4;
}

- (PSGInputSuggestionsExplanationSet)initWithSet:(id)a3
{
  id v5;
  PSGInputSuggestionsExplanationSet *v6;
  id *v7;
  uint64_t v8;
  _PASLock *lock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSGInputSuggestionsExplanationSet;
  v6 = -[PSGInputSuggestionsExplanationSet init](&v11, sel_init);
  if (v6)
  {
    v7 = (id *)objc_opt_new();
    objc_storeStrong(v7 + 1, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v7);
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v8;

  }
  return v6;
}

- (void)_pushExplanationCode:(unsigned __int16)a3 namespaceId:(unsigned __int16)a4
{
  int v4;
  NSObject *v5;
  _PASLock *lock;
  _QWORD v7[4];
  int v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  if (a4 < 2u)
  {
    lock = self->_lock;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PSGInputSuggestionsExplanationSet__pushExplanationCode_namespaceId___block_invoke;
    v7[3] = &__block_descriptor_36_e54_v16__0__PSGInputSuggestionsExplanationSetGuardedData_8l;
    v8 = a3 | (a4 << 16);
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  }
  else
  {
    psg_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v4;
      _os_log_fault_impl(&dword_1DBD27000, v5, OS_LOG_TYPE_FAULT, "Unexpcted namespace id: %d", buf, 8u);
    }

  }
}

- (void)pushInternalExplanationCode:(unsigned int)a3
{
  -[PSGInputSuggestionsExplanationSet _pushExplanationCode:namespaceId:](self, "_pushExplanationCode:namespaceId:", (unsigned __int16)a3, 0);
}

- (void)pushPortraitExplanationCode:(unsigned __int8)a3
{
  -[PSGInputSuggestionsExplanationSet _pushExplanationCode:namespaceId:](self, "_pushExplanationCode:namespaceId:", a3, 1);
}

- (void)enumerateExplanationCodeWithBlock:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke;
  v7[3] = &unk_1EA3F0BE0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (unint64_t)count
{
  _PASLock *lock;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PSGInputSuggestionsExplanationSet_count__block_invoke;
  v5[3] = &unk_1EA3F0C08;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasPETLoggingData
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke;
  v5[3] = &unk_1EA3F0C08;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasContactsServingError
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke;
  v5[3] = &unk_1EA3F0C08;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasTriggeringXPCTimeout
{
  _PASLock *lock;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PSGInputSuggestionsExplanationSet_hasTriggeringXPCTimeout__block_invoke;
  v5[3] = &unk_1EA3F0C08;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PSGInputSuggestionsExplanationSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PSGInputSuggestionsExplanationSet *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1DF0B9950]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    self = -[PSGInputSuggestionsExplanationSet initWithSet:](self, "initWithSet:", v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  _PASLock *lock;
  id v4;
  _QWORD *v5;

  lock = self->_lock;
  v4 = a3;
  -[_PASLock unsafeGuardedData](lock, "unsafeGuardedData");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5[1], CFSTR("set"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PSGInputSuggestionsExplanationSet *v5;
  id *v6;
  void *v7;
  PSGInputSuggestionsExplanationSet *v8;

  v5 = [PSGInputSuggestionsExplanationSet alloc];
  -[_PASLock unsafeGuardedData](self->_lock, "unsafeGuardedData");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6[1], "copyWithZone:", a3);
  v8 = -[PSGInputSuggestionsExplanationSet initWithSet:](v5, "initWithSet:", v7);

  return v8;
}

- (BOOL)isEqualToExplanationSet:(id)a3
{
  _PASLock *lock;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  if (!a3)
    return 0;
  lock = self->_lock;
  v4 = a3;
  -[_PASLock unsafeGuardedData](lock, "unsafeGuardedData");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[1];
  v7 = (void *)v4[1];

  objc_msgSend(v7, "unsafeGuardedData");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "isEqualToSet:", v8[1]);

  return (char)v6;
}

- (BOOL)isEqual:(id)a3
{
  PSGInputSuggestionsExplanationSet *v4;
  PSGInputSuggestionsExplanationSet *v5;
  BOOL v6;

  v4 = (PSGInputSuggestionsExplanationSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGInputSuggestionsExplanationSet isEqualToExplanationSet:](self, "isEqualToExplanationSet:", v5);

  return v6;
}

- (unint64_t)hash
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[_PASLock unsafeGuardedData](self->_lock, "unsafeGuardedData");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[1];

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  _PASLock *lock;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<PSGInputSuggestionsExplanationSet: ("));
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PSGInputSuggestionsExplanationSet_description__block_invoke;
  v7[3] = &unk_1EA3F0C58;
  v5 = v3;
  v8 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  objc_msgSend(v5, "appendString:", CFSTR(")>"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __48__PSGInputSuggestionsExplanationSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a2 + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        +[PSGInputSuggestionsExplanationSet stringFromExplanationCode:](PSGInputSuggestionsExplanationSet, "stringFromExplanationCode:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "unsignedIntegerValue", (_QWORD)v10));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v9);

        objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("; "));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

uint64_t __60__PSGInputSuggestionsExplanationSet_hasTriggeringXPCTimeout__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 8), "containsObject:", &unk_1EA3F47C0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke_2;
  v4[3] = &unk_1EA3F0C30;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

void __60__PSGInputSuggestionsExplanationSet_hasContactsServingError__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  unsigned __int16 v6;
  int v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = v5;
  v7 = HIWORD(v5);
  if (HIWORD(v5) != 1)
  {
    if (HIWORD(v5) || (unsigned __int16)v5 != 1)
      goto LABEL_8;
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_8;
  }
  if ((unsigned __int16)v5 <= 0x31u && ((1 << v5) & 0x2000000005880) != 0)
    goto LABEL_7;
LABEL_8:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    psg_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109376;
      v9[1] = v7;
      v10 = 1024;
      v11 = v6;
      _os_log_impl(&dword_1DBD27000, v8, OS_LOG_TYPE_INFO, "hasContactsServingError => YES due to expCode (%d, %d)", (uint8_t *)v9, 0xEu);
    }

    *a3 = 1;
  }
}

uint64_t __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke_2;
  v4[3] = &unk_1EA3F0C30;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __54__PSGInputSuggestionsExplanationSet_hasPETLoggingData__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  if ((result - 1) <= 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    if (a3)
      *a3 = 1;
  }
  return result;
}

uint64_t __42__PSGInputSuggestionsExplanationSet_count__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 8), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = *(void **)(a2 + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke_2;
  v3[3] = &unk_1EA3F0BB8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

uint64_t __71__PSGInputSuggestionsExplanationSet_enumerateExplanationCodeWithBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "unsignedIntegerValue"));
}

void __70__PSGInputSuggestionsExplanationSet__pushExplanationCode_namespaceId___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a2 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)_stringFromExplanation:(unsigned __int8)a3
{
  if (a3 > 7u)
    return CFSTR("Unknown");
  else
    return (id)*((_QWORD *)&off_1EA3F0C78 + a3);
}

+ (id)stringFromExplanationCode:(unsigned int)a3
{
  __CFString *v3;

  if (HIWORD(a3) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D70C10], "stringFromExplanation:", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (HIWORD(a3))
  {
    v3 = CFSTR("Unknown");
  }
  else
  {
    objc_msgSend(a1, "_stringFromExplanation:", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
