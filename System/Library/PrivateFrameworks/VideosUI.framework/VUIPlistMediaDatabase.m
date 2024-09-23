@implementation VUIPlistMediaDatabase

- (VUIPlistMediaDatabase)initWithURL:(id)a3
{
  id v4;
  VUIPlistMediaDatabase *v5;
  uint64_t v6;
  NSURL *fileURL;

  v4 = a3;
  v5 = -[VUIPlistMediaDatabase init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    -[VUIPlistMediaDatabase _parseDatabase](v5, "_parseDatabase");
    -[VUIPlistMediaDatabase _startMonitoringDatabaseFile](v5, "_startMonitoringDatabaseFile");
  }

  return v5;
}

- (VUIPlistMediaDatabase)init
{
  VUIPlistMediaDatabase *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *homeVideoByIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *movieByIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *movieRentalByIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *showByIdentifier;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialDispatchQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUIPlistMediaDatabase;
  v2 = -[VUIPlistMediaDatabase init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    homeVideoByIdentifier = v2->_homeVideoByIdentifier;
    v2->_homeVideoByIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    movieByIdentifier = v2->_movieByIdentifier;
    v2->_movieByIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    movieRentalByIdentifier = v2->_movieRentalByIdentifier;
    v2->_movieRentalByIdentifier = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    showByIdentifier = v2->_showByIdentifier;
    v2->_showByIdentifier = v9;

    v11 = dispatch_queue_create("com.apple.videosui.VUIPlistMediaDatabase.serialDispatchQueue", 0);
    serialDispatchQueue = v2->_serialDispatchQueue;
    v2->_serialDispatchQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *databaseFileDispatchSource;
  objc_super v4;

  databaseFileDispatchSource = self->_databaseFileDispatchSource;
  if (databaseFileDispatchSource)
    dispatch_source_cancel(databaseFileDispatchSource);
  v4.receiver = self;
  v4.super_class = (Class)VUIPlistMediaDatabase;
  -[VUIPlistMediaDatabase dealloc](&v4, sel_dealloc);
}

- (NSArray)movies
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__VUIPlistMediaDatabase_movies__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)objc_opt_class(), "_sortedEntitiesArray:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __31__VUIPlistMediaDatabase_movies__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "movieByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSArray)movieRentals
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__VUIPlistMediaDatabase_movieRentals__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)objc_opt_class(), "_sortedEntitiesArray:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __37__VUIPlistMediaDatabase_movieRentals__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "movieRentalByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSArray)homeVideos
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__VUIPlistMediaDatabase_homeVideos__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)objc_opt_class(), "_sortedEntitiesArray:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __35__VUIPlistMediaDatabase_homeVideos__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "homeVideoByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSArray)shows
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__VUIPlistMediaDatabase_shows__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)objc_opt_class(), "_sortedEntitiesArray:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __30__VUIPlistMediaDatabase_shows__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "showByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSArray)seasons
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__VUIPlistMediaDatabase_seasons__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __32__VUIPlistMediaDatabase_seasons__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_seasons");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)episodes
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__VUIPlistMediaDatabase_episodes__block_invoke;
  v6[3] = &unk_1E9F99348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)objc_opt_class(), "_sortedEntitiesArray:", v8[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __33__VUIPlistMediaDatabase_episodes__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_seasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "episodes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)addEntity:(id)a3 showIdentifier:(id)a4 seasonIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  VUIPlistMediaDatabase *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (!v12)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("An entity must have an identifier to be added to the library"));
  v13 = (void *)objc_msgSend(v8, "copy");
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VUIPlistMediaDatabase_addEntity_showIdentifier_seasonIdentifier___block_invoke;
  block[3] = &unk_1E9F99DB0;
  v15 = v13;
  v22 = v15;
  v23 = self;
  v16 = v9;
  v24 = v16;
  v17 = v10;
  v25 = v17;
  dispatch_sync((dispatch_queue_t)v14, block);

  v20 = 0;
  LOBYTE(v14) = -[VUIPlistMediaDatabase _saveWithError:](self, "_saveWithError:", &v20);
  v18 = v20;
  if ((v14 & 1) == 0)
  {
    VUIDefaultLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[VUIPlistMediaDatabase addEntity:showIdentifier:seasonIdentifier:].cold.1();

  }
}

uint64_t __67__VUIPlistMediaDatabase_addEntity_showIdentifier_seasonIdentifier___block_invoke(id *a1)
{
  uint64_t result;

  result = objc_msgSend(a1[4], "type");
  switch(result)
  {
    case 0:
      result = objc_msgSend(a1[5], "_addMovie:", a1[4]);
      break;
    case 1:
      result = objc_msgSend(a1[5], "_addMovieRental:", a1[4]);
      break;
    case 2:
      if (!objc_msgSend(a1[6], "length"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A show identifier must be provided to add an episode to the library"));
      if (!objc_msgSend(a1[7], "length"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A season identifier must be provided to add an episode to the library"));
      result = objc_msgSend(a1[5], "_addEpisode:showIdentifier:seasonIdentifier:", a1[4], a1[6], a1[7]);
      break;
    case 3:
      result = objc_msgSend(a1[5], "_addHomeVideo:", a1[4]);
      break;
    case 4:
      result = objc_msgSend(a1[5], "_addShow:", a1[4]);
      break;
    case 5:
      if (!objc_msgSend(a1[6], "length"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("A show identifier must be provided to add a season to the library"));
      result = objc_msgSend(a1[5], "_addSeason:showIdentifier:", a1[4], a1[6]);
      break;
    default:
      return result;
  }
  return result;
}

- (void)removeEntityWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;

  v4 = a3;
  -[VUIPlistMediaDatabase removeDownloadedMediaForIdentifier:](self, "removeDownloadedMediaForIdentifier:", v4);
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VUIPlistMediaDatabase_removeEntityWithIdentifier___block_invoke;
  block[3] = &unk_1E9F98FD8;
  block[4] = self;
  v6 = v4;
  v11 = v6;
  dispatch_sync((dispatch_queue_t)v5, block);

  v9 = 0;
  LOBYTE(v5) = -[VUIPlistMediaDatabase _saveWithError:](self, "_saveWithError:", &v9);
  v7 = v9;
  if ((v5 & 1) == 0)
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VUIPlistMediaDatabase addEntity:showIdentifier:seasonIdentifier:].cold.1();

  }
}

uint64_t __52__VUIPlistMediaDatabase_removeEntityWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeEntityWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)updateEntity:(id)a3 propertyName:(id)a4 propertyValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VUIPlistMediaDatabase_updateEntity_propertyName_propertyValue___block_invoke;
    block[3] = &unk_1E9F99840;
    v12 = v8;
    v23 = v12;
    v13 = v10;
    v24 = v13;
    v14 = v9;
    v25 = v14;
    dispatch_sync(v11, block);

    if (v14)
    {
      v15 = v13;
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v26[0] = VUIPlistMediaEntityPropertyDidChangePropertyNameKey;
      v26[1] = VUIPlistMediaEntityPropertyDidChangePropertyValueKey;
      v27[0] = v14;
      v27[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "postNotificationName:object:userInfo:", VUIPlistMediaEntityPropertyDidChange, v12, v16);

    }
    v21 = 0;
    v18 = -[VUIPlistMediaDatabase _saveWithError:](self, "_saveWithError:", &v21);
    v19 = v21;
    if (!v18)
    {
      VUIDefaultLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[VUIPlistMediaDatabase addEntity:showIdentifier:seasonIdentifier:].cold.1();

    }
  }

}

uint64_t __65__VUIPlistMediaDatabase_updateEntity_propertyName_propertyValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)updateEntityWithIdentifier:(id)a3 propertyName:(id)a4 propertyValue:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[VUIPlistMediaDatabase entityForIdentifier:](self, "entityForIdentifier:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIPlistMediaDatabase updateEntity:propertyName:propertyValue:](self, "updateEntity:propertyName:propertyValue:", v10, v9, v8);

}

- (id)entityForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke;
  block[3] = &unk_1E9F99E00;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  objc_msgSend(*(id *)(a1 + 32), "movieByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "movieRentalByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "homeVideoByIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *(_QWORD *)(a1 + 40));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "showByIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", *(_QWORD *)(a1 + 40));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          objc_msgSend(*(id *)(a1 + 32), "showByIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke_2;
          v21[3] = &unk_1E9F99DD8;
          v19 = *(id *)(a1 + 40);
          v20 = *(_QWORD *)(a1 + 48);
          v22 = v19;
          v23 = v20;
          objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v21);

        }
      }
    }
  }
}

void __45__VUIPlistMediaDatabase_entityForIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id obj;

  objc_msgSend(a3, "seasonForIdentifier:", *(_QWORD *)(a1 + 32));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (obj)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    v6 = obj;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(0, "episodeForIdentifier:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
      *a4 = 1;
    }

    v6 = 0;
  }

}

- (void)removeDownloadedMediaForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VUIPlistMediaDatabase itemForIdentifier:](self, "itemForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "filePathURL");
    v7 = objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Deleting downloaded video at %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v11 = objc_msgSend(v10, "removeItemAtURL:error:", v7, &v15);
      v8 = v15;

      if ((v11 & 1) == 0)
      {
        VUIDefaultLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[VUIPlistMediaDatabase removeDownloadedMediaForIdentifier:].cold.2();

      }
      VUIDefaultLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Removing local file path from database", buf, 2u);
      }

      -[VUIPlistMediaDatabase updateEntity:propertyName:propertyValue:](self, "updateEntity:propertyName:propertyValue:", v6, CFSTR("filePathURL"), 0);
    }
    else if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "No file path exists for database item; not deleting downloaded video",
        buf,
        2u);
    }

    VUIDefaultLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Removing offline FPS keys from database and setting state to NotDownloaded", buf, 2u);
    }

    -[VUIPlistMediaDatabase updateEntity:propertyName:propertyValue:](self, "updateEntity:propertyName:propertyValue:", v6, CFSTR("offlineFPSKeys"), 0);
    -[VUIPlistMediaDatabase updateEntity:propertyName:propertyValue:](self, "updateEntity:propertyName:propertyValue:", v6, CFSTR("downloadState"), VUIPlistDatabaseItemDownloadStateNotDownloaded);
  }
  else
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VUIPlistMediaDatabase removeDownloadedMediaForIdentifier:].cold.1();
  }

}

- (id)itemForIdentifier:(id)a3
{
  void *v3;
  id v4;

  -[VUIPlistMediaDatabase entityForIdentifier:](self, "entityForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)_saveWithError:(id *)a3
{
  void *v5;

  -[VUIPlistMediaDatabase fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[VUIPlistMediaDatabase saveToFileURL:error:](self, "saveToFileURL:error:", v5, a3);

  return (char)a3;
}

- (BOOL)saveToFileURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__VUIPlistMediaDatabase_saveToFileURL_error___block_invoke;
  v11[3] = &unk_1E9F99E28;
  v11[4] = self;
  v13 = &v15;
  v8 = v6;
  v12 = v8;
  v14 = &v21;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __45__VUIPlistMediaDatabase_saveToFileURL_error___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  obj = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 100, 0, &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v5, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(id *)(v7 + 40);
    v8 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v9);
    objc_storeStrong((id *)(v7 + 40), v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "writeToURL:atomically:", *(_QWORD *)(a1 + 40), 1);

  }
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[VUIPlistMediaDatabase homeVideoByIdentifier](self, "homeVideoByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIPlistMediaDatabase movieByIdentifier](self, "movieByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VUIPlistMediaDatabase movieRentalByIdentifier](self, "movieRentalByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlistMediaDatabase *v4;
  VUIPlistMediaDatabase *v5;
  VUIPlistMediaDatabase *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  id v24;

  v4 = (VUIPlistMediaDatabase *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUIPlistMediaDatabase homeVideoByIdentifier](self, "homeVideoByIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabase homeVideoByIdentifier](v6, "homeVideoByIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
            goto LABEL_29;
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_22;
        }
        -[VUIPlistMediaDatabase movieByIdentifier](self, "movieByIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabase movieByIdentifier](v6, "movieByIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

        }
        else
        {
          v11 = v16;
          v12 = 0;
          if (!v9 || !v16)
            goto LABEL_29;
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_22;
        }
        -[VUIPlistMediaDatabase movieRentalByIdentifier](self, "movieRentalByIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabase movieRentalByIdentifier](v6, "movieRentalByIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        v20 = v19;
        if (v9 == v20)
        {

LABEL_24:
          -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIPlistMediaDatabase showByIdentifier](v6, "showByIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v22;
          v24 = v23;
          v11 = v24;
          if (v9 == v24)
          {
            v12 = 1;
          }
          else
          {
            v12 = 0;
            if (v9 && v24)
              v12 = objc_msgSend(v9, "isEqual:", v24);
          }
          goto LABEL_29;
        }
        v11 = v20;
        v12 = 0;
        if (v9 && v20)
        {
          v21 = objc_msgSend(v9, "isEqual:", v20);

          if ((v21 & 1) == 0)
          {
LABEL_22:
            v12 = 0;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_24;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v12 = 0;
  }
LABEL_31:

  return v12;
}

- (BOOL)_parseDatabase
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  char isKindOfClass;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  VUIPlistMediaDatabaseItem *v13;
  NSMutableDictionary *movieByIdentifier;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  VUIPlistMediaDatabaseItem *v21;
  NSMutableDictionary *movieRentalByIdentifier;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  VUIPlistMediaDatabaseItem *v29;
  NSMutableDictionary *homeVideoByIdentifier;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t m;
  VUIPlistMediaDatabaseShow *v37;
  NSMutableDictionary *showByIdentifier;
  void *v39;
  NSObject *v40;
  void *v42;
  void *v43;
  char v44;
  NSObject *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_movieByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_movieRentalByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_homeVideoByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_showByIdentifier, "removeAllObjects");
  -[VUIPlistMediaDatabase fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, &v66);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v66;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v45 = v6;
      v46 = v4;
      v47 = v3;
      v43 = v5;
      v8 = v5;
      -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("Movies"));
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v63 != v11)
              objc_enumerationMutation(obj);
            v13 = -[VUIPlistMediaDatabaseItem initWithDictionary:]([VUIPlistMediaDatabaseItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
            movieByIdentifier = self->_movieByIdentifier;
            -[VUIPlistMediaDatabaseEntity identifier](v13, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary vui_setObjectIfNotNil:forKey:](movieByIdentifier, "vui_setObjectIfNotNil:forKey:", v13, v15);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v10);
      }
      v44 = isKindOfClass;
      -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("MovieRentals"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v59 != v19)
              objc_enumerationMutation(v16);
            v21 = -[VUIPlistMediaDatabaseItem initWithDictionary:]([VUIPlistMediaDatabaseItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
            movieRentalByIdentifier = self->_movieRentalByIdentifier;
            -[VUIPlistMediaDatabaseEntity identifier](v21, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary vui_setObjectIfNotNil:forKey:](movieRentalByIdentifier, "vui_setObjectIfNotNil:forKey:", v21, v23);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        }
        while (v18);
      }
      v48 = v8;
      -[NSObject objectForKey:](v8, "objectForKey:", CFSTR("HomeVideos"), v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v55;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v55 != v27)
              objc_enumerationMutation(v24);
            v29 = -[VUIPlistMediaDatabaseItem initWithDictionary:]([VUIPlistMediaDatabaseItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k));
            homeVideoByIdentifier = self->_homeVideoByIdentifier;
            -[VUIPlistMediaDatabaseEntity identifier](v29, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary vui_setObjectIfNotNil:forKey:](homeVideoByIdentifier, "vui_setObjectIfNotNil:forKey:", v29, v31);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        }
        while (v26);
      }
      -[NSObject objectForKey:](v48, "objectForKey:", CFSTR("Shows"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v51;
        do
        {
          for (m = 0; m != v34; ++m)
          {
            if (*(_QWORD *)v51 != v35)
              objc_enumerationMutation(v32);
            v37 = -[VUIPlistMediaDatabaseShow initWithDictionary:]([VUIPlistMediaDatabaseShow alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * m));
            showByIdentifier = self->_showByIdentifier;
            -[VUIPlistMediaDatabaseEntity identifier](v37, "identifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary vui_setObjectIfNotNil:forKey:](showByIdentifier, "vui_setObjectIfNotNil:forKey:", v37, v39);

          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
        }
        while (v34);
      }

      v4 = v46;
      v3 = v47;
      v6 = v45;
      isKindOfClass = v44;
      v5 = v43;
      v40 = v48;
    }
    else
    {
      VUIDefaultLogObject();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[VUIPlistMediaDatabase _parseDatabase].cold.2();
    }

  }
  else
  {
    VUIDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[VUIPlistMediaDatabase _parseDatabase].cold.1();
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_parseDatabaseAndSendNotification
{
  id v3;

  -[VUIPlistMediaDatabase _parseDatabase](self, "_parseDatabase");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("VUIPlistMediaDatabaseContentsDidChangeNotification"), self);

}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIPlistMediaDatabase movieByIdentifier](self, "movieByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke;
  v31[3] = &unk_1E9F99E50;
  v31[4] = &v32;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v31);

  objc_msgSend(v3, "setObject:forKey:", v33[5], CFSTR("Movies"));
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIPlistMediaDatabase movieRentalByIdentifier](self, "movieRentalByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_2;
  v24[3] = &unk_1E9F99E50;
  v24[4] = &v25;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v24);

  objc_msgSend(v3, "setObject:forKey:", v26[5], CFSTR("MovieRentals"));
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIPlistMediaDatabase homeVideoByIdentifier](self, "homeVideoByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_3;
  v17[3] = &unk_1E9F99E50;
  v17[4] = &v18;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v17);

  objc_msgSend(v3, "setObject:forKey:", v19[5], CFSTR("HomeVideos"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_4;
  v10[3] = &unk_1E9F99E78;
  v10[4] = &v11;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(v3, "setObject:forKey:", v12[5], CFSTR("Shows"));
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v32, 8);
  return v3;
}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

void __50__VUIPlistMediaDatabase__dictionaryRepresentation__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v4);

}

- (id)_seasons
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "seasons", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend((id)objc_opt_class(), "_sortedEntitiesArray:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_addShow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v4;
  objc_msgSend(v4, "seasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:", v11);

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "episodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:", v17);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v14);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
  }

  -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v20, v19);

}

- (void)_addSeason:(id)a3 showIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:", v10);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v6, "episodes", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

      objc_msgSend(v9, "seasons");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      objc_msgSend(v18, "addObject:", v6);
      objc_msgSend(v9, "setSeasons:", v18);

    }
  }

}

- (void)_addEpisode:(id)a3 showIdentifier:(id)a4 seasonIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a3;
  if (a4)
  {
    if (a5)
    {
      v17 = v8;
      v9 = a5;
      v10 = a4;
      -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "seasonForIdentifier:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v17;
      if (v13)
      {
        objc_msgSend(v17, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlistMediaDatabase _removeEntityWithIdentifier:](self, "_removeEntityWithIdentifier:", v14);

        objc_msgSend(v13, "episodes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "addObject:", v17);
        objc_msgSend(v13, "setEpisodes:", v16);

        v8 = v17;
      }
    }
  }

}

- (void)_addHomeVideo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIPlistMediaDatabase homeVideoByIdentifier](self, "homeVideoByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addItem:itemByIdentifier:", v4, v6);

}

- (void)_addMovie:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIPlistMediaDatabase movieByIdentifier](self, "movieByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addItem:itemByIdentifier:", v4, v6);

}

- (void)_addMovieRental:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIPlistMediaDatabase movieRentalByIdentifier](self, "movieRentalByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addItem:itemByIdentifier:", v4, v6);

}

+ (void)_addItem:(id)a3 itemByIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_removeItem:itemByIdentifier:", v7, v6);
  objc_msgSend(v7, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, v8);

}

- (void)_removeShow:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectForKey:", v5);
}

- (void)_removeSeason:(id)a3 fromShow:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "seasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObject:", v6);
  objc_msgSend(v5, "setSeasons:", v8);

}

- (void)_removeEpisode:(id)a3 fromSeason:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "episodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObject:", v6);
  objc_msgSend(v5, "setEpisodes:", v8);

}

- (void)_removeHomeVideo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIPlistMediaDatabase homeVideoByIdentifier](self, "homeVideoByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeItem:itemByIdentifier:", v4, v6);

}

- (void)_removeMovie:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIPlistMediaDatabase movieByIdentifier](self, "movieByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeItem:itemByIdentifier:", v4, v6);

}

- (void)_removeMovieRental:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIPlistMediaDatabase movieRentalByIdentifier](self, "movieRentalByIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeItem:itemByIdentifier:", v4, v6);

}

+ (void)_removeItem:(id)a3 itemByIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

- (void)_removeEntityWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  VUIPlistMediaDatabase *v13;
  id v14;

  v10 = a3;
  -[VUIPlistMediaDatabase movieByIdentifier](self, "movieByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIPlistMediaDatabase _removeMovie:](self, "_removeMovie:", v5);
  }
  else
  {
    -[VUIPlistMediaDatabase movieRentalByIdentifier](self, "movieRentalByIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VUIPlistMediaDatabase _removeMovieRental:](self, "_removeMovieRental:", v5);
    }
    else
    {
      -[VUIPlistMediaDatabase homeVideoByIdentifier](self, "homeVideoByIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[VUIPlistMediaDatabase _removeHomeVideo:](self, "_removeHomeVideo:", v5);
      }
      else
      {
        -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          -[VUIPlistMediaDatabase _removeShow:](self, "_removeShow:", v5);
        }
        else
        {
          -[VUIPlistMediaDatabase showByIdentifier](self, "showByIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __53__VUIPlistMediaDatabase__removeEntityWithIdentifier___block_invoke;
          v11[3] = &unk_1E9F99EA0;
          v12 = v10;
          v13 = self;
          v14 = 0;
          objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

        }
      }
    }
  }

}

void __53__VUIPlistMediaDatabase__removeEntityWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "seasonForIdentifier:", *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeSeason:fromShow:", v8, *(_QWORD *)(a1 + 48));
    v6 = v8;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(0, "episodeForIdentifier:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "_removeEpisode:fromSeason:", v7, 0);
      *a4 = 1;
    }

    v6 = 0;
  }

}

+ (id)_sortedEntitiesArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (void)_startMonitoringDatabaseFile
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  uintptr_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[4];
  int v12;
  _QWORD handler[4];
  id v14;
  id location;
  char v16[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[VUIPlistMediaDatabase fileURL](self, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCString:maxLength:encoding:", v16, 1024, 4);
  v5 = open(v16, 0x8000);
  if (v5 != -1)
  {
    v6 = v5;
    v7 = v5;
    -[VUIPlistMediaDatabase serialDispatchQueue](self, "serialDispatchQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_source_create(MEMORY[0x1E0C80DE8], v7, 0x23uLL, v8);

    if (v9)
    {
      -[VUIPlistMediaDatabase setDatabaseFileDispatchSource:](self, "setDatabaseFileDispatchSource:", v9);
      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke;
      handler[3] = &unk_1E9F99C98;
      objc_copyWeak(&v14, &location);
      dispatch_source_set_event_handler(v9, handler);
      v11[0] = v10;
      v11[1] = 3221225472;
      v11[2] = __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke_2;
      v11[3] = &__block_descriptor_36_e5_v8__0l;
      v12 = v6;
      dispatch_source_set_cancel_handler(v9, v11);
      dispatch_resume(v9);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      close(v6);
    }

  }
}

void __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_parseDatabaseAndSendNotification");

}

uint64_t __53__VUIPlistMediaDatabase__startMonitoringDatabaseFile__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (void)setSerialDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialDispatchQueue, a3);
}

- (OS_dispatch_source)databaseFileDispatchSource
{
  return self->_databaseFileDispatchSource;
}

- (void)setDatabaseFileDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_databaseFileDispatchSource, a3);
}

- (NSMutableDictionary)homeVideoByIdentifier
{
  return self->_homeVideoByIdentifier;
}

- (void)setHomeVideoByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeVideoByIdentifier, a3);
}

- (NSMutableDictionary)movieByIdentifier
{
  return self->_movieByIdentifier;
}

- (void)setMovieByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_movieByIdentifier, a3);
}

- (NSMutableDictionary)movieRentalByIdentifier
{
  return self->_movieRentalByIdentifier;
}

- (void)setMovieRentalByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_movieRentalByIdentifier, a3);
}

- (NSMutableDictionary)showByIdentifier
{
  return self->_showByIdentifier;
}

- (void)setShowByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_showByIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showByIdentifier, 0);
  objc_storeStrong((id *)&self->_movieRentalByIdentifier, 0);
  objc_storeStrong((id *)&self->_movieByIdentifier, 0);
  objc_storeStrong((id *)&self->_homeVideoByIdentifier, 0);
  objc_storeStrong((id *)&self->_databaseFileDispatchSource, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)addEntity:showIdentifier:seasonIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to save database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)removeDownloadedMediaForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Unable to remove media for databaseID %@ since it doesn't exist in database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)removeDownloadedMediaForIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_5_7(&dword_1D96EE000, v0, v1, "Unable to delete contents at %@: %@");
  OUTLINED_FUNCTION_4_9();
}

- (void)_parseDatabase
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_5_7(&dword_1D96EE000, v0, v1, "Error deserializing database file! Database URL: %@, Error: %@");
  OUTLINED_FUNCTION_4_9();
}

@end
