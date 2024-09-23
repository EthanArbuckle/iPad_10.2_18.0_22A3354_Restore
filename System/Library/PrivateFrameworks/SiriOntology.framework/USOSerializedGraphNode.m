@implementation USOSerializedGraphNode

- (USOSerializedGraphNode)initWithUsoElementId:(int)a3
{
  self->_usoElementId = a3;
  return self;
}

- (USOSerializedGraphNode)initWithCoder:(id)a3
{
  id v4;
  USOSerializedGraphNode *v5;
  NSNumber *v6;
  NSNumber *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSNumber *usoVerbId;
  NSNumber *v15;
  NSNumber *integerPayload;
  NSNumber *v17;
  NSString *stringPayload;
  NSString *v19;
  NSString *entityLabel;
  NSString *v21;
  NSString *verbLabel;
  NSString *v23;
  NSArray *normalizedStringPayloads;
  USOSerializedGraphNode *v25;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)USOSerializedGraphNode;
  v5 = -[USOSerializedGraphNode init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usoElementId"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usoVerbId"));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("integerPayload"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringPayload"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityLabel"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verbLabel"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("normalizedStringPayloads"));
    v13 = objc_claimAutoreleasedReturnValue();
    v5->_usoElementId = objc_msgSend(v28, "intValue");
    usoVerbId = v5->_usoVerbId;
    v5->_usoVerbId = v6;
    v15 = v6;

    integerPayload = v5->_integerPayload;
    v5->_integerPayload = v7;
    v17 = v7;

    stringPayload = v5->_stringPayload;
    v5->_stringPayload = v8;
    v19 = v8;

    entityLabel = v5->_entityLabel;
    v5->_entityLabel = v9;
    v21 = v9;

    verbLabel = v5->_verbLabel;
    v5->_verbLabel = v10;
    v23 = v10;

    normalizedStringPayloads = v5->_normalizedStringPayloads;
    v5->_normalizedStringPayloads = (NSArray *)v13;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[USOSerializedGraphNode usoElementId](self, "usoElementId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("usoElementId"));

  -[USOSerializedGraphNode usoVerbId](self, "usoVerbId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("usoVerbId"));

  -[USOSerializedGraphNode integerPayload](self, "integerPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("integerPayload"));

  -[USOSerializedGraphNode stringPayload](self, "stringPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("stringPayload"));

  -[USOSerializedGraphNode entityLabel](self, "entityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("entityLabel"));

  -[USOSerializedGraphNode verbLabel](self, "verbLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("verbLabel"));

  -[USOSerializedGraphNode normalizedStringPayloads](self, "normalizedStringPayloads");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("normalizedStringPayloads"));

}

- (int)usoElementId
{
  return self->_usoElementId;
}

- (void)setUsoElementId:(int)a3
{
  self->_usoElementId = a3;
}

- (NSNumber)usoVerbId
{
  return self->_usoVerbId;
}

- (void)setUsoVerbId:(id)a3
{
  objc_storeStrong((id *)&self->_usoVerbId, a3);
}

- (NSNumber)integerPayload
{
  return self->_integerPayload;
}

- (void)setIntegerPayload:(id)a3
{
  objc_storeStrong((id *)&self->_integerPayload, a3);
}

- (NSString)stringPayload
{
  return self->_stringPayload;
}

- (void)setStringPayload:(id)a3
{
  objc_storeStrong((id *)&self->_stringPayload, a3);
}

- (NSString)entityLabel
{
  return self->_entityLabel;
}

- (void)setEntityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_entityLabel, a3);
}

- (NSString)verbLabel
{
  return self->_verbLabel;
}

- (void)setVerbLabel:(id)a3
{
  objc_storeStrong((id *)&self->_verbLabel, a3);
}

- (NSArray)normalizedStringPayloads
{
  return self->_normalizedStringPayloads;
}

- (void)setNormalizedStringPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedStringPayloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStringPayloads, 0);
  objc_storeStrong((id *)&self->_verbLabel, 0);
  objc_storeStrong((id *)&self->_entityLabel, 0);
  objc_storeStrong((id *)&self->_stringPayload, 0);
  objc_storeStrong((id *)&self->_integerPayload, 0);
  objc_storeStrong((id *)&self->_usoVerbId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
