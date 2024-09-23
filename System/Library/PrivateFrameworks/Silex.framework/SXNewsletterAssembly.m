@implementation SXNewsletterAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  id v4;

  objc_msgSend(a3, "publicContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F51550, &__block_literal_global_44);

}

SXNewsletterSubscriptionStatusProvider *__39__SXNewsletterAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(SXNewsletterSubscriptionStatusProvider);
}

@end
