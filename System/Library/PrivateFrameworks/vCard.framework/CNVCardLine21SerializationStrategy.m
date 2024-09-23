@implementation CNVCardLine21SerializationStrategy

+ (id)serializerWithStorage:(id)a3 encodings:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStorage:encodings:", v7, v6);

  return v8;
}

- (CNVCardLine21SerializationStrategy)initWithStorage:(id)a3
{
  id v4;
  void *v5;
  CNVCardLine21SerializationStrategy *v6;

  v4 = a3;
  +[CNVCardEncoding encodingsFromUserDefaults](CNVCardEncoding, "encodingsFromUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNVCardLine21SerializationStrategy initWithStorage:encodings:](self, "initWithStorage:encodings:", v4, v5);

  return v6;
}

- (CNVCardLine21SerializationStrategy)initWithStorage:(id)a3 encodings:(id)a4
{
  id v6;
  CNVCardLine21SerializationStrategy *v7;
  uint64_t v8;
  NSArray *encodings;
  CNVCardLine21SerializationStrategy *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNVCardLine21SerializationStrategy;
  v7 = -[CNVCardLineSerializationStrategyImpl initWithStorage:](&v12, sel_initWithStorage_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    encodings = v7->_encodings;
    v7->_encodings = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
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
  objc_msgSend(a3, "_cn_map:", &__block_literal_global_117);
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

id __58__CNVCardLine21SerializationStrategy_serializeParameters___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardParameterEncoder encodeParameterValue:](CNVCardParameterEncoder, "encodeParameterValue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)serializeString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  CNVCardSerializationStorage *storage;
  void *v8;
  CNVCardSerializationStorage *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[CNVCardLine21SerializationStrategy necessaryEncodingForValue:](self, "necessaryEncodingForValue:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("ASCII"));

  if ((v6 & 1) == 0)
  {
    storage = self->super._storage;
    objc_msgSend(v11, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardSerializationStorage appendFormat:](storage, "appendFormat:", CFSTR(";CHARSET=%@"), v8);

  }
  -[CNVCardSerializationStorage appendString:](self->super._storage, "appendString:", CFSTR(":"));
  v9 = self->super._storage;
  +[CNVCardValueEncoder encodeValue:](CNVCardValueEncoder, "encodeValue:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNVCardSerializationStorage appendString:usingEncoding:](v9, "appendString:usingEncoding:", v10, objc_msgSend(v11, "stringEncoding"));
}

- (void)serializeArray:(id)a3 withItemSeparator:(id)a4
{
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  CNVCardSerializationStorage *storage;
  void *v13;
  __CFString *v14;

  v14 = (__CFString *)a4;
  objc_msgSend(a3, "_cn_map:", &__block_literal_global_122);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v7 = v14;
  else
    v7 = CFSTR(";");
  objc_msgSend(v6, "componentsJoinedByString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardLine21SerializationStrategy necessaryEncodingForValue:](self, "necessaryEncodingForValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ASCII"));

  if ((v11 & 1) == 0)
  {
    storage = self->super._storage;
    objc_msgSend(v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardSerializationStorage appendFormat:](storage, "appendFormat:", CFSTR(";CHARSET=%@"), v13);

  }
  -[CNVCardSerializationStorage appendString:](self->super._storage, "appendString:", CFSTR(":"));
  -[CNVCardSerializationStorage appendString:usingEncoding:](self->super._storage, "appendString:usingEncoding:", v8, objc_msgSend(v9, "stringEncoding"));

}

id __71__CNVCardLine21SerializationStrategy_serializeArray_withItemSeparator___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNVCardValueEncoder encodeValue:](CNVCardValueEncoder, "encodeValue:", a2);
}

- (void)serializeData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNVCardLine21SerializationStrategy _addAutomagicParametersForData:](self, "_addAutomagicParametersForData:", v4);
  -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR(":%@ "), CNVCardLineDelimiter);
  objc_msgSend(v4, "_cn_encodeVCardBase64DataWithInitialLength:", 1);
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
  -[CNVCardSerializationStorage appendString:](storage, "appendString:", CFSTR(";ENCODING=BASE64"));
  -[CNVCardLine21SerializationStrategy detectedTypeOfData:](self, "detectedTypeOfData:", v5);
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

- (id)necessaryEncodingForValue:(id)a3
{
  id v4;
  NSArray *encodings;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  encodings = self->_encodings;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__CNVCardLine21SerializationStrategy_necessaryEncodingForValue___block_invoke;
  v9[3] = &unk_1E956FE30;
  v6 = v4;
  v10 = v6;
  -[NSArray _cn_firstObjectPassingTest:](encodings, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[CNVCardEncoding utf8Encoding](CNVCardEncoding, "utf8Encoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __64__CNVCardLine21SerializationStrategy_necessaryEncodingForValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "canBeConvertedToEncoding:", objc_msgSend(a2, "stringEncoding"));
}

- (void)serializeVersionPlaceholder
{
  -[CNVCardSerializationStorage appendFormat:](self->super._storage, "appendFormat:", CFSTR("VERSION:2.1%@"), CNVCardLineDelimiter);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodings, 0);
}

@end
