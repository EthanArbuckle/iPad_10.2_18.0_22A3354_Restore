@implementation FRHeadlineRendererAssembly

- (void)loadInRegistry:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "publicContainer"));
  v4 = objc_msgSend(v5, "registerClass:factory:", objc_opt_class(FRArticlePrefetchManager, v3), &stru_1000DED30);

}

- (FRHeadlineRendererAssembly)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRHeadlineRendererAssembly;
  return -[FRHeadlineRendererAssembly init](&v3, "init");
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

@end
