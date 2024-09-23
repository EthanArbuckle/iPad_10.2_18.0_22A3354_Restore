@implementation UGCPhotoViewerBatchRequester

- (UGCPhotoViewerBatchRequester)initWithMapItem:(id)a3
{
  id v5;
  UGCPhotoViewerBatchRequester *v6;
  UGCPhotoViewerBatchRequester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UGCPhotoViewerBatchRequester;
  v6 = -[UGCPhotoViewerBatchRequester init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (void)fetchPhotosWithRange:(_NSRange)a3 completion:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  void *v9;
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
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _vendorID](self->_mapItem, "_vendorID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultTraits"));
      v14 = (GEOMapServicePhotoLookupTicket *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForVendorIdentifier:mapItemIdentifier:range:traits:", v9, v11, location, length, v13));
      currentTicket = self->_currentTicket;
      self->_currentTicket = v14;

      v16 = self->_currentTicket;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10077C874;
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
  objc_storeStrong((id *)&self->_currentTicket, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
