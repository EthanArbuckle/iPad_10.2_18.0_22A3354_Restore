@implementation AEBookRenderingCallbackTarget

- (AEBookRenderingCallbackTarget)initWithCallbackBlock:(id)a3
{
  id v4;
  AEBookRenderingCallbackTarget *v5;
  AEBookRenderingCallbackTarget *v6;
  id v7;
  void *callbackBlock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AEBookRenderingCallbackTarget;
  v5 = -[AEBookRenderingCallbackTarget init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      callbackBlock = v6->_callbackBlock;
      v6->_callbackBlock = v7;
    }
    else
    {
      callbackBlock = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (void)renderingCacheCallbackImage:(id)a3 context:(id)a4
{
  (*((void (**)(void))self->_callbackBlock + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end
