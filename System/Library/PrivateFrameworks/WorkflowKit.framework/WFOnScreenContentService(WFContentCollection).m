@implementation WFOnScreenContentService(WFContentCollection)

- (void)getOnScreenContentForInputContentClasses:()WFContentCollection completionHandler:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _OWORD v19[2];

  v6 = a4;
  if (a3)
  {
    objc_msgSend(a3, "if_compactMap:", &__block_literal_global_58738);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0DC7C08]);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "if_auditToken");
    else
      memset(v19, 0, sizeof(v19));
    v11 = (id)objc_msgSend(v8, "initWithSupportedItemClasses:originatingProcessAuditToken:", v7, v19);

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DC7C08]);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0DC7C00]);
  v13 = objc_alloc_init(MEMORY[0x1E0D13EA8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__WFOnScreenContentService_WFContentCollection__getOnScreenContentForInputContentClasses_completionHandler___block_invoke_2;
  v16[3] = &unk_1E7AF7D58;
  v17 = v13;
  v18 = v6;
  v16[4] = a1;
  v14 = v13;
  v15 = v6;
  objc_msgSend(v12, "getOnScreenContentWithOptions:completionHandler:", v11, v16);

}

- (void)populateOutputFromNodeRecursively:()WFContentCollection outputCollection:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "contentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", v9);

  }
  objc_msgSend(v6, "file");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "file");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_fileRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFile:", v12);

  }
  objc_msgSend(v6, "children");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "children", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(a1, "populateOutputFromNodeRecursively:outputCollection:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v7);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

@end
