@implementation PETAggregateState

- (void)incrementCounterBy:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5
{
  PETAggregateStateStorage *storage;
  _QWORD v6[5];

  storage = self->_storage;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PETAggregateState_incrementCounterBy_forKey_keyLength___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B44__0B8_v12_v20_v28Q36l;
  *(double *)&v6[4] = a3;
  lookupBlockCreatingIfNotExists(storage, (uint64_t)a4, a5, 1, 8u, v6);
}

uint64_t __57__PETAggregateState_incrementCounterBy_forKey_keyLength___block_invoke(uint64_t a1, char a2, double *a3)
{
  double v3;

  v3 = 0.0;
  if ((a2 & 1) == 0)
    v3 = *a3;
  *a3 = *(double *)(a1 + 32) + v3;
  return 0;
}

uint64_t __80__PETAggregateState_updateDistributionWithValue_forKey_keyLength_maxSampleSize___block_invoke(uint64_t a1, char a2, unsigned __int16 *a3, _QWORD *a4, uint64_t a5, unint64_t a6)
{
  unsigned int v7;
  unsigned __int16 v8;
  uint64_t v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t result;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int *v29;

  v7 = *(unsigned __int16 *)(a1 + 48);
  if (*(_WORD *)(a1 + 48))
  {
    if (v7 >= 0xFB)
      LOWORD(v7) = 255 * ((16843010 * (unint64_t)((unsigned __int16)(v7 - 250) + 254)) >> 32) + 250;
    else
      LOWORD(v7) = 250;
  }
  if ((a2 & 1) != 0)
  {
    v8 = 0;
    v9 = 0x4597AFFEFFFFFFFFLL;
    v10 = 1;
    v11 = 0.0;
    v12 = NAN;
    v13 = NAN;
    v14 = 0.0;
  }
  else
  {
    if (*a3 != (unsigned __int16)v7)
      goto LABEL_36;
    v9 = *((_QWORD *)a3 + 5);
    if (HIDWORD(v9) != 1167568894)
      goto LABEL_36;
    v8 = a3[1];
    v14 = *((double *)a3 + 1);
    v11 = *((double *)a3 + 2);
    v13 = *((double *)a3 + 3);
    v12 = *((double *)a3 + 4);
    v10 = *((_DWORD *)a3 + 1) + 1;
  }
  v15 = *(double *)(a1 + 40);
  v16 = v14 + (v15 - v14) / (double)v10;
  v17 = v11 + (v15 - v14) * (v15 - v16);
  if (v13 <= v15)
    v18 = v13;
  else
    v18 = *(double *)(a1 + 40);
  if (v12 < v15)
    v12 = *(double *)(a1 + 40);
  if (!(_WORD)v7)
  {
    result = 0;
    *a3 = 0;
LABEL_35:
    a3[1] = v8;
    *((_DWORD *)a3 + 1) = v10;
    *((double *)a3 + 1) = v16;
    *((double *)a3 + 2) = v17;
    *((double *)a3 + 3) = v18;
    *((double *)a3 + 4) = v12;
    *((_QWORD *)a3 + 5) = v9;
    return result;
  }
  if (v10 <= (unsigned __int16)v7)
  {
    LOWORD(v24) = v10 - 1;
    ++v8;
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)(v19 + 16);
    v21 = *(_QWORD *)(v19 + 24);
    v22 = v21 + v20;
    v23 = v21 ^ v20;
    *(_QWORD *)(v19 + 16) = __ROR8__(v20, 9) ^ (v23 << 14) ^ v23;
    *(_QWORD *)(v19 + 24) = __ROR8__(v23, 28);
    v24 = v22 % v10;
    if (v24 >= (unsigned __int16)v7)
    {
      result = 0;
LABEL_34:
      *a3 = v7;
      goto LABEL_35;
    }
  }
  if ((unsigned __int16)v24 <= 0xF9u)
  {
    result = 0;
    *(double *)&a3[4 * (unsigned __int16)v24 + 24] = v15;
    goto LABEL_34;
  }
  v26 = (unsigned __int16)v24 - 250;
  v27 = v9;
  if ((_DWORD)v9 == -1)
  {
    LODWORD(v29) = (_DWORD)a3 + 40;
LABEL_31:
    if (v26 < 0xFF)
    {
      *a4 = 0xE47F4EAAFFFFFFFFLL;
      a4[(unsigned __int16)v26 + 1] = *(_QWORD *)(a1 + 40);
      *a3 = v7;
      a3[1] = v8;
      *((_DWORD *)a3 + 1) = v10;
      *((double *)a3 + 1) = v16;
      *((double *)a3 + 2) = v17;
      *((double *)a3 + 3) = v18;
      *((double *)a3 + 4) = v12;
      *((_QWORD *)a3 + 5) = v9;
      setBucketPtr(a5, a6, (_DWORD)v29 - a5, (_DWORD)a4 - a5, *(void **)(*(_QWORD *)(a1 + 32) + 8));
      return 1;
    }
  }
  else
  {
    while (1)
    {
      v28 = v27;
      if ((unint64_t)v27 + 2048 > a6)
        break;
      v29 = (unsigned int *)(a5 + v27);
      if (v29[1] != -461418838)
        break;
      if (v26 <= 0xFE)
      {
        result = 0;
        *(double *)&v29[2 * (unsigned __int16)v26 + 2] = v15;
        goto LABEL_34;
      }
      v27 = *v29;
      if (v28 >= *v29)
        break;
      v26 -= 255;
      if (v27 == -1)
        goto LABEL_31;
    }
  }
LABEL_36:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveCorruptState");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resetLocked");
  __break(1u);
  return result;
}

- (void)updateDistributionWithValue:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5 maxSampleSize:(unsigned __int16)a6
{
  PETAggregateStateStorage *storage;
  unsigned int v7;
  _QWORD v8[6];
  unsigned __int16 v9;

  storage = self->_storage;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PETAggregateState_updateDistributionWithValue_forKey_keyLength_maxSampleSize___block_invoke;
  v8[3] = &unk_1E2A411C8;
  v9 = a6;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  if (a5)
    v7 = 2048;
  else
    v7 = 48;
  lookupBlockCreatingIfNotExists(storage, (uint64_t)a4, a5, 2, v7, v8);
}

- (PETAggregateState)initWithStorage:(id)a3
{
  id v6;
  PETAggregateState *v7;
  PETAggregateState *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PETAggregateState.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PETAggregateState;
  v7 = -[PETAggregateState init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_storage, a3);
    v8->_rng = ($FEF0A0984D2795EAE1E2AD40E2F6E7E6)xmmword_18FADA990;
  }

  return v8;
}

- (id)initInMemory
{
  void *v3;
  PETAggregateState *v4;
  PETAggregateState *v5;

  +[PETAggregateStateStorage storageInMemory](PETAggregateStateStorage, "storageInMemory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[PETAggregateState initWithStorage:](self, "initWithStorage:", v3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (PETAggregateState)initWithPath:(id)a3
{
  void *v4;
  PETAggregateState *v5;
  PETAggregateState *v6;

  +[PETAggregateStateStorage storageOnDisk:](PETAggregateStateStorage, "storageOnDisk:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[PETAggregateState initWithStorage:](self, "initWithStorage:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)updateCounterTo:(double)a3 forKey:(const void *)a4 keyLength:(unsigned __int16)a5
{
  PETAggregateStateStorage *storage;
  _QWORD v6[5];

  storage = self->_storage;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PETAggregateState_updateCounterTo_forKey_keyLength___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B44__0B8_v12_v20_v28Q36l;
  *(double *)&v6[4] = a3;
  lookupBlockCreatingIfNotExists(storage, (uint64_t)a4, a5, 1, 8u, v6);
}

- (void)incrementCounterBy:(double)a3 forKey:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PETAggregateState_incrementCounterBy_forKey___block_invoke;
  v4[3] = &unk_1E2A41218;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  callWithHashableBytesOfString(a4, v4);
}

- (void)updateCounterTo:(double)a3 forKey:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PETAggregateState_updateCounterTo_forKey___block_invoke;
  v4[3] = &unk_1E2A41218;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  callWithHashableBytesOfString(a4, v4);
}

- (void)updateDistributionWithValue:(double)a3 forKey:(id)a4 maxSampleSize:(unsigned __int16)a5
{
  _QWORD v5[6];
  unsigned __int16 v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PETAggregateState_updateDistributionWithValue_forKey_maxSampleSize___block_invoke;
  v5[3] = &unk_1E2A41240;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  v6 = a5;
  callWithHashableBytesOfString(a4, v5);
}

- (void)enumerateCounters:(id)a3 distributions:(id)a4
{
  id v6;
  id v7;
  PETAggregateStateStorage *storage;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  storage = self->_storage;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PETAggregateState_enumerateCounters_distributions___block_invoke;
  v11[3] = &unk_1E2A41268;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[PETAggregateStateStorage runWithLock:](storage, "runWithLock:", v11);

}

- (void)reset
{
  -[PETAggregateStateStorage reset](self->_storage, "reset");
  self->_rng = ($FEF0A0984D2795EAE1E2AD40E2F6E7E6)xmmword_18FADA990;
}

- (void)enumerateAndResetCounters:(id)a3 distributions:(id)a4
{
  id v6;
  id v7;
  PETAggregateStateStorage *storage;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  storage = self->_storage;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PETAggregateState_enumerateAndResetCounters_distributions___block_invoke;
  v11[3] = &unk_1E2A41290;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[PETAggregateStateStorage expand:andRunWithLock:](storage, "expand:andRunWithLock:", 0, v11);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendString:", CFSTR("Stat aggregation store\n======================\n"));
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__PETAggregateState_description__block_invoke;
  v11[3] = &unk_1E2A412B8;
  v12 = v3;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __32__PETAggregateState_description__block_invoke_2;
  v9[3] = &unk_1E2A412E0;
  v5 = v12;
  v10 = v5;
  -[PETAggregateState enumerateCounters:distributions:](self, "enumerateCounters:distributions:", v11, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (BOOL)checkIntegrity
{
  PETAggregateStateStorage *storage;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  storage = self->_storage;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PETAggregateState_checkIntegrity__block_invoke;
  v5[3] = &unk_1E2A41308;
  v5[4] = self;
  v5[5] = &v6;
  -[PETAggregateStateStorage runWithLock:](storage, "runWithLock:", v5);
  v3 = *((_BYTE *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

uint64_t __35__PETAggregateState_checkIntegrity__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unsigned __int8 *v9;
  BOOL v10;

  v6 = 0;
  while (2)
  {
    result = getBucketPtr(a2, a3, 4 * v6, *(void **)(*(_QWORD *)(a1 + 32) + 8));
    while ((_DWORD)result != -1)
    {
      v8 = result + 10;
      if (v8 <= a3)
      {
        v9 = (unsigned __int8 *)(a2 + result);
        if (*v9 == 228)
        {
          v10 = v8 + *((unsigned __int16 *)v9 + 2) + *((unsigned __int16 *)v9 + 1) > a3
             || result >= *(_DWORD *)(v9 + 6);
          result = *(unsigned int *)(v9 + 6);
          if (!v10)
            continue;
        }
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      return result;
    }
    if (++v6 != 256)
      continue;
    break;
  }
  return result;
}

void __32__PETAggregateState_description__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, double a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  displayStringForKey(a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCOUNTER '%@': %g\n"), v6, *(_QWORD *)&a4);

}

uint64_t __32__PETAggregateState_description__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6, uint64_t a7, unsigned __int16 *a8, double a9, double a10, double a11, double a12)
{
  uint64_t v22;
  uint64_t v23;
  unsigned __int16 *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;

  v22 = a6;
  if (a6 < 1)
  {
    v23 = 0;
  }
  else
  {
    LODWORD(v23) = 0;
    v24 = a8;
    v25 = a6;
    do
    {
      v26 = *v24++;
      v23 = (v23 + v26);
      --v25;
    }
    while (v25);
  }
  v27 = *(void **)(a1 + 32);
  displayStringForKey(a2, a3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendFormat:", CFSTR("\nDISTRIBUTION '%@' (sampled %i of %u from %u observations)\n"), v28, v23, a4, a5);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("    mean: %g\n    std. dev: %g\n    range: [%g, %g]\n    samples: ["), *(_QWORD *)&a9, sqrt(a10), *(_QWORD *)&a11, *(_QWORD *)&a12);
  if (a6 >= 1)
  {
    v29 = 0;
    do
    {
      if (a8[v29])
      {
        v30 = 0;
        do
          objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%g, "), *(_QWORD *)(*(_QWORD *)(a7 + 8 * v29) + 8 * v30++));
        while (v30 < a8[v29]);
      }
      ++v29;
    }
    while (v29 != v22);
  }
  if ((_DWORD)v23)
    objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", objc_msgSend(*(id *)(a1 + 32), "length") - 2, 2);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("]\n"));
}

uint64_t __61__PETAggregateState_enumerateAndResetCounters_distributions___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, _BYTE *a5)
{
  unsigned int i;
  unsigned int BucketPtr;

  for (i = 0; i != 1024; i += 4)
  {
    BucketPtr = getBucketPtr(a2, a3, i, *(void **)(*(_QWORD *)(a1 + 32) + 8));
    enumerateChain(a2, a3, BucketPtr, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(*(_QWORD *)(a1 + 32) + 8));
  }
  *a5 = 1;
  return 0;
}

void __53__PETAggregateState_enumerateCounters_distributions___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int i;
  unsigned int BucketPtr;

  for (i = 0; i != 1024; i += 4)
  {
    BucketPtr = getBucketPtr(a2, a3, i, *(void **)(*(_QWORD *)(a1 + 32) + 8));
    enumerateChain(a2, a3, BucketPtr, *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(*(_QWORD *)(a1 + 32) + 8));
  }
}

uint64_t __70__PETAggregateState_updateDistributionWithValue_forKey_maxSampleSize___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDistributionWithValue:forKey:keyLength:maxSampleSize:", a2, a3, *(unsigned __int16 *)(a1 + 48), *(double *)(a1 + 40));
}

uint64_t __44__PETAggregateState_updateCounterTo_forKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCounterTo:forKey:keyLength:", a2, a3, *(double *)(a1 + 40));
}

uint64_t __47__PETAggregateState_incrementCounterBy_forKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "incrementCounterBy:forKey:keyLength:", a2, a3, *(double *)(a1 + 40));
}

uint64_t __54__PETAggregateState_updateCounterTo_forKey_keyLength___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = *(_QWORD *)(a1 + 32);
  return 0;
}

+ (unsigned)hashForString:(id)a3
{
  id v3;
  unsigned __int8 v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PETAggregateState_hashForString___block_invoke;
  v6[3] = &unk_1E2A411F0;
  v6[4] = &v7;
  callWithHashableBytesOfString(v3, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __35__PETAggregateState_hashForString___block_invoke(uint64_t result, unsigned __int8 *a2, unsigned int a3)
{
  __int16 v3;
  uint64_t v4;
  __int16 v5;

  v3 = 8997;
  if (a3)
  {
    v4 = a3;
    do
    {
      v5 = *a2++;
      v3 = 435 * (v3 ^ v5);
      --v4;
    }
    while (v4);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v3 ^ HIBYTE(v3);
  return result;
}

@end
