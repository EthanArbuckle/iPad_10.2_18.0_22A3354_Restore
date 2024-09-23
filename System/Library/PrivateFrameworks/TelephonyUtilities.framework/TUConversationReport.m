@implementation TUConversationReport

- (TUConversationReport)init
{
  void *v3;
  void *v4;
  void *v5;
  TUConversationReport *v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUConversationReport initWithConversationID:padding:timebase:](self, "initWithConversationID:padding:timebase:", v3, v4, v5);

  return v6;
}

- (TUConversationReport)initWithConversationID:(id)a3 padding:(id)a4 timebase:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUConversationReport *v12;
  TUConversationReport *v13;
  NSUUID *v14;
  NSUUID *paddingForHashedValue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUConversationReport;
  v12 = -[TUConversationReport init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timebase, a5);
    objc_storeStrong((id *)&v13->_conversationID, a3);
    if (v10)
    {
      v14 = (NSUUID *)v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    paddingForHashedValue = v13->_paddingForHashedValue;
    v13->_paddingForHashedValue = v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationReport timebase](self, "timebase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" timebase=%@"), v4);

  -[TUConversationReport conversationID](self, "conversationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" conversationID=%@"), v5);

  -[TUConversationReport paddingForHashedValue](self, "paddingForHashedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" paddingForHashedValue=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUConversationReport isEqualToConversationReport:](self, "isEqualToConversationReport:", v4);

  return v5;
}

- (BOOL)isEqualToConversationReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[TUConversationReport conversationID](self, "conversationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationReport timebase](self, "timebase");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timebase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDate:", v8))
    {
      -[TUConversationReport paddingForHashedValue](self, "paddingForHashedValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "paddingForHashedValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TUConversationReport conversationID](self, "conversationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationReport timebase](self, "timebase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationReport conversationID](self, "conversationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationReport paddingForHashedValue](self, "paddingForHashedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationReport timebase](self, "timebase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithConversationID:padding:timebase:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationReport)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  TUConversationReport *v17;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_conversationID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_paddingForHashedValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = objc_opt_class();
  NSStringFromSelector(sel_timebase);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[TUConversationReport initWithConversationID:padding:timebase:](self, "initWithConversationID:padding:timebase:", v7, v13, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TUConversationReport conversationID](self, "conversationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_conversationID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationReport paddingForHashedValue](self, "paddingForHashedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_paddingForHashedValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationReport timebase](self, "timebase");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_timebase);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (unint64_t)hashForParticipantIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = 0;
  -[TUConversationReport paddingForHashedValue](self, "paddingForHashedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getUUIDBytes:", v7);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, 16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = IDSIDAliasHashUInt64();

  return v5;
}

- (NSDate)timebase
{
  return self->_timebase;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (NSUUID)paddingForHashedValue
{
  return self->_paddingForHashedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingForHashedValue, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_timebase, 0);
}

@end
