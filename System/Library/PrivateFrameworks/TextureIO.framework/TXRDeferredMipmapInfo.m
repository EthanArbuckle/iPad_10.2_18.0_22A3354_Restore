@implementation TXRDeferredMipmapInfo

- (TXRDeferredMipmapInfo)initWithArrayLength:(unint64_t)a3 cubemap:(BOOL)a4
{
  _BOOL8 v4;
  TXRDeferredMipmapInfo *v6;
  uint64_t v7;
  NSMutableArray *elements;
  id v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TXRDeferredMipmapInfo;
  v6 = -[TXRDeferredMipmapInfo init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    elements = v6->_elements;
    v6->_elements = (NSMutableArray *)v7;

    if (a3)
    {
      v9 = 0;
      do
      {
        v10 = v9;
        v9 = -[TXRDeferredElementInfo initAsCubemap:]([TXRDeferredElementInfo alloc], "initAsCubemap:", v4);

        -[NSMutableArray addObject:](v6->_elements, "addObject:", v9);
        --a3;
      }
      while (a3);

    }
  }
  return v6;
}

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
