@implementation PPScoredExtractionSet

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSource documentId](self->_source, "documentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPScoredExtractionSet doc:%@ n:%tu na:%tu t:%tu ta:%tu l:%tu>"), v4, -[NSArray count](self->_entities, "count"), self->_entityAlgorithm, -[NSArray count](self->_topics, "count"), self->_topicAlgorithm, -[NSMutableDictionary count](self->_locations, "count"));

  return v5;
}

- (unint64_t)_donateLocationsWithContextualNamedEntities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *locations;
  id v10;
  unint64_t v11;
  _QWORD v13[4];
  id v14;
  PPScoredExtractionSet *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_locations, "count"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSource bundleId](self->_source, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSource language](self->_source, "language");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extractionAlgorithmsForBundleId:sourceLanguage:conservative:domain:", v6, v7, 0, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    locations = self->_locations;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__PPScoredExtractionSet__donateLocationsWithContextualNamedEntities___block_invoke;
    v13[3] = &unk_1E7E1E7A0;
    v10 = v8;
    v14 = v10;
    v15 = self;
    v16 = v4;
    v17 = &v18;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](locations, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)addLocation:(id)a3 algorithm:(unsigned __int16)a4
{
  uint64_t v4;
  NSMutableDictionary *locations;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a4;
  v17 = a3;
  locations = self->_locations;
  if (!locations)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->_locations;
    self->_locations = v7;

    locations = self->_locations;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](locations, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    v12 = self->_locations;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  v14 = self->_locations;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

}

- (void)writeSynchronous
{
  void *v3;
  NSArray *entities;
  PPSource *source;
  unint64_t entityAlgorithm;
  _BOOL8 cloudSync;
  double sentimentScore;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  PPSource *v13;
  unint64_t topicAlgorithm;
  _BOOL8 v15;
  double v16;
  NSArray *topics;
  NSMutableArray *topicsExactMatchesInSourceText;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  id v25;
  NSMutableDictionary *locations;
  id v27;
  unint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, void *);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  NSUInteger v54;
  __int16 v55;
  NSUInteger v56;
  __int16 v57;
  unint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_entities, "count"))
  {
    +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    entities = self->_entities;
    source = self->_source;
    entityAlgorithm = self->_entityAlgorithm;
    cloudSync = self->_cloudSync;
    sentimentScore = self->_sentimentScore;
    v44 = 0;
    v9 = objc_msgSend(v3, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", entities, source, entityAlgorithm, cloudSync, &v44, sentimentScore);
    v10 = v44;

    if ((v9 & 1) == 0)
    {
      pp_default_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v10;
        _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to donate named entities: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = 0;
  }
  if (-[NSArray count](self->_topics, "count"))
  {

    +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_source;
    topicAlgorithm = self->_topicAlgorithm;
    v15 = self->_cloudSync;
    v16 = self->_sentimentScore;
    topics = self->_topics;
    topicsExactMatchesInSourceText = self->_topicsExactMatchesInSourceText;
    v43 = 0;
    v19 = objc_msgSend(v12, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", topics, v13, topicAlgorithm, v15, topicsExactMatchesInSourceText, &v43, v16);
    v10 = v43;

    if ((v19 & 1) == 0)
    {
      pp_default_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v10;
        _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to donate topics: %@", buf, 0xCu);
      }

    }
  }
  v21 = (void *)objc_opt_new();
  v22 = (void *)MEMORY[0x1C3BD6630]();
  v23 = self->_entities;
  v24 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __41__PPScoredExtractionSet_writeSynchronous__block_invoke;
  v41[3] = &unk_1E7E1E7C8;
  v25 = v21;
  v42 = v25;
  -[NSArray enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v41);
  locations = self->_locations;
  v36 = v24;
  v37 = 3221225472;
  v38 = __41__PPScoredExtractionSet_writeSynchronous__block_invoke_2;
  v39 = &unk_1E7E1E818;
  v27 = v25;
  v40 = v27;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](locations, "enumerateKeysAndObjectsUsingBlock:", &v36);
  if ((unint64_t)objc_msgSend(v27, "count", v36, v37, v38, v39) >= 0xB)
  {

    v27 = 0;
  }

  objc_autoreleasePoolPop(v22);
  v28 = -[PPScoredExtractionSet _donateLocationsWithContextualNamedEntities:](self, "_donateLocationsWithContextualNamedEntities:", v27);
  pp_default_log_handle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    -[PPSource documentId](self->_source, "documentId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSource bundleId](self->_source, "bundleId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = self->_entityAlgorithm;
    v32 = self->_topicAlgorithm;
    v34 = -[NSArray count](self->_entities, "count");
    v35 = -[NSArray count](self->_topics, "count");
    *(_DWORD *)buf = 138413826;
    v46 = v30;
    v47 = 2112;
    v48 = v31;
    v49 = 2048;
    v50 = v33;
    v51 = 2048;
    v52 = v32;
    v53 = 2048;
    v54 = v34;
    v55 = 2048;
    v56 = v35;
    v57 = 2048;
    v58 = v28;
    _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "PPScoredExtractionSet(%@:%@ alg:%tu/%tu) wrote %tu entities, %tu topics, and %tu locations", buf, 0x48u);

  }
}

- (void)flushWrites
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v3 = objc_msgSend(v2, "flushDonationsWithError:", &v13);
  v4 = v13;

  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEBUG, "PPScoredExtractionSet flushed named entity donations", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to flush named entity donations: %@", buf, 0xCu);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v7, "flushDonationsWithError:", &v12);
  v9 = v12;

  pp_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "PPScoredExtractionSet flushed topic donations", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to flush topic donations: %@", buf, 0xCu);
  }

}

- (id)numberOfExtractions
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary allValues](self->_locations, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1E7E5A5C0, &__block_literal_global_20455);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_topics, "count")+ -[NSArray count](self->_entities, "count")+ (int)objc_msgSend(v4, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
  objc_storeStrong((id *)&self->_entities, a3);
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
  objc_storeStrong((id *)&self->_topics, a3);
}

- (NSMutableArray)topicsExactMatchesInSourceText
{
  return self->_topicsExactMatchesInSourceText;
}

- (void)setTopicsExactMatchesInSourceText:(id)a3
{
  objc_storeStrong((id *)&self->_topicsExactMatchesInSourceText, a3);
}

- (NSMutableDictionary)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (PPSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (unint64_t)entityAlgorithm
{
  return self->_entityAlgorithm;
}

- (void)setEntityAlgorithm:(unint64_t)a3
{
  self->_entityAlgorithm = a3;
}

- (unint64_t)topicAlgorithm
{
  return self->_topicAlgorithm;
}

- (void)setTopicAlgorithm:(unint64_t)a3
{
  self->_topicAlgorithm = a3;
}

- (BOOL)cloudSync
{
  return self->_cloudSync;
}

- (void)setCloudSync:(BOOL)a3
{
  self->_cloudSync = a3;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (double)sentimentScore
{
  return self->_sentimentScore;
}

- (void)setSentimentScore:(double)a3
{
  self->_sentimentScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_topicsExactMatchesInSourceText, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

uint64_t __44__PPScoredExtractionSet_numberOfExtractions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  LODWORD(a2) = objc_msgSend(a2, "intValue");
  v6 = objc_msgSend(v5, "count");

  return objc_msgSend(v4, "numberWithUnsignedInteger:", v6 + (int)a2);
}

void __41__PPScoredExtractionSet_writeSynchronous__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "item");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __41__PPScoredExtractionSet_writeSynchronous__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PPScoredExtractionSet_writeSynchronous__block_invoke_3;
  v4[3] = &unk_1E7E1E7F0;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);

}

void __41__PPScoredExtractionSet_writeSynchronous__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placemark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
    v5 = v6;
  }

}

void __69__PPScoredExtractionSet__donateLocationsWithContextualNamedEntities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "bundleId");
    v13 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v5;
    _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "PPScoredExtractionSet: Suppressing donation from %@ using algorithm %@ as it is not enabled.", buf, 0x16u);
LABEL_8:

    goto LABEL_9;
  }
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  v10 = objc_msgSend(v5, "intValue");
  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = 0;
  LOBYTE(v9) = objc_msgSend(v7, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v6, v9, v8, v10, v11, &v14);
  v12 = v14;

  if ((v9 & 1) == 0)
  {
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "PPScoredExtractionSet failed to donate derived locations: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v6, "count");
LABEL_9:

}

@end
