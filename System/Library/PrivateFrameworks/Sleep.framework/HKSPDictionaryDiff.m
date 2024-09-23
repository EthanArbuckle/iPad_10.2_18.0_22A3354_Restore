@implementation HKSPDictionaryDiff

- (HKSPDictionaryDiff)initWithOriginalDictionary:(id)a3 updatedDictionary:(id)a4 keysToDiff:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKSPDictionaryDiff *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  NSDictionary *updatedProperties;
  uint64_t v21;
  NSSet *removedKeys;
  HKSPDictionaryDiff *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(id *, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)HKSPDictionaryDiff;
  v11 = -[HKSPDictionaryDiff init](&v36, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v14 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke;
    v32[3] = &unk_1E4E3C850;
    v15 = v10;
    v33 = v15;
    v16 = v8;
    v34 = v16;
    v35 = v12;
    v17 = v12;
    objc_msgSend(v9, "na_each:", v32);
    v25 = v14;
    v26 = 3221225472;
    v27 = __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke_2;
    v28 = &unk_1E4E3C850;
    v29 = v15;
    v30 = v9;
    v31 = v13;
    v18 = v13;
    objc_msgSend(v16, "na_each:", &v25);
    v19 = objc_msgSend(v17, "copy", v25, v26, v27, v28);
    updatedProperties = v11->_updatedProperties;
    v11->_updatedProperties = (NSDictionary *)v19;

    v21 = objc_msgSend(v18, "copy");
    removedKeys = v11->_removedKeys;
    v11->_removedKeys = (NSSet *)v21;

    v23 = v11;
  }

  return v11;
}

void __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(a1[4], "containsObject:", v8))
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = NAEqualObjects();

    if ((v7 & 1) == 0)
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v5, v8);
  }

}

void __78__HKSPDictionaryDiff_initWithOriginalDictionary_updatedDictionary_keysToDiff___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(a1[6], "addObject:", v4);
  }

}

- (BOOL)equalDictionaries
{
  return !-[NSDictionary count](self->_updatedProperties, "count") && -[NSSet count](self->_removedKeys, "count") == 0;
}

- (NSDictionary)updatedProperties
{
  return self->_updatedProperties;
}

- (NSSet)removedKeys
{
  return self->_removedKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedKeys, 0);
  objc_storeStrong((id *)&self->_updatedProperties, 0);
}

@end
