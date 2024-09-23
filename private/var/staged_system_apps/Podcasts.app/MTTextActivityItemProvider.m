@implementation MTTextActivityItemProvider

- (MTTextActivityItemProvider)initWithDataSource:(id)a3
{
  id v5;
  MTTextActivityItemProvider *v6;
  MTTextActivityItemProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTTextActivityItemProvider;
  v6 = -[MTTextActivityItemProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTextActivityItemProvider dataSource](self, "dataSource", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharePodcastTitle"));

  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;

  if (objc_msgSend(a4, "isEqualToString:", UIActivityTypeSaveToNotes))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTextActivityItemProvider dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtilStringFactory textForShareToNotesFromDataSource:](MTShareUtilStringFactory, "textForShareToNotesFromDataSource:", v5));

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
