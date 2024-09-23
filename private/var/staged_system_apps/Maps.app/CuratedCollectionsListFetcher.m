@implementation CuratedCollectionsListFetcher

- (CuratedCollectionsListFetcher)initWithTraits:(id)a3
{
  id v5;
  CuratedCollectionsListFetcher *v6;
  CuratedCollectionsListFetcher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionsListFetcher;
  v6 = -[CuratedCollectionsListFetcher init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_traits, a3);

  return v7;
}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  char *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20[2];
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionsListFetcher traits](self, "traits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCuratedCollections:isBatchLookup:traits:", v6, 1, v9));

  objc_initWeak(&location, self);
  v11 = sub_1002582C4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (char *)os_signpost_id_generate(v12);

  v14 = sub_1002582C4();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "FetchingCollectionsListViewBatch", ", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100258304;
  v18[3] = &unk_1011ADD38;
  v20[1] = v13;
  objc_copyWeak(v20, &location);
  v17 = v7;
  v19 = v17;
  objc_msgSend(v10, "submitWithHandler:networkActivity:", v18, &stru_1011ADD58);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
