@implementation PPNamedEntityExtractionPlugin

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D80F78], "ignored", a3);
}

- (id)consumerName
{
  return CFSTR("com.apple.proactive.PersonalizationPortrait.NamedEntityExtractionPlugin");
}

- (PPNamedEntityExtractionPlugin)initWithNamedEntityDissector:(id)a3
{
  id v5;
  PPNamedEntityExtractionPlugin *v6;
  PPNamedEntityExtractionPlugin *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPNamedEntityExtractionPlugin;
  v6 = -[PPNamedEntityExtractionPlugin init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dissector, a3);
    objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerUserActivityConsumer:levelOfService:", v7, 4);

  }
  return v7;
}

- (PPNamedEntityExtractionPlugin)init
{
  void *v3;
  PPNamedEntityExtractionPlugin *v4;

  +[PPNamedEntityDissector sharedInstance](PPNamedEntityDissector, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PPNamedEntityExtractionPlugin initWithNamedEntityDissector:](self, "initWithNamedEntityDissector:", v3);

  return v4;
}

- (id)consumeUserActivityMetadataWithContext:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "content");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: consumeUserActivityMetadataWithContext: %@: %@ - ignoring until 74452163.", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", &unk_1E7E59330);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)consumeSearchableUserActivityWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = (uint64_t)v4;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: consumeSearchableUserActivityWithContext: %@: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v4, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPNamedEntityExtractionPlugin entityContainersForUserActivity:](self, "entityContainersForUserActivity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "count");
    objc_msgSend(v7, "uniqueId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218242;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: consumeSearchableUserActivityWithContext: got %tu containers from %@", (uint8_t *)&v16, 0x16u);

  }
  if (v8)
    -[PPNamedEntityExtractionPlugin _writeAndFlushContainers:](self, "_writeAndFlushContainers:", v8);
  v12 = (void *)MEMORY[0x1E0D80F78];
  -[PPNamedEntityExtractionPlugin _extractionCountForContainers:](self, "_extractionCountForContainers:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "successWithNumberOfExtractions:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_writeAndFlushContainers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7++), "writeSynchronous");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "flushWrites", (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

}

- (id)_extractionCountForContainers:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = &unk_1E7E59330;
  objc_msgSend(a3, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1E7E59330, &__block_literal_global_61);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = v4;

  return v3;
}

- (id)_entityContainersForContent:(id)a3 contentDataSource:(id)a4 isOutgoing:(BOOL)a5 contactHandles:(id)a6 uniqueIdentifier:(id)a7 domainIdentifier:(id)a8 bundleIdentifier:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PPNamedEntityDissector *dissector;
  void *v39;
  void *v40;
  _BOOL4 v42;
  id v43;
  id v45;
  void *v46;
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v42 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v45 = a4;
  v14 = a9;
  v43 = a8;
  v15 = a7;
  v16 = a6;
  v17 = objc_msgSend(v13, "length");
  if (v17 >= 0xC8000)
    v18 = 819200;
  else
    v18 = v17;
  pp_default_log_handle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = v18;
    _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin processing text content of length: %tu", buf, 0xCu);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isMultilingual");

  v46 = v13;
  if ((v21 & 1) != 0)
  {
    v22 = (void *)MEMORY[0x1E0D70A90];
    objc_msgSend(MEMORY[0x1E0D70D00], "preferredLanguages");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v13, v23, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0C99DC8];
    if (v24)
    {
      v26 = 0;
      v27 = v24;
      goto LABEL_11;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1E0C99DC8];
  }
  objc_msgSend(v25, "currentLocale");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "languageCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v26 = 1;
LABEL_11:
  objc_msgSend(v25, "componentsFromLocaleIdentifier:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {

  }
  v30 = v18;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, v18, 0, (unsigned __int16)objc_msgSend(v16, "count"), v42);
  v32 = objc_alloc(MEMORY[0x1E0D70C78]);
  v33 = (void *)objc_opt_new();
  v34 = (void *)objc_msgSend(v32, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v14, v43, v15, v33, 0, v16, v29, v31);

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v14, v29, 0, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  LODWORD(v35) = objc_msgSend((id)*MEMORY[0x1E0D81008], "isEqualToString:", v14);
  if ((_DWORD)v35 && (!v45 || (objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D81018]) & 1) == 0))
    objc_msgSend(v37, "removeObject:", &unk_1E7E59348);
  dissector = self->_dissector;
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v30);
  -[PPNamedEntityDissector entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:](dissector, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v46, v39, v34, 1, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)_extractionsFromEntityContainers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "entities", (_QWORD)v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "entities");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "source");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPLocalNamedEntityStore recordsForNamedEntities:source:algorithm:](PPLocalNamedEntityStore, "recordsForNamedEntities:source:algorithm:", v13, v14, objc_msgSend(v11, "entityAlgorithm"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v15);

        }
        objc_msgSend(v11, "topics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v11, "topics");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "source");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPLocalTopicStore recordsForTopics:source:algorithm:](PPLocalTopicStore, "recordsForTopics:source:algorithm:", v17, v18, objc_msgSend(v11, "topicAlgorithm"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v19);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v20 = objc_alloc(MEMORY[0x1E0D70B50]);
  if (objc_msgSend(v4, "count"))
    v21 = v4;
  else
    v21 = 0;
  if (objc_msgSend(v5, "count", (_QWORD)v25))
    v22 = v5;
  else
    v22 = 0;
  v23 = (void *)objc_msgSend(v20, "initWithNamedEntityRecords:topicRecords:", v21, v22);

  return v23;
}

- (BOOL)_processUserActivity:(id)a3 extractionContainer:(id)a4 rawTextOut:(id *)a5 language:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  void *v58;
  BOOL v59;
  NSObject *v60;
  void *v61;
  id v62;
  id v63;
  uint8_t buf[4];
  NSObject *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9)
  {
    objc_msgSend(v9, "_payloadForIdentifier:", CFSTR("UAMKMapItemPayload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v63 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v12, 0, 0, &v63);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v63;
      v15 = v13 != 0;
      if (v13)
      {
        v58 = v13;
        +[PPLocalLocationStore locationFromMapItemDictionary:](PPLocalLocationStore, "locationFromMapItemDictionary:", v13);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v16, 1.0, 0.0);
          objc_msgSend(v10, "addLocation:algorithm:", v17, 5);

        }
        v60 = v14;
        v61 = v12;
        v62 = v9;
        -[NSObject placemark](v16, "placemark");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v19 = objc_claimAutoreleasedReturnValue();

        if (-[NSObject length](v19, "length"))
        {
          pp_private_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v19;
            _os_log_debug_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEBUG, "PPNamedEntityExtractionPlugin found location name from MapItem data in NSUA: %@", buf, 0xCu);
          }
          v21 = v16;

          if (a5)
            *a5 = objc_retainAutorelease(v19);
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v19, 3, v11);
          v23 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v10, "entities");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v22, 1.0);
          objc_msgSend(v24, "arrayByAddingObject:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v23);
          objc_msgSend(v10, "setEntities:", v26);

          v16 = v21;
        }
        v55 = v19;
        v59 = v15;
        -[NSObject placemark](v16, "placemark");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "thoroughfare");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject placemark](v16, "placemark");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "subThoroughfare");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPNamedEntitySupport streetAddressFromThoroughfare:subThoroughfare:](PPNamedEntitySupport, "streetAddressFromThoroughfare:subThoroughfare:", v28, v30);
        v31 = objc_claimAutoreleasedReturnValue();

        -[NSObject placemark](v16, "placemark");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "locality");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject placemark](v16, "placemark");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "administrativeArea");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject placemark](v16, "placemark");
        v57 = v11;
        v35 = v10;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "postalCode");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v16;
        v38 = v16;
        v39 = (void *)v31;
        -[NSObject placemark](v38, "placemark");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "country");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPNamedEntitySupport fullAddressForStreetAddress:city:state:postalCode:country:](PPNamedEntitySupport, "fullAddressForStreetAddress:city:state:postalCode:country:", v39, v32, v34, v37, v41);
        v42 = objc_claimAutoreleasedReturnValue();

        v10 = v35;
        v11 = v57;

        if (-[NSObject length](v42, "length"))
        {
          v43 = (void *)MEMORY[0x1C3BD6630]();
          pp_private_log_handle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v65 = v42;
            _os_log_debug_impl(&dword_1C392E000, v44, OS_LOG_TYPE_DEBUG, "PPNamedEntityExtractionPlugin found street address in NSUA: %@", buf, 0xCu);
          }

          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v42, 12, v57);
          objc_msgSend(v10, "entities");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v45, 1.0);
          objc_msgSend(v46, "arrayByAddingObject:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setEntities:", v48);

          objc_autoreleasePoolPop(v43);
        }

        v12 = v61;
        v9 = v62;
        v14 = v60;
        v15 = v59;
        v13 = v58;
        v49 = v56;
      }
      else
      {
        pp_default_log_handle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v14;
          _os_log_impl(&dword_1C392E000, v49, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin failed to deserialize MKMapItem dict: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      pp_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "_uniqueIdentifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "UUIDString");
        v51 = v10;
        v52 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v65 = v52;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin found no MKMapItem in NSUA %@.", buf, 0xCu);

        v10 = v51;
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_processCSSearchableItemLocationWithName:(id)a3 thoroughfare:(id)a4 city:(id)a5 state:(id)a6 country:(id)a7 postalCode:(id)a8 latitude:(id)a9 longitude:(id)a10 extractionContainer:(id)a11
{
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v17 = (void *)MEMORY[0x1E0D70B98];
  v18 = a11;
  objc_msgSend(v17, "placemarkWithLatitudeDegrees:longitudeDegrees:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", a9, a10, a3, a4, 0, a5, 0, a6, 0, a8, 0, a7, 0, 0, 0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v21, 0, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v19, 1.0, 0.0);
  objc_msgSend(v18, "addLocation:algorithm:", v20, 5);

}

- (id)_entityContainersForUserAction:(id)a3 searchableItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  void *v19;
  dispatch_semaphore_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  NSObject *v31;
  _BYTE *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin received user action from %@", buf, 0xCu);

  }
  objc_msgSend(v7, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relatedUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "Replacing NSUA uniqueIdentifier: %@ with relatedUniqueIdentifier: %@", buf, 0x16u);
    }

    v14 = v12;
    v10 = v14;
  }
  objc_msgSend(v7, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = v10 == 0;
  else
    v16 = 1;
  v17 = v16;

  if (v17)
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEBUG, "PPNamedEntityExtractionPlugin suppressing NSUA with missing fields", buf, 2u);
    }
    v19 = 0;
  }
  else
  {
    v20 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__7237;
    v35 = __Block_byref_object_dispose__7238;
    v36 = 0;
    v21 = (void *)MEMORY[0x1E0CA5920];
    objc_msgSend(v6, "uaIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __79__PPNamedEntityExtractionPlugin__entityContainersForUserAction_searchableItem___block_invoke;
    v30 = &unk_1E7E17FF0;
    v32 = buf;
    v18 = v20;
    v31 = v18;
    v23 = (id)objc_msgSend(v21, "_fetchUserActivityWithUUID:intervalToWaitForDocumentSynchronizationToComplete:completionHandler:", v22, &v27, 5.0);

    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v18, v27, v28, v29, v30);
    v24 = objc_alloc(MEMORY[0x1E0D80FB8]);
    v25 = (void *)objc_msgSend(v24, "initWithUserActivity:searchableItem:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v7);
    -[PPNamedEntityExtractionPlugin entityContainersForUserActivity:](self, "entityContainersForUserActivity:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

- (id)entityContainersForUserActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  unsigned int v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v124;
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  uint64_t v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PPHarvestingUtils appBlocklist](PPHarvestingUtils, "appBlocklist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "bundleId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v126 = v8;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_INFO, "PPNamedEntityExtractionPlugin: entityContainersForUserActivity: blocking NSUA from %@", buf, 0xCu);

    }
    v9 = 0;
    goto LABEL_49;
  }
  v116 = v3;
  objc_msgSend(v3, "searchableItem");
  v7 = objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(MEMORY[0x1E0D80FB0], "searchableItemIsOutgoing:", v7);
  v114 = (void *)objc_opt_new();
  v122 = (void *)objc_opt_new();
  +[PPHarvestingUtils contactHandlesForSearchableItem:](PPHarvestingUtils, "contactHandlesForSearchableItem:", v7);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  -[NSObject attributeSet](v7, "attributeSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "thoroughfare");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = isNontrivialString(v14);

  v117 = v12;
  if (v15)
  {
    -[NSObject attributeSet](v7, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "thoroughfare");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _PASCollapseWhitespaceAndStrip();
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject attributeSet](v7, "attributeSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subThoroughfare");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (isNontrivialString(v19))
    {
      -[NSObject attributeSet](v7, "attributeSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "subThoroughfare");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _PASCollapseWhitespaceAndStrip();
      v22 = objc_claimAutoreleasedReturnValue();

      v12 = v117;
    }
    else
    {
      v22 = 0;
    }

    v109 = (void *)v22;
    +[PPNamedEntitySupport streetAddressFromThoroughfare:subThoroughfare:](PPNamedEntitySupport, "streetAddressFromThoroughfare:subThoroughfare:", v115, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v23, 8, v11);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v24, 1.0);
      objc_msgSend(v12, "addObject:", v25);

      v26 = v23;
    }

  }
  else
  {
    v23 = 0;
    v115 = 0;
    v109 = 0;
  }
  -[NSObject attributeSet](v7, "attributeSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "city");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = isNontrivialString(v28);

  if (v29)
  {
    -[NSObject attributeSet](v7, "attributeSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "city");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    _PASCollapseWhitespaceAndStrip();
    v32 = objc_claimAutoreleasedReturnValue();

    v120 = (void *)v32;
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v32, 9, v11);
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v33, 1.0);
    objc_msgSend(v12, "addObject:", v34);

  }
  else
  {
    v120 = 0;
  }
  -[NSObject attributeSet](v7, "attributeSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stateOrProvince");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = isNontrivialString(v36);

  if (v37)
  {
    -[NSObject attributeSet](v7, "attributeSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stateOrProvince");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    _PASCollapseWhitespaceAndStrip();
    v119 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v119 = 0;
  }
  -[NSObject attributeSet](v7, "attributeSet");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "postalCode");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = isNontrivialString(v41);

  if (v42)
  {
    -[NSObject attributeSet](v7, "attributeSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "postalCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _PASCollapseWhitespaceAndStrip();
    v118 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v118 = 0;
  }
  -[NSObject attributeSet](v7, "attributeSet");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "country");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = isNontrivialString(v46);

  if (v47)
  {
    -[NSObject attributeSet](v7, "attributeSet");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "country");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    _PASCollapseWhitespaceAndStrip();
    v50 = objc_claimAutoreleasedReturnValue();

    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v50, 11, v11);
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v51, 1.0);
    objc_msgSend(v12, "addObject:", v52);

  }
  else
  {
    v50 = 0;
  }
  v113 = v23;
  v111 = (void *)v50;
  +[PPNamedEntitySupport fullAddressForStreetAddress:city:state:postalCode:country:](PPNamedEntitySupport, "fullAddressForStreetAddress:city:state:postalCode:country:", v23, v120, v119, v118, v50);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v53, 12, v11);
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v54, 1.0);
    objc_msgSend(v12, "addObject:", v55);

  }
  v56 = (void *)objc_opt_new();
  objc_msgSend(v56, "setEntities:", v12);
  v108 = v53;
  v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v53, "length"), 0, (unsigned __int16)objc_msgSend(v121, "count"), v112);
  v58 = objc_alloc(MEMORY[0x1E0D70C78]);
  objc_msgSend(v3, "bundleId");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainId");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueId");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = (void *)v57;
  v62 = (void *)objc_msgSend(v58, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v59, v60, v61, v122, 0, v121, v11, v57);
  objc_msgSend(v56, "setSource:", v62);

  objc_msgSend(v56, "setEntityAlgorithm:", 5);
  objc_msgSend(v56, "setCloudSync:", 0);
  objc_msgSend(v56, "setDecayRate:", *MEMORY[0x1E0D70F28]);
  objc_msgSend(v3, "userActivity");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = 0;
  v110 = (void *)v11;
  -[PPNamedEntityExtractionPlugin _processUserActivity:extractionContainer:rawTextOut:language:](self, "_processUserActivity:extractionContainer:rawTextOut:language:", v63, v56, &v124, v11);
  v64 = v124;

  -[NSObject attributeSet](v7, "attributeSet");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "title");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSObject attributeSet](v7, "attributeSet");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "namedLocation");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = (void *)objc_opt_new();
  if (objc_msgSend(v64, "length"))
    objc_msgSend(v69, "addObject:", v64);
  if (objc_msgSend(v66, "length"))
    objc_msgSend(v69, "addObject:", v66);
  v105 = v66;
  v106 = v64;
  v70 = v117;
  if (objc_msgSend(v68, "length"))
    objc_msgSend(v69, "addObject:", v68);
  v103 = v69;
  v104 = v68;
  objc_msgSend(v69, "_pas_componentsJoinedByString:", CFSTR("\n\n"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    -[NSObject uniqueIdentifier](v7, "uniqueIdentifier");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v71, "length");
    *(_DWORD *)buf = 138412546;
    v126 = v73;
    v127 = 2048;
    v128 = v74;
    _os_log_impl(&dword_1C392E000, v72, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: entityContainersForUserActivity: %@: text content length: %tu", buf, 0x16u);

  }
  if (objc_msgSend(v71, "length"))
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "isMultilingual");

    if ((v76 & 1) != 0)
    {
      v77 = (void *)MEMORY[0x1E0D70A90];
      objc_msgSend(MEMORY[0x1E0D70D00], "preferredLanguages");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v71, v78, 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = (void *)MEMORY[0x1E0C99DC8];
      if (v79)
      {
        v81 = 0;
        v82 = v79;
LABEL_41:
        objc_msgSend(v80, "componentsFromLocaleIdentifier:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        if (v81)
        {

        }
        v85 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C80]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v71, "length"), 0, (unsigned __int16)objc_msgSend(v121, "count"), v112);
        v86 = objc_alloc(MEMORY[0x1E0D70C78]);
        objc_msgSend(v116, "bundleId");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "domainId");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "uniqueId");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (void *)objc_msgSend(v86, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v87, v88, v89, v122, 0, v121, v84, v85);

        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject bundleID](v7, "bundleID");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v92, v84, 1, 1);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        -[PPNamedEntityDissector entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:](self->_dissector, "entitiesInPlainText:eligibleRegions:source:cloudSync:algorithms:", v71, 0, v90, 1, v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        pp_default_log_handle();
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v126 = v94;
          _os_log_impl(&dword_1C392E000, v95, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: entityContainersForUserActivity: text extractions: %@ ", buf, 0xCu);
        }

        objc_msgSend(v114, "addObjectsFromArray:", v94);
        v3 = v116;
        v70 = v117;
        v23 = v113;
        goto LABEL_46;
      }
    }
    else
    {
      v80 = (void *)MEMORY[0x1E0C99DC8];
    }
    objc_msgSend(v80, "currentLocale");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "languageCode");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    v81 = 1;
    goto LABEL_41;
  }
LABEL_46:
  -[NSObject attributeSet](v7, "attributeSet");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "namedLocation");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (isNontrivialString(v97))
  {
    -[NSObject attributeSet](v7, "attributeSet");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "latitude");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject attributeSet](v7, "attributeSet");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "longitude");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPNamedEntityExtractionPlugin _processCSSearchableItemLocationWithName:thoroughfare:city:state:country:postalCode:latitude:longitude:extractionContainer:](self, "_processCSSearchableItemLocationWithName:thoroughfare:city:state:country:postalCode:latitude:longitude:extractionContainer:", v97, v115, v120, v119, v111, v118, v99, v101, v56);

    v70 = v117;
  }

  v9 = v114;
  objc_msgSend(v114, "addObject:", v56);

LABEL_49:
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dissector, 0);
}

void __79__PPNamedEntityExtractionPlugin__entityContainersForUserAction_searchableItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPNamedEntityExtractionPlugin failed to fetch user activity: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __63__PPNamedEntityExtractionPlugin__extractionCountForContainers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  LODWORD(a2) = objc_msgSend(a2, "intValue");
  objc_msgSend(v5, "numberOfExtractions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_7276 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_7276, &__block_literal_global_7277);
  return (id)sharedInstance__pasExprOnceResult_7278;
}

void __47__PPNamedEntityExtractionPlugin_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_7278;
  sharedInstance__pasExprOnceResult_7278 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
