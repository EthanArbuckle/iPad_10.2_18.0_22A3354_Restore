@implementation _PSAutocompleteSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 displayName:(id)a4 handle:(id)a5 contactIdentifier:(id)a6 resultSourceType:(unint64_t)a7 autocompleteResult:(id)a8
{
  return -[_PSAutocompleteSuggestion initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:recipients:](self, "initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:recipients:", a3, 0, a4, a5, a6, a7, a8, 0);
}

- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 chatHandles:(id)a4 displayName:(id)a5 handle:(id)a6 contactIdentifier:(id)a7 resultSourceType:(unint64_t)a8 autocompleteResult:(id)a9
{
  return -[_PSAutocompleteSuggestion initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:recipients:](self, "initWithChatGuid:chatHandles:displayName:handle:contactIdentifier:resultSourceType:autocompleteResult:recipients:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (_PSAutocompleteSuggestion)initWithChatGuid:(id)a3 chatHandles:(id)a4 displayName:(id)a5 handle:(id)a6 contactIdentifier:(id)a7 resultSourceType:(unint64_t)a8 autocompleteResult:(id)a9 recipients:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _PSAutocompleteSuggestion *v22;
  uint64_t v23;
  NSString *chatGuid;
  uint64_t v25;
  NSArray *chatHandles;
  uint64_t v27;
  NSString *displayName;
  uint64_t v29;
  NSString *handle;
  uint64_t v31;
  NSString *contactIdentifier;
  uint64_t v33;
  NSArray *recipients;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)_PSAutocompleteSuggestion;
  v22 = -[_PSAutocompleteSuggestion init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    chatGuid = v22->_chatGuid;
    v22->_chatGuid = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    chatHandles = v22->_chatHandles;
    v22->_chatHandles = (NSArray *)v25;

    v27 = objc_msgSend(v18, "copy");
    displayName = v22->_displayName;
    v22->_displayName = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    handle = v22->_handle;
    v22->_handle = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    contactIdentifier = v22->_contactIdentifier;
    v22->_contactIdentifier = (NSString *)v31;

    v22->_resultSourceType = a8;
    v33 = objc_msgSend(v21, "copy");
    recipients = v22->_recipients;
    v22->_recipients = (NSArray *)v33;

  }
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v5 = v4;
  -[_PSAutocompleteSuggestion chatGuid](self, "chatGuid");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
LABEL_7:
    objc_msgSend(v5, "handle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSAutocompleteSuggestion handle](self, "handle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_8;
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "chatGuid");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_7;
  }
  v9 = (void *)v8;
  objc_msgSend(v5, "chatGuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAutocompleteSuggestion chatGuid](self, "chatGuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
    goto LABEL_7;

LABEL_8:
  v16 = 1;
LABEL_10:

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[_PSAutocompleteSuggestion chatGuid](self, "chatGuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[_PSAutocompleteSuggestion chatGuid](self, "chatGuid");
  else
    -[_PSAutocompleteSuggestion handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (_PSAutocompleteSuggestion)initWithCoder:(id)a3
{
  id v4;
  _PSAutocompleteSuggestion *v5;
  uint64_t v6;
  NSString *handle;
  uint64_t v8;
  NSString *chatGuid;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *chatHandles;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSString *contactIdentifier;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *recipients;
  _PSAutocompleteSuggestion *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_PSAutocompleteSuggestion;
  v5 = -[_PSAutocompleteSuggestion init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chatGuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    chatGuid = v5->_chatGuid;
    v5->_chatGuid = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("chatHandles"));
    v13 = objc_claimAutoreleasedReturnValue();
    chatHandles = v5->_chatHandles;
    v5->_chatHandles = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v15 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v17;

    v5->_resultSourceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultSourceType"));
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("recipients"));
    v22 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *handle;
  id v5;

  handle = self->_handle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", handle, CFSTR("handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chatGuid, CFSTR("chatGuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chatHandles, CFSTR("chatHandles"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resultSourceType, CFSTR("resultSourceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_PSAutocompleteSuggestion chatGuid](self, "chatGuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAutocompleteSuggestion chatHandles](self, "chatHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAutocompleteSuggestion handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAutocompleteSuggestion displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSAutocompleteSuggestion contactIdentifier](self, "contactIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> chatGuid: %@, chatHandles: %@, handle: %@, displayName: %@, contactIdentifier: %@"), v4, self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)chatGuid
{
  return self->_chatGuid;
}

- (NSArray)chatHandles
{
  return self->_chatHandles;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)resultSourceType
{
  return self->_resultSourceType;
}

- (void)setResultSourceType:(unint64_t)a3
{
  self->_resultSourceType = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_chatHandles, 0);
  objc_storeStrong((id *)&self->_chatGuid, 0);
}

@end
