@implementation _UIDocumentActivityDownloadOperation

- (_UIDocumentActivityDownloadOperation)initWithURL:(id)a3 scene:(id)a4
{
  id v7;
  id v8;
  _UIDocumentActivityDownloadOperation *v9;
  _UIDocumentActivityDownloadOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIDocumentActivityDownloadOperation;
  v9 = -[_UIDocumentActivityDownloadOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeWeak((id *)&v10->_weakScene, v8);
  }

  return v10;
}

- (void)main
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  _UIDocumentActivityDownloadOperation *v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __44___UIDocumentActivityDownloadOperation_main__block_invoke;
  v8 = &unk_1E16B1B50;
  v9 = self;
  v10 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], &v5);
  objc_msgSend(v4, "coordinateReadingItemAtURL:options:error:byAccessor:", self->_url, 0, 0, &__block_literal_global_160, v5, v6, v7, v8, v9);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakScene);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
