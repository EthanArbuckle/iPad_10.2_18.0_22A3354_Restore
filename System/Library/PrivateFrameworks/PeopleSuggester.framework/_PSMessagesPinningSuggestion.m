@implementation _PSMessagesPinningSuggestion

- (_PSMessagesPinningSuggestion)initWithChatGuid:(id)a3
{
  id v5;
  _PSMessagesPinningSuggestion *v6;
  _PSMessagesPinningSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSMessagesPinningSuggestion;
  v6 = -[_PSMessagesPinningSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_chatGuid, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_chatGuid, CFSTR("chatGuid"));
}

- (_PSMessagesPinningSuggestion)initWithCoder:(id)a3
{
  id v4;
  _PSMessagesPinningSuggestion *v5;
  uint64_t v6;
  NSString *chatGuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSMessagesPinningSuggestion;
  v5 = -[_PSMessagesPinningSuggestion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chatGuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    chatGuid = v5->_chatGuid;
    v5->_chatGuid = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_chatGuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _PSMessagesPinningSuggestion *v4;
  _PSMessagesPinningSuggestion *v5;
  _PSMessagesPinningSuggestion *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (_PSMessagesPinningSuggestion *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_PSMessagesPinningSuggestion chatGuid](self, "chatGuid");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          -[_PSMessagesPinningSuggestion chatGuid](v6, "chatGuid"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      -[_PSMessagesPinningSuggestion chatGuid](self, "chatGuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSMessagesPinningSuggestion chatGuid](v6, "chatGuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PSMessagesPinningSuggestion chatGuid](self, "chatGuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> chatGuid: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)chatGuid
{
  return self->_chatGuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatGuid, 0);
}

@end
