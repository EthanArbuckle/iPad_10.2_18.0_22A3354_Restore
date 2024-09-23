@implementation MTEmailActivityItemProvider

- (MTEmailActivityItemProvider)initWithDataSource:(id)a3
{
  id v5;
  MTEmailActivityItemProvider *v6;
  MTEmailActivityItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTEmailActivityItemProvider;
  v6 = -[MTEmailActivityItemProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEmailActivityItemProvider dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtilStringFactory bodyForShareEmailFromDataSource:](MTShareUtilStringFactory, "bodyForShareEmailFromDataSource:", v3));

  return v4;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend(a4, "isEqualToString:", UIActivityTypeMail);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEmailActivityItemProvider dataSource](self, "dataSource"));
  if (v5)
    v7 = objc_claimAutoreleasedReturnValue(+[MTShareUtilStringFactory subjectForShareEmailFromDataSource:](MTShareUtilStringFactory, "subjectForShareEmailFromDataSource:", v6));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[MTShareUtilStringFactory subjectForShareGenericFromDataSource:](MTShareUtilStringFactory, "subjectForShareGenericFromDataSource:", v6));
  v8 = (void *)v7;

  return v8;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;

  if (objc_msgSend(a4, "isEqualToString:", UIActivityTypeMail))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEmailActivityItemProvider dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtilStringFactory bodyForShareEmailFromDataSource:](MTShareUtilStringFactory, "bodyForShareEmailFromDataSource:", v5));

  }
  else
  {
    v6 = 0;
  }
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
