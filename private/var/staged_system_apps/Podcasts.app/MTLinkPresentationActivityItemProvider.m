@implementation MTLinkPresentationActivityItemProvider

- (MTLinkPresentationActivityItemProvider)initWithDataSource:(id)a3
{
  id v5;
  MTLinkPresentationActivityItemProvider *v6;
  MTLinkPresentationActivityItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTLinkPresentationActivityItemProvider;
  v6 = -[MTLinkPresentationActivityItemProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTLinkPresentationActivityItemProvider dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTLinkPresentationMetadataUtil linkMetadataForDataSource:](MTLinkPresentationMetadataUtil, "linkMetadataForDataSource:", v3));

  return v4;
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
