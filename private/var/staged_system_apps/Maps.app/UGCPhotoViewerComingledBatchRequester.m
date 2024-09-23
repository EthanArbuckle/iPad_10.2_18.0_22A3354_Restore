@implementation UGCPhotoViewerComingledBatchRequester

- (UGCPhotoViewerComingledBatchRequester)initWithMapItem:(id)a3 categoryId:(id)a4
{
  id v7;
  id v8;
  UGCPhotoViewerComingledBatchRequester *v9;
  UGCPhotoViewerComingledBatchRequester *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCPhotoViewerComingledBatchRequester;
  v9 = -[UGCPhotoViewerComingledBatchRequester init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categoryId, a4);
    objc_storeStrong((id *)&v10->_mapItem, a3);
  }

  return v10;
}

- (void)fetchPhotosWithRange:(_NSRange)a3 completion:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  NSString *categoryId;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOMapServicePhotoLookupTicket *v14;
  GEOMapServicePhotoLookupTicket *currentTicket;
  GEOMapServicePhotoLookupTicket *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (v7)
  {
    if (length)
    {
      -[GEOMapServicePhotoLookupTicket cancel](self->_currentTicket, "cancel");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
      categoryId = self->_categoryId;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultTraits"));
      v14 = (GEOMapServicePhotoLookupTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCategoryIdentifier:mapItemIdentifier:range:traits:", categoryId, v11, location, length, v13));
      currentTicket = self->_currentTicket;
      self->_currentTicket = v14;

      v16 = self->_currentTicket;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10077CAD8;
      v17[3] = &unk_1011C6270;
      v18 = v7;
      -[GEOMapServicePhotoLookupTicket submitWithHandler:networkActivity:](v16, "submitWithHandler:networkActivity:", v17, 0);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_currentTicket, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);
}

@end
