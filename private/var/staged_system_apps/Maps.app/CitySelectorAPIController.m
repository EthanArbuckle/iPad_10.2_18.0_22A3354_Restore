@implementation CitySelectorAPIController

- (CitySelectorAPIController)initWithStateChangeHandler:(id)a3 usingTraits:(id)a4
{
  id v6;
  id v7;
  CitySelectorAPIController *v8;
  id v9;
  id stateHandler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CitySelectorAPIController;
  v8 = -[CitySelectorAPIController init](&v12, "init");
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

- (id)citySelectorSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController sections](self, "sections"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)titleForSection:(id)a3
{
  return objc_msgSend(a3, "sectionTitle");
}

- (BOOL)isWorldwideSection:(id)a3
{
  return _objc_msgSend(a3, "isWorldwideSection");
}

- (id)guideLocationsFromLastBatch
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController guideLocations](self, "guideLocations"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (unsigned)batchSize
{
  return 10;
}

- (void)fetchCitySelectorView:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  uint8_t buf[8];
  id location;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController stateHandler](self, "stateHandler"));
  v5[2](v5, -[CitySelectorAPIController state](self, "state"), 1);

  -[CitySelectorAPIController setState:](self, "setState:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController traits](self, "traits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ticketForCitySelectorViewWithTraits:batchSize:", v7, -[CitySelectorAPIController batchSize](self, "batchSize")));
  -[CitySelectorAPIController setTicket:](self, "setTicket:", v8);

  objc_initWeak(&location, self);
  v9 = sub_10033DE74();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (char *)os_signpost_id_generate(v10);

  v12 = sub_10033DE74();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v11, "FetchingCitySelectorView", ", buf, 2u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController ticket](self, "ticket"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10033DEB4;
  v17[3] = &unk_1011B23A0;
  v19[1] = v11;
  objc_copyWeak(v19, &location);
  v16 = v4;
  v18 = v16;
  objc_msgSend(v15, "submitWithHandler:networkActivity:", v17, &stru_1011B23C0);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

}

- (void)cancelFetchingCitySelectorView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController ticket](self, "ticket"));
  objc_msgSend(v2, "cancel");

}

- (void)fetchGuidesWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27[2];
  uint8_t buf[8];
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = MKMapItemIdentifiersArrayToGEOMapItemIdentifiersArray(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  objc_initWeak(&location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10033E384;
  v29[3] = &unk_1011B2410;
  objc_copyWeak(&v31, &location);
  v11 = v10;
  v30 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v29);
  v12 = objc_msgSend(v6, "count");
  if (v12 == objc_msgSend(v11, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController traits](self, "traits"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ticketForGuideLocationLookupWithIds:identifiers:traits:", v11, v9, v14));
    -[CitySelectorAPIController setBatchTicket:](self, "setBatchTicket:", v15);

    v16 = sub_10033DE74();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = (char *)os_signpost_id_generate(v17);

    v19 = sub_10033DE74();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "FetchingCitySelectorViewBatch", ", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorAPIController batchTicket](self, "batchTicket"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10033E4C8;
    v25[3] = &unk_1011ADD38;
    objc_copyWeak(v27, &location);
    v26 = v7;
    v27[1] = v18;
    objc_msgSend(v22, "submitWithHandler:networkActivity:", v25, 0);

    objc_destroyWeak(v27);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
    v23 = sub_1004316CC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error fetching a batch for city selector.", buf, 2u);
    }

  }
  objc_destroyWeak(&v31);
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

- (MKMapServiceCitySelectorViewTicket)ticket
{
  return self->_ticket;
}

- (void)setTicket:(id)a3
{
  objc_storeStrong((id *)&self->_ticket, a3);
}

- (GEOMapServiceGuideLocationsLookupTicket)batchTicket
{
  return self->_batchTicket;
}

- (void)setBatchTicket:(id)a3
{
  objc_storeStrong((id *)&self->_batchTicket, a3);
}

- (GEOAllGuidesLocationsViewResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)guideLocations
{
  return self->_guideLocations;
}

- (void)setGuideLocations:(id)a3
{
  objc_storeStrong((id *)&self->_guideLocations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocations, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_batchTicket, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
