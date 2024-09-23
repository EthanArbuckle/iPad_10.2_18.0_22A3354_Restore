@implementation _PSFeatureDictionary

- (_PSFeatureDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  _PSFeatureDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = -[_PSFeatureDictionary init](self, "init");
  if (v8 && a5)
  {
    do
    {
      v10 = (uint64_t)*a3++;
      v9 = v10;
      v11 = (uint64_t)*a4++;
      -[_PSFeatureDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, v11);
      --a5;
    }
    while (a5);
  }
  return v8;
}

- (_QWORD)_timeBucketsCreateIfNeeded
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)_unoptimizedValuesCreateIfNeeded
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = (void *)v1[2];
      v1[2] = v3;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (unint64_t)count
{
  return self->_count;
}

+ (id)_toPlistValue:(uint64_t)a1
{
  id v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  double v14;

  v2 = a2;
  objc_opt_self();
  if (!objc_msgSend(v2, "hasBoolValue"))
  {
    if (objc_msgSend(v2, "hasIntValue"))
    {
      v6 = (void *)MEMORY[0x1A1AFCA24]();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "intValue"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v2, "hasDoubleValue"))
      {
        objc_msgSend(v2, "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v5 = v13;

        goto LABEL_18;
      }
      v6 = (void *)MEMORY[0x1A1AFCA24]();
      objc_msgSend(v2, "doubleValue");
      v8 = v7;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v7);
      if (malloc_size(v9) || (objc_msgSend(v9, "timeIntervalSinceReferenceDate"), v14 != v8))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = v9;
      }
      v5 = v10;

    }
    objc_autoreleasePoolPop(v6);
    goto LABEL_18;
  }
  v3 = objc_msgSend(v2, "BOOLValue");
  v4 = &unk_1E442D0A0;
  if (v3)
    v4 = &unk_1E442D078;
  v5 = v4;
LABEL_18:

  return v5;
}

+ (uint64_t)_fromPlistValue:(uint64_t)a3 timeBucket:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  uint64_t *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;

  v4 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (CFNumberIsFloatType((CFNumberRef)v4))
      {
        if ((_DWORD)a3 || (objc_msgSend(v4, "doubleValue"), v11 != 0.0))
        {
          v12 = objc_alloc(MEMORY[0x1E0D020D0]);
          v13 = 0;
          v14 = v4;
LABEL_30:
          v15 = 0;
          goto LABEL_31;
        }
        if (internedValues_onceToken == -1)
        {
LABEL_42:
          v21 = (void *)internedValues_values_4;
LABEL_43:
          v22 = v21;
          goto LABEL_44;
        }
LABEL_49:
        dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
        goto LABEL_42;
      }
      if (!(_DWORD)a3)
      {
        v23 = objc_msgSend(v4, "unsignedIntegerValue");
        if (v23 == 1)
        {
          if (internedValues_onceToken != -1)
            dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
          v21 = (void *)internedValues_values_3;
          goto LABEL_43;
        }
        if (!v23)
        {
          if (internedValues_onceToken != -1)
            dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
          v21 = (void *)internedValues_values_2;
          goto LABEL_43;
        }
      }
      v12 = objc_alloc(MEMORY[0x1E0D020D0]);
      v13 = v4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_alloc(MEMORY[0x1E0D020D0]);
        v13 = 0;
        v14 = 0;
        v15 = v4;
LABEL_31:
        v22 = (id)objc_msgSend(v12, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", v13, v14, v15, 0, a3);
LABEL_44:
        v10 = (uint64_t)v22;
        goto LABEL_45;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "timeIntervalSinceReferenceDate");
        v20 = v19;
        if ((_DWORD)a3 || v19 != 0.0)
        {
          v24 = objc_alloc(MEMORY[0x1E0D020D0]);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v24;
          v8 = v6;
          v9 = 0;
          goto LABEL_4;
        }
        if (internedValues_onceToken == -1)
          goto LABEL_42;
        goto LABEL_49;
      }
      if (!(_DWORD)a3)
      {
        if (internedValues_onceToken != -1)
          dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
        v21 = (void *)internedValues_values_5;
        goto LABEL_43;
      }
      v12 = objc_alloc(MEMORY[0x1E0D020D0]);
      v13 = 0;
    }
    v14 = 0;
    goto LABEL_30;
  }
  if (!(_DWORD)a3)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BOOL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
    {
      if (internedValues_onceToken != -1)
        dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
      v18 = &internedValues_values_0;
    }
    else
    {
      if (internedValues_onceToken != -1)
        dispatch_once(&internedValues_onceToken, &__block_literal_global_26);
      v18 = &internedValues_values_1;
    }
    v21 = (void *)*v18;
    goto LABEL_43;
  }
  v5 = objc_alloc(MEMORY[0x1E0D020D0]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BOOL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = 0;
  v9 = v6;
LABEL_4:
  v10 = objc_msgSend(v7, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, v8, 0, v9, a3);

LABEL_45:
  return v10;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_timeBuckets;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_timeBuckets, "objectForKeyedSubscript:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v14 = v12;
          v13 = (void *)+[_PSFeatureDictionary _fromPlistValue:timeBucket:]((uint64_t)_PSFeatureDictionary, v12, objc_msgSend(v10, "integerValue"));

          goto LABEL_11;
        }

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_unoptimizedValues, "objectForKeyedSubscript:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v13;
}

- (id)keyEnumerator
{
  uint64_t v3;
  NSMutableDictionary *unoptimizedValues;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[NSMutableDictionary count](self->_timeBuckets, "count");
  if (v3 == 1)
  {
    if (!-[NSMutableDictionary count](self->_unoptimizedValues, "count"))
    {
      v8 = (void *)MEMORY[0x1A1AFCA24]();
      -[NSMutableDictionary objectEnumerator](self->_timeBuckets, "objectEnumerator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "keyEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v8);
      return v6;
    }
  }
  else if (!v3)
  {
    if (self->_unoptimizedValues)
      unoptimizedValues = self->_unoptimizedValues;
    else
      unoptimizedValues = (NSMutableDictionary *)MEMORY[0x1E0C9AA70];
    -[NSMutableDictionary keyEnumerator](unoptimizedValues, "keyEnumerator");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v5 = -[_PSFeatureDictionaryEnumerator initWithCollection:]((uint64_t)[_PSFeatureDictionaryEnumerator alloc], self);
LABEL_9:
  v6 = (void *)v5;
  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v11;
    v8 = +[_PSFeatureDictionary _toPlistValue:]((uint64_t)_PSFeatureDictionary, v7);
    v9 = objc_msgSend(v7, "timeBucketValue");

    -[_PSFeatureDictionary _setPlistValue:inTimeBucket:forKey:](self, v8, v9, v6);
  }
  else
  {
    -[_PSFeatureDictionary _removeObjectForKey:]((uint64_t)self, v6);
    -[_PSFeatureDictionary _unoptimizedValuesCreateIfNeeded](self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

    ++self->_count;
  }

}

- (void)_setPlistValue:(uint64_t)a3 inTimeBucket:(void *)a4 forKey:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a4;
  if (a1)
  {
    -[_PSFeatureDictionary _removeObjectForKey:]((uint64_t)a1, v7);
    v8 = (void *)a1[1];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v10 = (void *)objc_opt_new();
      -[_PSFeatureDictionary _timeBucketsCreateIfNeeded](a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v7);
    ++a1[3];

  }
}

- (void)_removeObjectForKey:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD *, void *, void *, _BYTE *);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__11;
    v20 = __Block_byref_object_dispose__11;
    v21 = 0;
    v5 = *(void **)(a1 + 8);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __44___PSFeatureDictionary__removeObjectForKey___block_invoke;
    v11 = &unk_1E4400E90;
    v6 = v3;
    v14 = &v22;
    v15 = &v16;
    v12 = v6;
    v13 = a1;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v8);
    if (*((_BYTE *)v23 + 24))
    {
      if (v17[5])
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", 0, v8, v9, v10, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v6, v8, v9, v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", 0, v6);
        --*(_QWORD *)(a1 + 24);
      }
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }

}

- (void)addFeatureWithIntValue:(id)a3 doubleValue:(id)a4 stringValue:(id)a5 BOOLValue:(id)a6 timeBucket:(int)a7 forKey:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  double v30;
  id v31;
  int v32;
  void *v33;
  id v34;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (v14)
  {
    if (CFNumberIsFloatType((CFNumberRef)v14))
    {
      v19 = (void *)MEMORY[0x1A1AFCA24]();
      v20 = objc_msgSend(v14, "unsignedIntValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v19);
      v14 = (id)v21;
    }
    v22 = v14;
    v34 = v22;
  }
  else
  {
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      v24 = v23;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v23);
      if (!malloc_size(v25)
        && (objc_msgSend(v25, "timeIntervalSinceReferenceDate"), v30 == v24)
        && (v31 = v25) != 0)
      {
        v22 = v31;
      }
      else
      {
        if (!CFNumberIsFloatType((CFNumberRef)v15))
        {
          v26 = (void *)MEMORY[0x1A1AFCA24]();
          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "doubleValue");
          objc_msgSend(v27, "numberWithDouble:");
          v28 = objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v26);
          v15 = (id)v28;
        }
        v22 = v15;
        v15 = v22;
      }

    }
    else
    {
      if (v16)
      {
        v29 = (id)objc_msgSend(v16, "copy");
      }
      else if (v17)
      {
        v32 = objc_msgSend(v17, "BOOLValue");
        v33 = &unk_1E442D0F0;
        if (v32)
          v33 = &unk_1E442D0C8;
        v29 = v33;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v29 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v29;
      v15 = 0;
    }
    v34 = 0;
  }
  -[_PSFeatureDictionary _setPlistValue:inTimeBucket:forKey:](self, v22, v9, v18);

}

- (void)removeObjectForKey:(id)a3
{
  -[_PSFeatureDictionary _removeObjectForKey:]((uint64_t)self, a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  NSMutableDictionary *timeBuckets;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (_QWORD *)objc_opt_new();
  v4[3] = self->_count;
  timeBuckets = self->_timeBuckets;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44___PSFeatureDictionary_mutableCopyWithZone___block_invoke;
  v10[3] = &unk_1E4400EB8;
  v6 = v4;
  v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](timeBuckets, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = -[NSMutableDictionary mutableCopy](self->_unoptimizedValues, "mutableCopy");
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (void)addEntriesFromDictionary:(id)a3
{
  -[_PSFeatureDictionary addEntriesFromDictionary:overwrite:](self, "addEntriesFromDictionary:overwrite:", a3, 1);
}

- (void)addEntriesFromDictionary:(id)a3 overwrite:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableDictionary *unoptimizedValues;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  uint64_t v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *context;
  id v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[5];
  BOOL v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v4 = a4;
  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v6;
    v7 = 0x1EE5A6000;
    if (v4 && self->_count)
    {
      v48 = v6;
      v8 = v56[3];
      context = (void *)MEMORY[0x1A1AFCA24]();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      -[NSMutableDictionary objectEnumerator](self->_timeBuckets, "objectEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      v9 = 0;
      if (v53)
      {
        v51 = *(_QWORD *)v72;
        v52 = v8;
        while (2)
        {
          for (i = 0; i != v53; ++i)
          {
            if (*(_QWORD *)v72 != v51)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            v54 = objc_msgSend(v11, "count");
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v12 = v56;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v68;
              do
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v68 != v15)
                    objc_enumerationMutation(v12);
                  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j));
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
              }
              while (v14);
            }

            v9 += v54 - objc_msgSend(v11, "count");
            v8 = v52;
            if (v9 == v52)
            {

              goto LABEL_42;
            }
          }
          v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          if (v53)
            continue;
          break;
        }
      }

      v6 = v48;
      v7 = 0x1EE5A6000uLL;
      if (v9 != v8)
      {
        unoptimizedValues = self->_unoptimizedValues;
        if (unoptimizedValues)
        {
          v18 = -[NSMutableDictionary count](unoptimizedValues, "count");
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v19 = v56;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v64;
            do
            {
              for (k = 0; k != v21; ++k)
              {
                if (*(_QWORD *)v64 != v22)
                  objc_enumerationMutation(v19);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unoptimizedValues, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
            }
            while (v21);
          }

          v8 = v18 + v9 - -[NSMutableDictionary count](self->_unoptimizedValues, "count");
LABEL_42:
          v6 = v48;
          v7 = 0x1EE5A6000uLL;
        }
        else
        {
          v8 = v9;
        }
      }
      self->_count -= v8;
      objc_autoreleasePoolPop(context);
    }
    v33 = (void *)MEMORY[0x1A1AFCA24]();
    v34 = (void *)v56[1];
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __59___PSFeatureDictionary_addEntriesFromDictionary_overwrite___block_invoke;
    v61[3] = &unk_1E4400EE0;
    v61[4] = self;
    v62 = v4;
    objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v61);
    v35 = *(int *)(v7 + 3452);
    v36 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "count");
    v37 = *(void **)((char *)v56 + v35);
    if (v36)
    {
      if (!objc_msgSend(v37, "count"))
      {
LABEL_59:
        objc_autoreleasePoolPop(v33);

        goto LABEL_60;
      }
      v49 = v6;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v38 = *(id *)((char *)v56 + v35);
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v80, 16);
      if (v39)
      {
        v40 = v39;
        v55 = v33;
        v41 = *(_QWORD *)v58;
        do
        {
          for (m = 0; m != v40; ++m)
          {
            if (*(_QWORD *)v58 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m);
            if (!v4)
            {
              -[_PSFeatureDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * m));
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
                continue;
            }
            ++self->_count;
            objc_msgSend(*(id *)((char *)v56 + v35), "objectForKeyedSubscript:", v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v35), "setObject:forKeyedSubscript:", v45, v43);

          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v57, v80, 16);
        }
        while (v40);
        v6 = v49;
        v33 = v55;
      }
    }
    else
    {
      v46 = (objc_class *)objc_msgSend(v37, "mutableCopy");
      v38 = *(Class *)((char *)&self->super.super.super.isa + v35);
      *(Class *)((char *)&self->super.super.super.isa + v35) = v46;
    }

    goto LABEL_59;
  }
  if (v4)
  {
    v79.receiver = self;
    v79.super_class = (Class)_PSFeatureDictionary;
    -[_PSFeatureDictionary addEntriesFromDictionary:](&v79, sel_addEntriesFromDictionary_, v6);
  }
  else
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v24 = v6;
    v25 = v6;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v76;
      do
      {
        for (n = 0; n != v27; ++n)
        {
          if (*(_QWORD *)v76 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * n);
          -[_PSFeatureDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            objc_msgSend(v25, "objectForKeyedSubscript:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSFeatureDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v32, v30);

            ++self->_count;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v27);
    }

    v6 = v24;
  }
LABEL_60:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unoptimizedValues, 0);
  objc_storeStrong((id *)&self->_timeBuckets, 0);
}

@end
