@implementation WFContentItemProxy

- (NSURL)previewItemURL
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  -[WFContentItemProxy file](self, "file");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItemProxy setFile:](self, "setFile:", v4);

    objc_msgSend((id)objc_opt_class(), "previewRetrievalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__WFContentItemProxy_previewItemURL__block_invoke;
    block[3] = &unk_24EF60878;
    block[4] = self;
    dispatch_async(v5, block);

  }
  -[WFContentItemProxy file](self, "file");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[WFContentItemProxy file](self, "file");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v7;
}

- (NSString)previewItemTitle
{
  void *v2;
  void *v3;

  -[WFContentItemProxy item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFContentItemProxy file](self, "file");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFContentItemProxy file](self, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "file");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqual:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (WFContentItem)item
{
  return (WFContentItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
  objc_storeWeak((id *)&self->_item, a3);
}

- (WFContentItem)originalItem
{
  return (WFContentItem *)objc_loadWeakRetained((id *)&self->_originalItem);
}

- (void)setOriginalItem:(id)a3
{
  objc_storeWeak((id *)&self->_originalItem, a3);
}

- (WFFileType)preferredFileType
{
  return self->_preferredFileType;
}

- (void)setPreferredFileType:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFileType, a3);
}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (id)refreshBlock
{
  return self->_refreshBlock;
}

- (void)setRefreshBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshBlock, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_preferredFileType, 0);
  objc_destroyWeak((id *)&self->_originalItem);
  objc_destroyWeak((id *)&self->_item);
}

void __36__WFContentItemProxy_previewItemURL__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__WFContentItemProxy_previewItemURL__block_invoke_2;
  v3[3] = &unk_24EF60878;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "prepareForPresentationWithCompletionHandler:", v3);

}

void __36__WFContentItemProxy_previewItemURL__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE193F8];
  objc_msgSend(*(id *)(a1 + 32), "preferredFileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __36__WFContentItemProxy_previewItemURL__block_invoke_3;
  v14[3] = &unk_24EF60450;
  v14[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "requestForCoercingToFileType:completionHandler:", v3, v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BEC14A0];
  WFLivePhotoFileType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeWithUTType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BE193F0];
  v10 = *MEMORY[0x24BE19740];
  v15[0] = *MEMORY[0x24BE19738];
  v15[1] = v10;
  v16[0] = v8;
  v16[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "optionsWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v12);

  objc_msgSend(*(id *)(a1 + 32), "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performCoercion:", v4);

}

void __36__WFContentItemProxy_previewItemURL__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wfType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF83C0]);

  if (v8)
  {
    objc_msgSend(v6, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "wf_localizedDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v9, "lastPathComponent");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v14 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Folder (%@)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileWithData:ofType:proposedFilename:", v18, v19, 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v20;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__WFContentItemProxy_previewItemURL__block_invoke_4;
  block[3] = &unk_24EF60428;
  block[4] = *(_QWORD *)(a1 + 32);
  v24 = v6;
  v25 = v5;
  v21 = v5;
  v22 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __36__WFContentItemProxy_previewItemURL__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("previewItemURL"));
  if (*(_QWORD *)(a1 + 40) || (v2 = *(void **)(a1 + 48)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFile:");
  }
  else
  {
    v3 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileWithData:ofType:proposedFilename:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFile:", v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "refreshBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "refreshBlock");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

    objc_msgSend(*(id *)(a1 + 32), "setRefreshBlock:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("previewItemURL"));
}

+ (id)previewRetrievalQueue
{
  if (previewRetrievalQueue_onceToken != -1)
    dispatch_once(&previewRetrievalQueue_onceToken, &__block_literal_global);
  return (id)previewRetrievalQueue_previewRetrievalQueue;
}

void __43__WFContentItemProxy_previewRetrievalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.shortcuts.previewRetrievalQueue", 0);
  v1 = (void *)previewRetrievalQueue_previewRetrievalQueue;
  previewRetrievalQueue_previewRetrievalQueue = (uint64_t)v0;

}

@end
