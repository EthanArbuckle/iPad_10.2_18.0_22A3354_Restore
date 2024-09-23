@implementation VSUIAsyncLoadingCard

- (VSUIAsyncLoadingCard)initWithCard:(id)a3
{
  id v5;
  VSUIAsyncLoadingCard *v6;
  VSUIAsyncLoadingCard *v7;
  VSUIAsyncLoadingCard *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSUIAsyncLoadingCard;
  v6 = -[CRBasicCard init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storedCard, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)asynchronous
{
  return 1;
}

- (void)loadCardWithCompletion:(id)a3
{
  (*((void (**)(id, CRCard *))a3 + 2))(a3, self->_storedCard);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedCard, 0);
}

@end
