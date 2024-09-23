@implementation PXDebugHierarchyObjectTreeBuilder

+ (id)buildObjectTreeForDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  SEL v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__136390;
  v25 = __Block_byref_object_dispose__136391;
  v26 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __101__PXDebugHierarchyObjectTreeBuilder_buildObjectTreeForDebugHierarchyWithIdentifier_provider_options___block_invoke;
  v15[3] = &unk_1E512C5C0;
  v12 = v11;
  v18 = a2;
  v19 = a1;
  v20 = a5;
  v16 = v12;
  v17 = &v21;
  objc_msgSend(v10, "enumerateDebugHierarchyWithIdentifier:options:usingBlock:", v9, a5, v15);
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXDebugHierarchyObjectTreeBuilder.m"), 38, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXDebugHierarchyObjectTreeBuilder createObjectForElement:parentObject:options:]", v12);

  abort();
}

void __101__PXDebugHierarchyObjectTreeBuilder_buildObjectTreeForDebugHierarchyWithIdentifier_provider_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "parentIdentifier");
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "parentIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("PXDebugHierarchyObjectTreeBuilder.m"), 24, CFSTR("couldn't find parent with identifier %lu"), objc_msgSend(v11, "parentIdentifier"));

  }
  v6 = 0;
LABEL_5:
  objc_msgSend(*(id *)(a1 + 56), "createObjectForElement:parentObject:options:", v11, v6, *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "canHaveChildren"))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  if (!v3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);

}

@end
