@implementation ATXProactiveSuggestionLayoutConfig

- (id)proto
{
  void *v3;
  unint64_t applicableLayoutType;
  __CFString *v5;
  __CFString *v6;
  int v7;

  v3 = (void *)objc_opt_new();
  applicableLayoutType = self->_applicableLayoutType;
  if (applicableLayoutType >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %li)"), self->_applicableLayoutType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E57CF760[applicableLayoutType];
  }
  v6 = v5;
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_1Row1Column")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_1Row2Columns")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_2Rows2Columns")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_2Rows4Columns")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_1Row4Columns")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_4Rows4Columns")) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("_4Rows8Columns")) & 1) != 0)
  {
    v7 = 7;
  }
  else if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Max")))
  {
    v7 = 8;
  }
  else
  {
    v7 = 0;
  }

  -[ATXPBProactiveSuggestionLayoutConfig setApplicableLayoutType:]((uint64_t)v3, v7);
  return v3;
}

- (ATXProactiveSuggestionLayoutConfig)initWithProto:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  ATXProactiveSuggestionLayoutConfig *v8;
  __CFString *v9;
  uint64_t v10;

  v4 = a3;
  if (!v4)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXProactiveSuggestionUISpecification initWithProto:].cold.1();

    goto LABEL_8;
  }
  v5 = -[ATXPBProactiveSuggestionLayoutConfig applicableLayoutType]((uint64_t)v4);
  if (v5 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E57CF760[(int)v5];
  }
  v9 = v6;
  if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v10 = 0;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_1Row1Column")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_1Row2Columns")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_2Rows2Columns")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_2Rows4Columns")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_1Row4Columns")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_4Rows4Columns")) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("_4Rows8Columns")) & 1) != 0)
  {
    v10 = 7;
  }
  else if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("Max")))
  {
    v10 = 8;
  }
  else
  {
    v10 = 0;
  }

  self = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:](self, "initWithApplicableSuggestionLayout:", v10);
  v8 = self;
LABEL_30:

  return v8;
}

- (ATXProactiveSuggestionLayoutConfig)initWithApplicableSuggestionLayout:(int64_t)a3
{
  ATXProactiveSuggestionLayoutConfig *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXProactiveSuggestionLayoutConfig;
  result = -[ATXProactiveSuggestionLayoutConfig init](&v5, sel_init);
  if (result)
    result->_applicableLayoutType = a3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Layout type: %ld"), self->_applicableLayoutType);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:](+[ATXProactiveSuggestionLayoutConfig allocWithZone:](ATXProactiveSuggestionLayoutConfig, "allocWithZone:", a3), "initWithApplicableSuggestionLayout:", self->_applicableLayoutType);
}

- (unint64_t)hash
{
  return self->_applicableLayoutType;
}

- (BOOL)isEqual:(id)a3
{
  ATXProactiveSuggestionLayoutConfig *v4;
  BOOL v5;

  v4 = (ATXProactiveSuggestionLayoutConfig *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[ATXProactiveSuggestionLayoutConfig applicableLayoutType](v4, "applicableLayoutType") == self->_applicableLayoutType;
  }

  return v5;
}

+ (id)layoutConfigurationsForLayoutOptions:(unint64_t)a3
{
  char v3;
  void *v4;
  ATXProactiveSuggestionLayoutConfig *v5;
  ATXProactiveSuggestionLayoutConfig *v7;
  ATXProactiveSuggestionLayoutConfig *v8;
  ATXProactiveSuggestionLayoutConfig *v9;
  ATXProactiveSuggestionLayoutConfig *v10;
  ATXProactiveSuggestionLayoutConfig *v11;
  ATXProactiveSuggestionLayoutConfig *v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if ((v3 & 2) != 0)
  {
    v7 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 1);
    objc_msgSend(v4, "addObject:", v7);

    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 2);
  objc_msgSend(v4, "addObject:", v8);

  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v9 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 3);
  objc_msgSend(v4, "addObject:", v9);

  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v10 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 4);
  objc_msgSend(v4, "addObject:", v10);

  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    v12 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 6);
    objc_msgSend(v4, "addObject:", v12);

    if ((v3 & 0x80) == 0)
      return v4;
    goto LABEL_8;
  }
LABEL_14:
  v11 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 5);
  objc_msgSend(v4, "addObject:", v11);

  if ((v3 & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if (v3 < 0)
  {
LABEL_8:
    v5 = -[ATXProactiveSuggestionLayoutConfig initWithApplicableSuggestionLayout:]([ATXProactiveSuggestionLayoutConfig alloc], "initWithApplicableSuggestionLayout:", 7);
    objc_msgSend(v4, "addObject:", v5);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXProactiveSuggestionLayoutConfig proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXProactiveSuggestionLayoutConfig)initWithProtoData:(id)a3
{
  id v4;
  ATXPBProactiveSuggestionLayoutConfig *v5;
  ATXProactiveSuggestionLayoutConfig *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBProactiveSuggestionLayoutConfig initWithData:]([ATXPBProactiveSuggestionLayoutConfig alloc], "initWithData:", v4);

    self = -[ATXProactiveSuggestionLayoutConfig initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXProactiveSuggestionLayoutConfig encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXProactiveSuggestionLayoutConfig)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXProactiveSuggestionLayoutConfig *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXProactiveSuggestionLayoutConfig initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (int64_t)applicableLayoutType
{
  return self->_applicableLayoutType;
}

@end
