@implementation WFContentCollection(Previewing)

- (void)generatePreviewControllerDataSource:()Previewing
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_8;
    v7[3] = &unk_24EF60530;
    v7[4] = a1;
    v9 = a2;
    v8 = v5;
    objc_msgSend(a1, "transformItemsUsingBlock:completionHandler:", &__block_literal_global_215, v7);

  }
}

- (id)previewProxyItemAtIndex:()Previewing refreshBlock:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;

  v6 = a4;
  objc_getAssociatedObject(a1, &proxiesKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "strongObjectsPointerArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCount:", objc_msgSend(v8, "count"));

    objc_setAssociatedObject(a1, &proxiesKey, v7, (void *)1);
  }
  if (objc_msgSend(v7, "count") > a3 && !objc_msgSend(v7, "pointerAtIndex:", a3))
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(a1, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setItem:", v11);

    objc_msgSend(v9, "setRefreshBlock:", v6);
    objc_msgSend(v7, "replacePointerAtIndex:withPointer:", a3, v9);
    objc_getAssociatedObject(a1, &originalCollectionKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "numberOfItems") <= (uint64_t)a3)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v12, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v9, "item");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          v20 = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __72__WFContentCollection_Previewing__previewProxyItemAtIndex_refreshBlock___block_invoke;
          v23 = &unk_24EF60738;
          v24 = v9;
          v14 = v14;
          v25 = v14;
          objc_msgSend(v14, "prepareForPresentationWithCompletionHandler:", &v20);

        }
      }
    }

  }
  if (objc_msgSend(v7, "count", v20, v21, v22, v23) <= a3)
    v17 = 0;
  else
    v17 = (void *)objc_msgSend(v7, "pointerAtIndex:", a3);
  v18 = v17;

  return v18;
}

@end
