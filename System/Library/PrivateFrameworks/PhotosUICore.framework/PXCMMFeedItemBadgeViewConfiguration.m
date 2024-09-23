@implementation PXCMMFeedItemBadgeViewConfiguration

- (PXCMMFeedItemBadgeViewConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMFeedItemBadgeView.m"), 33, CFSTR("%s is not available as initializer"), "-[PXCMMFeedItemBadgeViewConfiguration init]");

  abort();
}

- (PXCMMFeedItemBadgeViewConfiguration)initWithTitle:(id)a3
{
  id v5;
  PXCMMFeedItemBadgeViewConfiguration *v6;
  uint64_t v7;
  NSString *title;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMFeedItemBadgeView.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXCMMFeedItemBadgeViewConfiguration;
  v6 = -[PXCMMFeedItemBadgeViewConfiguration init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    title = v6->_title;
    v6->_title = (NSString *)v7;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  NSString *v6;
  char v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    title = self->_title;
    objc_msgSend(v4, "title");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (title == v6)
      v7 = 1;
    else
      v7 = -[NSString isEqualToString:](title, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)_emptyConfiguration
{
  if (_emptyConfiguration_predicate != -1)
    dispatch_once(&_emptyConfiguration_predicate, &__block_literal_global_3293);
  return (id)_emptyConfiguration__emptyConfiguration;
}

void __58__PXCMMFeedItemBadgeViewConfiguration__emptyConfiguration__block_invoke()
{
  PXCMMFeedItemBadgeViewConfiguration *v0;
  void *v1;

  v0 = -[PXCMMFeedItemBadgeViewConfiguration initWithTitle:]([PXCMMFeedItemBadgeViewConfiguration alloc], "initWithTitle:", &stru_1E5149688);
  v1 = (void *)_emptyConfiguration__emptyConfiguration;
  _emptyConfiguration__emptyConfiguration = (uint64_t)v0;

}

@end
