@implementation PBCoercionRegistry

+ (id)defaultRegistry
{
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __37__PBCoercionRegistry_defaultRegistry__block_invoke;
  v8 = &unk_1E2431F18;
  v9 = &v11;
  v10 = a1;
  if (qword_1ECED8C98 != -1)
    dispatch_once(&qword_1ECED8C98, &v5);
  if (*((_BYTE *)v12 + 24))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)_MergedGlobals_7, "uikit_registerExtraCoercions", v5, v6, v7, v8, v9, v10, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v5, v6, v7, v8, v9, v10, v11);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "postNotificationName:object:", CFSTR("PBDefaultCoercionRegistryDidInstantiateNotification"), _MergedGlobals_7);

    }
  }
  v3 = (id)_MergedGlobals_7;
  _Block_object_dispose(&v11, 8);
  return v3;
}

uint64_t __37__PBCoercionRegistry_defaultRegistry__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = objc_alloc_init(*(Class *)(a1 + 40));
  v3 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v4 = (void *)_MergedGlobals_7;
  v5 = objc_opt_class();
  v6 = *MEMORY[0x1E0CA5CA0];
  objc_msgSend(v4, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", v5, *MEMORY[0x1E0CA5CA0], &__block_literal_global_8);
  objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v6, objc_opt_class(), &__block_literal_global_2);
  objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", *MEMORY[0x1E0CA5C98], objc_opt_class(), &__block_literal_global_4);
  objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", *MEMORY[0x1E0CA5C20], objc_opt_class(), &__block_literal_global_5);
  objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", *MEMORY[0x1E0CA5C88], objc_opt_class(), &__block_literal_global_6_0);
  v7 = *MEMORY[0x1E0CA5C90];
  objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", *MEMORY[0x1E0CA5C90], objc_opt_class(), &__block_literal_global_7);
  v8 = (void *)_MergedGlobals_7;
  v9 = objc_opt_class();
  objc_msgSend(v8, "registerCoercionFromObjectOfClass:toObjectOfClass:coercionBlock:", v9, objc_opt_class(), &__block_literal_global_10_0);
  objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", objc_opt_class(), v7, &__block_literal_global_11_0);
  return objc_msgSend((id)_MergedGlobals_7, "registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", v7, objc_opt_class(), &__block_literal_global_15);
}

void __37__PBCoercionRegistry_defaultRegistry__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void (**a4)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD, _QWORD))a4)[2](v6, v7, 0, 0);

}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_3(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_4(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 10);
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_5(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_6(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
  }
  else if (a6)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_7(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    PBURLFromURLArchive(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a6)
      goto LABEL_10;
  }
  else
  {
    v15 = 0;
    if (!a6)
      goto LABEL_10;
  }
  if (!v15)
  {
    PBCannotInstantiateObjectOfClassError(a2, v10, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v15;
}

uint64_t __37__PBCoercionRegistry_defaultRegistry__block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "absoluteString");
}

void __37__PBCoercionRegistry_defaultRegistry__block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "baseURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "relativeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v8;
    objc_msgSend(v7, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v8;
    v12[1] = &stru_1E24329D8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 200, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    (*((void (**)(id, void *, _QWORD, _QWORD))v5 + 2))(v5, v11, 0, 0);

}

id __37__PBCoercionRegistry_defaultRegistry__block_invoke_10(uint64_t a1, objc_class *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v11 || (PBURLFromURLArchive(v11), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (*a6)
    {
      PBCannotInstantiateObjectOfClassError(a2, v10, 0);
      v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (PBCoercionRegistry)init
{
  PBCoercionRegistry *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  uint64_t v5;
  NSMutableDictionary *member_exporterByClass;
  uint64_t v7;
  NSMutableDictionary *member_importerByClass;
  uint64_t v9;
  NSMutableDictionary *member_classCoercionByClass;
  uint64_t v11;
  NSMutableArray *member_representationCoercions;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PBCoercionRegistry;
  v2 = -[PBCoercionRegistry init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.pasteboard.PBCoercionRegistry-member-queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    member_exporterByClass = v2->_member_exporterByClass;
    v2->_member_exporterByClass = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    member_importerByClass = v2->_member_importerByClass;
    v2->_member_importerByClass = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    member_classCoercionByClass = v2->_member_classCoercionByClass;
    v2->_member_classCoercionByClass = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    member_representationCoercions = v2->_member_representationCoercions;
    v2->_member_representationCoercions = (NSMutableArray *)v11;

  }
  return v2;
}

- (void)_member_registerCoercionFromObjectOfClass:(Class)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  PBObjectToRepresentationCoercion *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBCoercionRegistry member_exporterByClass](self, "member_exporterByClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (PBObjectToRepresentationCoercion *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = -[PBObjectToRepresentationCoercion initWithClass:]([PBObjectToRepresentationCoercion alloc], "initWithClass:", a3);
    -[PBCoercionRegistry member_exporterByClass](self, "member_exporterByClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v9);

  }
  -[PBObjectToRepresentationCoercion addCoercionToType:block:](v11, "addCoercionToType:block:", v13, v8);

}

- (void)registerCoercionFromObjectOfClass:(Class)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  Class v16;

  v8 = a4;
  v9 = a5;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PBCoercionRegistry_registerCoercionFromObjectOfClass_toRepresentationOfType_coercionBlock___block_invoke;
  block[3] = &unk_1E2431F40;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

uint64_t __93__PBCoercionRegistry_registerCoercionFromObjectOfClass_toRepresentationOfType_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromObjectOfClass:toRepresentationOfType:coercionBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_member_registerCoercionFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  PBRepresentationToObjectCoercion *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  NSStringFromClass(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBCoercionRegistry member_importerByClass](self, "member_importerByClass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (PBRepresentationToObjectCoercion *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v11 = -[PBRepresentationToObjectCoercion initWithClass:]([PBRepresentationToObjectCoercion alloc], "initWithClass:", a4);
    -[PBCoercionRegistry member_importerByClass](self, "member_importerByClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v9);

  }
  -[PBRepresentationToObjectCoercion addCoercionFromType:block:](v11, "addCoercionFromType:block:", v13, v8);

}

- (void)registerCoercionFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  Class v16;

  v8 = a3;
  v9 = a5;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toObjectOfClass_coercionBlock___block_invoke;
  block[3] = &unk_1E2431F68;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

uint64_t __103__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toObjectOfClass_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromRepresentationConformingToType:toObjectOfClass:coercionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_member_registerCoercionFromObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  void *v8;
  void *v9;
  PBObjectToObjectCoercion *v10;
  void *v11;
  id v12;

  v12 = a5;
  NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBCoercionRegistry member_classCoercionByClass](self, "member_classCoercionByClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (PBObjectToObjectCoercion *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = -[PBObjectToObjectCoercion initWithClass:]([PBObjectToObjectCoercion alloc], "initWithClass:", a3);
    -[PBCoercionRegistry member_classCoercionByClass](self, "member_classCoercionByClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

  }
  -[PBObjectToObjectCoercion addCoercionToClass:block:](v10, "addCoercionToClass:block:", a4, v12);

}

- (void)registerCoercionFromObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4 coercionBlock:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  Class v13;
  Class v14;

  v8 = a5;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PBCoercionRegistry_registerCoercionFromObjectOfClass_toObjectOfClass_coercionBlock___block_invoke;
  block[3] = &unk_1E2431F90;
  v13 = a3;
  v14 = a4;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_sync(v9, block);

}

uint64_t __86__PBCoercionRegistry_registerCoercionFromObjectOfClass_toObjectOfClass_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromObjectOfClass:toObjectOfClass:coercionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (id)_member_availableDirectRepresentationTypesForClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PBCoercionRegistry member_exporterByClass](self, "member_exporterByClass", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSString **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", NSClassFromString(v11)))
        {
          -[PBCoercionRegistry member_exporterByClass](self, "member_exporterByClass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "availableExportTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)registerCoercionFromRepresentationConformingToType:(id)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke;
  block[3] = &unk_1E2431BD8;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

uint64_t __110__PBCoercionRegistry_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_registerCoercionFromRepresentationConformingToType:toRepresentationOfType:coercionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_member_registerCoercionFromRepresentationConformingToType:(id)a3 toRepresentationOfType:(id)a4 coercionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  PBRepresentationToRepresentationCoercion *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PBCoercionRegistry member_representationCoercions](self, "member_representationCoercions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __118__PBCoercionRegistry__member_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke;
  v18[3] = &unk_1E2431FB8;
  v17 = v8;
  v19 = v17;
  v12 = v9;
  v20 = v12;
  v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v18);

  v14 = -[PBRepresentationToRepresentationCoercion initWithSourceType:destinationType:conversionBlock:]([PBRepresentationToRepresentationCoercion alloc], "initWithSourceType:destinationType:conversionBlock:", v17, v12, v10);
  -[PBCoercionRegistry member_representationCoercions](self, "member_representationCoercions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v15, "addObject:", v14);
  else
    objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v13, v14);

}

uint64_t __118__PBCoercionRegistry__member_registerCoercionFromRepresentationConformingToType_toRepresentationOfType_coercionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "sourceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "destinationType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)availableRepresentationTypesForClass:(Class)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v11;
  PBCoercionRegistry *v12;
  Class v13;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PBCoercionRegistry_availableRepresentationTypesForClass___block_invoke;
  block[3] = &unk_1E2431FE0;
  v11 = v5;
  v12 = self;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __59__PBCoercionRegistry_availableRepresentationTypesForClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_member_availableDirectRepresentationTypesForClass:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "member_classCoercionByClass");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      v18 = v5;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(NSString **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        if (objc_msgSend(*(id *)(a1 + 48), "isSubclassOfClass:", NSClassFromString(v8)))
        {
          objc_msgSend(*(id *)(a1 + 40), "member_classCoercionByClass");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "availableClasses");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(a1 + 32);
                objc_msgSend(*(id *)(a1 + 40), "_member_availableDirectRepresentationTypesForClass:", NSClassFromString(*(NSString **)(*((_QWORD *)&v20 + 1) + 8 * i)));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addObjectsFromArray:", v17);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v13);
          }

          v5 = v18;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

}

- (id)_member_acceptableRepresentationTypesForCreatingObjectOfClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PBCoercionRegistry member_importerByClass](self, "member_importerByClass", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(NSString **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", NSClassFromString(v11)))
        {
          -[PBCoercionRegistry member_importerByClass](self, "member_importerByClass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "availableImportTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)acceptableRepresentationTypesForCreatingObjectOfClass:(Class)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PBCoercionRegistry_acceptableRepresentationTypesForCreatingObjectOfClass___block_invoke;
  block[3] = &unk_1E2432008;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __76__PBCoercionRegistry_acceptableRepresentationTypesForCreatingObjectOfClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_member_acceptableRepresentationTypesForCreatingObjectOfClass:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)canCoerceFromRepresentationConformingToType:(id)a3 toObjectOfClass:(Class)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  Class v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PBCoercionRegistry_canCoerceFromRepresentationConformingToType_toObjectOfClass___block_invoke;
  v10[3] = &unk_1E2432030;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(v6) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __82__PBCoercionRegistry_canCoerceFromRepresentationConformingToType_toObjectOfClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSString *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "member_importerByClass", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(NSString **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](NSClassFromString(v7), "isSubclassOfClass:", *(_QWORD *)(a1 + 56)))
        {
          objc_msgSend(*(id *)(a1 + 32), "member_importerByClass");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "canCoerceFromType:", *(_QWORD *)(a1 + 40)))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_14;
          }

        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          goto LABEL_14;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:

}

- (BOOL)canCoerceObjectOfClass:(Class)a3 toRepresentationConformingToType:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  Class v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PBCoercionRegistry_canCoerceObjectOfClass_toRepresentationConformingToType___block_invoke;
  v10[3] = &unk_1E2432030;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a3;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(v6) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __78__PBCoercionRegistry_canCoerceObjectOfClass_toRepresentationConformingToType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSString *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "member_exporterByClass", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(NSString **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 56), "isSubclassOfClass:", NSClassFromString(v7)))
        {
          objc_msgSend(*(id *)(a1 + 32), "member_exporterByClass");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "canCoerceToType:", *(_QWORD *)(a1 + 40)))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_14;
          }

        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          goto LABEL_14;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:

}

- (BOOL)canCoerceObjectOfClass:(Class)a3 toObjectOfClass:(Class)a4
{
  NSObject *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PBCoercionRegistry_canCoerceObjectOfClass_toObjectOfClass___block_invoke;
  v9[3] = &unk_1E2432058;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v7, v9);

  LOBYTE(a4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

void __61__PBCoercionRegistry_canCoerceObjectOfClass_toObjectOfClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSString *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(NSString **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 48), "isSubclassOfClass:", NSClassFromString(v7)))
        {
          objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "canCoerceToObjectOfClass:", *(_QWORD *)(a1 + 56)))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

            goto LABEL_14;
          }

        }
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          goto LABEL_14;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_14:

}

- (id)_newObjectOfClass:(Class)a3 fromData:(id)a4 URL:(id)a5 ofType:(id)a6 outError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  PBCoercionRegistry *v24;
  id v25;
  uint64_t *v26;
  Class v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __69__PBCoercionRegistry__newObjectOfClass_fromData_URL_ofType_outError___block_invoke;
  v23 = &unk_1E2432030;
  v24 = self;
  v27 = a3;
  v16 = v14;
  v25 = v16;
  v26 = &v28;
  dispatch_sync(v15, &v20);

  v17 = (void *)v29[5];
  if (v17)
  {
    objc_msgSend(v17, "createObjectFromRepresentationConformingToType:data:URL:outError:", v16, v12, v13, a7, v20, v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __69__PBCoercionRegistry__newObjectOfClass_fromData_URL_ofType_outError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "member_importerByClass", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(NSString **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](NSClassFromString(v7), "isSubclassOfClass:", *(_QWORD *)(a1 + 56)))
        {
          objc_msgSend(*(id *)(a1 + 32), "member_importerByClass");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "canCoerceFromType:", *(_QWORD *)(a1 + 40)))
          {
            v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v11 = *(void **)(v10 + 40);
            *(_QWORD *)(v10 + 40) = v9;

            goto LABEL_13;
          }

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

- (id)newObjectOfClass:(Class)a3 fromData:(id)a4 ofType:(id)a5 outError:(id *)a6
{
  return -[PBCoercionRegistry _newObjectOfClass:fromData:URL:ofType:outError:](self, "_newObjectOfClass:fromData:URL:ofType:outError:", a3, a4, 0, a5, a6);
}

- (id)newObjectOfClass:(Class)a3 fromContentsOfURL:(id)a4 ofType:(id)a5 outError:(id *)a6
{
  return -[PBCoercionRegistry _newObjectOfClass:fromData:URL:ofType:outError:](self, "_newObjectOfClass:fromData:URL:ofType:outError:", a3, 0, a4, a5, a6);
}

- (id)_member_exporterFromClass:(Class)a3 toType:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSString *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PBCoercionRegistry member_exporterByClass](self, "member_exporterByClass", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(NSString **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", NSClassFromString(v12)))
        {
          -[PBCoercionRegistry member_exporterByClass](self, "member_exporterByClass");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v14, "canCoerceToType:", v6) & 1) != 0)
            goto LABEL_12;

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)loadRepresentationOfObject:(id)a3 asType:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke;
  v30[3] = &unk_1E2432080;
  v12 = v9;
  v31 = v12;
  v13 = v8;
  v32 = v13;
  v14 = v10;
  v33 = v14;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x18D782EA4](v30);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__38;
  v28 = __Block_byref_object_dispose__39;
  v29 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_40;
  block[3] = &unk_1E24320F8;
  block[4] = self;
  v17 = v13;
  v21 = v17;
  v18 = v12;
  v22 = v18;
  v23 = &v24;
  dispatch_sync(v16, block);

  v19 = v25[5];
  if (v19)
    (*(void (**)(uint64_t, void (**)(_QWORD, _QWORD, _QWORD, _QWORD)))(v19 + 16))(v19, v15);
  else
    v15[2](v15, 0, 0, 0);

  _Block_object_dispose(&v24, 8);
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9 || !(v7 | v8))
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("PBErrorDomain"));

    if ((v12 & 1) == 0)
    {
      v13 = *(void **)(a1 + 32);
      v14 = (objc_class *)objc_opt_class();
      PBCannotCreateRepresentationError(v13, v14, v10);
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v15;
    }
  }
  else
  {
    v10 = 0;
  }
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2;
    v17[3] = &unk_1E2431888;
    v21 = v16;
    v18 = (id)v7;
    v19 = (id)v8;
    v20 = v10;
    PBDispatchAsyncCallback(v17);

  }
}

uint64_t __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  Class v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  Class v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_member_exporterFromClass:toType:", objc_opt_class(), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2_41;
    v44[3] = &unk_1E24320A8;
    v45 = v2;
    v46 = *(id *)(a1 + 48);
    v47 = *(id *)(a1 + 40);
    v4 = MEMORY[0x18D782EA4](v44);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass", v3);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
LABEL_5:
    v10 = 0;
    v28 = v8;
    while (1)
    {
      if (*(_QWORD *)v41 != v9)
        objc_enumerationMutation(obj);
      v11 = *(NSString **)(*((_QWORD *)&v40 + 1) + 8 * v10);
      NSClassFromString(v11);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "member_classCoercionByClass");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v13, "availableClasses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = NSClassFromString(*(NSString **)(*((_QWORD *)&v36 + 1) + 8 * i));
              objc_msgSend(*(id *)(a1 + 32), "_member_exporterFromClass:toType:", v19, *(_QWORD *)(a1 + 48));
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v21 = (void *)v20;
                v30[0] = MEMORY[0x1E0C809B0];
                v30[1] = 3221225472;
                v30[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_5;
                v30[3] = &unk_1E24320D0;
                v31 = v13;
                v22 = *(id *)(a1 + 40);
                v35 = v19;
                v32 = v22;
                v33 = v21;
                v34 = *(id *)(a1 + 48);
                v23 = v21;
                v24 = MEMORY[0x18D782EA4](v30);
                v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v26 = *(void **)(v25 + 40);
                *(_QWORD *)(v25 + 40) = v24;

                goto LABEL_19;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_19:

        v8 = v28;
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        break;
      if (++v10 == v8)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }

}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_2_41(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_3;
  v8[3] = &unk_1E2431568;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "createRepresentationOfType:fromObject:completionBlock:", v5, v6, v8);

}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_4;
    v11[3] = &unk_1E2431888;
    v15 = v10;
    v12 = v7;
    v13 = v8;
    v14 = v9;
    PBDispatchAsyncCallback(v11);

  }
}

uint64_t __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __72__PBCoercionRegistry_loadRepresentationOfObject_asType_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = 0;
  v6 = a2;
  objc_msgSend(v3, "coerceObject:toObjectOfClass:outError:", v4, v5, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v7)
    objc_msgSend(*(id *)(a1 + 48), "createRepresentationOfType:fromObject:completionBlock:", *(_QWORD *)(a1 + 56), v7, v6);
  else
    (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v8);

}

- (id)_member_availableClassesToCoerceToFromClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PBCoercionRegistry member_classCoercionByClass](self, "member_classCoercionByClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(NSString **)(*((_QWORD *)&v20 + 1) + 8 * v10);
          v12 = (void *)MEMORY[0x18D782D00]();
          if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", NSClassFromString(v11)))
          {
            -[PBCoercionRegistry member_classCoercionByClass](self, "member_classCoercionByClass");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "availableClasses");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __66__PBCoercionRegistry__member_availableClassesToCoerceToFromClass___block_invoke;
            v18[3] = &unk_1E2432120;
            v19 = v5;
            objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

          }
          objc_autoreleasePoolPop(v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v16;
}

Class __66__PBCoercionRegistry__member_availableClassesToCoerceToFromClass___block_invoke(uint64_t a1, NSString *aClassName)
{
  Class result;

  result = NSClassFromString(aClassName);
  if (result)
    return (Class)objc_msgSend(*(id *)(a1 + 32), "addObject:", result);
  return result;
}

- (id)loadCoercionOfRepresentation:(id)a3 fromType:(id)a4 toType:(id)a5 usingCoercion:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (v12)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __97__PBCoercionRegistry_loadCoercionOfRepresentation_fromType_toType_usingCoercion_completionBlock___block_invoke;
    v17[3] = &unk_1E2432148;
    v18 = v12;
    v19 = v11;
    v20 = v13;
    objc_msgSend(a3, "loadWithCompletionHandler:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PBCannotLoadRepresentationError((uint64_t)a4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v15);

    v14 = 0;
  }

  return v14;
}

void __97__PBCoercionRegistry_loadCoercionOfRepresentation_fromType_toType_usingCoercion_completionBlock___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  unint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;

  v19 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!(v19 | v9) || v10)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (!v9)
    {
      v17 = (void *)a1[4];
      objc_msgSend(0, "url");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "coerceRepresentationData:representationURL:toRepresentationOfType:completionBlock:", v19, v18, a1[5], a1[6]);

      if (!v11)
        goto LABEL_10;
      goto LABEL_9;
    }
    objc_msgSend((id)v9, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "startAccessingSecurityScopedResource");

    v14 = (void *)a1[4];
    objc_msgSend((id)v9, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coerceRepresentationData:representationURL:toRepresentationOfType:completionBlock:", v19, v15, a1[5], a1[6]);

    if (v13)
    {
      objc_msgSend((id)v9, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stopAccessingSecurityScopedResource");

      if (!v11)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  if (v11)
LABEL_9:
    v11[2](v11);
LABEL_10:

}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (NSMutableDictionary)member_exporterByClass
{
  return self->_member_exporterByClass;
}

- (void)setMember_exporterByClass:(id)a3
{
  objc_storeStrong((id *)&self->_member_exporterByClass, a3);
}

- (NSMutableDictionary)member_importerByClass
{
  return self->_member_importerByClass;
}

- (void)setMember_importerByClass:(id)a3
{
  objc_storeStrong((id *)&self->_member_importerByClass, a3);
}

- (NSMutableDictionary)member_classCoercionByClass
{
  return self->_member_classCoercionByClass;
}

- (void)setMember_classCoercionByClass:(id)a3
{
  objc_storeStrong((id *)&self->_member_classCoercionByClass, a3);
}

- (NSMutableArray)member_representationCoercions
{
  return self->_member_representationCoercions;
}

- (void)setMember_representationCoercions:(id)a3
{
  objc_storeStrong((id *)&self->_member_representationCoercions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member_representationCoercions, 0);
  objc_storeStrong((id *)&self->_member_classCoercionByClass, 0);
  objc_storeStrong((id *)&self->_member_importerByClass, 0);
  objc_storeStrong((id *)&self->_member_exporterByClass, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

- (void)enumerateAvailableCoercionLoaderBlocksForRepresentation:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PBCoercionRegistry_Private__enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke;
  block[3] = &unk_1E2432170;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __98__PBCoercionRegistry_Private__enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_member_enumerateAvailableCoercionLoaderBlocksForRepresentation:usingBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_member_enumerateAvailableCoercionLoaderBlocksForRepresentation:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD *);
  __CFString *v8;
  PBCoercionRegistry *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  __CFString *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, _QWORD *))a4;
  v18 = v6;
  objc_msgSend(v6, "typeIdentifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self;
  -[PBCoercionRegistry member_representationCoercions](self, "member_representationCoercions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v15, "sourceType");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "destinationType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (UTTypeConformsTo(v8, v16))
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __106__PBCoercionRegistry_Private___member_enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke;
          v19[3] = &unk_1E2432198;
          v19[4] = v9;
          v20 = v18;
          v21 = v16;
          v22 = v17;
          v23 = v15;
          v7[2](v7, v22, v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

}

uint64_t __106__PBCoercionRegistry_Private___member_enumerateAvailableCoercionLoaderBlocksForRepresentation_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadCoercionOfRepresentation:fromType:toType:usingCoercion:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), a2);
}

- (id)_availableClassesToCoerceFromClass:(Class)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  v14 = 0;
  -[PBCoercionRegistry memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PBCoercionRegistry_Private___availableClassesToCoerceFromClass___block_invoke;
  block[3] = &unk_1E2432008;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __66__PBCoercionRegistry_Private___availableClassesToCoerceFromClass___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_member_availableClassesToCoerceToFromClass:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)archivedDataFromObject:(id)a3 requestedType:(id)a4 outError:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  id v12;

  v7 = a4;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    PBCannotLoadRepresentationError((uint64_t)v7, v9);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v9);
LABEL_4:

  return v8;
}

+ (id)objectFromArchivedData:(id)a3 URL:(id)a4 requestedClass:(Class)a5 typeIdentifier:(id)a6 outError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v20;
  id v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v11)
  {
    v18 = 0;
LABEL_10:
    PBCannotInstantiateObjectOfClassError(a5, v13, v18);
    v20 = objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v18 = (id)v20;
    if (!a7)
      goto LABEL_8;
    goto LABEL_7;
  }
  v22 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, &v22);
  v15 = v22;
  objc_msgSend(v14, "setDecodingFailurePolicy:", 1);
  v16 = *MEMORY[0x1E0CB2CD0];
  v21 = v15;
  objc_msgSend(v14, "decodeTopLevelObjectOfClass:forKey:error:", a5, v16, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;

  if (!v17)
    goto LABEL_10;
  if (a7)
LABEL_7:
    *a7 = objc_retainAutorelease(v18);
LABEL_8:

  return v17;
}

@end
