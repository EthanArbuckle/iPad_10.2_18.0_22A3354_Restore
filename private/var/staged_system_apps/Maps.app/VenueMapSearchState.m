@implementation VenueMapSearchState

+ (id)stateWithMapSelectionState:(id)a3 searchFieldItem:(id)a4 searchInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithMapSelectionState:searchFieldItem:searchInfo:", v10, v9, v8);

  return v11;
}

- (VenueMapSearchState)initWithMapSelectionState:(id)a3 searchFieldItem:(id)a4 searchInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  VenueMapSearchState *v12;
  VenueMapSearchState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VenueMapSearchState;
  v12 = -[VenueMapSearchState init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapSelectionState, a3);
    objc_storeStrong((id *)&v13->_searchFieldItem, a4);
    objc_storeStrong((id *)&v13->_searchInfo, a5);
  }

  return v13;
}

- (VenueMapSearchState)init
{

  return 0;
}

- (MapSelectionManagerState)mapSelectionState
{
  return self->_mapSelectionState;
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_storeStrong((id *)&self->_mapSelectionState, 0);
}

@end
