@implementation PPQuickTypeExplanationSet

- (PPQuickTypeExplanationSet)init
{
  PPQuickTypeExplanationSet *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *set;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPQuickTypeExplanationSet;
  v2 = -[PPQuickTypeExplanationSet init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    set = v2->_set;
    v2->_set = (_PASLock *)v5;

  }
  return v2;
}

- (void)push:(unsigned __int8)a3
{
  _PASLock *set;
  _QWORD v4[4];
  unsigned __int8 v5;

  set = self->_set;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PPQuickTypeExplanationSet_push___block_invoke;
  v4[3] = &__block_descriptor_33_e27_v16__0__NSMutableIndexSet_8l;
  v5 = a3;
  -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v4);
}

- (void)enumerateWithBlock:(id)a3
{
  id v4;
  _PASLock *set;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  set = self->_set;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke;
  v7[3] = &unk_1E226B0B0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v7);

}

- (unint64_t)count
{
  _PASLock *set;
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
  set = self->_set;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PPQuickTypeExplanationSet_count__block_invoke;
  v5[3] = &unk_1E226B0D8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PPQuickTypeExplanationSet)initWithCoder:(id)a3
{
  id v4;
  PPQuickTypeExplanationSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _PASLock *set;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PPQuickTypeExplanationSet;
  v5 = -[PPQuickTypeExplanationSet init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D7805AC]();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("iset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (!v9)
    {
      v10 = (void *)MEMORY[0x18D7805AC]();
      v11 = objc_alloc(MEMORY[0x1E0C99E60]);
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("set"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_opt_new();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v9, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v20++), "unsignedIntegerValue"));
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v18);
      }

    }
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v9);
    set = v5->_set;
    v5->_set = (_PASLock *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PASLock *set;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  set = self->_set;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PPQuickTypeExplanationSet_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E226B100;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v7);

}

- (unint64_t)hash
{
  _PASLock *set;
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
  set = self->_set;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PPQuickTypeExplanationSet_hash__block_invoke;
  v5[3] = &unk_1E226B0D8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  id v5;
  _PASLock *set;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D815F0]);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__5322;
    v16 = __Block_byref_object_dispose__5323;
    v17 = 0;
    set = self->_set;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__PPQuickTypeExplanationSet_copyWithZone___block_invoke;
    v11[3] = &unk_1E226B0D8;
    v11[4] = &v12;
    -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v11);
    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    v8 = objc_msgSend(v5, "initWithGuardedData:", v7);
    v9 = (void *)v4[1];
    v4[1] = v8;

  }
  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<PPQuickTypeExplanationSet: ("));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PPQuickTypeExplanationSet_description__block_invoke;
  v6[3] = &unk_1E226B128;
  v4 = v3;
  v7 = v4;
  -[PPQuickTypeExplanationSet enumerateWithBlock:](self, "enumerateWithBlock:", v6);
  objc_msgSend(v4, "appendString:", CFSTR(")>"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PPQuickTypeExplanationSet *v4;
  PPQuickTypeExplanationSet *v5;
  BOOL v6;

  v4 = (PPQuickTypeExplanationSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPQuickTypeExplanationSet isEqualToQuickTypeExplanationSet:](self, "isEqualToQuickTypeExplanationSet:", v5);

  return v6;
}

- (BOOL)isEqualToQuickTypeExplanationSet:(id)a3
{
  PPQuickTypeExplanationSet *v4;
  PPQuickTypeExplanationSet *v5;
  unint64_t v6;
  uint64_t v7;
  _PASLock *set;
  id v9;
  _PASLock *v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = (PPQuickTypeExplanationSet *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v12 = 1;
    goto LABEL_7;
  }
  v6 = -[PPQuickTypeExplanationSet count](self, "count");
  if (v6 == -[PPQuickTypeExplanationSet count](v5, "count"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__5322;
    v22 = __Block_byref_object_dispose__5323;
    v23 = 0;
    v7 = MEMORY[0x1E0C809B0];
    set = self->_set;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke;
    v17[3] = &unk_1E226B0D8;
    v17[4] = &v18;
    -[_PASLock runWithLockAcquired:](set, "runWithLockAcquired:", v17);
    v9 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    LOBYTE(v21) = 0;
    v10 = v5->_set;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke_2;
    v14[3] = &unk_1E226B150;
    v16 = &v18;
    v11 = v9;
    v15 = v11;
    -[_PASLock runWithLockAcquired:](v10, "runWithLockAcquired:", v14);
    v12 = *((_BYTE *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
LABEL_5:
    v12 = 0;
  }
LABEL_7:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
}

void __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __62__PPQuickTypeExplanationSet_isEqualToQuickTypeExplanationSet___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__PPQuickTypeExplanationSet_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  +[PPQuickTypeExplanationSet stringFromExplanation:](PPQuickTypeExplanationSet, "stringFromExplanation:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("; "));
}

void __42__PPQuickTypeExplanationSet_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __33__PPQuickTypeExplanationSet_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __45__PPQuickTypeExplanationSet_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a2, CFSTR("iset"));
}

uint64_t __34__PPQuickTypeExplanationSet_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke_2;
  v3[3] = &unk_1E226B088;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateIndexesUsingBlock:", v3);

}

uint64_t __48__PPQuickTypeExplanationSet_enumerateWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __34__PPQuickTypeExplanationSet_push___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addIndex:", *(unsigned __int8 *)(a1 + 32));
}

+ (id)stringFromExplanation:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x30)
    return CFSTR("None");
  else
    return off_1E226B170[(a3 - 1)];
}

+ (id)uniqueKeycodeFromExplanation:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x30)
    return CFSTR("None");
  else
    return off_1E226B2F8[(a3 - 1)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
