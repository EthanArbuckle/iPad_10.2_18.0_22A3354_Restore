@implementation TPSDocument

uint64_t __26__TPSDocument_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (id)deliveryInfoIdForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("deliveryInfoId"));
}

- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TPSNotification *v16;
  TPSAssetFileInfoManager *v17;
  void *v18;
  TPSWidgetContent *v19;
  void *v20;
  void *v21;
  TPSLinkedDocument *v22;
  id v23;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[TPSDocument setClientConditionID:](self, "setClientConditionID:", a5);
  +[TPSNotification notificationFromDictionary:](TPSNotification, "notificationFromDictionary:", v15);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v16 = -[TPSNotification initWithDictionary:]([TPSNotification alloc], "initWithDictionary:", v23);
  -[TPSDocument setNotification:](self, "setNotification:", v16);

  v17 = -[TPSAssetFileInfoManager initWithDictionary:clientConditions:]([TPSAssetFileInfoManager alloc], "initWithDictionary:clientConditions:", v13, v12);
  -[TPSDocument setAssetFileInfoManager:](self, "setAssetFileInfoManager:", v17);

  objc_msgSend(v15, "TPSSafeDictionaryForKey:", CFSTR("widget"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TPSWidgetContent initWithDictionary:metadata:]([TPSWidgetContent alloc], "initWithDictionary:metadata:", v18, v14);

  -[TPSDocument setWidgetContent:](self, "setWidgetContent:", v19);
  objc_msgSend(v15, "TPSSafeStringForKey:", CFSTR("availabilityMessage"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDocument setAvailabilityMessage:](self, "setAvailabilityMessage:", v20);

  +[TPSLinkedDocument linkedDocumentFromDictionary:](TPSLinkedDocument, "linkedDocumentFromDictionary:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[TPSLinkedDocument initWithDictionary:]([TPSLinkedDocument alloc], "initWithDictionary:", v21);
  -[TPSDocument setLinkedDocument:](self, "setLinkedDocument:", v22);

}

- (void)setWidgetContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setNotification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setClientConditionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setAssetFileInfoManager:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setAvailabilityMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

uint64_t __26__TPSDocument_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notification");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientConditionID");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clonedFromID");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "correlationID");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "variantID");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "availabilityMessage");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keywords");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_12(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "language");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetFileInfoManager");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widgetContent");
}

- (BOOL)isWelcome
{
  return -[TPSDocument isHardwareWelcome](self, "isHardwareWelcome")
      || -[TPSDocument isSoftwareWelcome](self, "isSoftwareWelcome")
      || -[TPSDocument isSwitcherWelcome](self, "isSwitcherWelcome");
}

uint64_t __26__TPSDocument_na_identity__block_invoke_14(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "lastModifiedDate"));
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TPSDocument;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v18, sel_encodeWithCoder_, v4);
  -[TPSDocument identifier](self, "identifier", v18.receiver, v18.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[TPSDocument variantID](self, "variantID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("variantId"));

  -[TPSDocument correlationID](self, "correlationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("correlationId"));

  -[TPSDocument clonedFromID](self, "clonedFromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("clonedFromId"));

  -[TPSDocument clientConditionID](self, "clientConditionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("clientConditionId"));

  -[TPSDocument notification](self, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("notification"));

  -[TPSDocument widgetContent](self, "widgetContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("widget"));

  -[TPSDocument assetFileInfoManager](self, "assetFileInfoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("fileIdMap"));

  -[TPSDocument language](self, "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("language"));

  -[TPSDocument userLanguageCode](self, "userLanguageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("userLanguageCode"));

  -[TPSDocument keywords](self, "keywords");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("keywords"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSDocument lastModifiedDate](self, "lastModifiedDate"), CFSTR("lastModified"));
  -[TPSDocument availabilityMessage](self, "availabilityMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("availabilityMessage"));

  -[TPSDocument linkedDocument](self, "linkedDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("linkedDocument"));

}

- (NSString)identifier
{
  NSString *identifier;
  NSString *v3;
  void *v4;

  identifier = self->_identifier;
  if (identifier)
  {
    v3 = identifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (TPSNotification)notification
{
  return self->_notification;
}

- (TPSAssetFileInfoManager)assetFileInfoManager
{
  return self->_assetFileInfoManager;
}

- (NSString)variantID
{
  return self->_variantID;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (NSString)clonedFromID
{
  return self->_clonedFromID;
}

- (NSString)clientConditionID
{
  return self->_clientConditionID;
}

- (NSString)availabilityMessage
{
  return self->_availabilityMessage;
}

- (NSString)userLanguageCode
{
  return self->_userLanguageCode;
}

- (TPSDocument)initWithDictionary:(id)a3 metadata:(id)a4 identifierKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  TPSDocument *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *variantID;
  void *v16;
  uint64_t v17;
  NSString *correlationID;
  uint64_t v19;
  NSString *clonedFromID;
  uint64_t v21;
  NSString *language;
  uint64_t v23;
  NSString *userLanguageCode;
  uint64_t v25;
  NSArray *keywords;
  void *v27;
  void *v28;
  TPSDocument *v29;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TPSDocument;
  v11 = -[TPSSerializableObject initWithDictionary:](&v31, sel_initWithDictionary_, v8);
  if (v11)
  {
    objc_msgSend(v8, "TPSSafeStringForKey:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    if (!v11->_identifier)
    {
      v29 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v8, "TPSSafeStringForKey:", CFSTR("variantId"));
    v14 = objc_claimAutoreleasedReturnValue();
    variantID = v11->_variantID;
    v11->_variantID = (NSString *)v14;

    objc_msgSend(v8, "TPSSafeDictionaryForKey:", CFSTR("relationships"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "TPSSafeStringForKey:", CFSTR("correlationId"));
    v17 = objc_claimAutoreleasedReturnValue();
    correlationID = v11->_correlationID;
    v11->_correlationID = (NSString *)v17;

    objc_msgSend(v16, "TPSSafeStringForKey:", CFSTR("clonedFromId"));
    v19 = objc_claimAutoreleasedReturnValue();
    clonedFromID = v11->_clonedFromID;
    v11->_clonedFromID = (NSString *)v19;

    objc_msgSend(v9, "language");
    v21 = objc_claimAutoreleasedReturnValue();
    language = v11->_language;
    v11->_language = (NSString *)v21;

    objc_msgSend(MEMORY[0x1E0C99DC8], "tps_userLanguageCode");
    v23 = objc_claimAutoreleasedReturnValue();
    userLanguageCode = v11->_userLanguageCode;
    v11->_userLanguageCode = (NSString *)v23;

    objc_msgSend(v8, "TPSSafeArrayForKey:", CFSTR("keywords"));
    v25 = objc_claimAutoreleasedReturnValue();
    keywords = v11->_keywords;
    v11->_keywords = (NSArray *)v25;

    v11->_lastModifiedDate = objc_msgSend(v8, "TPSSafeIntegerForKey:", CFSTR("lastModified"));
    objc_msgSend(v8, "TPSSafeDictionaryForKey:", CFSTR("content"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSDocument fileIdMapForDictionary:](TPSDocument, "fileIdMapForDictionary:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSDocument updateWithContentDictionary:metadata:clientConditionIdentifier:fileIdMap:clientConditions:](v11, "updateWithContentDictionary:metadata:clientConditionIdentifier:fileIdMap:clientConditions:", v27, v9, 0, v28, 0);

  }
  v29 = v11;
LABEL_6:

  return v29;
}

+ (id)fileIdMapForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("fileIdMap"));
}

- (BOOL)hasWidgetContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[TPSDocument widgetContent](self, "widgetContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSDocument widgetContent](self, "widgetContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bodyContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v4 == 0;
  else
    v7 = 1;
  return !v7;
}

- (TPSWidgetContent)widgetContent
{
  return self->_widgetContent;
}

uint64_t __75__TPSDocument_contentDictionaryForDictionary_fromMatchingClientConditions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "TPSSafeStringForKey:", CFSTR("ruleId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

+ (id)contentDictionaryForDictionary:(id)a3 fromMatchingClientConditions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "TPSSafeArrayForKey:", CFSTR("conditions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __75__TPSDocument_contentDictionaryForDictionary_fromMatchingClientConditions___block_invoke;
    v19 = &unk_1E395C190;
    v20 = v6;
    objc_msgSend(v7, "na_firstObjectPassingTest:", &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "TPSSafeStringForKey:", CFSTR("ruleId"), v16, v17, v18, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "TPSSafeDictionaryForKey:", CFSTR("content"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v10)
        v13 = v11 == 0;
      else
        v13 = 1;
      if (v13)
      {
        v14 = 0;
      }
      else
      {
        v21 = v10;
        v22[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TPSDocument;
  v4 = -[TPSSerializableObject copyWithZone:](&v19, sel_copyWithZone_, a3);
  -[TPSDocument identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[TPSDocument variantID](self, "variantID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVariantID:", v6);

  -[TPSDocument correlationID](self, "correlationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCorrelationID:", v7);

  -[TPSDocument clonedFromID](self, "clonedFromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClonedFromID:", v8);

  -[TPSDocument clientConditionID](self, "clientConditionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientConditionID:", v9);

  -[TPSDocument notification](self, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotification:", v10);

  -[TPSDocument widgetContent](self, "widgetContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidgetContent:", v11);

  -[TPSDocument assetFileInfoManager](self, "assetFileInfoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetFileInfoManager:", v12);

  -[TPSDocument language](self, "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguage:", v13);

  -[TPSDocument userLanguageCode](self, "userLanguageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserLanguageCode:", v14);

  -[TPSDocument keywords](self, "keywords");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeywords:", v15);

  objc_msgSend(v4, "setLastModifiedDate:", -[TPSDocument lastModifiedDate](self, "lastModifiedDate"));
  -[TPSDocument availabilityMessage](self, "availabilityMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvailabilityMessage:", v16);

  -[TPSDocument linkedDocument](self, "linkedDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLinkedDocument:", v17);

  return v4;
}

- (void)setVariantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setUserLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLastModifiedDate:(int64_t)a3
{
  self->_lastModifiedDate = a3;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCorrelationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClonedFromID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (TPSDocument)initWithCoder:(id)a3
{
  id v4;
  TPSDocument *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *variantID;
  uint64_t v10;
  NSString *correlationID;
  uint64_t v12;
  NSString *clonedFromID;
  uint64_t v14;
  NSString *clientConditionID;
  uint64_t v16;
  NSString *language;
  uint64_t v18;
  TPSNotification *notification;
  uint64_t v20;
  TPSWidgetContent *widgetContent;
  uint64_t v22;
  TPSAssetFileInfoManager *assetFileInfoManager;
  uint64_t v24;
  NSString *userLanguageCode;
  uint64_t v26;
  NSArray *keywords;
  uint64_t v28;
  NSString *availabilityMessage;
  uint64_t v30;
  TPSLinkedDocument *linkedDocument;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TPSDocument;
  v5 = -[TPSSerializableObject initWithCoder:](&v33, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variantId"));
    v8 = objc_claimAutoreleasedReturnValue();
    variantID = v5->_variantID;
    v5->_variantID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("correlationId"));
    v10 = objc_claimAutoreleasedReturnValue();
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clonedFromId"));
    v12 = objc_claimAutoreleasedReturnValue();
    clonedFromID = v5->_clonedFromID;
    v5->_clonedFromID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientConditionId"));
    v14 = objc_claimAutoreleasedReturnValue();
    clientConditionID = v5->_clientConditionID;
    v5->_clientConditionID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v16 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notification"));
    v18 = objc_claimAutoreleasedReturnValue();
    notification = v5->_notification;
    v5->_notification = (TPSNotification *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
    v20 = objc_claimAutoreleasedReturnValue();
    widgetContent = v5->_widgetContent;
    v5->_widgetContent = (TPSWidgetContent *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileIdMap"));
    v22 = objc_claimAutoreleasedReturnValue();
    assetFileInfoManager = v5->_assetFileInfoManager;
    v5->_assetFileInfoManager = (TPSAssetFileInfoManager *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userLanguageCode"));
    v24 = objc_claimAutoreleasedReturnValue();
    userLanguageCode = v5->_userLanguageCode;
    v5->_userLanguageCode = (NSString *)v24;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("keywords"));
    v26 = objc_claimAutoreleasedReturnValue();
    keywords = v5->_keywords;
    v5->_keywords = (NSArray *)v26;

    v5->_lastModifiedDate = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lastModified"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availabilityMessage"));
    v28 = objc_claimAutoreleasedReturnValue();
    availabilityMessage = v5->_availabilityMessage;
    v5->_availabilityMessage = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkedDocument"));
    v30 = objc_claimAutoreleasedReturnValue();
    linkedDocument = v5->_linkedDocument;
    v5->_linkedDocument = (TPSLinkedDocument *)v30;

  }
  return v5;
}

id __26__TPSDocument_na_identity__block_invoke()
{
  if (TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_token_0, &__block_literal_global_86);
  return (id)TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_object_0;
}

void __26__TPSDocument_na_identity__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  __26__TPSDocument_na_identity__block_invoke_3();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_object_0;
  TPSDocumentURLSchemeParameterLaunchSourceKey_block_invoke_na_once_object_0 = v0;

}

id __26__TPSDocument_na_identity__block_invoke_3()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_91);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_92);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_93);
  v4 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_94);
  v5 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_95);
  v6 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_97);
  v7 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_99);
  v8 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_101);
  v9 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_102);
  v10 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_104);
  v11 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_106);
  v12 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_108);
  objc_msgSend(v0, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)documentsForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeArrayForKey:", CFSTR("documents"));
}

+ (id)deliveryInfoForDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("deliveryInfo"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityMessage, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_linkedDocument, 0);
  objc_storeStrong((id *)&self->_assetFileInfoManager, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_widgetContent, 0);
  objc_storeStrong((id *)&self->_clientConditionID, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_userLanguageCode, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_clonedFromID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)URLWithTipIdentifier:(id)a3 collectionIdentifier:(id)a4 referrer:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("tip"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("collection"), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("referrer"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v14, "setScheme:", CFSTR("x-apple-tips"));
  objc_msgSend(v14, "setHost:", CFSTR("open"));
  objc_msgSend(v14, "setQueryItems:", v10);
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (void)getValuesFromOpenURLSchemeQueryItems:(id)a3 tipIdentifier:(id *)a4 collectionIdentifier:(id *)a5 referrer:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        if (!a4
          || (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "name"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("tip")),
              v13,
              v15 = a4,
              (v14 & 1) == 0))
        {
          if (!a5
            || (objc_msgSend(v12, "name"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("collection")),
                v16,
                v15 = a5,
                (v17 & 1) == 0))
          {
            if (!a6)
              goto LABEL_15;
            objc_msgSend(v12, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "isEqualToString:", CFSTR("referrer")))
            {

              v15 = a6;
            }
            else
            {
              objc_msgSend(v12, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("launchSource"));

              v15 = a6;
              if (!v20)
                goto LABEL_15;
            }
          }
        }
        objc_msgSend(v12, "value");
        *v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

}

- (id)URLWithReferrer:(id)a3
{
  return 0;
}

- (BOOL)isHardwareWelcome
{
  return 0;
}

- (BOOL)isSoftwareWelcome
{
  return 0;
}

- (BOOL)isSwitcherWelcome
{
  return 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v8.receiver = self;
  v8.super_class = (Class)TPSDocument;
  -[TPSDocument description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSDocument identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@"), CFSTR("identifier"), v6);

  return v5;
}

- (id)debugDescription
{
  id v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v29.receiver = self;
  v29.super_class = (Class)TPSDocument;
  -[TPSSerializableObject debugDescription](&v29, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSDocument identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@ = %@\n"), CFSTR("identifier"), v6);

  -[TPSDocument variantID](self, "variantID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("variantId"), v7);

  -[TPSDocument correlationID](self, "correlationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("correlationId"), v8);

  -[TPSDocument clonedFromID](self, "clonedFromID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("clonedFromId"), v9);

  -[TPSDocument clientConditionID](self, "clientConditionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("clientConditionId"), v10);

  -[TPSDocument language](self, "language");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("language"), v11);

  -[TPSDocument userLanguageCode](self, "userLanguageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("userLanguageCode"), v12);

  -[TPSDocument keywords](self, "keywords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("keywords"), v13);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("lastModified"), -[TPSDocument lastModifiedDate](self, "lastModifiedDate"));
  -[TPSDocument notification](self, "notification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TPSDocument notification](self, "notification");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("notification"), v16);

  }
  -[TPSDocument widgetContent](self, "widgetContent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TPSDocument widgetContent](self, "widgetContent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("widget"), v19);

  }
  -[TPSDocument assetFileInfoManager](self, "assetFileInfoManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TPSDocument assetFileInfoManager](self, "assetFileInfoManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "debugDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("fileIdMap"), v22);

  }
  -[TPSDocument availabilityMessage](self, "availabilityMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TPSDocument availabilityMessage](self, "availabilityMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("availabilityMessage"), v24);

  }
  -[TPSDocument linkedDocument](self, "linkedDocument");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[TPSDocument linkedDocument](self, "linkedDocument");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "debugDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("linkedDocument"), v27);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (TPSLinkedDocument)linkedDocument
{
  return self->_linkedDocument;
}

- (void)setLinkedDocument:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

@end
