@implementation GuidesHomeAPIController

- (GuidesHomeAPIController)initWithGuideLocation:(id)a3 onStateChangeHandler:(id)a4 traits:(id)a5
{
  id v9;
  id v10;
  id v11;
  GuidesHomeAPIController *v12;
  GuidesHomeAPIController *v13;
  id v14;
  id stateHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GuidesHomeAPIController;
  v12 = -[GuidesHomeAPIController init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_guideLocation, a3);
    v14 = objc_retainBlock(v10);
    stateHandler = v13->_stateHandler;
    v13->_stateHandler = v14;

    objc_storeStrong((id *)&v13->_traits, a5);
    v13->_state = 0;
  }

  return v13;
}

- (void)cancelFetchingGuideHome
{
  void *v3;
  id v4;

  -[GuidesHomeAPIController clearFilteredData](self, "clearFilteredData");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController batchTicket](self, "batchTicket"));
  objc_msgSend(v3, "cancel");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController ticket](self, "ticket"));
  objc_msgSend(v4, "cancel");

}

- (void)refreshWithGuideLocation:(id)a3
{
  id v5;
  GEOGuidesHomeResult *guideHomeResult;

  objc_storeStrong((id *)&self->_guideLocation, a3);
  v5 = a3;
  guideHomeResult = self->_guideHomeResult;
  self->_guideHomeResult = 0;

  -[GuidesHomeAPIController cancelFetchingGuideHome](self, "cancelFetchingGuideHome");
}

- (void)fetchGuidesHomeViewFilteredBy:(id)a3 onCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  char *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD);
  id v25[2];
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[GuidesHomeAPIController setFilter:](self, "setFilter:", v6);
  if (v6
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideHomeResult](self, "guideHomeResult")),
        v20,
        !v20))
  {
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController stateHandler](self, "stateHandler"));
    v8[2](v8, -[GuidesHomeAPIController state](self, "state"), 1);

    -[GuidesHomeAPIController setState:](self, "setState:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideLocation](self, "guideLocation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController traits](self, "traits"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForGuideHomeWithFilter:guideLocation:withTraits:", v6, v10, v11));
    -[GuidesHomeAPIController setTicket:](self, "setTicket:", v12);

    objc_initWeak(&location, self);
    v13 = sub_10025B3B0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = (char *)os_signpost_id_generate(v14);

    v16 = sub_10025B3B0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "FetchingGuidesHomeView", ", buf, 2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController ticket](self, "ticket"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10025B3F0;
    v22[3] = &unk_1011ADE40;
    v25[1] = v15;
    objc_copyWeak(v25, &location);
    v23 = v6;
    v24 = v7;
    objc_msgSend(v19, "submitWithHandler:networkActivity:", v22, 0);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
  else
  {
    -[GuidesHomeAPIController clearFilteredData](self, "clearFilteredData");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController stateHandler](self, "stateHandler"));
    v21[2](v21, -[GuidesHomeAPIController state](self, "state"), 2);

    -[GuidesHomeAPIController setState:](self, "setState:", 2);
    v7[2](v7);
  }

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
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController traits](self, "traits"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ticketForCuratedCollections:isBatchLookup:traits:", v6, 1, v9));
  -[GuidesHomeAPIController setBatchTicket:](self, "setBatchTicket:", v10);

  objc_initWeak(&location, self);
  v11 = sub_10025B3B0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (char *)os_signpost_id_generate(v12);

  v14 = sub_10025B3B0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v13, "FetchingGuidesHomeViewBatch", ", buf, 2u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController batchTicket](self, "batchTicket"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10025B7F0;
  v19[3] = &unk_1011ADD38;
  v21[1] = v13;
  objc_copyWeak(v21, &location);
  v18 = v7;
  v20 = v18;
  objc_msgSend(v17, "submitWithHandler:networkActivity:", v19, &stru_1011ADE60);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

}

- (void)clearFilteredData
{
  -[GuidesHomeAPIController setFilteredCollections:](self, "setFilteredCollections:", 0);
  -[GuidesHomeAPIController setFilteredCollectionsIds:](self, "setFilteredCollectionsIds:", 0);
}

- (void)initializeSingleCollectionFromResponseIfApplicable
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GEOPlaceCollection *v8;
  GEOPlaceCollection *singlePlaceCollection;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideHomeResult](self, "guideHomeResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repeatableSections"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10025BA30;
  v11[3] = &unk_1011ADE88;
  v10 = v3;
  v12 = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  if (objc_msgSend(v10, "count") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collection"));

    if (v7)
    {
      v8 = (GEOPlaceCollection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collection"));
      singlePlaceCollection = self->_singlePlaceCollection;
      self->_singlePlaceCollection = v8;

    }
  }

}

- (id)guideHomeFilteredCollectionResults
{
  return -[GuidesHomeAPIController filteredCollections](self, "filteredCollections");
}

- (id)guideHomeFilteredCollectionResultsIds
{
  return -[GuidesHomeAPIController filteredCollectionsIds](self, "filteredCollectionsIds");
}

- (id)guideLocationName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideLocation](self, "guideLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideHomeViewResult](self, "guideHomeViewResult"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideLocation](self, "guideLocation"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guideLocationName:", v7));

  }
  return v5;
}

- (BOOL)isCuratedGuidesHome
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController guideHomeResult](self, "guideHomeResult"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "featuredGuidesSection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "featuredGuides"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = v5 != 0;

  return v6;
}

- (BOOL)isFilteredGuidesHome
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController filter](self, "filter"));
  v3 = v2 != 0;

  return v3;
}

- (id)guideHomeSingleCollectionIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController singlePlaceCollection](self, "singlePlaceCollection"));

  if (v3)
  {
    v4 = objc_alloc((Class)MKMapItemIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeAPIController singlePlaceCollection](self, "singlePlaceCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifier"));
    v7 = objc_msgSend(v4, "initWithGEOMapItemIdentifier:", v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (id)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (MKMapServiceGuideHomeViewTicket)ticket
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

- (GEOGuidesHomeResult)guideHomeResult
{
  return self->_guideHomeResult;
}

- (void)setGuideHomeResult:(id)a3
{
  objc_storeStrong((id *)&self->_guideHomeResult, a3);
}

- (NSArray)filteredCollections
{
  return self->_filteredCollections;
}

- (void)setFilteredCollections:(id)a3
{
  objc_storeStrong((id *)&self->_filteredCollections, a3);
}

- (NSArray)filteredCollectionsIds
{
  return self->_filteredCollectionsIds;
}

- (void)setFilteredCollectionsIds:(id)a3
{
  objc_storeStrong((id *)&self->_filteredCollectionsIds, a3);
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (GEOGuidesHomeResultFilterTypeConcept)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_storeStrong((id *)&self->_filter, a3);
}

- (GEOPlaceCollection)singlePlaceCollection
{
  return self->_singlePlaceCollection;
}

- (void)setSinglePlaceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_singlePlaceCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singlePlaceCollection, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_filteredCollectionsIds, 0);
  objc_storeStrong((id *)&self->_filteredCollections, 0);
  objc_storeStrong((id *)&self->_guideHomeResult, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
}

@end
