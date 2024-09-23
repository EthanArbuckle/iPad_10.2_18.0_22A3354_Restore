@implementation MTAirDropActivityItemSource

- (MTAirDropActivityItemSource)initWithDataSource:(id)a3
{
  id v4;
  MTAirDropActivityItemSource *v5;
  MTAirDropActivityItemSource *v6;

  v4 = a3;
  v5 = -[MTAirDropActivityItemSource init](self, "init");
  v6 = v5;
  if (v5)
    -[MTAirDropActivityItemSource setDataSource:](v5, "setDataSource:", v4);

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAirDropActivityItemSource dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shareURL"));

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;

  if (objc_msgSend(a4, "isEqualToString:", UIActivityTypeAirDrop))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAirDropActivityItemSource dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareURL"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  void *v6;
  void *v7;

  if (objc_msgSend(a4, "isEqualToString:", UIActivityTypeAirDrop, a5.width, a5.height))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAirDropActivityItemSource dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareImage"));

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
