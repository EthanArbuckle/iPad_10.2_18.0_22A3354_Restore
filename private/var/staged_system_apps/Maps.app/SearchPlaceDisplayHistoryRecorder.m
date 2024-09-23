@implementation SearchPlaceDisplayHistoryRecorder

- (SearchPlaceDisplayHistoryRecorder)initWithGEOMapItem:(id)a3
{
  id v4;
  id v5;
  SearchPlaceDisplayHistoryRecorder *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)MSPMutableHistoryEntryPlaceDisplay);
  v6 = -[SearchPlaceDisplayHistoryRecorder initWithGEOMapItem:placeDisplayHistoryItem:](self, "initWithGEOMapItem:placeDisplayHistoryItem:", v4, v5);

  return v6;
}

- (SearchPlaceDisplayHistoryRecorder)initWithGEOMapItem:(id)a3 placeDisplayHistoryItem:(id)a4
{
  id v6;
  id v7;
  SearchPlaceDisplayHistoryRecorder *v8;
  SearchPlaceDisplayHistoryRecorder *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SearchPlaceDisplayHistoryRecorder;
  v8 = -[SearchPlaceDisplayHistoryRecorder init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_placeDisplayHistoryItem, a4);
    -[MSPMutableHistoryEntryPlaceDisplay setGeoMapItem:](v9->_placeDisplayHistoryItem, "setGeoMapItem:", v6);
  }

  return v9;
}

- (void)recordItemInHistory
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MSPMutableHistoryEntryPlaceDisplay geoMapItem](self->_placeDisplayHistoryItem, "geoMapItem"));
  +[HistoryEntryRecentsItem saveGeoMapItem:](HistoryEntryRecentsItem, "saveGeoMapItem:", v2);

}

- (MSPMutableHistoryEntryPlaceDisplay)placeDisplayHistoryItem
{
  return self->_placeDisplayHistoryItem;
}

- (void)setPlaceDisplayHistoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeDisplayHistoryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDisplayHistoryItem, 0);
}

@end
