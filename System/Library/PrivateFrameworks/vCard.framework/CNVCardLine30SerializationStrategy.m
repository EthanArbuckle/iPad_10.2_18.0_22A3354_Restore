@implementation CNVCardLine30SerializationStrategy

- (void)willSerializeValue
{
  self->_startingLineLength = -[CNVCardSerializationStorage currentLength](self->super._storage, "currentLength");
}

- (void)serializeGroupingName:(id)a3
{
  id v4;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
    -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR("%@."), v4);

}

- (void)serializeParameters:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_cn_map:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR(";%@"),
          *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

id __58__CNVCardLine30SerializationStrategy_serializeParameters___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardParameterEncoder encodeParameterValue:](CNVCardParameterEncoder, "encodeParameterValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v2, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((_DWORD)v5)
  {
    v7 = v4;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), v9, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)serializeGroupedLines:(id)a3 withGroupingName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR("%@."), v7);
        objc_msgSend(v12, "serializeWithStrategy:", self);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)serializeString:(id)a3
{
  CNVCardSerializationStorage *storage;
  id v4;

  storage = self->super._storage;
  +[CNVCardValueEncoder encodeValue:](CNVCardValueEncoder, "encodeValue:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNVCardSerializationStorage appendFormat:](storage, "appendFormat:", CFSTR(":%@"), v4);

}

- (void)serializeArray:(id)a3 withItemSeparator:(id)a4
{
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v6 = (__CFString *)a4;
  objc_msgSend(a3, "_cn_map:", &__block_literal_global_98);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v6)
    v8 = v6;
  else
    v8 = CFSTR(";");
  objc_msgSend(v7, "componentsJoinedByString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR(":%@"), v9);

}

id __71__CNVCardLine30SerializationStrategy_serializeArray_withItemSeparator___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNVCardValueEncoder encodeValue:](CNVCardValueEncoder, "encodeValue:", a2);
}

- (void)serializeData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNVCardLine30SerializationStrategy _addAutomagicParametersForData:](self, "_addAutomagicParametersForData:", v4);
  -[CNVCardSerializationStorage appendString:](self->super._storage, "appendString:", CFSTR(":"));
  objc_msgSend(v4, "_cn_encodeVCardBase64DataWithInitialLength:", -[CNVCardSerializationStorage currentLength](self->super._storage, "currentLength") - self->_startingLineLength);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 1);
  -[CNVCardSerializationStorage appendString:](self->super._storage, "appendString:", v5);

}

- (void)_addAutomagicParametersForData:(id)a3
{
  CNVCardSerializationStorage *storage;
  id v5;
  void *v6;
  uint64_t v7;

  storage = self->super._storage;
  v5 = a3;
  -[CNVCardSerializationStorage appendString:](storage, "appendString:", CFSTR(";ENCODING=b"));
  -[CNVCardLine30SerializationStrategy detectedTypeOfData:](self, "detectedTypeOfData:", v5);
  v7 = objc_claimAutoreleasedReturnValue();

  v6 = (void *)v7;
  if (v7)
  {
    -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR(";TYPE=%@"), v7);
    v6 = (void *)v7;
  }

}

- (id)detectedTypeOfData:(id)a3
{
  if (+[CNVCardData isJPEGData:](CNVCardData, "isJPEGData:", a3))
    return CFSTR("JPEG");
  else
    return 0;
}

- (void)serializeVersionPlaceholder
{
  -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR("VERSION:3.0%@"), CNVCardLineDelimiter);
}

@end
