@implementation INObjectCollection(WFMapping)

- (id)wf_mapObjectsUsingBlock:()WFMapping
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke;
  v10[3] = &unk_1E7AF8740;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "if_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSections:", v7);
  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v8;
}

- (void)wf_mapAsynchronously:()WFMapping completionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke;
  v13[3] = &unk_1E7AF87B8;
  v14 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_4;
  v11[3] = &unk_1E7AF8790;
  v11[4] = a1;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v13, v11);

}

@end
