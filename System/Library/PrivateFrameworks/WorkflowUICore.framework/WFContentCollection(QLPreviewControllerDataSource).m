@implementation WFContentCollection(QLPreviewControllerDataSource)

- (uint64_t)numberOfPreviewItemsInPreviewController:()QLPreviewControllerDataSource
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "items");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count");

  return v2;
}

- (id)previewController:()QLPreviewControllerDataSource previewItemAtIndex:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __91__WFContentCollection_QLPreviewControllerDataSource__previewController_previewItemAtIndex___block_invoke;
  v15 = &unk_24EF60558;
  v16 = v6;
  v17 = a4;
  v7 = v6;
  v8 = _Block_copy(&v12);
  v9 = _Block_copy(v8);
  objc_msgSend(a1, "previewProxyItemAtIndex:refreshBlock:", a4, v9, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
