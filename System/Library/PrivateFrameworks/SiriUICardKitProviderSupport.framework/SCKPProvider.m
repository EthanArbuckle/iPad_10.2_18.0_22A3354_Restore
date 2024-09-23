@implementation SCKPProvider

- (SCKPProvider)init
{
  SCKPProvider *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCKPProvider;
  v2 = -[SCKPProvider init](&v4, sel_init);
  if (v2 && init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global);
  return v2;
}

uint64_t __20__SCKPProvider_init__block_invoke()
{
  return +[CRKCardSectionViewController _registerWithCardKit](SCKPInteractiveCardSectionViewController, "_registerWithCardKit");
}

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__SCKPProvider_requestCardSectionViewProviderForCard_delegate_reply___block_invoke;
  v10[3] = &unk_24E048F68;
  v11 = v8;
  v9 = v8;
  -[SCKPProvider requestIdentifiedCardSectionViewProviderForCard:delegate:reply:](self, "requestIdentifiedCardSectionViewProviderForCard:delegate:reply:", a3, a4, v10);

}

uint64_t __69__SCKPProvider_requestCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  void (**v6)(id, _QWORD, SCKPCardSectionViewProvider *);
  id v7;
  SCKPCardSectionViewProvider *v8;

  if (a5)
  {
    v6 = (void (**)(id, _QWORD, SCKPCardSectionViewProvider *))a5;
    v7 = a3;
    v8 = -[SCKPCardSectionViewProvider initWithCard:]([SCKPCardSectionViewProvider alloc], "initWithCard:", v7);

    v6[2](v6, 0, v8);
  }
}

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.SiriUICardKitProvider");
}

@end
