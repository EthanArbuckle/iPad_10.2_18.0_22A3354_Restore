@implementation RTMapServiceManager

- (void)fetchMapItemsRelatedPlacesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsRelatedPlacesFromLocation:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSXPCConnection *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSXPCConnection *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  SEL v24;

  v6 = a4;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__RTMapServiceManager__proxyForServicingSelector_withErrorHandler___block_invoke;
  v22[3] = &unk_1E9298100;
  v22[4] = self;
  v24 = a3;
  v7 = v6;
  v23 = v7;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232094](v22);
  v9 = self->_xpcConnection;
  v16 = v9;
  if (!v9)
  {
    v18 = CFSTR("no xpc connection");
    goto LABEL_5;
  }
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v9, "remoteObjectProxyWithErrorHandler:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = CFSTR("no remote object proxy");
LABEL_5:
    RTErrorConnectionCreate(a3, v18, v10, v11, v12, v13, v14, v15, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v19);

    v17 = 0;
  }

  return v17;
}

void __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsFromIdentifiers:options:source:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));

}

- (void)fetchMapItemsFromIdentifiers:(id)a3 options:(id)a4 source:(unint64_t)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  unint64_t v23;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke;
  v18[3] = &unk_1E9299A58;
  v18[4] = self;
  v19 = v11;
  v20 = v12;
  v21 = v13;
  v22 = a2;
  v23 = a5;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(v14, v18);

}

- (RTMapServiceManager)init
{
  RTMapServiceManager *v2;
  uint64_t v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)RTMapServiceManager;
  v2 = -[RTNotifier init](&v34, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.CoreRoutine.helperservice"));
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCBEE70);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_xpcConnection, "setRemoteObjectInterface:", v5);

    objc_initWeak(&location, v2);
    v31[1] = 3221225472;
    v31[2] = __27__RTMapServiceManager_init__block_invoke;
    v31[3] = &unk_1E92983E8;
    v31[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v32, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_xpcConnection, "setInvalidationHandler:", v31);
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsFromNaturalLanguageQuery_location_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsFromLocation_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsRelatedPlacesFromLocation_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsRelatedPlacesFromLocation_options_handler_, 1, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsFromIdentifiers_options_source_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsFromAddressString_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchMapItemsFromAddressDictionary_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchPostalAddressForMapItem_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchAppClipURLsForMapItem_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchCountryAndSubdivisionCodesFromLocation_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchBuildingPolygonsFromLocation_radius_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchPointOfInterestAttributesWithIdentifier_options_handler_, 0, 1);

    -[NSXPCConnection remoteObjectInterface](v2->_xpcConnection, "remoteObjectInterface");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_fetchPointOfInterestsAroundCoordinate_radius_options_handler_, 0, 1);

    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__RTMapServiceManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

void __67__RTMapServiceManager__proxyForServicingSelector_withErrorHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  RTErrorConnectionCreate(*(const char **)(a1 + 48), CFSTR("%@"), a3, a4, a5, a6, a7, a8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityMapService);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);

}

- (void)fetchMapItemFromHandle:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemFromHandle:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __62__RTMapServiceManager_fetchMapItemFromHandle_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchMapItemsFromNaturalLanguageQuery:(id)a3 location:(id)a4 options:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke;
  v20[3] = &unk_1E9298DE8;
  v24 = v14;
  v25 = a2;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v14;
  dispatch_async(v15, v20);

}

void __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsFromNaturalLanguageQuery:location:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __86__RTMapServiceManager_fetchMapItemsFromNaturalLanguageQuery_location_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchMapItemsFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsFromLocation:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __65__RTMapServiceManager_fetchMapItemsFromLocation_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __78__RTMapServiceManager_fetchMapItemsRelatedPlacesFromLocation_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

uint64_t __75__RTMapServiceManager_fetchMapItemsFromIdentifiers_options_source_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchMapItemsFromLocations:(id)a3 accessPoints:(id)a4 startDate:(id)a5 endDate:(id)a6 options:(id)a7 handler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  SEL v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[RTNotifier queue](self, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke;
  v28[3] = &unk_1E92A3068;
  v34 = v20;
  v35 = a2;
  v28[4] = self;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v20;
  dispatch_async(v21, v28);

}

void __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 88);
  v6 = *(id *)(a1 + 80);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsFromLocations:accessPoints:startDate:endDate:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

}

uint64_t __97__RTMapServiceManager_fetchMapItemsFromLocations_accessPoints_startDate_endDate_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchMapItemsFromAddressString:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsFromAddressString:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __70__RTMapServiceManager_fetchMapItemsFromAddressString_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchMapItemsFromAddressDictionary:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMapItemsFromAddressDictionary:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __74__RTMapServiceManager_fetchMapItemsFromAddressDictionary_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchPostalAddressForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPostalAddressForMapItem:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __68__RTMapServiceManager_fetchPostalAddressForMapItem_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchAppClipURLsForMapItem:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAppClipURLsForMapItem:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __66__RTMapServiceManager_fetchAppClipURLsForMapItem_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)createMapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  unint64_t v28;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  -[RTNotifier queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke;
  block[3] = &unk_1E92A1780;
  v26 = v16;
  v27 = a2;
  block[4] = self;
  v23 = v13;
  v28 = a5;
  v24 = v14;
  v25 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v16;
  dispatch_async(v17, block);

}

void __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __97__RTMapServiceManager_createMapItemWithIdentifier_geoMapItemStorage_source_creationDate_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (id)mapItemWithIdentifier:(id)a3 geoMapItemStorage:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  id v34;
  void *v36;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint8_t buf[16];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__125;
  v52 = __Block_byref_object_dispose__125;
  v53 = 0;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__125;
  v46 = __Block_byref_object_dispose__125;
  v47 = 0;
  v14 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __89__RTMapServiceManager_mapItemWithIdentifier_geoMapItemStorage_source_creationDate_error___block_invoke;
  v38[3] = &unk_1E9298D98;
  v40 = &v48;
  v41 = &v42;
  v15 = v14;
  v39 = v15;
  v36 = v11;
  -[RTMapServiceManager createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:](self, "createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:", v11, v12, a5, v13, v38);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v17);
  v21 = v20;
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_99);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v28 = (void *)MEMORY[0x1E0CB35C8];
  v54 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v54, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_retainAutorelease(v30);

    v32 = 0;
  }
  else
  {
LABEL_6:
    v31 = 0;
    v32 = 1;
  }

  v33 = v31;
  if ((v32 & 1) == 0)
    objc_storeStrong(v43 + 5, v31);
  if (a7)
    *a7 = objc_retainAutorelease(v43[5]);
  v34 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v34;
}

void __89__RTMapServiceManager_mapItemWithIdentifier_geoMapItemStorage_source_creationDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchMapItemWithIdentifier:(id)a3 geoMapItem:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  RTMapServiceManager *v24;
  id v25;
  id v26;
  id v27;
  SEL v28;
  unint64_t v29;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  -[RTNotifier queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke;
  block[3] = &unk_1E92A3090;
  v23 = v14;
  v24 = self;
  v27 = v16;
  v28 = a2;
  v29 = a5;
  v25 = v13;
  v26 = v15;
  v18 = v15;
  v19 = v13;
  v20 = v16;
  v21 = v14;
  dispatch_async(v17, block);

}

void __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0D271E8], "mapItemStorageForGEOMapItem:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke_2;
  v6[3] = &unk_1E9297568;
  v4 = *(_QWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v3, "_proxyForServicingSelector:withErrorHandler:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createMapItemWithIdentifier:geoMapItemStorage:source:creationDate:handler:", *(_QWORD *)(a1 + 48), v2, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __89__RTMapServiceManager_fetchMapItemWithIdentifier_geoMapItem_source_creationDate_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (id)mapItemWithIdentifier:(id)a3 geoMapItem:(id)a4 source:(unint64_t)a5 creationDate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  id v34;
  void *v36;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint8_t buf[16];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__125;
  v52 = __Block_byref_object_dispose__125;
  v53 = 0;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__125;
  v46 = __Block_byref_object_dispose__125;
  v47 = 0;
  v14 = dispatch_semaphore_create(0);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __82__RTMapServiceManager_mapItemWithIdentifier_geoMapItem_source_creationDate_error___block_invoke;
  v38[3] = &unk_1E9298D98;
  v40 = &v48;
  v41 = &v42;
  v15 = v14;
  v39 = v15;
  v36 = v11;
  -[RTMapServiceManager fetchMapItemWithIdentifier:geoMapItem:source:creationDate:handler:](self, "fetchMapItemWithIdentifier:geoMapItem:source:creationDate:handler:", v11, v12, a5, v13, v38);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v17);
  v21 = v20;
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_99);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v28 = (void *)MEMORY[0x1E0CB35C8];
  v54 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v54, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_retainAutorelease(v30);

    v32 = 0;
  }
  else
  {
LABEL_6:
    v31 = 0;
    v32 = 1;
  }

  v33 = v31;
  if ((v32 & 1) == 0)
    objc_storeStrong(v43 + 5, v31);
  if (a7)
    *a7 = objc_retainAutorelease(v43[5]);
  v34 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v34;
}

void __82__RTMapServiceManager_mapItemWithIdentifier_geoMapItem_source_creationDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchCountryAndSubdivisionCodesFromLocation:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke;
  block[3] = &unk_1E9299090;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCountryAndSubdivisionCodesFromLocation:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __83__RTMapServiceManager_fetchCountryAndSubdivisionCodesFromLocation_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchBuildingPolygonsFromLocation:(id)a3 radius:(double)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  SEL v17;
  double v18;

  v9 = a3;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke;
  block[3] = &unk_1E92971C8;
  v16 = v10;
  v17 = a2;
  block[4] = self;
  v15 = v9;
  v18 = a4;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

}

void __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchBuildingPolygonsFromLocation:radius:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));

}

uint64_t __72__RTMapServiceManager_fetchBuildingPolygonsFromLocation_radius_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchPointOfInterestAttributesWithIdentifier:(unint64_t)a3 options:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  SEL v17;
  unint64_t v18;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke;
  block[3] = &unk_1E92971C8;
  v16 = v10;
  v17 = a2;
  v18 = a3;
  block[4] = self;
  v15 = v9;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, block);

}

void __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPointOfInterestAttributesWithIdentifier:options:handler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __84__RTMapServiceManager_fetchPointOfInterestAttributesWithIdentifier_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)fetchPointOfInterestsAroundCoordinate:(id)a3 radius:(double)a4 options:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  double v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[RTNotifier queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke;
  v18[3] = &unk_1E9299A58;
  v21 = v13;
  v22 = a2;
  v18[4] = self;
  v19 = v11;
  v23 = a4;
  v20 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(v14, v18);

}

void __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke_2;
  v5[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPointOfInterestsAroundCoordinate:radius:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72));

}

uint64_t __84__RTMapServiceManager_fetchPointOfInterestsAroundCoordinate_radius_options_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
