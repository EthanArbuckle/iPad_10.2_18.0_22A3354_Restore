@implementation CNVCardLineSerializationStrategyImpl

+ (id)serializerWithStorage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStorage:", v4);

  return v5;
}

- (CNVCardLineSerializationStrategyImpl)initWithStorage:(id)a3
{
  id v5;
  CNVCardLineSerializationStrategyImpl *v6;
  CNVCardLineSerializationStrategyImpl *v7;
  CNVCardLineSerializationStrategyImpl *v8;

  v5 = a3;
  v6 = -[CNVCardLineSerializationStrategyImpl init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
    v8 = v7;
  }

  return v7;
}

- (void)serializeLine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "canSerializeWithStrategy:", self))
  {
    -[CNVCardLineSerializationStrategyImpl willSerializeValue](self, "willSerializeValue");
    objc_msgSend(v9, "groupingName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardLineSerializationStrategyImpl serializeGroupingName:](self, "serializeGroupingName:", v4);

    objc_msgSend(v9, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardLineSerializationStrategyImpl serializeName:](self, "serializeName:", v5);

    objc_msgSend(v9, "parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardLineSerializationStrategyImpl serializeParameters:](self, "serializeParameters:", v6);

    objc_msgSend(v9, "serializeValueWithStrategy:", self);
    -[CNVCardSerializationStorage appendString:](self->_storage, "appendString:", CNVCardLineDelimiter);
    objc_msgSend(v9, "groupedLines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupingName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardLineSerializationStrategyImpl serializeGroupedLines:withGroupingName:](self, "serializeGroupedLines:withGroupingName:", v7, v8);

  }
}

- (void)serializeName:(id)a3
{
  -[CNVCardSerializationStorage appendString:](self->_storage, "appendString:", a3);
}

- (BOOL)canSerializeString:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (BOOL)canSerializeArray:(id)a3
{
  return objc_msgSend(a3, "count") != 0;
}

- (BOOL)canSerializeData:(id)a3
{
  return objc_msgSend(a3, "length") != 0;
}

- (void)serializeOpaqueValue:(id)a3
{
  id v4;

  v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13818] + 16))() & 1) == 0)
  {
    -[CNVCardSerializationStorage appendData:](self->_storage, "appendData:", v4);
    -[CNVCardSerializationStorage appendString:](self->_storage, "appendString:", CNVCardLineDelimiter);
  }

}

- (id)insertionMarker
{
  return (id)-[CNVCardSerializationStorage insertionMarker](self->_storage, "insertionMarker");
}

- (unint64_t)estimatedDataLength
{
  return -[CNVCardSerializationStorage estimatedDataLength](self->_storage, "estimatedDataLength");
}

- (void)insertLine:(id)a3 atMarker:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0CB37A0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "string");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[CNVCardSerializationStorage storageWithString:](CNVCardSerializationStorage, "storageWithString:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStorage:", v9);
  objc_msgSend(v8, "serializeWithStrategy:", v10);

  -[CNVCardSerializationStorage insertString:atMarker:](self->_storage, "insertString:atMarker:", v11, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
