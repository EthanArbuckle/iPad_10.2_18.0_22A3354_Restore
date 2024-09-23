@implementation PPPBScoredItemWithFeatures

- (void)setTopicId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_topicId = a3;
}

- (void)setHasTopicId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTopicId
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasNamedEntity
{
  return self->_namedEntity != 0;
}

- (BOOL)hasNamedEntityWithFeedback
{
  return self->_namedEntityWithFeedback != 0;
}

- (void)setScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearFeatures
{
  -[NSMutableArray removeAllObjects](self->_features, "removeAllObjects");
}

- (void)addFeatures:(id)a3
{
  id v4;
  NSMutableArray *features;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  features = self->_features;
  v8 = v4;
  if (!features)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_features;
    self->_features = v6;

    v4 = v8;
    features = self->_features;
  }
  -[NSMutableArray addObject:](features, "addObject:", v4);

}

- (unint64_t)featuresCount
{
  return -[NSMutableArray count](self->_features, "count");
}

- (id)featuresAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_features, "objectAtIndex:", a3);
}

- (void)clearFeedbackItems
{
  -[NSMutableArray removeAllObjects](self->_feedbackItems, "removeAllObjects");
}

- (void)addFeedbackItems:(id)a3
{
  id v4;
  NSMutableArray *feedbackItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  feedbackItems = self->_feedbackItems;
  v8 = v4;
  if (!feedbackItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_feedbackItems;
    self->_feedbackItems = v6;

    v4 = v8;
    feedbackItems = self->_feedbackItems;
  }
  -[NSMutableArray addObject:](feedbackItems, "addObject:", v4);

}

- (unint64_t)feedbackItemsCount
{
  return -[NSMutableArray count](self->_feedbackItems, "count");
}

- (id)feedbackItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_feedbackItems, "objectAtIndex:", a3);
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
  v8.super_class = (Class)PPPBScoredItemWithFeatures;
  -[PPPBScoredItemWithFeatures description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPPBScoredItemWithFeatures dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *namedEntity;
  NSString *namedEntityWithFeedback;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
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
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_topicId);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("topicId"));

  }
  namedEntity = self->_namedEntity;
  if (namedEntity)
    objc_msgSend(v3, "setObject:forKey:", namedEntity, CFSTR("namedEntity"));
  namedEntityWithFeedback = self->_namedEntityWithFeedback;
  if (namedEntityWithFeedback)
    objc_msgSend(v3, "setObject:forKey:", namedEntityWithFeedback, CFSTR("namedEntityWithFeedback"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)&v4 = self->_score;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("score"));

  }
  if (-[NSMutableArray count](self->_features, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_features, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = self->_features;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("features"));
  }
  if (-[NSMutableArray count](self->_feedbackItems, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_feedbackItems, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = self->_feedbackItems;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v19);
    }

    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("feedbackItems"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PPPBScoredItemWithFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_namedEntity)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteFloatField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_features;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_feedbackItems;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_namedEntityWithFeedback)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  _QWORD *v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_topicId;
    *((_BYTE *)v4 + 52) |= 1u;
  }
  v13 = v4;
  if (self->_namedEntity)
  {
    objc_msgSend(v4, "setNamedEntity:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = LODWORD(self->_score);
    *((_BYTE *)v4 + 52) |= 2u;
  }
  if (-[PPPBScoredItemWithFeatures featuresCount](self, "featuresCount"))
  {
    objc_msgSend(v13, "clearFeatures");
    v5 = -[PPPBScoredItemWithFeatures featuresCount](self, "featuresCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[PPPBScoredItemWithFeatures featuresAtIndex:](self, "featuresAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addFeatures:", v8);

      }
    }
  }
  if (-[PPPBScoredItemWithFeatures feedbackItemsCount](self, "feedbackItemsCount"))
  {
    objc_msgSend(v13, "clearFeedbackItems");
    v9 = -[PPPBScoredItemWithFeatures feedbackItemsCount](self, "feedbackItemsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[PPPBScoredItemWithFeatures feedbackItemsAtIndex:](self, "feedbackItemsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addFeedbackItems:", v12);

      }
    }
  }
  if (self->_namedEntityWithFeedback)
    objc_msgSend(v13, "setNamedEntityWithFeedback:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
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
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_topicId;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_namedEntity, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)(v6 + 48) = self->_score;
    *(_BYTE *)(v6 + 52) |= 2u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = self->_features;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addFeatures:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v11);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = self->_feedbackItems;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v6, "addFeedbackItems:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  v21 = -[NSString copyWithZone:](self->_namedEntityWithFeedback, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *namedEntity;
  NSMutableArray *features;
  NSMutableArray *feedbackItems;
  NSString *namedEntityWithFeedback;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 52);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_topicId != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_21;
  }
  namedEntity = self->_namedEntity;
  if ((unint64_t)namedEntity | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](namedEntity, "isEqual:"))
    {
LABEL_21:
      v11 = 0;
      goto LABEL_22;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 52);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_score != *((float *)v4 + 12))
      goto LABEL_21;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_21;
  }
  features = self->_features;
  if ((unint64_t)features | *((_QWORD *)v4 + 2)
    && !-[NSMutableArray isEqual:](features, "isEqual:"))
  {
    goto LABEL_21;
  }
  feedbackItems = self->_feedbackItems;
  if ((unint64_t)feedbackItems | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](feedbackItems, "isEqual:"))
      goto LABEL_21;
  }
  namedEntityWithFeedback = self->_namedEntityWithFeedback;
  if ((unint64_t)namedEntityWithFeedback | *((_QWORD *)v4 + 5))
    v11 = -[NSString isEqual:](namedEntityWithFeedback, "isEqual:");
  else
    v11 = 1;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  float score;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_topicId;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_namedEntity, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    score = self->_score;
    v7 = -score;
    if (score >= 0.0)
      v7 = self->_score;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_features, "hash");
  v11 = -[NSMutableArray hash](self->_feedbackItems, "hash");
  return v10 ^ v11 ^ -[NSString hash](self->_namedEntityWithFeedback, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_topicId = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[4])
    -[PPPBScoredItemWithFeatures setNamedEntity:](self, "setNamedEntity:");
  if ((*((_BYTE *)v5 + 52) & 2) != 0)
  {
    self->_score = *((float *)v5 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v5 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[PPPBScoredItemWithFeatures addFeatures:](self, "addFeatures:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 3);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[PPPBScoredItemWithFeatures addFeedbackItems:](self, "addFeedbackItems:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v5 + 5))
    -[PPPBScoredItemWithFeatures setNamedEntityWithFeedback:](self, "setNamedEntityWithFeedback:");

}

- (unint64_t)topicId
{
  return self->_topicId;
}

- (NSString)namedEntity
{
  return self->_namedEntity;
}

- (void)setNamedEntity:(id)a3
{
  objc_storeStrong((id *)&self->_namedEntity, a3);
}

- (NSString)namedEntityWithFeedback
{
  return self->_namedEntityWithFeedback;
}

- (void)setNamedEntityWithFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_namedEntityWithFeedback, a3);
}

- (float)score
{
  return self->_score;
}

- (NSMutableArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (NSMutableArray)feedbackItems
{
  return self->_feedbackItems;
}

- (void)setFeedbackItems:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityWithFeedback, 0);
  objc_storeStrong((id *)&self->_namedEntity, 0);
  objc_storeStrong((id *)&self->_feedbackItems, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

+ (Class)featuresType
{
  return (Class)objc_opt_class();
}

+ (Class)feedbackItemsType
{
  return (Class)objc_opt_class();
}

@end
