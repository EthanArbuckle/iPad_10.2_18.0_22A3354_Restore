@implementation UGCReportImageryController

- (UGCReportImageryController)initWithMapItem:(id)a3 reportedPhoto:(id)a4 presentingViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  UGCReportImageryController *v12;
  UGCReportImageryController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *photoURL;
  uint64_t v18;
  UIView *rapButtonView;
  uint64_t v20;
  geo_isolater *downloadIsolator;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UGCReportImageryController;
  v12 = -[UGCReportImageryController init](&v23, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapItem, a3);
    objc_storeStrong((id *)&v13->_geoPhoto, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "largestPhoto"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "url"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
    photoURL = v13->_photoURL;
    v13->_photoURL = (NSString *)v16;

    objc_storeStrong((id *)&v13->_presentingViewController, a5);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rapBarButtonView"));
    rapButtonView = v13->_rapButtonView;
    v13->_rapButtonView = (UIView *)v18;

    v13->_shouldCancelPresentation = 0;
    v20 = geo_isolater_create("com.apple.Maps.UGCReportImageryController.layoutDownload");
    downloadIsolator = v13->_downloadIsolator;
    v13->_downloadIsolator = (geo_isolater *)v20;

  }
  return v13;
}

- (void)fetchLayoutAndPresentWithCompletion:(id)a3
{
  id v4;
  RAPPlacecardImageryContextImpl *v5;
  RAPPlacecardImageryLayoutManager *v6;
  void *v7;
  RAPPlacecardImageryLayoutManager *v8;
  RAPPlacecardImageryLayoutManager *layoutManager;
  geo_isolater *downloadIsolator;
  RAPPlacecardImageryLayoutManager *v11;
  MKMapItem *mapItem;
  RAPPlacecardImageryContextImpl *v13;
  id v14;
  _QWORD v15[5];
  RAPPlacecardImageryContextImpl *v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[5];

  v4 = a3;
  v5 = -[RAPPlacecardImageryContextImpl initWithMapItem:photo:selectedPhotoURL:]([RAPPlacecardImageryContextImpl alloc], "initWithMapItem:photo:selectedPhotoURL:", self->_mapItem, self->_geoPhoto, self->_photoURL);
  v6 = [RAPPlacecardImageryLayoutManager alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPPlacecardImageryIssueItem defaultIssueItems](RAPPlacecardImageryIssueItem, "defaultIssueItems"));
  v8 = -[RAPPlacecardImageryLayoutManager initWithDefaultItems:](v6, "initWithDefaultItems:", v7);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v8;

  downloadIsolator = self->_downloadIsolator;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10073FEB8;
  v20[3] = &unk_1011AC860;
  v20[4] = self;
  geo_isolate_sync(downloadIsolator, v20);
  objc_initWeak(&location, self);
  v11 = self->_layoutManager;
  mapItem = self->_mapItem;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10073FEC4;
  v15[3] = &unk_1011C5248;
  objc_copyWeak(&v18, &location);
  v15[4] = self;
  v13 = v5;
  v16 = v13;
  v14 = v4;
  v17 = v14;
  -[RAPPlacecardImageryLayoutManager downloadAndResolveLayoutWithMapItem:completion:](v11, "downloadAndResolveLayoutWithMapItem:completion:", mapItem, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)cancelPresentation
{
  geo_isolater *downloadIsolator;
  _QWORD v3[5];

  downloadIsolator = self->_downloadIsolator;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10074013C;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  geo_isolate_sync(downloadIsolator, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadIsolator, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_geoPhoto, 0);
  objc_storeStrong((id *)&self->_rapButtonView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end
