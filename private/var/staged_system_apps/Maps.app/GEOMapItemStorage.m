@implementation GEOMapItemStorage

- (id)searchResultForFidelity:(unint64_t)a3 refinedHandler:(id)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SearchResult *v10;
  SearchResult *v11;
  void *v12;
  void *v13;
  SearchResult *v14;
  _QWORD v16[4];
  SearchResult *v17;
  id v18;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMapItemStorage data](self, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForSerializedMapItemStorage:](GEOMapItemStorage, "mapItemStorageForSerializedMapItemStorage:", v7));

  if (!v8)
    goto LABEL_8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v8));
  if (!v9
    || (v10 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v9)) == 0)
  {

LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = v10;
  if ((v4 & 0x10) == 0)
  {
    -[SearchResultRepr setHasIncompleteMetadata:](v10, "setHasIncompleteMetadata:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ticketForMapItemToRefine:", v9));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100B83818;
    v16[3] = &unk_1011E7460;
    v17 = v11;
    v18 = v6;
    v14 = v11;
    objc_msgSend(v13, "submitWithRefinedHandler:networkActivity:", v16, 0);

    v11 = 0;
  }

LABEL_9:
  return v11;
}

@end
