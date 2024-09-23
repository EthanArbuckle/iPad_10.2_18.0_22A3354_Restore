@implementation RRSchemaRRAnnotatedEntity

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RRSchemaRRAnnotatedEntity;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v15, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[RRSchemaRRAnnotatedEntity deleteUsoGraph](self, "deleteUsoGraph");
  -[RRSchemaRRAnnotatedEntity group](self, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[RRSchemaRRAnnotatedEntity deleteGroup](self, "deleteGroup");
  -[RRSchemaRRAnnotatedEntity annotations](self, "annotations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SISchemaInstrumentationMessage _pruneSuppressedMessagesFromArray:underConditions:](self, "_pruneSuppressedMessagesFromArray:underConditions:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RRSchemaRRAnnotatedEntity setAnnotations:](self, "setAnnotations:", v13);

  return v5;
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

- (void)deleteUsoGraph
{
  -[RRSchemaRRAnnotatedEntity setUsoGraph:](self, "setUsoGraph:", 0);
}

- (BOOL)hasSwiftClassName
{
  return self->_swiftClassName != 0;
}

- (void)deleteSwiftClassName
{
  -[RRSchemaRRAnnotatedEntity setSwiftClassName:](self, "setSwiftClassName:", 0);
}

- (BOOL)hasGroup
{
  return self->_group != 0;
}

- (void)deleteGroup
{
  -[RRSchemaRRAnnotatedEntity setGroup:](self, "setGroup:", 0);
}

- (void)clearAnnotations
{
  -[NSArray removeAllObjects](self->_annotations, "removeAllObjects");
}

- (void)addAnnotations:(id)a3
{
  id v4;
  NSArray *annotations;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  annotations = self->_annotations;
  v8 = v4;
  if (!annotations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_annotations;
    self->_annotations = v6;

    v4 = v8;
    annotations = self->_annotations;
  }
  -[NSArray addObject:](annotations, "addObject:", v4);

}

- (unint64_t)annotationsCount
{
  return -[NSArray count](self->_annotations, "count");
}

- (id)annotationsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_annotations, "objectAtIndexedSubscript:", a3);
}

- (void)setSaliencyScore:(float)a3
{
  *(&self->_hasReference + 1) |= 1u;
  self->_saliencyScore = a3;
}

- (BOOL)hasSaliencyScore
{
  return *(&self->_hasReference + 1);
}

- (void)setHasSaliencyScore:(BOOL)a3
{
  *(&self->_hasReference + 1) = *(&self->_hasReference + 1) & 0xFE | a3;
}

- (void)deleteSaliencyScore
{
  double v2;

  LODWORD(v2) = 0;
  -[RRSchemaRRAnnotatedEntity setSaliencyScore:](self, "setSaliencyScore:", v2);
  *(&self->_hasReference + 1) &= ~1u;
}

- (void)setSaliencyComputedAtTimestampInSeconds:(unint64_t)a3
{
  *(&self->_hasReference + 1) |= 2u;
  self->_saliencyComputedAtTimestampInSeconds = a3;
}

- (BOOL)hasSaliencyComputedAtTimestampInSeconds
{
  return (*((unsigned __int8 *)&self->_hasReference + 1) >> 1) & 1;
}

- (void)setHasSaliencyComputedAtTimestampInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(&self->_hasReference + 1) = *(&self->_hasReference + 1) & 0xFD | v3;
}

- (void)deleteSaliencyComputedAtTimestampInSeconds
{
  -[RRSchemaRRAnnotatedEntity setSaliencyComputedAtTimestampInSeconds:](self, "setSaliencyComputedAtTimestampInSeconds:", 0);
  *(&self->_hasReference + 1) &= ~2u;
}

- (void)setHasReference:(BOOL)a3
{
  *(&self->_hasReference + 1) |= 4u;
  self->_hasReference = a3;
}

- (BOOL)hasHasReference
{
  return (*((unsigned __int8 *)&self->_hasReference + 1) >> 2) & 1;
}

- (void)setHasHasReference:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(&self->_hasReference + 1) = *(&self->_hasReference + 1) & 0xFB | v3;
}

- (void)deleteHasReference
{
  -[RRSchemaRRAnnotatedEntity setHasReference:](self, "setHasReference:", 0);
  *(&self->_hasReference + 1) &= ~4u;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return RRSchemaRRAnnotatedEntityReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[RRSchemaRRAnnotatedEntity swiftClassName](self, "swiftClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    PBDataWriterWriteStringField();
  -[RRSchemaRRAnnotatedEntity group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RRSchemaRRAnnotatedEntity group](self, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_annotations;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

  v15 = *(&self->_hasReference + 1);
  if ((v15 & 1) == 0)
  {
    if ((*(&self->_hasReference + 1) & 2) == 0)
      goto LABEL_16;
LABEL_20:
    PBDataWriterWriteUint64Field();
    if ((*(&self->_hasReference + 1) & 4) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  PBDataWriterWriteFloatField();
  v15 = *(&self->_hasReference + 1);
  if ((v15 & 2) != 0)
    goto LABEL_20;
LABEL_16:
  if ((v15 & 4) != 0)
LABEL_17:
    PBDataWriterWriteBOOLField();
LABEL_18:

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  unsigned int v29;
  unsigned int v30;
  float saliencyScore;
  float v32;
  int v33;
  unint64_t saliencyComputedAtTimestampInSeconds;
  int v35;
  int hasReference;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usoGraph");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "usoGraph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[RRSchemaRRAnnotatedEntity swiftClassName](self, "swiftClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "swiftClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RRSchemaRRAnnotatedEntity swiftClassName](self, "swiftClassName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[RRSchemaRRAnnotatedEntity swiftClassName](self, "swiftClassName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "swiftClassName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[RRSchemaRRAnnotatedEntity group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[RRSchemaRRAnnotatedEntity group](self, "group");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[RRSchemaRRAnnotatedEntity group](self, "group");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "group");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[RRSchemaRRAnnotatedEntity annotations](self, "annotations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  -[RRSchemaRRAnnotatedEntity annotations](self, "annotations");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[RRSchemaRRAnnotatedEntity annotations](self, "annotations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "annotations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_22;
  }
  else
  {

  }
  v29 = *((unsigned __int8 *)&self->_hasReference + 1);
  v30 = v4[57];
  if ((v29 & 1) == (v30 & 1))
  {
    if ((v29 & 1) != 0)
    {
      saliencyScore = self->_saliencyScore;
      objc_msgSend(v4, "saliencyScore");
      if (saliencyScore != v32)
        goto LABEL_22;
      v29 = *((unsigned __int8 *)&self->_hasReference + 1);
      v30 = v4[57];
    }
    v33 = (v29 >> 1) & 1;
    if (v33 == ((v30 >> 1) & 1))
    {
      if (v33)
      {
        saliencyComputedAtTimestampInSeconds = self->_saliencyComputedAtTimestampInSeconds;
        if (saliencyComputedAtTimestampInSeconds != objc_msgSend(v4, "saliencyComputedAtTimestampInSeconds"))
          goto LABEL_22;
        v29 = *((unsigned __int8 *)&self->_hasReference + 1);
        v30 = v4[57];
      }
      v35 = (v29 >> 2) & 1;
      if (v35 == ((v30 >> 2) & 1))
      {
        if (!v35
          || (hasReference = self->_hasReference, hasReference == objc_msgSend(v4, "hasReference")))
        {
          v27 = 1;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  float saliencyScore;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;

  v3 = -[USOSchemaUSOGraph hash](self->_usoGraph, "hash");
  v4 = -[NSString hash](self->_swiftClassName, "hash");
  v5 = -[RRSchemaRRGroupIdentifier hash](self->_group, "hash");
  v6 = -[NSArray hash](self->_annotations, "hash");
  v7 = *(&self->_hasReference + 1);
  if ((v7 & 1) != 0)
  {
    saliencyScore = self->_saliencyScore;
    v10 = saliencyScore;
    if (saliencyScore < 0.0)
      v10 = -saliencyScore;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((v7 & 2) != 0)
  {
    v13 = 2654435761u * self->_saliencyComputedAtTimestampInSeconds;
    if ((v7 & 4) != 0)
      goto LABEL_11;
LABEL_13:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((v7 & 4) == 0)
    goto LABEL_13;
LABEL_11:
  v14 = 2654435761 * self->_hasReference;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_annotations, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = self->_annotations;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("annotations"));
  }
  if (self->_group)
  {
    -[RRSchemaRRAnnotatedEntity group](self, "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("group"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("group"));

    }
  }
  v15 = *(&self->_hasReference + 1);
  if ((v15 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RRSchemaRRAnnotatedEntity hasReference](self, "hasReference"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("hasReference"));

    v15 = *(&self->_hasReference + 1);
    if ((v15 & 2) == 0)
    {
LABEL_20:
      if ((v15 & 1) == 0)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  else if ((*(&self->_hasReference + 1) & 2) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[RRSchemaRRAnnotatedEntity saliencyComputedAtTimestampInSeconds](self, "saliencyComputedAtTimestampInSeconds", (_QWORD)v26));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("saliencyComputedAtTimestampInSeconds"));

  if (*(&self->_hasReference + 1))
  {
LABEL_21:
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[RRSchemaRRAnnotatedEntity saliencyScore](self, "saliencyScore", (_QWORD)v26);
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("saliencyScore"));

  }
LABEL_22:
  if (self->_swiftClassName)
  {
    -[RRSchemaRRAnnotatedEntity swiftClassName](self, "swiftClassName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("swiftClassName"));

  }
  if (self->_usoGraph)
  {
    -[RRSchemaRRAnnotatedEntity usoGraph](self, "usoGraph");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("usoGraph"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("usoGraph"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v26);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaRRAnnotatedEntity dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (RRSchemaRRAnnotatedEntity)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaRRAnnotatedEntity *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[RRSchemaRRAnnotatedEntity initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaRRAnnotatedEntity)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaRRAnnotatedEntity *v5;
  uint64_t v6;
  USOSchemaUSOGraph *v7;
  void *v8;
  void *v9;
  void *v10;
  RRSchemaRRGroupIdentifier *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  RRSchemaRRAnnotation *v19;
  void *v20;
  void *v21;
  void *v22;
  RRSchemaRRAnnotatedEntity *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)RRSchemaRRAnnotatedEntity;
  v5 = -[RRSchemaRRAnnotatedEntity init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usoGraph"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[USOSchemaUSOGraph initWithDictionary:]([USOSchemaUSOGraph alloc], "initWithDictionary:", v6);
      -[RRSchemaRRAnnotatedEntity setUsoGraph:](v5, "setUsoGraph:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("swiftClassName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[RRSchemaRRAnnotatedEntity setSwiftClassName:](v5, "setSwiftClassName:", v9);

    }
    v26 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("group"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[RRSchemaRRGroupIdentifier initWithDictionary:]([RRSchemaRRGroupIdentifier alloc], "initWithDictionary:", v10);
      -[RRSchemaRRAnnotatedEntity setGroup:](v5, "setGroup:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotations"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v10;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[RRSchemaRRAnnotation initWithDictionary:]([RRSchemaRRAnnotation alloc], "initWithDictionary:", v18);
              -[RRSchemaRRAnnotatedEntity addAnnotations:](v5, "addAnnotations:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v15);
      }

      v10 = v25;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("saliencyScore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "floatValue");
      -[RRSchemaRRAnnotatedEntity setSaliencyScore:](v5, "setSaliencyScore:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("saliencyComputedAtTimestampInSeconds"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RRSchemaRRAnnotatedEntity setSaliencyComputedAtTimestampInSeconds:](v5, "setSaliencyComputedAtTimestampInSeconds:", objc_msgSend(v21, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasReference"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RRSchemaRRAnnotatedEntity setHasReference:](v5, "setHasReference:", objc_msgSend(v22, "BOOLValue"));
    v23 = v5;

  }
  return v5;
}

- (USOSchemaUSOGraph)usoGraph
{
  return self->_usoGraph;
}

- (void)setUsoGraph:(id)a3
{
  objc_storeStrong((id *)&self->_usoGraph, a3);
}

- (NSString)swiftClassName
{
  return self->_swiftClassName;
}

- (void)setSwiftClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RRSchemaRRGroupIdentifier)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (float)saliencyScore
{
  return self->_saliencyScore;
}

- (unint64_t)saliencyComputedAtTimestampInSeconds
{
  return self->_saliencyComputedAtTimestampInSeconds;
}

- (BOOL)hasReference
{
  return self->_hasReference;
}

- (void)setHasUsoGraph:(BOOL)a3
{
  *(&self->_hasReference + 2) = a3;
}

- (void)setHasSwiftClassName:(BOOL)a3
{
  *(&self->_hasReference + 3) = a3;
}

- (void)setHasGroup:(BOOL)a3
{
  *(_BYTE *)&self->_has = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_swiftClassName, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
}

@end
