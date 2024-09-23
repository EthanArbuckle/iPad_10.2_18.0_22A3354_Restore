@implementation PKPaymentOfferAction

- (PKPaymentOfferAction)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferAction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *actionURL;
  void *v10;
  PKPaymentOfferDynamicContent *v11;
  PKPaymentOfferDynamicContent *dynamicContent;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferAction;
  v5 = -[PKPaymentOfferAction init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("actionURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v8;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("dynamicContent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v11 = -[PKPaymentOfferDynamicContent initWithDictionary:]([PKPaymentOfferDynamicContent alloc], "initWithDictionary:", v10);
      dynamicContent = v5->_dynamicContent;
      v5->_dynamicContent = v11;

    }
  }

  return v5;
}

- (void)populateChallenge:(id)a3 verifier:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *challenge;
  NSString *verifier;
  NSString *v10;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  challenge = self->_challenge;
  self->_challenge = v6;
  v10 = v6;

  verifier = self->_verifier;
  self->_verifier = v7;

}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  -[PKPaymentOfferAction actionURL](self, "actionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionURL"));

  -[PKPaymentOfferDynamicContent dictionaryRepresentation](self->_dynamicContent, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("dynamicContent"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_challenge, CFSTR("challenge"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_verifier, CFSTR("verifier"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (NSURL)actionURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSURL *v8;
  void *v9;
  void *v10;

  if (self->_verifier)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", self->_actionURL, 0);
    objc_msgSend(v3, "queryItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = v7;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("verifier"), self->_verifier);
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(v3, "setQueryItems:", v9);
    objc_msgSend(v3, "URL");
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self->_actionURL;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferAction *v4;
  PKPaymentOfferAction *v5;
  PKPaymentOfferAction *v6;
  NSString *identifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  NSURL *actionURL;
  NSURL *v13;
  PKPaymentOfferDynamicContent *dynamicContent;
  PKPaymentOfferDynamicContent *v15;
  NSString *challenge;
  NSString *v17;
  NSString *verifier;
  NSString *v19;
  NSString *v20;

  v4 = (PKPaymentOfferAction *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9)
            goto LABEL_33;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_34;
        }
        actionURL = self->_actionURL;
        v13 = v6->_actionURL;
        if (actionURL && v13)
        {
          if ((-[NSURL isEqual:](actionURL, "isEqual:") & 1) == 0)
            goto LABEL_26;
        }
        else if (actionURL != v13)
        {
          goto LABEL_26;
        }
        dynamicContent = self->_dynamicContent;
        v15 = v6->_dynamicContent;
        if (dynamicContent && v15)
        {
          if (-[PKPaymentOfferDynamicContent isEqual:](dynamicContent, "isEqual:"))
          {
LABEL_20:
            challenge = v6->_challenge;
            v8 = self->_challenge;
            v17 = challenge;
            if (v8 == v17)
            {

LABEL_28:
              verifier = self->_verifier;
              v19 = v6->_verifier;
              v8 = verifier;
              v20 = v19;
              if (v8 == v20)
              {
                LOBYTE(v11) = 1;
                v10 = v8;
              }
              else
              {
                v10 = v20;
                LOBYTE(v11) = 0;
                if (v8 && v20)
                  LOBYTE(v11) = -[NSString isEqualToString:](v8, "isEqualToString:", v20);
              }
              goto LABEL_33;
            }
            v10 = v17;
            LOBYTE(v11) = 0;
            if (v8 && v17)
            {
              v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v17);

              if (!v11)
                goto LABEL_34;
              goto LABEL_28;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        else if (dynamicContent == v15)
        {
          goto LABEL_20;
        }
LABEL_26:
        LOBYTE(v11) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_35:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_actionURL);
  objc_msgSend(v3, "safelyAddObject:", self->_dynamicContent);
  objc_msgSend(v3, "safelyAddObject:", self->_challenge);
  objc_msgSend(v3, "safelyAddObject:", self->_verifier);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  -[PKPaymentOfferAction actionURL](self, "actionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("actionURL: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("dynamicContent: '%@'; "), self->_dynamicContent);
  objc_msgSend(v3, "appendFormat:", CFSTR("challenge: '%@'; "), self->_challenge);
  objc_msgSend(v3, "appendFormat:", CFSTR("verifier: '%@'; "), self->_verifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferAction)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferAction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *actionURL;
  uint64_t v10;
  PKPaymentOfferDynamicContent *dynamicContent;
  uint64_t v12;
  NSString *challenge;
  uint64_t v14;
  NSString *verifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentOfferAction;
  v5 = -[PKPaymentOfferAction init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dynamicContent"));
    v10 = objc_claimAutoreleasedReturnValue();
    dynamicContent = v5->_dynamicContent;
    v5->_dynamicContent = (PKPaymentOfferDynamicContent *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("challenge"));
    v12 = objc_claimAutoreleasedReturnValue();
    challenge = v5->_challenge;
    v5->_challenge = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    verifier = v5->_verifier;
    v5->_verifier = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicContent, CFSTR("dynamicContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_verifier, CFSTR("verifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferAction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *actionURL;
  PKPaymentOfferDynamicContent *v10;
  PKPaymentOfferDynamicContent *dynamicContent;
  uint64_t v12;
  NSString *challenge;
  uint64_t v14;
  NSString *verifier;

  v5 = -[PKPaymentOfferAction init](+[PKPaymentOfferAction allocWithZone:](PKPaymentOfferAction, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSURL copyWithZone:](self->_actionURL, "copyWithZone:", a3);
  actionURL = v5->_actionURL;
  v5->_actionURL = (NSURL *)v8;

  v10 = -[PKPaymentOfferDynamicContent copyWithZone:](self->_dynamicContent, "copyWithZone:", a3);
  dynamicContent = v5->_dynamicContent;
  v5->_dynamicContent = v10;

  v12 = -[NSString copyWithZone:](self->_challenge, "copyWithZone:", a3);
  challenge = v5->_challenge;
  v5->_challenge = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_verifier, "copyWithZone:", a3);
  verifier = v5->_verifier;
  v5->_verifier = (NSString *)v14;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (NSString)verifier
{
  return self->_verifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
