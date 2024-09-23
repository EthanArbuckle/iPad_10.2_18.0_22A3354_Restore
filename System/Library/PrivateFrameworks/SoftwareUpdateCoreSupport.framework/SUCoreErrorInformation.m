@implementation SUCoreErrorInformation

void __50__SUCoreErrorInformation_safeUserInfoValueClasses__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "safeUserInfoValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)safeUserInfoValues
{
  return self->_safeUserInfoValues;
}

void __43__SUCoreErrorInformation_codeNameForError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  objc_msgSend(*(id *)(a1 + 32), "errorInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeDictionaryForKey:fromBase:withKeyDescription:", v3, CFSTR("SUCoreErrorInformation{codeNameForError} errorInformation"), CFSTR("errorInStack domain"));
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    objc_msgSend(v25, "safeObjectForKey:ofClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "codeName");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v15, CFSTR("SUCoreError"));

      v7 = (void *)MEMORY[0x1E0CB3940];
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(a1 + 40), "code"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = v23;
        goto LABEL_11;
      }
      +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v8;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@(%d)"), v8, objc_msgSend(*(id *)(a1 + 40), "code"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

LABEL_11:
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v9, CFSTR("SUCoreError"));

  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v10)
  {
    +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@(%d)"), v4, objc_msgSend(*(id *)(a1 + 40), "code"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(*(id *)(a1 + 40), "code"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;
  }
LABEL_12:

}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  objc_msgSend(*(id *)(a1 + 32), "errorInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeDictionaryForKey:fromBase:withKeyDescription:", v3, CFSTR("SUCoreErrorInformation{isIndication} errorInformation"), CFSTR("errorInStack domain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    objc_msgSend(v4, "safeObjectForKey:ofClass:", v5, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6
      && (objc_msgSend(v6, "indications")
       || (objc_msgSend(v7, "keyMatchTrueMap"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8)))
    {
      v9 = objc_msgSend(v7, "indications");
      v44[3] = v9;
      objc_msgSend(v7, "keyMatchTrue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v38[5];
      v38[5] = v10;

      objc_msgSend(v7, "keyMatchTrueMap");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v32[5];
      v32[5] = v12;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "layerInformation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_2;
      v26[3] = &unk_1E611C0F0;
      v27 = *(id *)(a1 + 40);
      v28 = &v43;
      v29 = &v37;
      v30 = &v31;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v26);

      v13 = v27;
    }

    v15 = v44[3];
    if (!v15 && !v32[5])
      goto LABEL_15;
    if (v38[5])
    {
      objc_msgSend(*(id *)(a1 + 40), "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "safeBooleanForKey:", v38[5]);

      if (v17)
      {
        v15 = v44[3];
LABEL_14:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= *(_QWORD *)(a1 + 56) & v15;
      }
    }
    else
    {
      v18 = (void *)v32[5];
      if (!v18)
        goto LABEL_14;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_3;
      v22[3] = &unk_1E611C118;
      v19 = *(id *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(a1 + 56);
      v23 = v19;
      v24 = v20;
      v25 = v21;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
LABEL_15:

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }

}

- (NSMutableDictionary)errorInformation
{
  return self->_errorInformation;
}

+ (int64_t)indicationsForError:(id)a3 matchingMask:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(v6, "informationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  objc_msgSend(v6, "informationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke;
  v13[3] = &unk_1E611C140;
  v14 = v6;
  v15 = v5;
  v16 = &v18;
  v17 = a4;
  v9 = v5;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

+ (id)codeNameForError:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  objc_msgSend(v4, "informationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  objc_msgSend(v4, "informationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SUCoreErrorInformation_codeNameForError___block_invoke;
  block[3] = &unk_1E611C0A0;
  v12 = v4;
  v13 = v3;
  v14 = &v15;
  v7 = v3;
  v8 = v4;
  dispatch_sync(v6, block);

  v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

+ (int64_t)allIndicationsForError:(id)a3
{
  return +[SUCoreErrorInformation indicationsForError:matchingMask:](SUCoreErrorInformation, "indicationsForError:matchingMask:", a3, 255);
}

void __40__SUCoreErrorInformation_layerForError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "layerInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SUCoreErrorInformation_layerForError___block_invoke_2;
  v5[3] = &unk_1E611C078;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

- (NSMutableDictionary)layerInformation
{
  return self->_layerInformation;
}

+ (int64_t)layerForError:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  int64_t v9;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 10;
  objc_msgSend(v4, "informationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  objc_msgSend(v4, "informationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SUCoreErrorInformation_layerForError___block_invoke;
  block[3] = &unk_1E611C0A0;
  v12 = v4;
  v13 = v3;
  v14 = &v15;
  v7 = v3;
  v8 = v4;
  dispatch_sync(v6, block);

  v9 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v9;
}

+ (id)safeUserInfoValueClasses
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  objc_msgSend(v2, "informationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  objc_msgSend(v2, "informationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SUCoreErrorInformation_safeUserInfoValueClasses__block_invoke;
  v8[3] = &unk_1E611BFB0;
  v9 = v2;
  v10 = &v11;
  v5 = v2;
  dispatch_sync(v4, v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __40__SUCoreErrorInformation_layerForError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v6, v7))
    goto LABEL_4;
  if (objc_msgSend(v11, "minCode") == -1)
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "code");
  if (v8 >= objc_msgSend(v11, "minCode"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "code");
    v10 = objc_msgSend(v11, "maxCode");

    if (v9 > v10)
      goto LABEL_8;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "errorLayer");
    *a4 = 1;
    goto LABEL_8;
  }
LABEL_4:

LABEL_8:
}

- (OS_dispatch_queue)informationQueue
{
  return self->_informationQueue;
}

+ (id)setupCoreErrorInformation
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  +[SUCoreErrorInformation sharedErrorInformation](SUCoreErrorInformation, "sharedErrorInformation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke;
  block[3] = &unk_1E611BF88;
  v3 = v2;
  v6 = v3;
  if (setupCoreErrorInformation_coreErrorInfoOnce != -1)
    dispatch_once(&setupCoreErrorInformation_coreErrorInfoOnce, block);

  return v3;
}

+ (id)sharedErrorInformation
{
  if (sharedErrorInformation_errorInfoOnce != -1)
    dispatch_once(&sharedErrorInformation_errorInfoOnce, &__block_literal_global_0);
  return (id)sharedErrorInformation_errorInfo;
}

void __48__SUCoreErrorInformation_sharedErrorInformation__block_invoke()
{
  SUCoreErrorInformation *v0;
  void *v1;

  v0 = objc_alloc_init(SUCoreErrorInformation);
  v1 = (void *)sharedErrorInformation_errorInfo;
  sharedErrorInformation_errorInfo = (uint64_t)v0;

}

- (SUCoreErrorInformation)init
{
  SUCoreErrorInformation *v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *informationQueue;
  NSMutableDictionary *v7;
  NSMutableDictionary *layerInformation;
  NSMutableDictionary *v9;
  NSMutableDictionary *errorInformation;
  uint64_t v11;
  NSArray *safeUserInfoValues;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SUCoreErrorInformation;
  v2 = -[SUCoreErrorInformation init](&v14, sel_init);
  if (v2)
  {
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.su.core.error.info"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create(v3, v4);
    informationQueue = v2->_informationQueue;
    v2->_informationQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    layerInformation = v2->_layerInformation;
    v2->_layerInformation = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errorInformation = v2->_errorInformation;
    v2->_errorInformation = v9;

    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v11 = objc_claimAutoreleasedReturnValue();
    safeUserInfoValues = v2->_safeUserInfoValues;
    v2->_safeUserInfoValues = (NSArray *)v11;

  }
  return v2;
}

- (void)_defineErrorLayers
{
  NSObject *v3;

  -[SUCoreErrorInformation informationQueue](self, "informationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 100, CFSTR("SUCoreError"), 8100, 8126);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 110, CFSTR("SUCoreError"), 8200, 8206);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 130, CFSTR("SUCoreError"), 8250, 8255);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 101, CFSTR("SUCoreError"), 8300, 8300);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 620, CFSTR("SUCoreError"), 8400, 8411);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 102, CFSTR("SUCoreError"), 8500, 8503);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 150, CFSTR("SUCoreError"), 8600, 8608);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 410, CFSTR("SUCoreError"), 8700, 8707);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 500, CFSTR("SUCoreError"), 8800, 8804);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 140, CFSTR("SUCoreError"), 8900, 8909);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 910, CFSTR("SUCoreError"), 9900, 9900);
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:](self, "_associateLayer:withDomain:minCode:maxCode:", 920, CFSTR("SUCoreError"), 9000, 9012);
}

- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
  -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:](self, "_associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, a5, a6, 0, 0, 0);
}

- (void)_associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;

  v13 = a4;
  v14 = a8;
  v15 = a9;
  -[SUCoreErrorInformation informationQueue](self, "informationQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", a3);
  -[SUCoreErrorInformation layerInformation](self, "layerInformation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeObjectForKey:ofClass:", v17, objc_opt_class());
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SUCoreErrorInformation _associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:].cold.1(a3, v21);

  }
  else
  {
    v19 = -[SUCoreErrorLayerGroup initForLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:]([SUCoreErrorLayerGroup alloc], "initForLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", a3, v13, a5, a6, a7, v14, v15);
    -[SUCoreErrorInformation layerInformation](self, "layerInformation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSafeObject:forKey:", v19, v17);

  }
}

- (void)_attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  int64_t v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  -[SUCoreErrorInformation informationQueue](self, "informationQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[SUCoreErrorInformation errorInformation](self, "errorInformation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeDictionaryForKey:fromBase:withKeyDescription:", v14, CFSTR("SUCoreErrorInformation{_attributesOfErrorForDomain} errorInformation"), CFSTR("error domain"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a4);
  if (!v20)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SUCoreErrorInformation errorInformation](self, "errorInformation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSafeObject:forKey:", v20, v14);

  }
  objc_msgSend(v20, "safeObjectForKey:ofClass:", v21, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    v24 = -[SUCoreErrorAttributes initForDomain:withCode:ofCodeName:indicating:ifKeyTrue:keyMatchTrueMap:]([SUCoreErrorAttributes alloc], "initForDomain:withCode:ofCodeName:indicating:ifKeyTrue:keyMatchTrueMap:", v14, a4, v15, a6, v16, v17);
    objc_msgSend(v20, "setSafeObject:forKey:", v24, v21);
    goto LABEL_13;
  }
  v24 = v23;
  v33 = v16;
  v25 = a6;
  objc_msgSend(v23, "domain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v14, v26)
    && objc_msgSend(v24, "code") == a4)
  {
    objc_msgSend(v24, "codeName");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    if (v27 == v15)
    {
      objc_msgSend(v24, "setIndications:", v25);
      v16 = v33;
      objc_msgSend(v24, "setKeyMatchTrue:", v33);
      objc_msgSend(v24, "setKeyMatchTrueMap:", v17);
      goto LABEL_13;
    }
  }
  else
  {

  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "oslog");
  v29 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v24, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v24, "code");
    objc_msgSend(v24, "codeName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v35 = v14;
    v36 = 1024;
    v37 = a4;
    v38 = 2114;
    v39 = v15;
    v40 = 2114;
    v41 = v30;
    v42 = 1024;
    v43 = v32;
    v44 = 2114;
    v45 = v31;
    _os_log_error_impl(&dword_1B05B8000, v29, OS_LOG_TYPE_ERROR, "[ERROR_INFORMATION] changing attributes of error [%{public}@:%d(%{public}@)] when already have attributes for error [%{public}@:%d(%{public}@)] | new attributes ignored", buf, 0x36u);

  }
  v16 = v33;
LABEL_13:

}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4
{
  +[SUCoreErrorInformation associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, -1, -1, 0, 0, 0);
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6
{
  +[SUCoreErrorInformation associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, a5, a6, 0, 0, 0);
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 indicating:(int64_t)a5 ifKeyTrue:(id)a6
{
  +[SUCoreErrorInformation associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, -1, -1, a5, a6, 0);
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 keyMatchTrueMap:(id)a5
{
  +[SUCoreErrorInformation associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, -1, -1, 0, 0, a5);
}

+ (void)associateLayer:(int64_t)a3 withDomain:(id)a4 minCode:(int64_t)a5 maxCode:(int64_t)a6 indicating:(int64_t)a7 ifKeyTrue:(id)a8 keyMatchTrueMap:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;

  v14 = a4;
  v15 = a8;
  v16 = a9;
  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "informationQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v18);

  objc_msgSend(v17, "informationQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__SUCoreErrorInformation_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke;
  block[3] = &unk_1E611C028;
  v25 = v17;
  v26 = v14;
  v29 = a3;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v27 = v15;
  v28 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v17;
  dispatch_sync(v19, block);

}

uint64_t __105__SUCoreErrorInformation_associateLayer_withDomain_minCode_maxCode_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_associateLayer:withDomain:minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (void)attributesOfSUCoreErrorCode:(int64_t)a3 indicating:(int64_t)a4
{
  id v6;

  +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreErrorInformation attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:", CFSTR("SUCoreError"), a3, v6, a4, 0, 0);

}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5
{
  +[SUCoreErrorInformation attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, a5, 0, 0, 0);
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6
{
  +[SUCoreErrorInformation attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, a5, a6, 0, 0);
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7
{
  +[SUCoreErrorInformation attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, a5, a6, a7, 0);
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 keyMatchTrueMap:(id)a6
{
  +[SUCoreErrorInformation attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:](SUCoreErrorInformation, "attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:", a3, a4, a5, 0, 0, a6);
}

+ (void)attributesOfErrorForDomain:(id)a3 withCode:(int64_t)a4 codeName:(id)a5 indicating:(int64_t)a6 ifKeyTrue:(id)a7 keyMatchTrueMap:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;
  int64_t v32;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "informationQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v18);

  objc_msgSend(v17, "informationQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__SUCoreErrorInformation_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke;
  block[3] = &unk_1E611C050;
  v26 = v17;
  v27 = v13;
  v31 = a4;
  v32 = a6;
  v28 = v14;
  v29 = v15;
  v30 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  dispatch_sync(v19, block);

}

uint64_t __108__SUCoreErrorInformation_attributesOfErrorForDomain_withCode_codeName_indicating_ifKeyTrue_keyMatchTrueMap___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attributesOfErrorForDomain:withCode:codeName:indicating:ifKeyTrue:keyMatchTrueMap:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

+ (id)nameForSUCoreLayer:(int64_t)a3
{
  id result;

  if (a3 <= 399)
  {
    if (a3 <= 139)
    {
      if (a3 > 101)
      {
        if (a3 > 119)
        {
          if (a3 == 120)
            return CFSTR("Scheduler");
          if (a3 == 130)
            return CFSTR("PersistedState");
        }
        else
        {
          if (a3 == 102)
            return CFSTR("FSM");
          if (a3 == 110)
            return CFSTR("EventReporter");
        }
      }
      else
      {
        if (a3 > 99)
        {
          if (a3 == 100)
            return CFSTR("SUCore");
          else
            return CFSTR("Diag");
        }
        if (!a3)
          return &stru_1E611E1C8;
        if (a3 == 10)
          return CFSTR("?");
      }
    }
    else if (a3 <= 160)
    {
      if (a3 > 150)
      {
        if (a3 == 151)
          return CFSTR("CacheDelete");
        if (a3 == 160)
          return CFSTR("Power");
      }
      else
      {
        if (a3 == 140)
          return CFSTR("Connect");
        if (a3 == 150)
          return CFSTR("Space");
      }
    }
    else if (a3 <= 209)
    {
      if (a3 == 161)
        return CFSTR("PowerManagement");
      if (a3 == 200)
        return CFSTR("OperatingSystem");
    }
    else
    {
      switch(a3)
      {
        case 210:
          return CFSTR("OSFilesystem");
        case 300:
          return CFSTR("Network");
        case 310:
          return CFSTR("NetworkServer");
      }
    }
    return CFSTR("!");
  }
  if (a3 > 599)
  {
    if (a3 > 709)
    {
      if (a3 <= 899)
      {
        if (a3 == 710)
          return CFSTR("BridgeOS");
        if (a3 == 711)
          return CFSTR("BridgeOSAMAuthInstall");
      }
      else
      {
        switch(a3)
        {
          case 900:
            return CFSTR("Test");
          case 910:
            return CFSTR("Simulate");
          case 920:
            return CFSTR("DocManager");
        }
      }
    }
    else if (a3 <= 619)
    {
      if (a3 == 600)
        return CFSTR("Facility");
      if (a3 == 610)
        return CFSTR("Policy");
    }
    else
    {
      switch(a3)
      {
        case 620:
          return CFSTR("Scan");
        case 630:
          return CFSTR("Update");
        case 700:
          return CFSTR("Extended");
      }
    }
    return CFSTR("!");
  }
  if (a3 > 499)
  {
    if (a3 > 510)
    {
      if (a3 == 511)
        return CFSTR("Personalization");
      if (a3 == 512)
        return CFSTR("Preflight");
    }
    else
    {
      if (a3 == 500)
        return CFSTR("SoftwareUpdate");
      if (a3 == 510)
        return CFSTR("MSU");
    }
    return CFSTR("!");
  }
  switch(a3)
  {
    case 400:
      result = CFSTR("Asset");
      break;
    case 410:
      result = CFSTR("MobileAsset");
      break;
    case 411:
      result = CFSTR("MobileAssetDownload");
      break;
    case 412:
      result = CFSTR("MobileAssetQuery");
      break;
    case 413:
      result = CFSTR("MobileAssetPurge");
      break;
    case 414:
      result = CFSTR("MobileAssetXPC");
      break;
    default:
      return CFSTR("!");
  }
  return result;
}

+ (id)codeNameForDomain:(id)a3 withCode:(int64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  +[SUCoreErrorInformation setupCoreErrorInformation](SUCoreErrorInformation, "setupCoreErrorInformation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  objc_msgSend(v6, "informationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  objc_msgSend(v6, "informationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SUCoreErrorInformation_codeNameForDomain_withCode___block_invoke;
  block[3] = &unk_1E611C0C8;
  v9 = v5;
  v17 = v9;
  v19 = &v21;
  v20 = a4;
  v10 = v6;
  v18 = v10;
  dispatch_sync(v8, block);

  v11 = (void *)v22[5];
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v22[5];
    v22[5] = v12;

    v11 = (void *)v22[5];
  }
  v14 = v11;

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __53__SUCoreErrorInformation_codeNameForDomain_withCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", *(_QWORD *)(a1 + 32), CFSTR("SUCoreError")))
  {
    +[SUCoreErrorInformation nameForSUCoreCode:](SUCoreErrorInformation, "nameForSUCoreCode:", *(_QWORD *)(a1 + 56));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "errorInformation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeDictionaryForKey:fromBase:withKeyDescription:", *(_QWORD *)(a1 + 32), CFSTR("SUCoreErrorInformation{codeNameForDomain} errorInformation"), CFSTR("error domain"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v12;
    if (v12)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v12, "safeObjectForKey:ofClass:", v6, objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "codeName");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
      v4 = v12;
    }
  }

}

+ (id)nameForSUCoreCode:(int64_t)a3
{
  id result;

  if (a3 > 8499)
  {
    if (a3 > 8899)
    {
      if (a3 <= 9099)
      {
        switch(a3)
        {
          case 9000:
            result = CFSTR("kSUCoreErrorDocManagerAllocationFailure");
            break;
          case 9001:
            result = CFSTR("kSUCoreErrorDocManagerDirectoryDeleteFailure");
            break;
          case 9002:
            result = CFSTR("kSUCoreErrorDocManagerDirectoryCopyFailure");
            break;
          case 9003:
            result = CFSTR("kSUCoreErrorDocManagerDirectoryReadFailure");
            break;
          case 9004:
            result = CFSTR("kSUCoreErrorDocManagerPathCreateFailure");
            break;
          case 9005:
            result = CFSTR("kSUCoreErrorDocManagerInstalledBuildCreateFailure");
            break;
          case 9006:
            result = CFSTR("kSUCoreErrorDocManagerDetermineOSBuildFailure");
            break;
          case 9007:
            return CFSTR("Unknown Error Code");
          case 9008:
            result = CFSTR("kSUCoreErrorDocManagerCreateInstalledStashedDataDictFailed");
            break;
          case 9009:
            result = CFSTR("kSUCoreErrorDocManagerStashedBuildVersionNotFound");
            break;
          case 9010:
            result = CFSTR("kSUCoreErrorDocDataCreateFailed");
            break;
          case 9011:
            result = CFSTR("kSUCoreErrorDocDataAssetRefreshFailed");
            break;
          case 9012:
            result = CFSTR("kSUCoreErrorDocDataAssetNotLocal");
            break;
          default:
            switch(a3)
            {
              case 8900:
                result = CFSTR("kSUCoreErrorConnectClientDoesNotRespond");
                break;
              case 8902:
                result = CFSTR("kSUCoreErrorConnectClientDecodeFailure");
                break;
              case 8903:
                result = CFSTR("kSUCoreErrorConnectClientDecodeException");
                break;
              case 8904:
                result = CFSTR("kSUCoreErrorConnectServerDecodeFailure");
                break;
              case 8905:
                result = CFSTR("kSUCoreErrorConnectServerDecodeException");
                break;
              case 8906:
                result = CFSTR("kSUCoreErrorConnectClientIsObserverOnly");
                break;
              case 8907:
                result = CFSTR("kSUCoreErrorConnectClientIDMismatch");
                break;
              case 8908:
                result = CFSTR("kSUCoreErrorConnectMessagedIDMismatch");
                break;
              case 8909:
                result = CFSTR("kSUCoreErrorConnectNoServerConnection");
                break;
              default:
                return CFSTR("Unknown Error Code");
            }
            break;
        }
      }
      else
      {
        if (a3 > 9899)
        {
          if (a3 == 9900)
            return CFSTR("kSUCoreErrorSimulatedFailure");
          if (a3 == 90007)
            return CFSTR("kSUCoreErrorDocManagerFileEvictionFailure");
        }
        else
        {
          if (a3 == 9100)
            return CFSTR("kSUCoreErrorDDMInvalidDeclarationFailure");
          if (a3 == 9101)
            return CFSTR("kSUCoreErrorDDMNoControllerFailure");
        }
        return CFSTR("Unknown Error Code");
      }
    }
    else if (a3 > 8699)
    {
      switch(a3)
      {
        case 8700:
          result = CFSTR("kSUCoreErrorAssetDownloadFailed");
          break;
        case 8701:
          result = CFSTR("kSUCoreErrorAssetPurgeFailed");
          break;
        case 8702:
          result = CFSTR("kSUCoreErrorCancelingDownload");
          break;
        case 8703:
          result = CFSTR("kSUCoreErrorConfiguringDownload");
          break;
        case 8704:
          result = CFSTR("kSUCoreErrorAssetReloadFailed");
          break;
        case 8705:
          result = CFSTR("kSUCoreErrorAssetReloadNotFound");
          break;
        case 8706:
          result = CFSTR("kSUCoreErrorAssetRefreshFailed");
          break;
        case 8707:
          result = CFSTR("kSUCoreErrorAssetNotLocal");
          break;
        default:
          switch(a3)
          {
            case 8800:
              result = CFSTR("kSUCoreErrorMSUPreflightSUDownloadFailed");
              break;
            case 8801:
              result = CFSTR("kSUCoreErrorMSUPurgeFailed");
              break;
            case 8802:
              result = CFSTR("kSUCoreErrorMSUPreviousUpdateStateFailed");
              break;
            case 8803:
              result = CFSTR("kSUCoreErrorMSUMissingDescriptor");
              break;
            case 8804:
              result = CFSTR("kSUCoreErrorMSUPrepareFailed");
              break;
            default:
              return CFSTR("Unknown Error Code");
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 8600:
          result = CFSTR("kSUCoreErrorSpaceInsufficient");
          break;
        case 8601:
          result = CFSTR("kSUCoreErrorSpaceNoPurgeResults");
          break;
        case 8602:
          result = CFSTR("kSUCoreErrorSpaceCheckFailed");
          break;
        case 8603:
          result = CFSTR("kSUCoreErrorSpaceNoCacheDeletePurgeableResults");
          break;
        case 8604:
          result = CFSTR("kSUCoreErrorSpaceCacheDeletePurgeableFailed");
          break;
        case 8605:
          result = CFSTR("kSUCoreErrorSpaceNoAppOffloadPurgeableResults");
          break;
        case 8606:
          result = CFSTR("kSUCoreErrorSpaceAppOffloadPurgeableFailed");
          break;
        case 8607:
          result = CFSTR("kSUCoreErrorSpaceNoAppOffloadPurgeResults");
          break;
        case 8608:
          result = CFSTR("kSUCoreErrorSpaceAppOffloadFailed");
          break;
        default:
          switch(a3)
          {
            case 8500:
              result = CFSTR("kSUCoreErrorFSMStateInvalidForTable");
              break;
            case 8501:
              result = CFSTR("kSUCoreErrorFSMEventInvalidForState");
              break;
            case 8502:
              result = CFSTR("kSUCoreErrorFSMAlreadyActive");
              break;
            case 8503:
              result = CFSTR("kSUCoreErrorFSMInvalidTable");
              break;
            default:
              return CFSTR("Unknown Error Code");
          }
          break;
      }
    }
  }
  else if (a3 > 8249)
  {
    switch(a3)
    {
      case 8400:
        result = CFSTR("kSUCoreErrorScanCatalogDownloadFailed");
        break;
      case 8401:
        result = CFSTR("kSUCoreErrorScanQueryMetadataFailed");
        break;
      case 8402:
        result = CFSTR("kSUCoreErrorScanFailed");
        break;
      case 8403:
        result = CFSTR("kSUCoreErrorScanCanceled");
        break;
      case 8404:
        result = CFSTR("kSUCoreErrorScanFailCanceling");
        break;
      case 8405:
        result = CFSTR("kSUCoreErrorScanNotCanceling");
        break;
      case 8406:
        result = CFSTR("kSUCoreErrorScanNoUpdateFound");
        break;
      case 8407:
        result = CFSTR("kSUCoreErrorScanNoDocFound");
        break;
      case 8408:
        result = CFSTR("kSUCoreErrorScanFoundDifferent");
        break;
      case 8409:
        result = CFSTR("kSUCoreErrorScanFoundMultiple");
        break;
      case 8410:
        result = CFSTR("kSUCoreErrorScanAbortedStale");
        break;
      case 8411:
        result = CFSTR("kSUCoreErrorScanFailedToDeterminePSUSAssets");
        break;
      default:
        switch(a3)
        {
          case 8250:
            result = CFSTR("kSUCoreErrorPersistedStateNotLoaded");
            break;
          case 8251:
            result = CFSTR("kSUCoreErrorPersistedStateLoadFailed");
            break;
          case 8252:
            result = CFSTR("kSUCoreErrorPersistedStateMissingContents");
            break;
          case 8253:
            result = CFSTR("kSUCoreErrorPersistedStateInvalidType");
            break;
          case 8254:
            result = CFSTR("kSUCoreErrorPersistedStateArchiverError");
            break;
          case 8255:
            result = CFSTR("kSUCoreErrorPersistedStateClassMismatch");
            break;
          default:
            if (a3 != 8300)
              return CFSTR("Unknown Error Code");
            result = CFSTR("kSUCoreErrorDiagDecoded");
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 8100:
        result = CFSTR("kSUCoreErrorCreateFailed");
        break;
      case 8101:
        result = CFSTR("kSUCoreErrorMissingRequired");
        break;
      case 8102:
        result = CFSTR("kSUCoreErrorInvalidParam");
        break;
      case 8103:
        result = CFSTR("kSUCoreErrorUnknownFormat");
        break;
      case 8104:
        result = CFSTR("kSUCoreErrorReadFailure");
        break;
      case 8105:
        result = CFSTR("kSUCoreErrorCopyFailed");
        break;
      case 8106:
        result = CFSTR("kSUCoreErrorSerializedFailed");
        break;
      case 8107:
        result = CFSTR("kSUCoreErrorInvalidPayload");
        break;
      case 8108:
        result = CFSTR("kSUCoreErrorTooManyQueued");
        break;
      case 8109:
        result = CFSTR("kSUCoreErrorWriteFailure");
        break;
      case 8110:
        result = CFSTR("kSUCoreErrorRemoveFailed");
        break;
      case 8111:
        result = CFSTR("kSUCoreErrorAlreadyAssigned");
        break;
      case 8112:
        result = CFSTR("kSUCoreErrorTypeMismatch");
        break;
      case 8113:
        result = CFSTR("kSUCoreErrorNotSupported");
        break;
      case 8114:
        result = CFSTR("kSUCoreErrorIgnoredParam");
        break;
      case 8115:
        result = CFSTR("kSUCoreErrorInvalidState");
        break;
      case 8116:
        result = CFSTR("kSUCoreErrorUnexpectedValue");
        break;
      case 8117:
        result = CFSTR("kSUCoreErrorInconsistencyDetected");
        break;
      case 8118:
        result = CFSTR("kSUCoreErrorInvalidPolicyAssetType");
        break;
      case 8119:
        result = CFSTR("kSUCoreErrorOperationTimedOut");
        break;
      case 8120:
        result = CFSTR("kSUCoreErrorExistingTransaction");
        break;
      case 8121:
        result = CFSTR("kSUCoreErrorLoadfailed");
        break;
      case 8122:
        result = CFSTR("kSUCoreErrorMethodNotAvailable");
        break;
      case 8123:
        result = CFSTR("kSUCoreErrorDeprecated");
        break;
      case 8124:
        result = CFSTR("kSUCoreErrorOperationCanceled");
        break;
      case 8125:
        result = CFSTR("kSUCoreErrorFileNotFound");
        break;
      case 8126:
        result = CFSTR("kSUCoreErrorMissingAuthentication");
        break;
      default:
        switch(a3)
        {
          case 8200:
            result = CFSTR("kSUCoreErrorEventReporterInvalidTask");
            break;
          case 8201:
            result = CFSTR("kSUCoreErrorEventReporterInvalidTaskDescriptor");
            break;
          case 8202:
            result = CFSTR("kSUCoreErrorEventReporterSendFailed");
            break;
          case 8203:
            result = CFSTR("kSUCoreErrorEventReporterInvalidResponse");
            break;
          case 8204:
            result = CFSTR("kSUCoreErrorEventReporterInvalidFileUUID");
            break;
          case 8205:
            result = CFSTR("kSUCoreErrorEventReporterNoResponse");
            break;
          case 8206:
            result = CFSTR("kSUCoreErrorEventReporterResponseNotHTTP");
            break;
          default:
            if (a3)
              return CFSTR("Unknown Error Code");
            result = CFSTR("kSUCoreErrorNone");
            break;
        }
        break;
    }
  }
  return result;
}

+ (id)summaryOfIndications:(int64_t)a3
{
  int v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;

  v3 = a3;
  v4 = 0;
  v5 = &stru_1E611E1C8;
  do
  {
    if (((1 << v4) & v3) != 0)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      +[SUCoreErrorAttributes nameForIndication:](SUCoreErrorAttributes, "nameForIndication:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("|%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (__CFString *)v9;
    }
    ++v4;
  }
  while (v4 != 5);
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_1E611E1C8) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v11;
    v5 = v10;
  }

  return v10;
}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[SUCore stringIsEqual:to:](SUCore, "stringIsEqual:to:", v6, v7))
    goto LABEL_4;
  if (objc_msgSend(v17, "minCode") == -1)
  {

    goto LABEL_7;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "code");
  if (v8 >= objc_msgSend(v17, "minCode"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "code");
    v10 = objc_msgSend(v17, "maxCode");

    if (v9 > v10)
      goto LABEL_8;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v17, "indications");
    objc_msgSend(v17, "keyMatchTrue");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v17, "keyMatchTrueMap");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *a4 = 1;
    goto LABEL_8;
  }
LABEL_4:

LABEL_8:
}

void __59__SUCoreErrorInformation_indicationsForError_matchingMask___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "unsignedLongLongValue");
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeBooleanForKey:", v9);

      if (v8)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= *(_QWORD *)(a1 + 48) & v6;
    }
  }

}

void __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "informationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v2);

  objc_msgSend(*(id *)(a1 + 32), "informationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke_2;
  block[3] = &unk_1E611BF88;
  v5 = *(id *)(a1 + 32);
  dispatch_sync(v3, block);

}

uint64_t __51__SUCoreErrorInformation_setupCoreErrorInformation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_defineErrorLayers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeUserInfoValues, 0);
  objc_storeStrong((id *)&self->_errorInformation, 0);
  objc_storeStrong((id *)&self->_layerInformation, 0);
  objc_storeStrong((id *)&self->_informationQueue, 0);
}

- (void)_associateLayer:(uint64_t)a1 withDomain:(NSObject *)a2 minCode:maxCode:indicating:ifKeyTrue:keyMatchTrueMap:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1B05B8000, a2, OS_LOG_TYPE_ERROR, "[ERROR_INFORMATION] layer group(%{public}@) already defined", (uint8_t *)&v4, 0xCu);

}

@end
