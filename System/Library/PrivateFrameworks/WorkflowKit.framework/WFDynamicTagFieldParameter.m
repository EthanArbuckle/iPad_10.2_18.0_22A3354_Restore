@implementation WFDynamicTagFieldParameter

- (id)suggestedTags
{
  void *v3;
  void *v4;

  -[WFDynamicTagFieldParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestedTagsForTagField:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFDynamicTagFieldDataSource)dataSource
{
  return (WFDynamicTagFieldDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
