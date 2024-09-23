@implementation RadioAddStationRequest

- (RadioAddStationRequest)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("-init is not supported, use -initWithStationDictionary:"));

  return 0;
}

- (RadioAddStationRequest)initWithStation:(id)a3
{
  id v4;
  void *v5;
  RadioAddStationRequest *v6;
  uint64_t v7;
  NSString *stationHashForSkipHistoryCopying;
  void *v9;
  _QWORD v11[4];
  id v12;
  RadioAddStationRequest *v13;

  v4 = a3;
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RadioAddStationRequest initWithStationDictionary:](self, "initWithStationDictionary:", v5);

  if (v6)
  {
    objc_msgSend(v4, "stationHash");
    v7 = objc_claimAutoreleasedReturnValue();
    stationHashForSkipHistoryCopying = v6->_stationHashForSkipHistoryCopying;
    v6->_stationHashForSkipHistoryCopying = (NSString *)v7;

    +[RadioModel sharedModel](RadioModel, "sharedModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__RadioAddStationRequest_initWithStation___block_invoke;
    v11[3] = &unk_24CA2E640;
    v12 = v4;
    v13 = v6;
    objc_msgSend(v9, "performWriteTransactionWithBlock:", v11);

  }
  return v6;
}

- (RadioAddStationRequest)initWithStationDictionary:(id)a3
{
  id v4;
  RadioAddStationRequest *v5;
  uint64_t v6;
  NSMutableDictionary *stationDictionary;
  NSMutableDictionary *v8;
  void *v9;
  RadioAddStationRequest *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)RadioAddStationRequest;
    v5 = -[RadioSyncRequest init](&v12, sel_init);
    if (v5)
    {
      v5->_persistentID = arc4random();
      v6 = objc_msgSend(v4, "mutableCopy");
      stationDictionary = v5->_stationDictionary;
      v5->_stationDictionary = (NSMutableDictionary *)v6;

      v8 = v5->_stationDictionary;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llx"), v5->_persistentID);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, CFSTR("persistent-id"));

    }
    self = v5;
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("stationDictionary must be non-nil"));
    v10 = 0;
  }

  return v10;
}

- (RadioAddStationRequest)initWithLibraryTrackDictionary:(id)a3 useArtist:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RadioAddStationRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *matchDictionary;
  RadioAddStationRequest *v12;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v4 = a4;
  v16[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)RadioAddStationRequest;
    v7 = -[RadioSyncRequest init](&v14, sel_init);
    if (v7)
    {
      v7->_persistentID = arc4random();
      v16[0] = v6;
      v15[0] = CFSTR("library-track");
      v15[1] = CFSTR("use-artist");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v8;
      v15[2] = CFSTR("persistent-id");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llx"), v7->_persistentID);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
      v10 = objc_claimAutoreleasedReturnValue();
      matchDictionary = v7->_matchDictionary;
      v7->_matchDictionary = (NSDictionary *)v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("libraryTrackDictionary must be non-nil"));
    v12 = 0;
  }

  return v12;
}

- (RadioAddStationRequest)initWithRadioTrackDictionary:(id)a3 useArtist:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  RadioAddStationRequest *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *matchDictionary;
  RadioAddStationRequest *v12;
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v4 = a4;
  v16[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)RadioAddStationRequest;
    v7 = -[RadioSyncRequest init](&v14, sel_init);
    if (v7)
    {
      v7->_persistentID = arc4random();
      v16[0] = v6;
      v15[0] = CFSTR("radio-track");
      v15[1] = CFSTR("use-artist");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v8;
      v15[2] = CFSTR("persistent-id");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llx"), v7->_persistentID);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
      v10 = objc_claimAutoreleasedReturnValue();
      matchDictionary = v7->_matchDictionary;
      v7->_matchDictionary = (NSDictionary *)v10;

    }
    self = v7;
    v12 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("radioTrackDictionary must be non-nil"));
    v12 = 0;
  }

  return v12;
}

- (RadioAddStationRequest)initWithQueryTerm:(id)a3 queryID:(int64_t)a4
{
  id v7;
  RadioAddStationRequest *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *matchDictionary;
  void *v14;
  objc_super v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RadioAddStationRequest.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryTerm"));

  }
  v15.receiver = self;
  v15.super_class = (Class)RadioAddStationRequest;
  v8 = -[RadioSyncRequest init](&v15, sel_init);
  if (v8)
  {
    v8->_persistentID = arc4random();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("id"));

    }
    if (v7)
      objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("term"));
    v16 = CFSTR("query");
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    matchDictionary = v8->_matchDictionary;
    v8->_matchDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (id)changeList
{
  void *v3;
  NSMutableDictionary *stationDictionary;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->_matchDictionary)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCE70];
  stationDictionary = self->_stationDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", stationDictionary, CFSTR("station-dict"), v5, CFSTR("change-type"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)matchDictionary
{
  return self->_matchDictionary;
}

- (void)startWithCompletionHandler:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("-startWithCompletionHandler: is not supported, use -startWithAddStationCompletionHandler:"));
}

- (void)startWithAddStationCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke;
  v14[3] = &unk_24CA2EB28;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v7, "performWriteTransactionWithBlock:", v14);
  v11[1] = 3221225472;
  v11[2] = __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_2;
  v11[3] = &unk_24CA2E560;
  v11[4] = self;
  v12 = v7;
  v13 = v4;
  v10.receiver = self;
  v10.super_class = (Class)RadioAddStationRequest;
  v11[0] = v6;
  v8 = v4;
  v9 = v7;
  -[RadioSyncRequest startWithCompletionHandler:](&v10, sel_startWithCompletionHandler_, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationHashForSkipHistoryCopying, 0);
  objc_storeStrong((id *)&self->_stationDictionary, 0);
  objc_storeStrong((id *)&self->_matchDictionary, 0);
}

uint64_t __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setGlobalVersion:", objc_msgSend(*(id *)(a1 + 32), "globalVersion") + 1);
}

void __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_INFO, "[RadioAddStationRequest] Add station response: %@", buf, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "status") != 1)
  {
    v17 = *(void **)(a1 + 40);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_45;
    v23[3] = &unk_24CA2E538;
    v24 = v17;
    v25 = a2;
    objc_msgSend(v24, "performWriteTransactionWithBlock:", v23);
    v9 = 0;
    v18 = v24;
LABEL_25:

    goto LABEL_26;
  }
  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stationWithPersistentID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128)
    && (!v9 || (objc_msgSend(v9, "isFeatured") & 1) != 0 || objc_msgSend(v9, "isSponsored")))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    +[RadioModel sharedModel](RadioModel, "sharedModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userStations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (!objc_msgSend(v16, "persistentID")
            && (objc_msgSend(v16, "isFeatured") & 1) == 0
            && (objc_msgSend(v16, "isSponsored") & 1) == 0)
          {
            v19 = v16;

            v9 = v19;
            goto LABEL_21;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_21:

  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152))
  {
    v20 = objc_msgSend(v9, "stationID");
    if (v20)
    {
      v21 = v20;
      +[RadioModel sharedModel](RadioModel, "sharedModel");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "copySkipHistoryFromStationHash:toStationID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), v21);
      goto LABEL_25;
    }
  }
LABEL_26:
  v22 = *(_QWORD *)(a1 + 48);
  if (v22)
    (*(void (**)(uint64_t, void *, uint64_t, id))(v22 + 16))(v22, v9, a2, v5);

}

uint64_t __63__RadioAddStationRequest_startWithAddStationCompletionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "globalVersion");
  if (result == *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setGlobalVersion:", result - 1);
  return result;
}

uint64_t __42__RadioAddStationRequest_initWithStation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPersistentID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136));
}

@end
