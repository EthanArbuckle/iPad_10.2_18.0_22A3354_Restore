@implementation AllCollectionsAPIController

- (AllCollectionsAPIController)initWithOnStateChangeHandler:(id)a3 usingTraits:(id)a4
{
  id v6;
  id v7;
  AllCollectionsAPIController *v8;
  id v9;
  id stateHandler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AllCollectionsAPIController;
  v8 = -[AllCollectionsAPIController init](&v12, "init");
  if (v8)
  {
    v9 = objc_retainBlock(v6);
    stateHandler = v8->_stateHandler;
    v8->_stateHandler = v9;

    objc_storeStrong((id *)&v8->_traits, a4);
    v8->_state = 0;
  }

  return v8;
}

- (NSArray)collectionResults
{
  return self->_collectionResults;
}

- (id)placeCollectionsFromLastBatch
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController placeCollections](self, "placeCollections"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (unsigned)batchSize
{
  return 10;
}

- (void)fetchAllCollectionsViewForKeywordFilter:(id)a3 addressFilter:(id)a4 onCompletion:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  uint8_t buf[8];
  id location;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController allCollectionViewFilters](self, "allCollectionViewFilters"));
  v12 = objc_msgSend(v11, "count");

  if (!v12 || v8 | v9 || (id)-[AllCollectionsAPIController state](self, "state") == (id)3)
  {
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController stateHandler](self, "stateHandler"));
    v13[2](v13, -[AllCollectionsAPIController state](self, "state"), 1);

    -[AllCollectionsAPIController setState:](self, "setState:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v15 = -[AllCollectionsAPIController batchSize](self, "batchSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController traits](self, "traits"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ticketForAllCollectionViewWithBatchSize:keywordFilter:addressFilter:withTraits:", v15, v8, v9, v16));
    -[AllCollectionsAPIController setTicket:](self, "setTicket:", v17);

    objc_initWeak(&location, self);
    v18 = sub_10027A138();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = (char *)os_signpost_id_generate(v19);

    v21 = sub_10027A138();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v20, "FetchingAllCollectionsView", ", buf, 2u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController ticket](self, "ticket"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10027A178;
    v25[3] = &unk_1011AE838;
    objc_copyWeak(v27, &location);
    v27[1] = v20;
    v26 = v10;
    objc_msgSend(v24, "submitWithHandler:networkActivity:", v25, &stru_1011AE858);

    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }

}

- (void)cancelFetchingAllCollections
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController ticket](self, "ticket"));
  objc_msgSend(v3, "cancel");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController batchTicket](self, "batchTicket"));
  objc_msgSend(v4, "cancel");

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
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21[2];
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController traits](self, "traits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCuratedCollections:isBatchLookup:traits:", v6, 1, v9));
  -[AllCollectionsAPIController setBatchTicket:](self, "setBatchTicket:", v10);

  objc_initWeak(&location, self);
  v11 = sub_10027A138();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (char *)os_signpost_id_generate(v12);

  v14 = sub_10027A138();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "FetchingAllCollectionsViewBatch", ", buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsAPIController batchTicket](self, "batchTicket"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10027A638;
  v19[3] = &unk_1011ADD38;
  objc_copyWeak(v21, &location);
  v18 = v7;
  v20 = v18;
  v21[1] = v13;
  objc_msgSend(v17, "submitWithHandler:networkActivity:", v19, &stru_1011AE878);

  objc_destroyWeak(v21);
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

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MKMapServiceAllCollectionsViewTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (MKMapServiceCuratedCollectionTicket)batchTicket
{
  return self->_batchTicket;
}

- (void)setBatchTicket:(id)a3
{
  objc_storeStrong((id *)&self->_batchTicket, a3);
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (void)setCollectionResults:(id)a3
{
  objc_storeStrong((id *)&self->_collectionResults, a3);
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
