@implementation TIInputContextEntry

- (TIInputContextEntry)initWithCoder:(id)a3
{
  id v4;
  TIInputContextEntry *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSString *senderIdentifier;
  uint64_t v12;
  NSPersonNameComponents *senderName;
  uint64_t v14;
  NSString *entryIdentifier;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSSet *primaryRecipientIdentifiers;
  uint64_t v21;
  NSSet *secondaryRecipientIdentifiers;
  uint64_t v23;
  NSString *threadIdentifier;
  NSDate *v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSDate *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIInputContextEntry;
  v5 = -[TIInputContextEntry init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    senderIdentifier = v5->_senderIdentifier;
    v5->_senderIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderName"));
    v12 = objc_claimAutoreleasedReturnValue();
    senderName = v5->_senderName;
    v5->_senderName = (NSPersonNameComponents *)v12;

    if (!v5->_senderIdentifier && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v26 = v5->_timestamp;
      *(_DWORD *)buf = 136315394;
      v29 = "-[TIInputContextEntry initWithCoder:]";
      v30 = 2114;
      v31 = v26;
      _os_log_error_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Sender identifier is Nil, timestamp: %{public}@", buf, 0x16u);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    entryIdentifier = v5->_entryIdentifier;
    v5->_entryIdentifier = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("primaryRecipientIdentifiers"));
    v19 = objc_claimAutoreleasedReturnValue();
    primaryRecipientIdentifiers = v5->_primaryRecipientIdentifiers;
    v5->_primaryRecipientIdentifiers = (NSSet *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("secondaryRecipientIdentifiers"));
    v21 = objc_claimAutoreleasedReturnValue();
    secondaryRecipientIdentifiers = v5->_secondaryRecipientIdentifiers;
    v5->_secondaryRecipientIdentifiers = (NSSet *)v21;

    v5->_entryType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("entryType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threadIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    threadIdentifier = v5->_threadIdentifier;
    v5->_threadIdentifier = (NSString *)v23;

  }
  return v5;
}

- (TIInputContextEntry)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIInputContextEntry;
  return -[TIInputContextEntry init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  objc_class *v6;
  void *v7;
  NSDate *timestamp;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  NSDate *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    timestamp = self->_timestamp;
    v9 = 136315650;
    v10 = "-[TIInputContextEntry encodeWithCoder:]";
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = timestamp;
    _os_log_error_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Sender identifier is NOT of NSString class: %{public}@, timestamp: %{public}@", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderIdentifier, CFSTR("senderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderName, CFSTR("senderName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entryIdentifier, CFSTR("entryIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryRecipientIdentifiers, CFSTR("primaryRecipientIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryRecipientIdentifiers, CFSTR("secondaryRecipientIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_entryType, CFSTR("entryType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_threadIdentifier, CFSTR("threadIdentifier"));

}

- (void)enforceMaxContextLength:(unint64_t)a3
{
  NSString *v4;
  NSString *text;

  -[NSString _stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:](self->_text, "_stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  text = self->_text;
  self->_text = v4;

}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setSenderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_senderIdentifier, a3);
}

- (NSString)senderIdentifier
{
  return self->_senderIdentifier;
}

- (void)setEntryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_entryIdentifier, a3);
}

- (NSString)entryIdentifier
{
  return self->_entryIdentifier;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setPrimaryRecipientIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_primaryRecipientIdentifiers, a3);
}

- (NSSet)primaryRecipientIdentifiers
{
  return self->_primaryRecipientIdentifiers;
}

- (void)setSecondaryRecipientIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryRecipientIdentifiers, a3);
}

- (NSSet)secondaryRecipientIdentifiers
{
  return self->_secondaryRecipientIdentifiers;
}

- (void)setSenderName:(id)a3
{
  objc_storeStrong((id *)&self->_senderName, a3);
}

- (NSPersonNameComponents)senderName
{
  return self->_senderName;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(int64_t)a3
{
  self->_entryType = a3;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_threadIdentifier, a3);
}

- (int64_t)compare:(id)a3
{
  id v4;
  NSDate *timestamp;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int64_t v9;
  NSString *senderIdentifier;
  uint64_t v11;
  NSString *threadIdentifier;
  uint64_t v13;
  NSString *text;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  timestamp = self->_timestamp;
  objc_msgSend(v4, "timestamp");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (timestamp)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (v6)
      v9 = -1;
    else
      v9 = 0;
    if (timestamp)
      goto LABEL_26;
  }
  else
  {
    v9 = -[NSDate compare:](timestamp, "compare:", v6);
  }

  if (!v9)
  {
    senderIdentifier = self->_senderIdentifier;
    objc_msgSend(v4, "senderIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v11;
    if (senderIdentifier && v11)
    {
      v9 = -[NSString compare:](senderIdentifier, "compare:", v11);
    }
    else
    {
      if (v11)
        v9 = -1;
      else
        v9 = 0;
      if (senderIdentifier)
        goto LABEL_26;
    }

    if (!v9)
    {
      threadIdentifier = self->_threadIdentifier;
      objc_msgSend(v4, "threadIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v13;
      if (threadIdentifier && v13)
      {
        v9 = -[NSString compare:](threadIdentifier, "compare:", v13);
LABEL_29:

        if (v9)
          goto LABEL_28;
        text = self->_text;
        objc_msgSend(v4, "text");
        v16 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v16;
        if (text && v16)
        {
          v9 = -[NSString compare:](text, "compare:", v16);
        }
        else
        {
          if (v16)
            v17 = -1;
          else
            v17 = 0;
          if (text)
            v9 = 1;
          else
            v9 = v17;
        }
        goto LABEL_27;
      }
      if (v13)
        v9 = -1;
      else
        v9 = 0;
      if (!threadIdentifier)
        goto LABEL_29;
LABEL_26:
      v9 = 1;
LABEL_27:

    }
  }
LABEL_28:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = -[TIInputContextEntry compare:](self, "compare:", v4) == 0;
  else
    v5 = 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_text, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_senderIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSDate copy](self->_timestamp, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSPersonNameComponents copy](self->_senderName, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_entryIdentifier, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSSet copy](self->_primaryRecipientIdentifiers, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[NSSet copy](self->_secondaryRecipientIdentifiers, "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

  v4[8] = self->_entryType;
  v19 = -[NSString copy](self->_threadIdentifier, "copy");
  v20 = (void *)v4[9];
  v4[9] = v19;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputContextEntry text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") != 0;
  -[TIInputContextEntry senderIdentifier](self, "senderIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") != 0;
  -[TIInputContextEntry senderName](self, "senderName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: hasText: %d, hasSenderID: %d, hasName: %d>"), v5, self, v7, v9, v10 != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_primaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_entryIdentifier, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
