@implementation SFB389NFCPromptConfiguration

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedTitle;
  id v5;

  localizedTitle = self->_localizedTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userMessage, CFSTR("userMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_baUUID, CFSTR("baUUID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_promptState, CFSTR("promptState"));

}

- (SFB389NFCPromptConfiguration)initWithCoder:(id)a3
{
  id v4;
  SFB389NFCPromptConfiguration *v5;
  void *v6;
  uint64_t v7;
  NSString *localizedTitle;
  void *v9;
  uint64_t v10;
  NSString *message;
  void *v12;
  uint64_t v13;
  NSString *phoneNumber;
  void *v15;
  uint64_t v16;
  NSString *userMessage;
  void *v18;
  uint64_t v19;
  NSUUID *baUUID;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFB389NFCPromptConfiguration;
  v5 = -[SFB389NFCPromptConfiguration init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    message = v5->_message;
    v5->_message = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userMessage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    userMessage = v5->_userMessage;
    v5->_userMessage = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baUUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    baUUID = v5->_baUUID;
    v5->_baUUID = (NSUUID *)v19;

    v5->_promptState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("promptState"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SFB389NFCPromptConfiguration *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  unint64_t v37;
  id v38;
  id v40;
  id v41;
  void *v42;
  int v43;
  id v44;
  void *v45;

  v4 = (SFB389NFCPromptConfiguration *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SFB389NFCPromptConfiguration localizedTitle](self, "localizedTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFB389NFCPromptConfiguration localizedTitle](v4, "localizedTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {

      }
      else
      {
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
          v16 = v8;
          v14 = v7;
          goto LABEL_40;
        }
        v10 = objc_msgSend(v7, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      -[SFB389NFCPromptConfiguration message](self, "message");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFB389NFCPromptConfiguration message](v4, "message");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      v15 = v13;
      v16 = v15;
      if (v14 == v15)
      {

      }
      else
      {
        if ((v14 == 0) == (v15 != 0))
        {
          v11 = 0;
          v22 = v15;
          v20 = v14;
          goto LABEL_39;
        }
        v17 = objc_msgSend(v14, "isEqual:", v15);

        if (!v17)
        {
          v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
      }
      -[SFB389NFCPromptConfiguration phoneNumber](self, "phoneNumber");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFB389NFCPromptConfiguration phoneNumber](v4, "phoneNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      v21 = v19;
      v22 = v21;
      if (v20 == v21)
      {

      }
      else
      {
        if ((v20 == 0) == (v21 != 0))
        {
          v11 = 0;
          v28 = v21;
          v26 = v20;
          goto LABEL_38;
        }
        v23 = objc_msgSend(v20, "isEqual:", v21);

        if (!v23)
        {
          v11 = 0;
LABEL_39:

          goto LABEL_40;
        }
      }
      -[SFB389NFCPromptConfiguration userMessage](self, "userMessage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFB389NFCPromptConfiguration userMessage](v4, "userMessage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
      v27 = v25;
      v28 = v27;
      if (v26 == v27)
      {

      }
      else
      {
        if ((v26 == 0) == (v27 != 0))
        {
          v45 = v22;
          v11 = 0;
          v35 = v27;
          v36 = v26;
LABEL_37:

          v22 = v45;
          goto LABEL_38;
        }
        v43 = objc_msgSend(v26, "isEqual:", v27);

        if (!v43)
        {
          v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      v42 = v28;
      v44 = v26;
      -[SFB389NFCPromptConfiguration baUUID](self, "baUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFB389NFCPromptConfiguration baUUID](v4, "baUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v29;
      v32 = v30;
      v45 = v22;
      if (v31 == v32)
      {
        v40 = v32;

        v41 = v31;
      }
      else
      {
        if ((v31 == 0) == (v32 != 0))
        {
          v38 = v32;

          v35 = v38;
          v11 = 0;
          v36 = v31;
          v28 = v42;
          v26 = v44;
          goto LABEL_37;
        }
        v33 = v32;
        v34 = objc_msgSend(v31, "isEqual:", v32);
        v40 = v33;

        v41 = v31;
        if (!v34)
        {
          v11 = 0;
LABEL_35:
          v28 = v42;
          v26 = v44;
          v35 = v40;
          v36 = v41;
          goto LABEL_37;
        }
      }
      v37 = -[SFB389NFCPromptConfiguration promptState](self, "promptState");
      v11 = v37 == -[SFB389NFCPromptConfiguration promptState](v4, "promptState");
      goto LABEL_35;
    }
    v11 = 0;
  }
LABEL_42:

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SFB389NFCPromptConfiguration: %p, localizedTitle: %@, message: \"%@\", userMessage: %@, phoneNumber: %@, baUUID: %@, promptState: %li>"), self, self->_localizedTitle, self->_message, self->_userMessage, self->_phoneNumber, self->_baUUID, self->_promptState);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_opt_new();
  -[SFB389NFCPromptConfiguration localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLocalizedTitle:", v6);

  -[SFB389NFCPromptConfiguration message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setMessage:", v8);

  -[SFB389NFCPromptConfiguration userMessage](self, "userMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setUserMessage:", v10);

  -[SFB389NFCPromptConfiguration phoneNumber](self, "phoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPhoneNumber:", v12);

  -[SFB389NFCPromptConfiguration baUUID](self, "baUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBaUUID:", v14);

  objc_msgSend(v4, "setPromptState:", -[SFB389NFCPromptConfiguration promptState](self, "promptState"));
  return v4;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)userMessage
{
  return self->_userMessage;
}

- (void)setUserMessage:(id)a3
{
  objc_storeStrong((id *)&self->_userMessage, a3);
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_baUUID, a3);
}

- (unint64_t)promptState
{
  return self->_promptState;
}

- (void)setPromptState:(unint64_t)a3
{
  self->_promptState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
