@implementation _PXStoryMemoryForYouDataSource

- (_PXStoryMemoryForYouDataSource)initWithDataSource:(id)a3
{
  id v5;
  _PXStoryMemoryForYouDataSource *v6;
  _PXStoryMemoryForYouDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryMemoryForYouDataSource;
  v6 = -[_PXStoryMemoryForYouDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
