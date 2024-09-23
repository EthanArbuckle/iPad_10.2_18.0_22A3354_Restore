@implementation CACMessageDisplayOperation

- (CACMessageDisplayOperation)initWithMessageString:(id)a3 type:(int64_t)a4
{
  id v6;
  CACMessageDisplayOperation *v7;
  CACMessageDisplayOperation *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CACMessageDisplayOperation;
  v7 = -[CACMessageDisplayOperation init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CACMessageDisplayOperation setMessage:](v7, "setMessage:", v6);
    -[CACMessageDisplayOperation setType:](v8, "setType:", a4);
  }

  return v8;
}

- (void)main
{
  void *v3;
  double v4;
  double v5;
  _QWORD block[5];

  if ((-[CACMessageDisplayOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__CACMessageDisplayOperation_main__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[CACMessageDisplayOperation message](self, "message");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACDisplayManager durationToDisplayMessageString:](CACDisplayManager, "durationToDisplayMessageString:", v3);
    v5 = v4;

    if (v5 > 0.0)
    {
      while ((-[CACMessageDisplayOperation isCancelled](self, "isCancelled") & 1) == 0)
      {
        if (v5 <= 0.1)
        {
          usleep((v5 * 1000000.0));
          return;
        }
        v5 = v5 + -0.1;
        usleep(0x186A0u);
        if (v5 <= 0.0)
          return;
      }
    }
  }
}

void __34__CACMessageDisplayOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_showBannerViewWithText:type:", v2, objc_msgSend(*(id *)(a1 + 32), "type"));

}

- (BOOL)ignore
{
  return self->_ignore;
}

- (void)setIgnore:(BOOL)a3
{
  self->_ignore = a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
