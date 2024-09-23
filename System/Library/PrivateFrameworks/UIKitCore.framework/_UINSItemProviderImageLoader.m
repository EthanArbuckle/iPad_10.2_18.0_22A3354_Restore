@implementation _UINSItemProviderImageLoader

- (_UINSItemProviderImageLoader)initWithItemProvider:(id)a3 typeIdentifier:(id)a4
{
  id v7;
  id v8;
  _UINSItemProviderImageLoader *v9;
  _UINSItemProviderImageLoader *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UINSItemProviderImageLoader;
  v9 = -[_UIImageLoader init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemProvider, a3);
    if (v8)
    {
      v11 = (void *)objc_msgSend(v8, "copy");
    }
    else
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_storeStrong((id *)&v10->_typeIdentifier, v11);

  }
  return v10;
}

- (void)_really_loadImage:(id)a3
{
  id v4;
  NSItemProvider *itemProvider;
  NSString *typeIdentifier;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  _UINSItemProviderImageLoader *v13;
  id v14;

  v4 = a3;
  itemProvider = self->_itemProvider;
  typeIdentifier = self->_typeIdentifier;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __50___UINSItemProviderImageLoader__really_loadImage___block_invoke;
  v12 = &unk_1E16C4458;
  v13 = self;
  v14 = v4;
  v7 = v4;
  -[NSItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](itemProvider, "loadDataRepresentationForTypeIdentifier:completionHandler:", typeIdentifier, &v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINSItemProviderImageLoader _setProgress:](self, "_setProgress:", v8, v9, v10, v11, v12, v13);

}

- (BOOL)_really_cancel
{
  void *v2;

  -[_UINSItemProviderImageLoader _progress](self, "_progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  return 1;
}

- (NSProgress)_progress
{
  return (NSProgress *)objc_getProperty(self, a2, 64, 1);
}

- (void)_setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progress, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
