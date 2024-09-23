@implementation SUScriptActivityItemProvider

- (SUScriptActivityItemProvider)initWithMIMEType:(id)a3
{
  SUScriptActivityItemProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptActivityItemProvider;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_mimeType = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUScriptFunction setThisObject:](self->_itemFunction, "setThisObject:", 0);

  -[SUActivityItemProvider setDelegate:](self->_nativeProvider, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivityItemProvider;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (SUActivityItemProvider)nativeActivityItemProvider
{
  SUActivityItemProvider *nativeProvider;
  id v4;
  SUActivityItemProvider *v5;
  SUActivityItemProvider *v6;

  -[SUScriptObject lock](self, "lock");
  nativeProvider = self->_nativeProvider;
  if (!nativeProvider)
  {
    v4 = -[SUScriptActivityItemProvider _newPlaceholderWithMIMEType:](self, "_newPlaceholderWithMIMEType:", self->_mimeType);
    v5 = -[SUActivityItemProvider initWithPlaceholderItem:]([SUActivityItemProvider alloc], "initWithPlaceholderItem:", v4);
    self->_nativeProvider = v5;
    -[SUActivityItemProvider setDelegate:](v5, "setDelegate:", self);

    nativeProvider = self->_nativeProvider;
  }
  v6 = nativeProvider;
  -[SUScriptObject unlock](self, "unlock");
  return v6;
}

- (id)activitySupportsMIMEType:(id)a3
{
  id v5;
  void *v6;
  UIActivity *v7;
  id *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    goto LABEL_7;
  }
  v5 = -[SUScriptActivityItemProvider _newPlaceholderWithMIMEType:](self, "_newPlaceholderWithMIMEType:", a3);
  if (!v5)
  {
LABEL_7:
    v8 = (id *)MEMORY[0x24BDBD268];
    return *v8;
  }
  v6 = v5;
  v7 = -[SUActivityItemProvider suActivity](-[SUScriptActivityItemProvider nativeActivityItemProvider](self, "nativeActivityItemProvider"), "suActivity");
  LODWORD(v7) = -[UIActivity canPerformWithActivityItems:](v7, "canPerformWithActivityItems:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6));

  v8 = (id *)MEMORY[0x24BDBD270];
  if (!(_DWORD)v7)
    v8 = (id *)MEMORY[0x24BDBD268];
  return *v8;
}

- (void)setItem:(id)a3
{
  SUScriptActivityItemProvider *v5;
  id v6;
  char isKindOfClass;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0)
  {
    v5 = self;
    v6 = 0;
LABEL_3:
    -[SUScriptActivityItemProvider _finishItemWithItem:](v5, "_finishItemWithItem:", v6);
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NSString isEqualToString:](self->_mimeType, "isEqualToString:", CFSTR("text/url")))
    {
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
      -[SUScriptActivityItemProvider _finishItemWithItem:](self, "_finishItemWithItem:", v12);

      return;
    }
    if (-[NSString hasPrefix:](self->_mimeType, "hasPrefix:", CFSTR("text/")))
    {
      v5 = self;
      v6 = a3;
      goto LABEL_3;
    }
    if (-[NSString hasPrefix:](self->_mimeType, "hasPrefix:", CFSTR("image/")))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
      v9 = -[SUScriptObject newImageWithURL:](self, "newImageWithURL:", v8);
      if (v9)
      {
        v10 = v9;
        -[SUScriptActivityItemProvider _finishItemWithItem:](self, "_finishItemWithItem:", v9);

      }
      else
      {
        -[SUScriptObject lock](self, "lock");
        self->_loadState = 1;
        -[SUScriptObject unlock](self, "unlock");
        v11 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __40__SUScriptActivityItemProvider_setItem___block_invoke;
        v13[3] = &unk_24DE7E0C8;
        v13[4] = v11;
        -[SUScriptObject loadImageWithURL:completionBlock:](self, "loadImageWithURL:completionBlock:", v8, v13);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __40__SUScriptActivityItemProvider_setItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_finishItemWithItem:", a2);
}

- (void)setPreviewImageWithURLString:(id)a3
{
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0)
  {
    -[SUScriptActivityItemProvider _finishPreviewWithImage:](self, "_finishPreviewWithImage:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
      if (v6)
      {
        v7 = (void *)v6;
        v8 = -[SUScriptObject newImageWithURL:](self, "newImageWithURL:", v6);
        if (v8)
        {
          v9 = v8;
          -[SUScriptActivityItemProvider _finishPreviewWithImage:](self, "_finishPreviewWithImage:", v8);

        }
        else
        {
          -[SUScriptObject lock](self, "lock");
          self->_previewLoadState = 1;
          -[SUScriptObject unlock](self, "unlock");
          v10 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __61__SUScriptActivityItemProvider_setPreviewImageWithURLString___block_invoke;
          v11[3] = &unk_24DE7E0C8;
          v11[4] = v10;
          -[SUScriptObject loadImageWithURL:completionBlock:](self, "loadImageWithURL:completionBlock:", v7, v11);
        }

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }
  }
}

uint64_t __61__SUScriptActivityItemProvider_setPreviewImageWithURLString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_finishPreviewWithImage:", a2);
}

- (NSString)activityType
{
  return -[UIActivityItemProvider activityType](self->_nativeProvider, "activityType");
}

- (id)_className
{
  return CFSTR("iTunesActivityItemProvider");
}

- (WebScriptObject)itemFunction
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUScriptFunction scriptObject](self->_itemFunction, "scriptObject");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (NSString)MIMEType
{
  return self->_mimeType;
}

- (double)progress
{
  return 0.0;
}

- (void)setItemFunction:(id)a3
{
  id v5;
  int v6;
  char isKindOfClass;
  SUScriptFunction *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    v6 = 1;
    if (a3 && (isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
        return;
      }
      v6 = 0;
      v5 = a3;
    }
  }
  -[SUScriptFunction setThisObject:](self->_itemFunction, "setThisObject:", 0);

  if (v6)
  {
    self->_itemFunction = 0;
  }
  else
  {
    v8 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v5);
    self->_itemFunction = v8;
    -[SUScriptFunction setThisObject:](v8, "setThisObject:", self);
  }
}

- (NSString)status
{
  return 0;
}

- (void)activityItemProvider:(id)a3 provideItemUsingBlock:(id)a4
{
  SUScriptFunction *v6;
  uint64_t v7;
  _QWORD v8[5];

  -[SUScriptObject lock](self, "lock", a3);
  v6 = self->_itemFunction;

  self->_itemBlock = (id)objc_msgSend(a4, "copy");
  -[SUScriptObject unlock](self, "unlock");
  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__SUScriptActivityItemProvider_activityItemProvider_provideItemUsingBlock___block_invoke;
    v8[3] = &unk_24DE7C7C8;
    v8[4] = v7;
    -[SUScriptFunction callWithArguments:completionBlock:](v6, "callWithArguments:completionBlock:", 0, v8);

  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

uint64_t __75__SUScriptActivityItemProvider_activityItemProvider_provideItemUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "object");
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      v13 = 138412546;
      v14 = objc_opt_class();
      v15 = 2112;
      v16 = a2;
      LODWORD(v12) = 22;
      v11 = &v13;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v13, v12);
        free(v9);
        v11 = (int *)v10;
        SSFileLog();
      }
    }
    return objc_msgSend(v3, "_finishItemWithItem:", 0, v11);
  }
  return result;
}

- (void)_finishItemWithItem:(id)a3
{
  void (**v5)(id, id);

  -[SUScriptObject lock](self, "lock");

  self->_item = a3;
  self->_loadState = 2;
  if (self->_previewLoadState == 1)
  {
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    v5 = (void (**)(id, id))self->_itemBlock;
    -[SUScriptObject unlock](self, "unlock");
    if (v5)
    {
      v5[2](v5, a3);

    }
  }
}

- (void)_finishPreviewWithImage:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  -[SUActivityItemProvider setSUPreviewImage:](-[SUScriptActivityItemProvider nativeActivityItemProvider](self, "nativeActivityItemProvider"), "setSUPreviewImage:", a3);
  -[SUScriptObject lock](self, "lock");
  self->_previewLoadState = 2;
  if (self->_loadState == 2)
  {
    v6 = self->_item;
    v4 = (void (**)(id, id))self->_itemBlock;
    -[SUScriptObject unlock](self, "unlock");
    if (v4)
      v4[2](v4, v6);
    v5 = v6;
  }
  else
  {
    -[SUScriptObject unlock](self, "unlock");
    v5 = 0;
  }

}

- (id)_newPlaceholderWithMIMEType:(id)a3
{
  objc_class *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("text/url")))
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("http://example.com/"));
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("text/")))
  {
    v5 = (objc_class *)MEMORY[0x24BDD17C8];
    return objc_alloc_init(v5);
  }
  if (objc_msgSend(a3, "hasPrefix:", CFSTR("image/")))
  {
    v5 = (objc_class *)MEMORY[0x24BDF6AC8];
    return objc_alloc_init(v5);
  }
  return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_71, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityItemProvider;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_53, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityItemProvider;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptActivityItemProvider;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_71, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_53 = (uint64_t)sel_activitySupportsMIMEType_;
    unk_255187010 = CFSTR("activitySupportsMIMEType");
    qword_255187018 = (uint64_t)sel_setItem_;
    unk_255187020 = CFSTR("setItem");
    qword_255187028 = (uint64_t)sel_setPreviewImageWithURLString_;
    unk_255187030 = CFSTR("setPreviewImage");
    __KeyMapping_71 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("activityType"), CFSTR("itemFunction"), CFSTR("itemFunction"), CFSTR("MIMEType"), CFSTR("MIMEType"), CFSTR("progress"), CFSTR("progress"), CFSTR("status"), CFSTR("status"), 0);
  }
}

@end
