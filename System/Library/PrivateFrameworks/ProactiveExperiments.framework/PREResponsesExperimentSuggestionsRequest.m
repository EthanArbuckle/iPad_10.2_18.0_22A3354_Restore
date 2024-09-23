@implementation PREResponsesExperimentSuggestionsRequest

- (PREResponsesExperimentSuggestionsRequest)initWithReceivedMessages:(id)a3
{
  id v4;
  PREResponsesExperimentSuggestionsRequest *v5;
  uint64_t v6;
  NSArray *receivedMessages;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREResponsesExperimentSuggestionsRequest;
  v5 = -[PREResponsesExperimentSuggestionsRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    receivedMessages = v5->_receivedMessages;
    v5->_receivedMessages = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *receivedMessages;
  id v5;

  receivedMessages = self->_receivedMessages;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", receivedMessages, CFSTR("receivedMessages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderMessages, CFSTR("senderMessages"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("recipients"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("context"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageCode, CFSTR("languageCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_includesDynamicSuggestions, CFSTR("includeDynamicSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestDate, CFSTR("requestDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageLastChangedDate, CFSTR("languageLastChangedDate"));

}

- (PREResponsesExperimentSuggestionsRequest)initWithCoder:(id)a3
{
  id v4;
  PREResponsesExperimentSuggestionsRequest *v5;
  uint64_t v6;
  NSArray *receivedMessages;
  uint64_t v8;
  NSArray *senderMessages;
  void *v10;
  id v11;
  uint64_t v12;
  NSArray *recipients;
  void *v14;
  uint64_t v15;
  NSString *context;
  void *v17;
  uint64_t v18;
  NSString *languageCode;
  uint64_t v20;
  NSDate *requestDate;
  uint64_t v22;
  NSDate *languageLastChangedDate;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v5 = -[PREResponsesExperimentSuggestionsRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("receivedMessages"));
    v6 = objc_claimAutoreleasedReturnValue();
    receivedMessages = v5->_receivedMessages;
    v5->_receivedMessages = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("senderMessages"));
    v8 = objc_claimAutoreleasedReturnValue();
    senderMessages = v5->_senderMessages;
    v5->_senderMessages = (NSArray *)v8;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v10 = (void *)getCKEntityClass_softClass;
    v29 = getCKEntityClass_softClass;
    if (!getCKEntityClass_softClass)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __getCKEntityClass_block_invoke;
      v25[3] = &unk_1E7D9E670;
      v25[4] = &v26;
      __getCKEntityClass_block_invoke((uint64_t)v25);
      v10 = (void *)v27[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v11, CFSTR("recipients"));
    v12 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    context = v5->_context;
    v5->_context = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("languageCode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v18;

    v5->_includesDynamicSuggestions = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeDynamicSuggestions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestDate"));
    v20 = objc_claimAutoreleasedReturnValue();
    requestDate = v5->_requestDate;
    v5->_requestDate = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("languageLastChangedDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    languageLastChangedDate = v5->_languageLastChangedDate;
    v5->_languageLastChangedDate = (NSDate *)v22;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PREResponsesExperimentSuggestionsRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[PREResponsesExperimentSuggestionsRequest initWithReceivedMessages:]([PREResponsesExperimentSuggestionsRequest alloc], "initWithReceivedMessages:", self->_receivedMessages);
  v5 = (void *)-[NSArray copy](self->_senderMessages, "copy");
  -[PREResponsesExperimentSuggestionsRequest setSenderMessages:](v4, "setSenderMessages:", v5);

  v6 = (void *)-[NSArray copy](self->_recipients, "copy");
  -[PREResponsesExperimentSuggestionsRequest setRecipients:](v4, "setRecipients:", v6);

  v7 = (void *)-[NSString copy](self->_context, "copy");
  -[PREResponsesExperimentSuggestionsRequest setContext:](v4, "setContext:", v7);

  v8 = (void *)-[NSString copy](self->_languageCode, "copy");
  -[PREResponsesExperimentSuggestionsRequest setLanguageCode:](v4, "setLanguageCode:", v8);

  -[PREResponsesExperimentSuggestionsRequest setIncludesDynamicSuggestions:](v4, "setIncludesDynamicSuggestions:", self->_includesDynamicSuggestions);
  v9 = (void *)-[NSDate copy](self->_requestDate, "copy");
  -[PREResponsesExperimentSuggestionsRequest setRequestDate:](v4, "setRequestDate:", v9);

  v10 = (void *)-[NSDate copy](self->_languageLastChangedDate, "copy");
  -[PREResponsesExperimentSuggestionsRequest setLanguageLastChangedDate:](v4, "setLanguageLastChangedDate:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PREResponsesExperimentSuggestionsRequest *v4;
  uint64_t v5;
  char v6;
  PREResponsesExperimentSuggestionsRequest *v7;
  unint64_t v8;
  NSArray *receivedMessages;
  void *v10;
  NSArray *senderMessages;
  void *v12;
  NSArray *recipients;
  void *v14;
  NSString *context;
  void *v16;
  NSString *languageCode;
  void *v18;
  _BOOL4 includesDynamicSuggestions;
  NSDate *requestDate;
  void *v21;
  NSDate *languageLastChangedDate;
  void *v23;

  v4 = (PREResponsesExperimentSuggestionsRequest *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = -[PREResponsesExperimentSuggestionsRequest hash](self, "hash");
      if (v8 == -[PREResponsesExperimentSuggestionsRequest hash](v7, "hash"))
      {
        receivedMessages = self->_receivedMessages;
        -[PREResponsesExperimentSuggestionsRequest receivedMessages](v7, "receivedMessages");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSArray isEqualToArray:](receivedMessages, "isEqualToArray:", v10))
        {
          senderMessages = self->_senderMessages;
          -[PREResponsesExperimentSuggestionsRequest senderMessages](v7, "senderMessages");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray isEqualToArray:](senderMessages, "isEqualToArray:", v12))
          {
            recipients = self->_recipients;
            -[PREResponsesExperimentSuggestionsRequest recipients](v7, "recipients");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSArray isEqual:](recipients, "isEqual:", v14))
            {
              context = self->_context;
              -[PREResponsesExperimentSuggestionsRequest context](v7, "context");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSString isEqualToString:](context, "isEqualToString:", v16))
              {
                languageCode = self->_languageCode;
                -[PREResponsesExperimentSuggestionsRequest languageCode](v7, "languageCode");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[NSString isEqualToString:](languageCode, "isEqualToString:", v18)
                  && (includesDynamicSuggestions = self->_includesDynamicSuggestions,
                      includesDynamicSuggestions == -[PREResponsesExperimentSuggestionsRequest includesDynamicSuggestions](v7, "includesDynamicSuggestions")))
                {
                  requestDate = self->_requestDate;
                  -[PREResponsesExperimentSuggestionsRequest requestDate](v7, "requestDate");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (-[NSDate isEqualToDate:](requestDate, "isEqualToDate:", v21))
                  {
                    languageLastChangedDate = self->_languageLastChangedDate;
                    -[PREResponsesExperimentSuggestionsRequest languageLastChangedDate](v7, "languageLastChangedDate");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v6 = -[NSDate isEqualToDate:](languageLastChangedDate, "isEqualToDate:", v23);

                  }
                  else
                  {
                    v6 = 0;
                  }

                }
                else
                {
                  v6 = 0;
                }

              }
              else
              {
                v6 = 0;
              }

            }
            else
            {
              v6 = 0;
            }

          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[PREResponsesExperimentSuggestionsRequest context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PREResponsesExperimentSuggestionsRequest languageCode](self, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + objc_msgSend(v5, "hash");
  -[PREResponsesExperimentSuggestionsRequest requestDate](self, "requestDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PREResponsesExperimentSuggestionsRequest languageLastChangedDate](self, "languageLastChangedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "hash") + 31;

  return v10;
}

- (NSArray)receivedMessages
{
  return self->_receivedMessages;
}

- (NSArray)senderMessages
{
  return self->_senderMessages;
}

- (void)setSenderMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)languageLastChangedDate
{
  return self->_languageLastChangedDate;
}

- (void)setLanguageLastChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_languageLastChangedDate, a3);
}

- (BOOL)includesDynamicSuggestions
{
  return self->_includesDynamicSuggestions;
}

- (void)setIncludesDynamicSuggestions:(BOOL)a3
{
  self->_includesDynamicSuggestions = a3;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_languageLastChangedDate, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_senderMessages, 0);
  objc_storeStrong((id *)&self->_receivedMessages, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
