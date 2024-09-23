@implementation SXDocumentTextContentProvider

- (SXDocumentTextContentProvider)initWithDocument:(id)a3
{
  id v5;
  SXDocumentTextContentProvider *v6;
  SXDocumentTextContentProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDocumentTextContentProvider;
  v6 = -[SXDocumentTextContentProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_document, a3);

  return v7;
}

- (void)textContentForType:(unint64_t)a3 onCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    +[SXDocumentTextContentProvider sharedQueue](SXDocumentTextContentProvider, "sharedQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke;
    v8[3] = &unk_24D68AFF0;
    objc_copyWeak(v10, &location);
    v10[1] = (id)a3;
    v9 = v6;
    dispatch_async(v7, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

void __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textContentForComponents:withType:", v5, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_2;
    block[3] = &unk_24D68AFA0;
    v7 = *(id *)(a1 + 32);
    v12 = v6;
    v13 = v7;
    v8 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_3;
    v9[3] = &unk_24D68AFC8;
    v10 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
    v8 = v10;
  }

}

void __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __65__SXDocumentTextContentProvider_textContentForType_onCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)textContentForComponents:(id)a3 withType:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[SXDocumentTextContentProvider textContentForComponent:withType:](self, "textContentForComponent:withType:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          if (objc_msgSend(v7, "length"))
            objc_msgSend(v7, "appendString:", CFSTR("\n"));
          objc_msgSend(v7, "appendString:", v13);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)textContentForComponent:(id)a3 withType:(unint64_t)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  objc_msgSend(v6, "classification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXDocumentTextContentProvider classification:isValidForType:](self, "classification:isValidForType:", v7, a4);

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      if (-[SXDocumentTextContentProvider contentRelevance:isValidForType:](self, "contentRelevance:isValidForType:", objc_msgSend(v9, "contentRelevance"), a4))
      {
        objc_msgSend(v9, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "components");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDocumentTextContentProvider textContentForComponents:withType:](self, "textContentForComponents:withType:", v11, a4);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)classification:(id)a3 isValidForType:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  return a4 != 1 || objc_msgSend((id)objc_opt_class(), "role", v4, v5) != 8;
}

- (BOOL)contentRelevance:(unint64_t)a3 isValidForType:(unint64_t)a4
{
  return a3 == 2 || a4 != 1;
}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1)
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_53);
  return (id)sharedQueue_sharedQueue;
}

void __44__SXDocumentTextContentProvider_sharedQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.news.text-providing", v2);
  v1 = (void *)sharedQueue_sharedQueue;
  sharedQueue_sharedQueue = (uint64_t)v0;

}

- (SXDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
}

@end
