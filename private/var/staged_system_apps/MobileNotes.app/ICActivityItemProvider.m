@implementation ICActivityItemProvider

- (ICActivityItemProvider)initWithItemProvider:(id)a3 title:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICActivityItemProvider *v11;
  ICActivityItemProvider *v12;
  ICLinkPresentationMetadata *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICActivityItemProvider;
  v11 = -[ICActivityItemProvider initWithPlaceholderItem:](&v15, "initWithPlaceholderItem:", v8);
  v12 = v11;
  if (v11)
  {
    -[ICActivityItemProvider setItemProvider:](v11, "setItemProvider:", v8);
    v13 = -[ICLinkPresentationMetadata initWithTitle:image:]([ICLinkPresentationMetadata alloc], "initWithTitle:image:", v9, v10);
    -[ICActivityItemProvider setLinkPresentationMetadata:](v12, "setLinkPresentationMetadata:", v13);

  }
  return v12;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICActivityItemProvider linkPresentationMetadata](self, "linkPresentationMetadata", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "linkMetadata"));

  return v4;
}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_itemProvider, a3);
}

- (ICLinkPresentationMetadata)linkPresentationMetadata
{
  return self->_linkPresentationMetadata;
}

- (void)setLinkPresentationMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkPresentationMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationMetadata, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end
