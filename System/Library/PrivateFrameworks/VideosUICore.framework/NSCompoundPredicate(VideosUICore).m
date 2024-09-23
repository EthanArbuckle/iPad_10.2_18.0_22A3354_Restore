@implementation NSCompoundPredicate(VideosUICore)

- (id)vui_predicateWithSubpredicateFilterBlock:()VideosUICore
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "subpredicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "compoundPredicateType");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__NSCompoundPredicate_VideosUICore__vui_predicateWithSubpredicateFilterBlock___block_invoke;
  v13[3] = &unk_1E9F2BFF0;
  v8 = v4;
  v15 = v8;
  v16 = &v17;
  v9 = v5;
  v14 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  if (*((_BYTE *)v18 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "vui_predicateWithSubpredicates:type:", v9, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = a1;
  }
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  return v11;
}

@end
