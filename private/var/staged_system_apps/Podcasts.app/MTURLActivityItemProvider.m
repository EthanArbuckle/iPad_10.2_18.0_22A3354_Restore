@implementation MTURLActivityItemProvider

- (MTURLActivityItemProvider)initWithDataSource:(id)a3
{
  id v5;
  MTURLActivityItemProvider *v6;
  MTURLActivityItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTURLActivityItemProvider;
  v6 = -[MTURLActivityItemProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLActivityItemProvider dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareURL"));

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;

  if ((objc_msgSend(a4, "isEqualToString:", UIActivityTypeMail) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLActivityItemProvider dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareURL"));

  }
  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLActivityItemProvider dataSource](self, "dataSource", a3, a4, a5.width, a5.height));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareImage"));

  return v6;
}

- (MTShareUtilDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
