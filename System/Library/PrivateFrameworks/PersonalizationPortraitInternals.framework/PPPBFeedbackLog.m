@implementation PPPBFeedbackLog

- (BOOL)hasFeedbackMetadata
{
  return self->_feedbackMetadata != 0;
}

- (int)predictionType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_predictionType;
  else
    return 0;
}

- (void)setPredictionType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_predictionType = a3;
}

- (void)setHasPredictionType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredictionType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearScoredItems
{
  -[NSMutableArray removeAllObjects](self->_scoredItems, "removeAllObjects");
}

- (void)addScoredItems:(id)a3
{
  id v4;
  NSMutableArray *scoredItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  scoredItems = self->_scoredItems;
  v8 = v4;
  if (!scoredItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_scoredItems;
    self->_scoredItems = v6;

    v4 = v8;
    scoredItems = self->_scoredItems;
  }
  -[NSMutableArray addObject:](scoredItems, "addObject:", v4);

}

- (unint64_t)scoredItemsCount
{
  return -[NSMutableArray count](self->_scoredItems, "count");
}

- (id)scoredItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_scoredItems, "objectAtIndex:", a3);
}

- (void)clearExtractedDonations
{
  -[NSMutableArray removeAllObjects](self->_extractedDonations, "removeAllObjects");
}

- (void)addExtractedDonations:(id)a3
{
  id v4;
  NSMutableArray *extractedDonations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  extractedDonations = self->_extractedDonations;
  v8 = v4;
  if (!extractedDonations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_extractedDonations;
    self->_extractedDonations = v6;

    v4 = v8;
    extractedDonations = self->_extractedDonations;
  }
  -[NSMutableArray addObject:](extractedDonations, "addObject:", v4);

}

- (unint64_t)extractedDonationsCount
{
  return -[NSMutableArray count](self->_extractedDonations, "count");
}

- (id)extractedDonationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_extractedDonations, "objectAtIndex:", a3);
}

- (void)clearExperimentalGroups
{
  -[NSMutableArray removeAllObjects](self->_experimentalGroups, "removeAllObjects");
}

- (void)addExperimentalGroups:(id)a3
{
  id v4;
  NSMutableArray *experimentalGroups;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  experimentalGroups = self->_experimentalGroups;
  v8 = v4;
  if (!experimentalGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_experimentalGroups;
    self->_experimentalGroups = v6;

    v4 = v8;
    experimentalGroups = self->_experimentalGroups;
  }
  -[NSMutableArray addObject:](experimentalGroups, "addObject:", v4);

}

- (unint64_t)experimentalGroupsCount
{
  return -[NSMutableArray count](self->_experimentalGroups, "count");
}

- (id)experimentalGroupsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_experimentalGroups, "objectAtIndex:", a3);
}

- (BOOL)hasHomeLocationGeohash
{
  return self->_homeLocationGeohash != 0;
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PPPBFeedbackLog;
  -[PPPBFeedbackLog description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBFeedbackLog dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PPPBFeedbackMetadata *feedbackMetadata;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  NSString *homeLocationGeohash;
  NSString *assetVersion;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  feedbackMetadata = self->_feedbackMetadata;
  if (feedbackMetadata)
  {
    -[PPPBFeedbackMetadata dictionaryRepresentation](feedbackMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("feedbackMetadata"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_predictionType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("predictionType"));

  }
  if (-[NSMutableArray count](self->_scoredItems, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_scoredItems, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v8 = self->_scoredItems;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("scoredItems"));
  }
  if (-[NSMutableArray count](self->_extractedDonations, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_extractedDonations, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = self->_extractedDonations;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("extractedDonations"));
  }
  if (-[NSMutableArray count](self->_experimentalGroups, "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_experimentalGroups, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = self->_experimentalGroups;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "dictionaryRepresentation", (_QWORD)v31);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("experimentalGroups"));
  }
  homeLocationGeohash = self->_homeLocationGeohash;
  if (homeLocationGeohash)
    objc_msgSend(v3, "setObject:forKey:", homeLocationGeohash, CFSTR("homeLocationGeohash"));
  assetVersion = self->_assetVersion;
  if (assetVersion)
    objc_msgSend(v3, "setObject:forKey:", assetVersion, CFSTR("assetVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBFeedbackLogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_feedbackMetadata)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->_scoredItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_extractedDonations;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_experimentalGroups;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

  if (self->_homeLocationGeohash)
    PBDataWriterWriteStringField();
  if (self->_assetVersion)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (self->_feedbackMetadata)
  {
    objc_msgSend(v4, "setFeedbackMetadata:");
    v4 = v18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_predictionType;
    *((_BYTE *)v4 + 64) |= 1u;
  }
  if (-[PPPBFeedbackLog scoredItemsCount](self, "scoredItemsCount"))
  {
    objc_msgSend(v18, "clearScoredItems");
    v5 = -[PPPBFeedbackLog scoredItemsCount](self, "scoredItemsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PPPBFeedbackLog scoredItemsAtIndex:](self, "scoredItemsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addScoredItems:", v8);

      }
    }
  }
  if (-[PPPBFeedbackLog extractedDonationsCount](self, "extractedDonationsCount"))
  {
    objc_msgSend(v18, "clearExtractedDonations");
    v9 = -[PPPBFeedbackLog extractedDonationsCount](self, "extractedDonationsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[PPPBFeedbackLog extractedDonationsAtIndex:](self, "extractedDonationsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addExtractedDonations:", v12);

      }
    }
  }
  if (-[PPPBFeedbackLog experimentalGroupsCount](self, "experimentalGroupsCount"))
  {
    objc_msgSend(v18, "clearExperimentalGroups");
    v13 = -[PPPBFeedbackLog experimentalGroupsCount](self, "experimentalGroupsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[PPPBFeedbackLog experimentalGroupsAtIndex:](self, "experimentalGroupsAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addExperimentalGroups:", v16);

      }
    }
  }
  if (self->_homeLocationGeohash)
    objc_msgSend(v18, "setHomeLocationGeohash:");
  v17 = v18;
  if (self->_assetVersion)
  {
    objc_msgSend(v18, "setAssetVersion:");
    v17 = v18;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PPPBFeedbackMetadata copyWithZone:](self->_feedbackMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_predictionType;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = self->_scoredItems;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v12), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addScoredItems:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v10);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = self->_extractedDonations;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v18), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addExtractedDonations:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v16);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = self->_experimentalGroups;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v24), "copyWithZone:", a3, (_QWORD)v31);
        objc_msgSend((id)v5, "addExperimentalGroups:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v22);
  }

  v26 = -[NSString copyWithZone:](self->_homeLocationGeohash, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v26;

  v28 = -[NSString copyWithZone:](self->_assetVersion, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v28;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  PPPBFeedbackMetadata *feedbackMetadata;
  NSMutableArray *scoredItems;
  NSMutableArray *extractedDonations;
  NSMutableArray *experimentalGroups;
  NSString *homeLocationGeohash;
  NSString *assetVersion;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  feedbackMetadata = self->_feedbackMetadata;
  if ((unint64_t)feedbackMetadata | *((_QWORD *)v4 + 4))
  {
    if (!-[PPPBFeedbackMetadata isEqual:](feedbackMetadata, "isEqual:"))
      goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_predictionType != *((_DWORD *)v4 + 12))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  scoredItems = self->_scoredItems;
  if ((unint64_t)scoredItems | *((_QWORD *)v4 + 7)
    && !-[NSMutableArray isEqual:](scoredItems, "isEqual:"))
  {
    goto LABEL_19;
  }
  extractedDonations = self->_extractedDonations;
  if ((unint64_t)extractedDonations | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](extractedDonations, "isEqual:"))
      goto LABEL_19;
  }
  experimentalGroups = self->_experimentalGroups;
  if ((unint64_t)experimentalGroups | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](experimentalGroups, "isEqual:"))
      goto LABEL_19;
  }
  homeLocationGeohash = self->_homeLocationGeohash;
  if ((unint64_t)homeLocationGeohash | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](homeLocationGeohash, "isEqual:"))
      goto LABEL_19;
  }
  assetVersion = self->_assetVersion;
  if ((unint64_t)assetVersion | *((_QWORD *)v4 + 1))
    v11 = -[NSString isEqual:](assetVersion, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;

  v3 = -[PPPBFeedbackMetadata hash](self->_feedbackMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_predictionType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSMutableArray hash](self->_scoredItems, "hash");
  v7 = v5 ^ v6 ^ -[NSMutableArray hash](self->_extractedDonations, "hash");
  v8 = -[NSMutableArray hash](self->_experimentalGroups, "hash");
  v9 = v8 ^ -[NSString hash](self->_homeLocationGeohash, "hash");
  return v7 ^ v9 ^ -[NSString hash](self->_assetVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  PPPBFeedbackMetadata *feedbackMetadata;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  feedbackMetadata = self->_feedbackMetadata;
  v6 = *((_QWORD *)v4 + 4);
  if (feedbackMetadata)
  {
    if (v6)
      -[PPPBFeedbackMetadata mergeFrom:](feedbackMetadata, "mergeFrom:");
  }
  else if (v6)
  {
    -[PPPBFeedbackLog setFeedbackMetadata:](self, "setFeedbackMetadata:");
  }
  if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    self->_predictionType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        -[PPPBFeedbackLog addScoredItems:](self, "addScoredItems:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = *((id *)v4 + 3);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        -[PPPBFeedbackLog addExtractedDonations:](self, "addExtractedDonations:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = *((id *)v4 + 2);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        -[PPPBFeedbackLog addExperimentalGroups:](self, "addExperimentalGroups:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k), (_QWORD)v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

  if (*((_QWORD *)v4 + 5))
    -[PPPBFeedbackLog setHomeLocationGeohash:](self, "setHomeLocationGeohash:");
  if (*((_QWORD *)v4 + 1))
    -[PPPBFeedbackLog setAssetVersion:](self, "setAssetVersion:");

}

- (PPPBFeedbackMetadata)feedbackMetadata
{
  return self->_feedbackMetadata;
}

- (void)setFeedbackMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackMetadata, a3);
}

- (NSMutableArray)scoredItems
{
  return self->_scoredItems;
}

- (void)setScoredItems:(id)a3
{
  objc_storeStrong((id *)&self->_scoredItems, a3);
}

- (NSMutableArray)extractedDonations
{
  return self->_extractedDonations;
}

- (void)setExtractedDonations:(id)a3
{
  objc_storeStrong((id *)&self->_extractedDonations, a3);
}

- (NSMutableArray)experimentalGroups
{
  return self->_experimentalGroups;
}

- (void)setExperimentalGroups:(id)a3
{
  objc_storeStrong((id *)&self->_experimentalGroups, a3);
}

- (NSString)homeLocationGeohash
{
  return self->_homeLocationGeohash;
}

- (void)setHomeLocationGeohash:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocationGeohash, a3);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredItems, 0);
  objc_storeStrong((id *)&self->_homeLocationGeohash, 0);
  objc_storeStrong((id *)&self->_feedbackMetadata, 0);
  objc_storeStrong((id *)&self->_extractedDonations, 0);
  objc_storeStrong((id *)&self->_experimentalGroups, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

+ (Class)scoredItemsType
{
  return (Class)objc_opt_class();
}

+ (Class)extractedDonationsType
{
  return (Class)objc_opt_class();
}

+ (Class)experimentalGroupsType
{
  return (Class)objc_opt_class();
}

@end
