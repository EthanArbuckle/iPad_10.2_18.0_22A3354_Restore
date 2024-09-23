@implementation PublisherAPIController

- (PublisherAPIController)initWithPublisherId:(id)a3 usingOnStateChangeHandler:(id)a4 usingTraits:(id)a5
{
  id v9;
  id v10;
  id v11;
  PublisherAPIController *v12;
  PublisherAPIController *v13;
  id v14;
  id stateHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PublisherAPIController;
  v12 = -[PublisherAPIController init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_publisherId, a3);
    v14 = objc_retainBlock(v10);
    stateHandler = v13->_stateHandler;
    v13->_stateHandler = v14;

    objc_storeStrong((id *)&v13->_traits, a5);
    v13->_state = 0;
  }

  return v13;
}

- (void)fetchPublisherViewForKeywordFilter:(id)a3 addressFilter:(id)a4 onCompletion:(id)a5
{
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  char *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28[2];
  uint8_t buf[8];
  id location;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController filters](self, "filters"));
  v12 = objc_msgSend(v11, "count");

  if (!v12 || v8 | v9 || (id)-[PublisherAPIController state](self, "state") == (id)3)
  {
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PublisherAPIController stateHandler](self, "stateHandler"));
    v13[2](v13, -[PublisherAPIController state](self, "state"), 1);

    -[PublisherAPIController setState:](self, "setState:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController publisherId](self, "publisherId"));
    v16 = -[PublisherAPIController batchSize](self, "batchSize");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController traits](self, "traits"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ticketForPublisherViewPublisherIdentifier:keywordFilter:addressFilter:batchSize:withTraits:", v15, v8, v9, v16, v17));
    -[PublisherAPIController setTicket:](self, "setTicket:", v18);

    objc_initWeak(&location, self);
    v19 = sub_1008211E8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = (char *)os_signpost_id_generate(v20);

    v22 = sub_1008211E8();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v21, "FetchingPublisherView", ", buf, 2u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController ticket](self, "ticket"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100821228;
    v26[3] = &unk_1011CA218;
    objc_copyWeak(v28, &location);
    v28[1] = v21;
    v26[4] = self;
    v27 = v10;
    objc_msgSend(v25, "submitWithHandler:networkActivity:", v26, &stru_1011CA238);

    objc_destroyWeak(v28);
    objc_destroyWeak(&location);
  }

}

- (void)cancelFetchingPublisher
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController ticket](self, "ticket"));
  objc_msgSend(v3, "cancel");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PublisherAPIController batchTicket](self, "batchTicket"));
  objc_msgSend(v4, "cancel");

}

- (id)publisherViewResultFilters
{
  return self->_filters;
}

- (NSArray)collectionResults
{
  return self->_collectionResults;
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (id)placeCollectionsFromLastBatch
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController placeCollections](self, "placeCollections"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (unsigned)batchSize
{
  return 10;
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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController traits](self, "traits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCuratedCollections:isBatchLookup:traits:", v6, 1, v9));
  -[PublisherAPIController setBatchTicket:](self, "setBatchTicket:", v10);

  objc_initWeak(&location, self);
  v11 = sub_1008211E8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (char *)os_signpost_id_generate(v12);

  v14 = sub_1008211E8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "FetchingPublisherViewBatch", ", buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherAPIController batchTicket](self, "batchTicket"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1008217DC;
  v19[3] = &unk_1011ADD38;
  objc_copyWeak(v21, &location);
  v18 = v7;
  v20 = v18;
  v21[1] = v13;
  objc_msgSend(v17, "submitWithHandler:networkActivity:", v19, &stru_1011CA258);

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

- (MKMapItemIdentifier)publisherId
{
  return self->_publisherId;
}

- (void)setPublisherId:(id)a3
{
  objc_storeStrong((id *)&self->_publisherId, a3);
}

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MKMapServicePublisherViewTicket)ticket
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

- (void)setPublisherResult:(id)a3
{
  objc_storeStrong((id *)&self->_publisherResult, a3);
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIds, a3);
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_publisherId, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
