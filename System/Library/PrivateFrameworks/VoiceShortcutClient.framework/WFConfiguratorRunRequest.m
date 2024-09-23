@implementation WFConfiguratorRunRequest

- (WFConfiguratorRunRequest)initWithInputStrings:(id)a3 presentationMode:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  WFConfiguratorRunRequest *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "if_compactMap:", &__block_literal_global_4734);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v8 = (void *)getWFContentCollectionClass_softClass_4735;
    v17 = getWFContentCollectionClass_softClass_4735;
    if (!getWFContentCollectionClass_softClass_4735)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getWFContentCollectionClass_block_invoke_4736;
      v13[3] = &unk_1E5FC8858;
      v13[4] = &v14;
      __getWFContentCollectionClass_block_invoke_4736((uint64_t)v13);
      v8 = (void *)v15[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v9, "collectionWithItems:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = -[WFWorkflowRunRequest initWithInput:presentationMode:](self, "initWithInput:presentationMode:", v10, a4);

  return v11;
}

id __66__WFConfiguratorRunRequest_initWithInputStrings_presentationMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getWFContentItemClass_softClass;
  v11 = getWFContentItemClass_softClass;
  if (!getWFContentItemClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getWFContentItemClass_block_invoke;
    v7[3] = &unk_1E5FC8858;
    v7[4] = &v8;
    __getWFContentItemClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v4, "itemWithObject:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
