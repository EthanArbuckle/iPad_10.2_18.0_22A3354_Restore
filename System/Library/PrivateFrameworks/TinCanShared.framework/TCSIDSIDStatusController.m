@implementation TCSIDSIDStatusController

- (TCSIDSIDStatusController)initWithItem:(id)a3 delegate:(id)a4 timeout:(double)a5
{
  id v9;
  id v10;
  TCSIDSIDStatusController *v11;
  TCSIDSIDStatusController *v12;
  uint64_t v13;
  NSMutableDictionary *destinationToStatus;
  uint64_t v15;
  NSArray *destinations;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TCSIDSIDStatusController;
  v11 = -[TCSIDSIDStatusController init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_item, a3);
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    destinationToStatus = v12->_destinationToStatus;
    v12->_destinationToStatus = (NSMutableDictionary *)v13;

    objc_msgSend(v9, "idsCanonicalDestinations");
    v15 = objc_claimAutoreleasedReturnValue();
    destinations = v12->_destinations;
    v12->_destinations = (NSArray *)v15;

    v12->_timeout = a5;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = v12->_destinations;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_destinationToStatus, "setObject:forKeyedSubscript:", &unk_24CFC7C60, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++), (_QWORD)v23);
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v19);
    }

  }
  return v12;
}

- (void)execute
{
  void *v3;
  NSArray *destinations;
  NSObject *v5;
  void *v6;
  void *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *timer;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  IDSBatchIDQueryController *v14;
  IDSBatchIDQueryController *queryController;
  _QWORD handler[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  _TCSInitializeLogging();
  v3 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    destinations = self->_destinations;
    v5 = v3;
    -[NSArray componentsJoinedByString:](destinations, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TCSLogSafeDescription(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_21342E000, v5, OS_LOG_TYPE_DEFAULT, "IDS status query initiated for destinations: %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  timer = self->_timer;
  self->_timer = v8;

  v10 = self->_timer;
  v11 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v12 = self->_timer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __35__TCSIDSIDStatusController_execute__block_invoke;
  handler[3] = &unk_24CFC2448;
  objc_copyWeak(&v17, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_timer);
  v13 = objc_alloc(MEMORY[0x24BE4FBF0]);
  v14 = (IDSBatchIDQueryController *)objc_msgSend(v13, "initWithService:delegate:queue:", CFSTR("com.apple.private.alloy.tincan.audio"), self, MEMORY[0x24BDAC9B8]);
  queryController = self->_queryController;
  self->_queryController = v14;

  -[IDSBatchIDQueryController setDestinations:](self->_queryController, "setDestinations:", self->_destinations);
  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __35__TCSIDSIDStatusController_execute__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_statusQueryTimedOut");

}

- (void)dealloc
{
  NSObject *timer;
  objc_super v4;

  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);
  -[IDSBatchIDQueryController invalidate](self->_queryController, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)TCSIDSIDStatusController;
  -[TCSIDSIDStatusController dealloc](&v4, sel_dealloc);
}

- (void)_statusQueryTimedOut
{
  OUTLINED_FUNCTION_1_2(&dword_21342E000, a1, a3, "IDS status query timed out without a definitive answer.", a5, a6, a7, a8, 0);
}

- (NSNumber)status
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[TCSIDSIDStatusController destinationToStatus](self, "destinationToStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
  {

    return (NSNumber *)&unk_24CFC7CA8;
  }
  v5 = v4;
  v6 = 0;
  v14 = 0;
  v15 = 0;
  v7 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
      -[TCSIDSIDStatusController destinationToStatus](self, "destinationToStatus", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "integerValue");

      switch(v12)
      {
        case 17486201:
          ++v15;
          break;
        case 1:
          ++v6;
          break;
        case 0:
          ++v14;
          break;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v5);

  if (v6)
    return (NSNumber *)&unk_24CFC7C78;
  if (v15)
    return (NSNumber *)&unk_24CFC7C60;
  if (!v14)
    return (NSNumber *)&unk_24CFC7CA8;
  return (NSNumber *)&unk_24CFC7C90;
}

- (NSString)tinCanHandle
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[TCSIDSIDStatusController status](self, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 == 1)
  {
    -[TCSIDSIDStatusController destinationToStatus](self, "destinationToStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__TCSIDSIDStatusController_tinCanHandle__block_invoke;
    v8[3] = &unk_24CFC2B98;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

void __40__TCSIDSIDStatusController_tinCanHandle__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "integerValue") == 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *timer;
  OS_dispatch_source *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "count"))
  {
    if ((objc_msgSend(CFSTR("com.apple.private.alloy.tincan.audio"), "isEqualToString:", v10) & 1) != 0)
    {
      _TCSInitializeLogging();
      v12 = TCSLogDefault;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
          -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:].cold.2((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          v34 = v12;
          objc_msgSend((id)objc_opt_class(), "stringForDestinationToStatus:", v9);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          TCSLogSafeDescription(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v36;
          _os_log_impl(&dword_21342E000, v34, OS_LOG_TYPE_DEFAULT, "IDS status query returned status update: %@", buf, 0xCu);

        }
        -[TCSIDSIDStatusController status](self, "status");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v37 = v9;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v53 != v40)
                objc_enumerationMutation(v37);
              v42 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
              -[TCSIDSIDStatusController destinationToStatus](self, "destinationToStatus", v51);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectForKeyedSubscript:", v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                objc_msgSend(v37, "objectForKeyedSubscript:", v42);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[TCSIDSIDStatusController destinationToStatus](self, "destinationToStatus");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, v42);

              }
            }
            v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          }
          while (v39);
        }

        -[TCSIDSIDStatusController status](self, "status");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51 != v47 && (objc_msgSend(v51, "isEqualToNumber:", v47) & 1) == 0)
        {
          -[TCSIDSIDStatusController delegate](self, "delegate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "tinCanIDSIDStatusControllerStatusDidChange:", self);

        }
        timer = self->_timer;
        v11 = 0;
        if (timer)
        {
          dispatch_source_cancel(timer);
          v50 = self->_timer;
          self->_timer = 0;

        }
      }
    }
    else
    {
      _TCSInitializeLogging();
      v27 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
        -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:].cold.3((uint64_t)v10, v27, v28, v29, v30, v31, v32, v33);
    }
  }
  else
  {
    _TCSInitializeLogging();
    v19 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSIDSIDStatusController batchQueryController:updatedDestinationsStatus:onService:error:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
  }

}

+ (id)stringForDestinationToStatus:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__TCSIDSIDStatusController_stringForDestinationToStatus___block_invoke;
  v9[3] = &unk_24CFC2BC0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __57__TCSIDSIDStatusController_stringForDestinationToStatus___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)IDSCopyRawAddressForDestination();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = CFSTR("valid");
  v7 = CFSTR("unknown");
  if (v5 == 2)
    v7 = CFSTR("invalid");
  if (v5 == 17486201)
    v8 = CFSTR("loading");
  else
    v8 = v7;
  if (v5 != 1)
    v6 = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ = %@"), v10, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

- (TUIDSLookup)item
{
  return self->_item;
}

- (TCSIDSIDStatusControllerDelegate)delegate
{
  return (TCSIDSIDStatusControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (IDSBatchIDQueryController)queryController
{
  return self->_queryController;
}

- (void)setQueryController:(id)a3
{
  objc_storeStrong((id *)&self->_queryController, a3);
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (NSMutableDictionary)destinationToStatus
{
  return self->_destinationToStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationToStatus, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)batchQueryController:(uint64_t)a3 updatedDestinationsStatus:(uint64_t)a4 onService:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21342E000, a1, a3, "IDS status query returned an empty status update!", a5, a6, a7, a8, 0);
}

@end
