@implementation CNVCardLineSerializationStrategy

+ (id)version30StrategyWithStringStorage:(id)a3
{
  void *v3;
  void *v4;

  +[CNVCardSerializationStorage storageWithString:](CNVCardSerializationStorage, "storageWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardLineSerializationStrategyImpl serializerWithStorage:](CNVCardLine30SerializationStrategy, "serializerWithStorage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)version21StrategyWithStringStorage:(id)a3 encodings:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  +[CNVCardSerializationStorage storageWithString:](CNVCardSerializationStorage, "storageWithString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    +[CNVCardEncoding standardEncodings](CNVCardEncoding, "standardEncodings");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  +[CNVCardLine21SerializationStrategy serializerWithStorage:encodings:](CNVCardLine21SerializationStrategy, "serializerWithStorage:encodings:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)version30StrategyWithDataStorage:(id)a3
{
  void *v3;
  void *v4;

  +[CNVCardSerializationStorage storageWithData:](CNVCardSerializationStorage, "storageWithData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardLineSerializationStrategyImpl serializerWithStorage:](CNVCardLine30SerializationStrategy, "serializerWithStorage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)version21StrategyWithDataStorage:(id)a3 encodings:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  +[CNVCardSerializationStorage storageWithData:](CNVCardSerializationStorage, "storageWithData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    +[CNVCardEncoding standardEncodings](CNVCardEncoding, "standardEncodings");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  +[CNVCardLine21SerializationStrategy serializerWithStorage:encodings:](CNVCardLine21SerializationStrategy, "serializerWithStorage:encodings:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
