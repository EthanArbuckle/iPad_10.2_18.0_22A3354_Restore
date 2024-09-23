@implementation USOEntitySpan

- (USOEntitySpan)init
{
  USOEntitySpan *v2;
  uint64_t v3;
  NSMutableArray *properties;
  uint64_t v5;
  NSMutableArray *alternatives;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)USOEntitySpan;
  v2 = -[USOEntitySpan init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    properties = v2->_properties;
    v2->_properties = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    alternatives = v2->_alternatives;
    v2->_alternatives = (NSMutableArray *)v5;

  }
  return v2;
}

- (USOEntitySpan)initWithOriginAppId:(id)a3 sourceComponent:(unsigned int)a4 label:(id)a5 matchInfo:(id)a6 properties:(id)a7 startIndex:(unsigned int)a8 endIndex:(unsigned int)a9 alternatives:(id)a10 originEntityId:(id)a11
{
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  USOEntitySpan *v20;
  USOEntitySpan *v21;
  uint64_t v22;
  NSNumber *sourceComponent;
  uint64_t v24;
  NSMutableArray *properties;
  uint64_t v26;
  NSNumber *startIndex;
  uint64_t v28;
  NSNumber *endIndex;
  uint64_t v30;
  NSMutableArray *alternatives;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v14 = *(_QWORD *)&a4;
  v36 = a3;
  v35 = a5;
  v34 = a6;
  v17 = a7;
  v18 = a10;
  v19 = a11;
  v37.receiver = self;
  v37.super_class = (Class)USOEntitySpan;
  v20 = -[USOEntitySpan init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_originAppId, a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    v22 = objc_claimAutoreleasedReturnValue();
    sourceComponent = v21->_sourceComponent;
    v21->_sourceComponent = (NSNumber *)v22;

    objc_storeStrong((id *)&v21->_label, a5);
    objc_storeStrong((id *)&v21->_matchInfo, a6);
    if (v17)
    {
      v24 = objc_msgSend(v17, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    properties = v21->_properties;
    v21->_properties = (NSMutableArray *)v24;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a8);
    v26 = objc_claimAutoreleasedReturnValue();
    startIndex = v21->_startIndex;
    v21->_startIndex = (NSNumber *)v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a9);
    v28 = objc_claimAutoreleasedReturnValue();
    endIndex = v21->_endIndex;
    v21->_endIndex = (NSNumber *)v28;

    if (v18)
    {
      v30 = objc_msgSend(v18, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    alternatives = v21->_alternatives;
    v21->_alternatives = (NSMutableArray *)v30;

    objc_storeStrong((id *)&v21->_originEntityId, a11);
  }

  return v21;
}

- (void)addSpanProperty:(id)a3
{
  -[NSMutableArray addObject:](self->_properties, "addObject:", a3);
}

- (void)addAlternative:(id)a3
{
  -[NSMutableArray addObject:](self->_alternatives, "addObject:", a3);
}

- (USOEntitySpan)initWithCoder:(id)a3
{
  id v4;
  USOEntitySpan *v5;
  uint64_t v6;
  NSString *originAppId;
  uint64_t v8;
  NSNumber *sourceComponent;
  uint64_t v10;
  NSString *label;
  uint64_t v12;
  USOMatchInfo *matchInfo;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *properties;
  uint64_t v19;
  NSNumber *startIndex;
  uint64_t v21;
  NSNumber *endIndex;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *alternatives;
  uint64_t v28;
  NSString *originEntityId;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)USOEntitySpan;
  v5 = -[USOEntitySpan init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originAppId"));
    v6 = objc_claimAutoreleasedReturnValue();
    originAppId = v5->_originAppId;
    v5->_originAppId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceComponent"));
    v8 = objc_claimAutoreleasedReturnValue();
    sourceComponent = v5->_sourceComponent;
    v5->_sourceComponent = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v10 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchInfo"));
    v12 = objc_claimAutoreleasedReturnValue();
    matchInfo = v5->_matchInfo;
    v5->_matchInfo = (USOMatchInfo *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("properties"));
    v17 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSMutableArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startIndex"));
    v19 = objc_claimAutoreleasedReturnValue();
    startIndex = v5->_startIndex;
    v5->_startIndex = (NSNumber *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endIndex"));
    v21 = objc_claimAutoreleasedReturnValue();
    endIndex = v5->_endIndex;
    v5->_endIndex = (NSNumber *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("alternatives"));
    v26 = objc_claimAutoreleasedReturnValue();
    alternatives = v5->_alternatives;
    v5->_alternatives = (NSMutableArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originEntityId"));
    v28 = objc_claimAutoreleasedReturnValue();
    originEntityId = v5->_originEntityId;
    v5->_originEntityId = (NSString *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[USOEntitySpan originAppId](self, "originAppId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("originAppId"));

  -[USOEntitySpan sourceComponent](self, "sourceComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceComponent"));

  -[USOEntitySpan label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("label"));

  -[USOEntitySpan matchInfo](self, "matchInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("matchInfo"));

  -[USOEntitySpan properties](self, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("properties"));

  -[USOEntitySpan startIndex](self, "startIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("startIndex"));

  -[USOEntitySpan endIndex](self, "endIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("endIndex"));

  -[USOEntitySpan alternatives](self, "alternatives");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("alternatives"));

  -[USOEntitySpan originEntityId](self, "originEntityId");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("originEntityId"));

}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (void)setOriginAppId:(id)a3
{
  objc_storeStrong((id *)&self->_originAppId, a3);
}

- (NSNumber)sourceComponent
{
  return self->_sourceComponent;
}

- (void)setSourceComponent:(id)a3
{
  objc_storeStrong((id *)&self->_sourceComponent, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (USOMatchInfo)matchInfo
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

- (NSNumber)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(id)a3
{
  objc_storeStrong((id *)&self->_startIndex, a3);
}

- (NSNumber)endIndex
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

- (NSString)originEntityId
{
  return self->_originEntityId;
}

- (void)setOriginEntityId:(id)a3
{
  objc_storeStrong((id *)&self->_originEntityId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originEntityId, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_endIndex, 0);
  objc_storeStrong((id *)&self->_startIndex, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_sourceComponent, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
