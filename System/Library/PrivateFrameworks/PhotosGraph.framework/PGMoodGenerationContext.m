@implementation PGMoodGenerationContext

- (PGMoodGenerationContext)initWithReferenceDate:(id)a3
{
  id v4;
  PGMoodGenerationContext *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *isLongTimeNoSeeByPersonLocalIdentifier;
  NSMutableDictionary *v8;
  NSMutableDictionary *isLongTimeNoSeeBySocialGroupUUID;
  NSMutableDictionary *v10;
  NSMutableDictionary *isLongTimeNoSeeByLocationUUID;
  uint64_t v12;
  NSDate *longTimeNoSeePeopleLatestDate;
  uint64_t v14;
  NSDate *longTimeNoSeeLocationLatestDate;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGMoodGenerationContext;
  v5 = -[PGMoodGenerationContext init](&v17, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    isLongTimeNoSeeByPersonLocalIdentifier = v5->_isLongTimeNoSeeByPersonLocalIdentifier;
    v5->_isLongTimeNoSeeByPersonLocalIdentifier = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    isLongTimeNoSeeBySocialGroupUUID = v5->_isLongTimeNoSeeBySocialGroupUUID;
    v5->_isLongTimeNoSeeBySocialGroupUUID = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    isLongTimeNoSeeByLocationUUID = v5->_isLongTimeNoSeeByLocationUUID;
    v5->_isLongTimeNoSeeByLocationUUID = v10;

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingYears:toDate:", -1, v4);
    v12 = objc_claimAutoreleasedReturnValue();
    longTimeNoSeePeopleLatestDate = v5->_longTimeNoSeePeopleLatestDate;
    v5->_longTimeNoSeePeopleLatestDate = (NSDate *)v12;

    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingYears:toDate:", -2, v4);
    v14 = objc_claimAutoreleasedReturnValue();
    longTimeNoSeeLocationLatestDate = v5->_longTimeNoSeeLocationLatestDate;
    v5->_longTimeNoSeeLocationLatestDate = (NSDate *)v14;

  }
  return v5;
}

- (BOOL)momentIsLongTimeNoSeeForPeopleWithMomentNode:(id)a3
{
  return objc_msgSend(a3, "endsBeforeLocalDate:", self->_longTimeNoSeePeopleLatestDate);
}

- (BOOL)momentIsLongTimeNoSeeForLocationWithMomentNode:(id)a3
{
  return objc_msgSend(a3, "endsBeforeLocalDate:", self->_longTimeNoSeeLocationLatestDate);
}

- (BOOL)personIsLongTimeNoSeeWithPersonNode:(id)a3
{
  id v4;
  NSMutableDictionary *isLongTimeNoSeeByPersonLocalIdentifier;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  isLongTimeNoSeeByPersonLocalIdentifier = self->_isLongTimeNoSeeByPersonLocalIdentifier;
  objc_msgSend(v4, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](isLongTimeNoSeeByPersonLocalIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    objc_msgSend(v4, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__PGMoodGenerationContext_personIsLongTimeNoSeeWithPersonNode___block_invoke;
    v15[3] = &unk_1E8433E30;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(v10, "enumerateNodesUsingBlock:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v17 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_isLongTimeNoSeeByPersonLocalIdentifier;
    objc_msgSend(v4, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v8 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (BOOL)socialGroupIsLongTimeNoSeeWithSocialGroupNode:(id)a3
{
  id v4;
  NSMutableDictionary *isLongTimeNoSeeBySocialGroupUUID;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  isLongTimeNoSeeBySocialGroupUUID = self->_isLongTimeNoSeeBySocialGroupUUID;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](isLongTimeNoSeeBySocialGroupUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 1;
    objc_msgSend(v4, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __73__PGMoodGenerationContext_socialGroupIsLongTimeNoSeeWithSocialGroupNode___block_invoke;
    v15[3] = &unk_1E8433E30;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(v10, "enumerateNodesUsingBlock:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v17 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->_isLongTimeNoSeeBySocialGroupUUID;
    objc_msgSend(v4, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    v8 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (BOOL)locationIsLongTimeNoSeeWithLocationNode:(id)a3
{
  id v4;
  NSMutableDictionary *isLongTimeNoSeeByLocationUUID;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  isLongTimeNoSeeByLocationUUID = self->_isLongTimeNoSeeByLocationUUID;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](isLongTimeNoSeeByLocationUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    objc_msgSend(v4, "locationNodeCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addressNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "momentNodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__PGMoodGenerationContext_locationIsLongTimeNoSeeWithLocationNode___block_invoke;
    v16[3] = &unk_1E8433E30;
    v16[4] = self;
    v16[5] = &v17;
    objc_msgSend(v11, "enumerateNodesUsingBlock:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v18 + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_isLongTimeNoSeeByLocationUUID;
    objc_msgSend(v4, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    v8 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longTimeNoSeeLocationLatestDate, 0);
  objc_storeStrong((id *)&self->_longTimeNoSeePeopleLatestDate, 0);
  objc_storeStrong((id *)&self->_isLongTimeNoSeeByLocationUUID, 0);
  objc_storeStrong((id *)&self->_isLongTimeNoSeeBySocialGroupUUID, 0);
  objc_storeStrong((id *)&self->_isLongTimeNoSeeByPersonLocalIdentifier, 0);
}

uint64_t __67__PGMoodGenerationContext_locationIsLongTimeNoSeeWithLocationNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "endsBeforeLocalDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __73__PGMoodGenerationContext_socialGroupIsLongTimeNoSeeWithSocialGroupNode___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "momentIsLongTimeNoSeeForPeopleWithMomentNode:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

uint64_t __63__PGMoodGenerationContext_personIsLongTimeNoSeeWithPersonNode___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "momentIsLongTimeNoSeeForPeopleWithMomentNode:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end
