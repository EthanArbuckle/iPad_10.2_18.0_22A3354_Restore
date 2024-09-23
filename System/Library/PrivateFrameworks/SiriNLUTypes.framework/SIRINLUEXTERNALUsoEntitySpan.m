@implementation SIRINLUEXTERNALUsoEntitySpan

- (unsigned)nodeIndex
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_nodeIndex;
  else
    return 0;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_nodeIndex = a3;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNodeIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasOriginAppId
{
  return self->_originAppId != 0;
}

- (int)sourceComponent
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_sourceComponent;
  else
    return 0;
}

- (void)setSourceComponent:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sourceComponent = a3;
}

- (void)setHasSourceComponent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSourceComponent
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)sourceComponentAsString:(int)a3
{
  if (a3 < 7)
    return off_1E7BB1C08[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSourceComponent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_SIRI_VOCAB")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_VOC_FILE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_MENTION_RESOLVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_SPAN_MATCH_CONTEXTUAL_SPAN_MATCHER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_PARSER_CATI")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NLU_COMPONENT_PARSER_SSU")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasMatchInfo
{
  return self->_matchInfo != 0;
}

- (void)clearProperties
{
  -[NSMutableArray removeAllObjects](self->_properties, "removeAllObjects");
}

- (void)addProperties:(id)a3
{
  id v4;
  NSMutableArray *properties;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  properties = self->_properties;
  v8 = v4;
  if (!properties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_properties;
    self->_properties = v6;

    v4 = v8;
    properties = self->_properties;
  }
  -[NSMutableArray addObject:](properties, "addObject:", v4);

}

- (unint64_t)propertiesCount
{
  return -[NSMutableArray count](self->_properties, "count");
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_properties, "objectAtIndex:", a3);
}

- (BOOL)hasStartIndex
{
  return self->_startIndex != 0;
}

- (BOOL)hasEndIndex
{
  return self->_endIndex != 0;
}

- (void)clearAlternatives
{
  -[NSMutableArray removeAllObjects](self->_alternatives, "removeAllObjects");
}

- (void)addAlternatives:(id)a3
{
  id v4;
  NSMutableArray *alternatives;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  alternatives = self->_alternatives;
  v8 = v4;
  if (!alternatives)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_alternatives;
    self->_alternatives = v6;

    v4 = v8;
    alternatives = self->_alternatives;
  }
  -[NSMutableArray addObject:](alternatives, "addObject:", v4);

}

- (unint64_t)alternativesCount
{
  return -[NSMutableArray count](self->_alternatives, "count");
}

- (id)alternativesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_alternatives, "objectAtIndex:", a3);
}

- (BOOL)hasOriginEntityId
{
  return self->_originEntityId != 0;
}

- (BOOL)hasPayloadAttachmentInfo
{
  return self->_payloadAttachmentInfo != 0;
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
  v8.super_class = (Class)SIRINLUEXTERNALUsoEntitySpan;
  -[SIRINLUEXTERNALUsoEntitySpan description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUsoEntitySpan dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  SIRICOMMONStringValue *originAppId;
  void *v6;
  uint64_t sourceComponent;
  __CFString *v8;
  SIRICOMMONStringValue *label;
  void *v10;
  SIRINLUEXTERNALMatchInfo *matchInfo;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  SIRICOMMONUInt32Value *startIndex;
  void *v21;
  SIRICOMMONUInt32Value *endIndex;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  SIRICOMMONStringValue *originEntityId;
  void *v32;
  SIRINLUEXTERNALPayloadAttachmentInfo *payloadAttachmentInfo;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nodeIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("node_index"));

  }
  originAppId = self->_originAppId;
  if (originAppId)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](originAppId, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("origin_app_id"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    sourceComponent = self->_sourceComponent;
    if (sourceComponent >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sourceComponent);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7BB1C08[sourceComponent];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("source_component"));

  }
  label = self->_label;
  if (label)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](label, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("label"));

  }
  matchInfo = self->_matchInfo;
  if (matchInfo)
  {
    -[SIRINLUEXTERNALMatchInfo dictionaryRepresentation](matchInfo, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("match_info"));

  }
  if (-[NSMutableArray count](self->_properties, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_properties, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v14 = self->_properties;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("properties"));
  }
  startIndex = self->_startIndex;
  if (startIndex)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](startIndex, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("start_index"));

  }
  endIndex = self->_endIndex;
  if (endIndex)
  {
    -[SIRICOMMONUInt32Value dictionaryRepresentation](endIndex, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("end_index"));

  }
  if (-[NSMutableArray count](self->_alternatives, "count"))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_alternatives, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = self->_alternatives;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v27);
    }

    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("alternatives"));
  }
  originEntityId = self->_originEntityId;
  if (originEntityId)
  {
    -[SIRICOMMONStringValue dictionaryRepresentation](originEntityId, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("origin_entity_id"));

  }
  payloadAttachmentInfo = self->_payloadAttachmentInfo;
  if (payloadAttachmentInfo)
  {
    -[SIRINLUEXTERNALPayloadAttachmentInfo dictionaryRepresentation](payloadAttachmentInfo, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("payload_attachment_info"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEntitySpanReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteUint32Field();
  if (self->_originAppId)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_label)
    PBDataWriterWriteSubmessage();
  if (self->_matchInfo)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_properties;
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

  if (self->_startIndex)
    PBDataWriterWriteSubmessage();
  if (self->_endIndex)
    PBDataWriterWriteSubmessage();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_alternatives;
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

  if (self->_originEntityId)
    PBDataWriterWriteSubmessage();
  if (self->_payloadAttachmentInfo)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  _DWORD *v14;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_nodeIndex;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  v14 = v4;
  if (self->_originAppId)
  {
    objc_msgSend(v4, "setOriginAppId:");
    v4 = v14;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[20] = self->_sourceComponent;
    *((_BYTE *)v4 + 96) |= 2u;
  }
  if (self->_label)
    objc_msgSend(v14, "setLabel:");
  if (self->_matchInfo)
    objc_msgSend(v14, "setMatchInfo:");
  if (-[SIRINLUEXTERNALUsoEntitySpan propertiesCount](self, "propertiesCount"))
  {
    objc_msgSend(v14, "clearProperties");
    v5 = -[SIRINLUEXTERNALUsoEntitySpan propertiesCount](self, "propertiesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SIRINLUEXTERNALUsoEntitySpan propertiesAtIndex:](self, "propertiesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addProperties:", v8);

      }
    }
  }
  if (self->_startIndex)
    objc_msgSend(v14, "setStartIndex:");
  if (self->_endIndex)
    objc_msgSend(v14, "setEndIndex:");
  if (-[SIRINLUEXTERNALUsoEntitySpan alternativesCount](self, "alternativesCount"))
  {
    objc_msgSend(v14, "clearAlternatives");
    v9 = -[SIRINLUEXTERNALUsoEntitySpan alternativesCount](self, "alternativesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[SIRINLUEXTERNALUsoEntitySpan alternativesAtIndex:](self, "alternativesAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAlternatives:", v12);

      }
    }
  }
  if (self->_originEntityId)
    objc_msgSend(v14, "setOriginEntityId:");
  v13 = v14;
  if (self->_payloadAttachmentInfo)
  {
    objc_msgSend(v14, "setPayloadAttachmentInfo:");
    v13 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_nodeIndex;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v7 = -[SIRICOMMONStringValue copyWithZone:](self->_originAppId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_sourceComponent;
    *(_BYTE *)(v6 + 96) |= 2u;
  }
  v9 = -[SIRICOMMONStringValue copyWithZone:](self->_label, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  v11 = -[SIRINLUEXTERNALMatchInfo copyWithZone:](self->_matchInfo, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v11;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = self->_properties;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v17), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addProperties:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v15);
  }

  v19 = -[SIRICOMMONUInt32Value copyWithZone:](self->_startIndex, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v19;

  v21 = -[SIRICOMMONUInt32Value copyWithZone:](self->_endIndex, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v21;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v23 = self->_alternatives;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v23);
        v28 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v27), "copyWithZone:", a3, (_QWORD)v34);
        objc_msgSend((id)v6, "addAlternatives:", v28);

        ++v27;
      }
      while (v25 != v27);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v25);
  }

  v29 = -[SIRICOMMONStringValue copyWithZone:](self->_originEntityId, "copyWithZone:", a3);
  v30 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v29;

  v31 = -[SIRINLUEXTERNALPayloadAttachmentInfo copyWithZone:](self->_payloadAttachmentInfo, "copyWithZone:", a3);
  v32 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v31;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  SIRICOMMONStringValue *originAppId;
  SIRICOMMONStringValue *label;
  SIRINLUEXTERNALMatchInfo *matchInfo;
  NSMutableArray *properties;
  SIRICOMMONUInt32Value *startIndex;
  SIRICOMMONUInt32Value *endIndex;
  NSMutableArray *alternatives;
  SIRICOMMONStringValue *originEntityId;
  SIRINLUEXTERNALPayloadAttachmentInfo *payloadAttachmentInfo;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 96);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_nodeIndex != *((_DWORD *)v4 + 10))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_31;
  }
  originAppId = self->_originAppId;
  if ((unint64_t)originAppId | *((_QWORD *)v4 + 6))
  {
    if (!-[SIRICOMMONStringValue isEqual:](originAppId, "isEqual:"))
    {
LABEL_31:
      v16 = 0;
      goto LABEL_32;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 96);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_sourceComponent != *((_DWORD *)v4 + 20))
      goto LABEL_31;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_31;
  }
  label = self->_label;
  if ((unint64_t)label | *((_QWORD *)v4 + 3) && !-[SIRICOMMONStringValue isEqual:](label, "isEqual:"))
    goto LABEL_31;
  matchInfo = self->_matchInfo;
  if ((unint64_t)matchInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALMatchInfo isEqual:](matchInfo, "isEqual:"))
      goto LABEL_31;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](properties, "isEqual:"))
      goto LABEL_31;
  }
  startIndex = self->_startIndex;
  if ((unint64_t)startIndex | *((_QWORD *)v4 + 11))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](startIndex, "isEqual:"))
      goto LABEL_31;
  }
  endIndex = self->_endIndex;
  if ((unint64_t)endIndex | *((_QWORD *)v4 + 2))
  {
    if (!-[SIRICOMMONUInt32Value isEqual:](endIndex, "isEqual:"))
      goto LABEL_31;
  }
  alternatives = self->_alternatives;
  if ((unint64_t)alternatives | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](alternatives, "isEqual:"))
      goto LABEL_31;
  }
  originEntityId = self->_originEntityId;
  if ((unint64_t)originEntityId | *((_QWORD *)v4 + 7))
  {
    if (!-[SIRICOMMONStringValue isEqual:](originEntityId, "isEqual:"))
      goto LABEL_31;
  }
  payloadAttachmentInfo = self->_payloadAttachmentInfo;
  if ((unint64_t)payloadAttachmentInfo | *((_QWORD *)v4 + 8))
    v16 = -[SIRINLUEXTERNALPayloadAttachmentInfo isEqual:](payloadAttachmentInfo, "isEqual:");
  else
    v16 = 1;
LABEL_32:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_nodeIndex;
  else
    v3 = 0;
  v4 = -[SIRICOMMONStringValue hash](self->_originAppId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_sourceComponent;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[SIRICOMMONStringValue hash](self->_label, "hash");
  v7 = -[SIRINLUEXTERNALMatchInfo hash](self->_matchInfo, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_properties, "hash");
  v9 = v6 ^ v8 ^ -[SIRICOMMONUInt32Value hash](self->_startIndex, "hash");
  v10 = -[SIRICOMMONUInt32Value hash](self->_endIndex, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_alternatives, "hash");
  v12 = v11 ^ -[SIRICOMMONStringValue hash](self->_originEntityId, "hash");
  return v9 ^ v12 ^ -[SIRINLUEXTERNALPayloadAttachmentInfo hash](self->_payloadAttachmentInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  SIRICOMMONStringValue *originAppId;
  uint64_t v7;
  SIRICOMMONStringValue *label;
  uint64_t v9;
  SIRINLUEXTERNALMatchInfo *matchInfo;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  SIRICOMMONUInt32Value *startIndex;
  uint64_t v18;
  SIRICOMMONUInt32Value *endIndex;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  SIRICOMMONStringValue *originEntityId;
  uint64_t v27;
  SIRINLUEXTERNALPayloadAttachmentInfo *payloadAttachmentInfo;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[24] & 1) != 0)
  {
    self->_nodeIndex = v4[10];
    *(_BYTE *)&self->_has |= 1u;
  }
  originAppId = self->_originAppId;
  v7 = *((_QWORD *)v5 + 6);
  if (originAppId)
  {
    if (v7)
      -[SIRICOMMONStringValue mergeFrom:](originAppId, "mergeFrom:");
  }
  else if (v7)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setOriginAppId:](self, "setOriginAppId:");
  }
  if ((*((_BYTE *)v5 + 96) & 2) != 0)
  {
    self->_sourceComponent = *((_DWORD *)v5 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  label = self->_label;
  v9 = *((_QWORD *)v5 + 3);
  if (label)
  {
    if (v9)
      -[SIRICOMMONStringValue mergeFrom:](label, "mergeFrom:");
  }
  else if (v9)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setLabel:](self, "setLabel:");
  }
  matchInfo = self->_matchInfo;
  v11 = *((_QWORD *)v5 + 4);
  if (matchInfo)
  {
    if (v11)
      -[SIRINLUEXTERNALMatchInfo mergeFrom:](matchInfo, "mergeFrom:");
  }
  else if (v11)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setMatchInfo:](self, "setMatchInfo:");
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = *((id *)v5 + 9);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        -[SIRINLUEXTERNALUsoEntitySpan addProperties:](self, "addProperties:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v14);
  }

  startIndex = self->_startIndex;
  v18 = *((_QWORD *)v5 + 11);
  if (startIndex)
  {
    if (v18)
      -[SIRICOMMONUInt32Value mergeFrom:](startIndex, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setStartIndex:](self, "setStartIndex:");
  }
  endIndex = self->_endIndex;
  v20 = *((_QWORD *)v5 + 2);
  if (endIndex)
  {
    if (v20)
      -[SIRICOMMONUInt32Value mergeFrom:](endIndex, "mergeFrom:");
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setEndIndex:](self, "setEndIndex:");
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = *((id *)v5 + 1);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        -[SIRINLUEXTERNALUsoEntitySpan addAlternatives:](self, "addAlternatives:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), (_QWORD)v30);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v23);
  }

  originEntityId = self->_originEntityId;
  v27 = *((_QWORD *)v5 + 7);
  if (originEntityId)
  {
    if (v27)
      -[SIRICOMMONStringValue mergeFrom:](originEntityId, "mergeFrom:");
  }
  else if (v27)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setOriginEntityId:](self, "setOriginEntityId:");
  }
  payloadAttachmentInfo = self->_payloadAttachmentInfo;
  v29 = *((_QWORD *)v5 + 8);
  if (payloadAttachmentInfo)
  {
    if (v29)
      -[SIRINLUEXTERNALPayloadAttachmentInfo mergeFrom:](payloadAttachmentInfo, "mergeFrom:");
  }
  else if (v29)
  {
    -[SIRINLUEXTERNALUsoEntitySpan setPayloadAttachmentInfo:](self, "setPayloadAttachmentInfo:");
  }

}

- (SIRICOMMONStringValue)originAppId
{
  return self->_originAppId;
}

- (void)setOriginAppId:(id)a3
{
  objc_storeStrong((id *)&self->_originAppId, a3);
}

- (SIRICOMMONStringValue)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (SIRINLUEXTERNALMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_matchInfo, a3);
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (SIRICOMMONUInt32Value)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(id)a3
{
  objc_storeStrong((id *)&self->_startIndex, a3);
}

- (SIRICOMMONUInt32Value)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(id)a3
{
  objc_storeStrong((id *)&self->_endIndex, a3);
}

- (NSMutableArray)alternatives
{
  return self->_alternatives;
}

- (void)setAlternatives:(id)a3
{
  objc_storeStrong((id *)&self->_alternatives, a3);
}

- (SIRICOMMONStringValue)originEntityId
{
  return self->_originEntityId;
}

- (void)setOriginEntityId:(id)a3
{
  objc_storeStrong((id *)&self->_originEntityId, a3);
}

- (SIRINLUEXTERNALPayloadAttachmentInfo)payloadAttachmentInfo
{
  return self->_payloadAttachmentInfo;
}

- (void)setPayloadAttachmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_payloadAttachmentInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startIndex, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_payloadAttachmentInfo, 0);
  objc_storeStrong((id *)&self->_originEntityId, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

+ (Class)alternativesType
{
  return (Class)objc_opt_class();
}

@end
