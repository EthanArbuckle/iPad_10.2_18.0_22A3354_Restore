@implementation _SFPBIndexState

- (_SFPBIndexState)initWithFacade:(id)a3
{
  id v4;
  _SFPBIndexState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _SFPBIndexState *v16;

  v4 = a3;
  v5 = -[_SFPBIndexState init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "percentMessagesIndexed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "percentMessagesIndexed");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBIndexState setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", objc_msgSend(v7, "intValue"));

    }
    objc_msgSend(v4, "percentAttachmentsIndexed");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "percentAttachmentsIndexed");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBIndexState setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", objc_msgSend(v9, "intValue"));

    }
    objc_msgSend(v4, "searchIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "searchIndex");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBIndexState setSearchIndex:](v5, "setSearchIndex:", objc_msgSend(v11, "intValue"));

    }
    objc_msgSend(v4, "totalMessageCount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "totalMessageCount");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBIndexState setTotalMessageCount:](v5, "setTotalMessageCount:", objc_msgSend(v13, "intValue"));

    }
    objc_msgSend(v4, "indexedMessageCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "indexedMessageCount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBIndexState setIndexedMessageCount:](v5, "setIndexedMessageCount:", objc_msgSend(v15, "intValue"));

    }
    v16 = v5;
  }

  return v5;
}

- (void)setPercentMessagesIndexed:(int)a3
{
  self->_percentMessagesIndexed = a3;
}

- (void)setPercentAttachmentsIndexed:(int)a3
{
  self->_percentAttachmentsIndexed = a3;
}

- (void)setSearchIndex:(int)a3
{
  self->_searchIndex = a3;
}

- (void)setTotalMessageCount:(int)a3
{
  self->_totalMessageCount = a3;
}

- (void)setIndexedMessageCount:(int)a3
{
  self->_indexedMessageCount = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBIndexStateReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[_SFPBIndexState percentMessagesIndexed](self, "percentMessagesIndexed"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBIndexState searchIndex](self, "searchIndex"))
    PBDataWriterWriteInt32Field();
  if (-[_SFPBIndexState totalMessageCount](self, "totalMessageCount"))
    PBDataWriterWriteInt32Field();
  v4 = -[_SFPBIndexState indexedMessageCount](self, "indexedMessageCount");
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int percentMessagesIndexed;
  int percentAttachmentsIndexed;
  int searchIndex;
  int totalMessageCount;
  int indexedMessageCount;
  BOOL v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (percentMessagesIndexed = self->_percentMessagesIndexed,
        percentMessagesIndexed == objc_msgSend(v4, "percentMessagesIndexed"))
    && (percentAttachmentsIndexed = self->_percentAttachmentsIndexed,
        percentAttachmentsIndexed == objc_msgSend(v4, "percentAttachmentsIndexed"))
    && (searchIndex = self->_searchIndex, searchIndex == objc_msgSend(v4, "searchIndex"))
    && (totalMessageCount = self->_totalMessageCount,
        totalMessageCount == objc_msgSend(v4, "totalMessageCount")))
  {
    indexedMessageCount = self->_indexedMessageCount;
    v10 = indexedMessageCount == objc_msgSend(v4, "indexedMessageCount");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (2654435761 * self->_percentAttachmentsIndexed) ^ (2654435761 * self->_percentMessagesIndexed) ^ (2654435761 * self->_searchIndex) ^ (2654435761 * self->_totalMessageCount) ^ (2654435761 * self->_indexedMessageCount);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_indexedMessageCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBIndexState indexedMessageCount](self, "indexedMessageCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("indexedMessageCount"));

  }
  if (self->_percentAttachmentsIndexed)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("percentAttachmentsIndexed"));

  }
  if (self->_percentMessagesIndexed)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBIndexState percentMessagesIndexed](self, "percentMessagesIndexed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("percentMessagesIndexed"));

  }
  if (self->_searchIndex)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBIndexState searchIndex](self, "searchIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("searchIndex"));

  }
  if (self->_totalMessageCount)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_SFPBIndexState totalMessageCount](self, "totalMessageCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("totalMessageCount"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBIndexState dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBIndexState)initWithJSON:(id)a3
{
  void *v4;
  _SFPBIndexState *v5;
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
    self = -[_SFPBIndexState initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBIndexState)initWithDictionary:(id)a3
{
  id v4;
  _SFPBIndexState *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _SFPBIndexState *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBIndexState;
  v5 = -[_SFPBIndexState init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("percentMessagesIndexed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBIndexState setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("percentAttachmentsIndexed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBIndexState setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", objc_msgSend(v7, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBIndexState setSearchIndex:](v5, "setSearchIndex:", objc_msgSend(v8, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalMessageCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBIndexState setTotalMessageCount:](v5, "setTotalMessageCount:", objc_msgSend(v9, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("indexedMessageCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBIndexState setIndexedMessageCount:](v5, "setIndexedMessageCount:", objc_msgSend(v10, "intValue"));
    v11 = v5;

  }
  return v5;
}

- (int)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (int)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (int)searchIndex
{
  return self->_searchIndex;
}

- (int)totalMessageCount
{
  return self->_totalMessageCount;
}

- (int)indexedMessageCount
{
  return self->_indexedMessageCount;
}

@end
