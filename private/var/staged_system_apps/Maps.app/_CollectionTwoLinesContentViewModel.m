@implementation _CollectionTwoLinesContentViewModel

- (void)setCollection:(id)a3
{
  CollectionHandler *v5;
  CollectionHandler *v6;
  CollectionHandler **p_collection;
  unsigned __int8 v8;
  CollectionHandler *v9;

  v5 = (CollectionHandler *)a3;
  v6 = v5;
  p_collection = &self->_collection;
  if (self->_collection != v5)
  {
    v9 = v5;
    v8 = -[CollectionHandler isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      -[CollectionHandler removeObserver:](*p_collection, "removeObserver:", self);
      objc_storeStrong((id *)&self->_collection, a3);
      -[CollectionHandler addObserver:](*p_collection, "addObserver:", self);
      v6 = v9;
    }
  }

}

- (void)collectionHandlerInfoUpdated:(id)a3
{
  CollectionHandler *v4;
  void *v5;
  void *v6;
  CollectionHandler *v7;

  v4 = (CollectionHandler *)a3;
  v7 = v4;
  if (self->_collection == v4 || -[CollectionHandler isEqual:](v4, "isEqual:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler title](v7, "title"));
    -[_BasicTwoLinesContentViewModel setTitleText:](self, "setTitleText:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler subtitle](v7, "subtitle"));
    -[_BasicTwoLinesContentViewModel setSubtitleText:](self, "setSubtitleText:", v6);

    -[_BasicTwoLinesContentViewModel updateObservers](self, "updateObservers");
  }

}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
