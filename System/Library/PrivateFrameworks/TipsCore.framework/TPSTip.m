@implementation TPSTip

- (void)updateWithContentDictionary:(id)a3 metadata:(id)a4 clientConditionIdentifier:(id)a5 fileIdMap:(id)a6 clientConditions:(id)a7
{
  id v12;
  id v13;
  NSString *v14;
  NSString *eyebrow;
  void *v16;
  TPSFullTipContent *v17;
  void *v18;
  TPSActionableContent *v19;
  void *v20;
  TPSChecklistContent *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TPSTip;
  v12 = a4;
  v13 = a3;
  -[TPSDocument updateWithContentDictionary:metadata:clientConditionIdentifier:fileIdMap:clientConditions:](&v22, sel_updateWithContentDictionary_metadata_clientConditionIdentifier_fileIdMap_clientConditions_, v13, v12, a5, a6, a7);
  objc_msgSend(v13, "TPSSafeStringForKey:", CFSTR("eyebrow"), v22.receiver, v22.super_class);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  eyebrow = self->_eyebrow;
  self->_eyebrow = v14;

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("full"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TPSFullTipContent initWithDictionary:metadata:]([TPSFullTipContent alloc], "initWithDictionary:metadata:", v16, v12);
  -[TPSTip setFullContent:](self, "setFullContent:", v17);

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("mini"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TPSActionableContent initWithDictionary:metadata:]([TPSActionableContent alloc], "initWithDictionary:metadata:", v18, v12);
  -[TPSTip setMiniContent:](self, "setMiniContent:", v19);

  objc_msgSend(v13, "TPSSafeDictionaryForKey:", CFSTR("checklist"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[TPSChecklistContent initWithDictionary:metadata:]([TPSChecklistContent alloc], "initWithDictionary:metadata:", v20, v12);
  -[TPSTip setChecklistContent:](self, "setChecklistContent:", v21);

}

- (void)setMiniContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setFullContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setChecklistContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (TPSTip)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  TPSTip *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSTip;
  v7 = -[TPSDocument initWithDictionary:metadata:identifierKey:](&v11, sel_initWithDictionary_metadata_identifierKey_, v6, a4, CFSTR("documentId"));
  if (v7)
  {
    v7->_type = objc_msgSend((id)objc_opt_class(), "contentTypeForDictionary:", v6);
    v7->_subContentType = 0;
    objc_msgSend(v6, "TPSSafeStringForKey:", CFSTR("subContentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("intro")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("outro")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("checklist")) & 1) != 0)
    {
      v9 = 3;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("linked-article")))
      {
LABEL_11:

        goto LABEL_12;
      }
      v9 = 4;
    }
    v7->_subContentType = v9;
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

+ (int64_t)contentTypeForDictionary:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(a1, "contentTypeForContentDictionary:", v5);
    v11[3] = v6;
  }
  else
  {
    v6 = v11[3];
  }
  if (v6 == 1)
  {
    objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("conditions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__TPSTip_contentTypeForDictionary___block_invoke;
    v9[3] = &unk_1E395BD48;
    v9[4] = &v10;
    v9[5] = a1;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

    v6 = v11[3];
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

+ (int64_t)contentTypeForContentDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "TPSSafeDictionaryForKey:", CFSTR("full"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = 3;
  else
    v5 = 1;
  objc_msgSend(v3, "TPSSafeDictionaryForKey:", CFSTR("mini"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v5 |= 4uLL;
  objc_msgSend(v3, "TPSSafeDictionaryForKey:", CFSTR("checklist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5 | 8;
  if (!v7)
    v8 = v5;
  if (v8 == 1)
    return 1;
  else
    return v8 & 0xE;
}

+ (id)tipIdFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("documentId"));
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

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __21__TPSTip_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __21__TPSTip_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __21__TPSTip_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__TPSTip_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (TPSTipSubContentTypeOutroValue_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSTipSubContentTypeOutroValue_block_invoke_na_once_token_0, block);
  return (id)TPSTipSubContentTypeOutroValue_block_invoke_na_once_object_0;
}

- (BOOL)isCompleted
{
  return -[TPSTip contentStatus](self, "contentStatus") == 1;
}

- (BOOL)isHardwareWelcome
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TPSTip isIntro](self, "isIntro");
  if (v3)
  {
    -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSCommonDefines hardwareWelcomeCollectionIdentifier](TPSCommonDefines, "hardwareWelcomeCollectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isSoftwareWelcome
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TPSTip isIntro](self, "isIntro");
  if (v3)
  {
    -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSCommonDefines softwareWelcomeCollectionIdentifier](TPSCommonDefines, "softwareWelcomeCollectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)addCollectionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  v4 = (void *)MEMORY[0x1E0C99E10];
  -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v8);
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTip setCollectionIdentifiers:](self, "setCollectionIdentifiers:", v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (void)setCollectionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSTip;
  v4 = a3;
  -[TPSDocument encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[TPSTip isSiriSuggestion](self, "isSiriSuggestion", v10.receiver, v10.super_class), CFSTR("SiriSuggestion"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSTip contentStatus](self, "contentStatus"), CFSTR("contentStatus"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSTip subContentType](self, "subContentType"), CFSTR("subContentType"));
  -[TPSTip eyebrow](self, "eyebrow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("eyebrow"));

  -[TPSTip fullContent](self, "fullContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("full"));

  -[TPSTip miniContent](self, "miniContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("mini"));

  -[TPSTip checklistContent](self, "checklistContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("checklist"));

  -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("collectionIdentifiers"));

}

- (NSArray)collectionIdentifiers
{
  return self->_collectionIdentifiers;
}

- (BOOL)isOutro
{
  return -[TPSTip subContentType](self, "subContentType") == 2;
}

- (BOOL)isIntro
{
  return -[TPSTip subContentType](self, "subContentType") == 1;
}

- (int64_t)subContentType
{
  return self->_subContentType;
}

- (int64_t)contentStatus
{
  return self->_contentStatus;
}

- (TPSFullTipContent)fullContent
{
  return self->_fullContent;
}

- (TPSChecklistContent)checklistContent
{
  return self->_checklistContent;
}

- (TPSActionableContent)miniContent
{
  return self->_miniContent;
}

- (NSString)linkedDocumentId
{
  void *v2;
  void *v3;

  -[TPSDocument linkedDocument](self, "linkedDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSiriSuggestion
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  LOBYTE(self) = self->_siriSuggestion;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
  return (char)self;
}

- (NSString)eyebrow
{
  return self->_eyebrow;
}

+ (id)correlationIdForDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "TPSSafeDictionaryForKey:", CFSTR("relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "TPSSafeStringForKey:", CFSTR("correlationId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TPSTip;
  v4 = -[TPSDocument copyWithZone:](&v10, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSiriSuggestion:", -[TPSTip isSiriSuggestion](self, "isSiriSuggestion"));
  objc_msgSend(v4, "setType:", -[TPSTip type](self, "type"));
  objc_msgSend(v4, "setSubContentType:", -[TPSTip subContentType](self, "subContentType"));
  -[TPSTip eyebrow](self, "eyebrow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEyebrow:", v5);

  -[TPSTip fullContent](self, "fullContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFullContent:", v6);

  -[TPSTip miniContent](self, "miniContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMiniContent:", v7);

  -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollectionIdentifiers:", v8);

  objc_msgSend(v4, "setContentStatus:", -[TPSTip contentStatus](self, "contentStatus"));
  return v4;
}

- (void)setContentStatus:(int64_t)a3
{
  self->_contentStatus = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setSubContentType:(int64_t)a3
{
  self->_subContentType = a3;
}

- (void)setSiriSuggestion:(BOOL)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  self->_siriSuggestion = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (void)setEyebrow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (TPSTip)initWithCoder:(id)a3
{
  id v4;
  TPSTip *v5;
  uint64_t v6;
  NSString *eyebrow;
  uint64_t v8;
  TPSFullTipContent *fullContent;
  uint64_t v10;
  TPSActionableContent *miniContent;
  uint64_t v12;
  TPSChecklistContent *checklistContent;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *collectionIdentifiers;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSTip;
  v5 = -[TPSDocument initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_siriSuggestion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SiriSuggestion"));
    v5->_contentStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentStatus"));
    v5->_subContentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("subContentType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eyebrow"));
    v6 = objc_claimAutoreleasedReturnValue();
    eyebrow = v5->_eyebrow;
    v5->_eyebrow = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("full"));
    v8 = objc_claimAutoreleasedReturnValue();
    fullContent = v5->_fullContent;
    v5->_fullContent = (TPSFullTipContent *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mini"));
    v10 = objc_claimAutoreleasedReturnValue();
    miniContent = v5->_miniContent;
    v5->_miniContent = (TPSActionableContent *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("checklist"));
    v12 = objc_claimAutoreleasedReturnValue();
    checklistContent = v5->_checklistContent;
    v5->_checklistContent = (TPSChecklistContent *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("collectionIdentifiers"));
    v17 = objc_claimAutoreleasedReturnValue();
    collectionIdentifiers = v5->_collectionIdentifiers;
    v5->_collectionIdentifiers = (NSArray *)v17;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __21__TPSTip_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __21__TPSTip_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __21__TPSTip_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)TPSTipSubContentTypeOutroValue_block_invoke_na_once_object_0;
  TPSTipSubContentTypeOutroValue_block_invoke_na_once_object_0 = v1;

}

id __21__TPSTip_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v13.receiver = *(id *)(a1 + 32);
  v13.super_class = (Class)&OBJC_METACLASS___TPSTip;
  objc_msgSendSuper2(&v13, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_18);
  v5 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_63_1);
  v6 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_64);
  v7 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_66);
  v8 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_68_0);
  v9 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_70_0);
  v10 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_72);
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_checklistContent, 0);
  objc_storeStrong((id *)&self->_miniContent, 0);
  objc_storeStrong((id *)&self->_fullContent, 0);
  objc_storeStrong((id *)&self->_eyebrow, 0);
}

- (BOOL)containsLinks
{
  void *v2;
  char v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bodyContainsLink");

  return v3;
}

- (BOOL)textContainsHTML
{
  return 0;
}

- (id)shortTitle
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasImage
{
  void *v2;
  char v3;

  -[TPSTip fullContentAssets](self, "fullContentAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasImage");

  return v3;
}

- (BOOL)hasVideo
{
  void *v2;
  char v3;

  -[TPSTip fullContentAssets](self, "fullContentAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasVideo");

  return v3;
}

- (id)actions
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)summary
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)webURLPath
{
  return 0;
}

- (id)bodyText
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyContent
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footnoteContent
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnoteContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shareText
{
  return &stru_1E39608B8;
}

void __35__TPSTip_contentTypeForDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;

  objc_msgSend(a2, "TPSSafeDictionaryForKey:", CFSTR("content"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "contentTypeForContentDictionary:", v6);
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 1;

}

- (BOOL)isChecklistTip
{
  return -[TPSTip subContentType](self, "subContentType") == 3;
}

- (BOOL)isTip
{
  return !-[TPSTip subContentType](self, "subContentType") || -[TPSTip isChecklistTip](self, "isChecklistTip");
}

- (BOOL)isLinkedArticle
{
  return -[TPSTip subContentType](self, "subContentType") == 4;
}

- (BOOL)isSwitcherWelcome
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  v3 = -[TPSTip isIntro](self, "isIntro");
  if (v3)
  {
    -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSCommonDefines switcherWelcomeCollectionIdentifier](TPSCommonDefines, "switcherWelcomeCollectionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)text
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textContent
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bodyContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TPSAssets)fullContentAssets
{
  void *v2;
  void *v3;

  -[TPSTip fullContent](self, "fullContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TPSAssets *)v3;
}

- (void)removeCollectionIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObject:", v7);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[TPSTip setCollectionIdentifiers:](self, "setCollectionIdentifiers:", v6);

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (id)URLWithReferrer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[TPSDocument identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSDocument URLWithTipIdentifier:collectionIdentifier:referrer:](TPSDocument, "URLWithTipIdentifier:collectionIdentifier:referrer:", v5, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  objc_super v19;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v19.receiver = self;
  v19.super_class = (Class)TPSTip;
  -[TPSDocument debugDescription](&v19, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %d\n"), CFSTR("SiriSuggestion"), -[TPSTip isSiriSuggestion](self, "isSiriSuggestion"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("contentStatus"), -[TPSTip contentStatus](self, "contentStatus"));
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("subContentType"), -[TPSTip subContentType](self, "subContentType"));
  -[TPSTip collectionIdentifiers](self, "collectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("collectionIdentifiers"), v6);

  -[TPSTip eyebrow](self, "eyebrow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSTip eyebrow](self, "eyebrow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("eyebrow"), v8);

  }
  -[TPSTip fullContent](self, "fullContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TPSTip fullContent](self, "fullContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("full"), v11);

  }
  -[TPSTip miniContent](self, "miniContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSTip miniContent](self, "miniContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("mini"), v14);

  }
  -[TPSTip checklistContent](self, "checklistContent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TPSTip checklistContent](self, "checklistContent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "debugDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("checklist"), v17);

  }
  return v5;
}

uint64_t __21__TPSTip_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "contentStatus"));
}

uint64_t __21__TPSTip_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "type"));
}

uint64_t __21__TPSTip_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "subContentType"));
}

uint64_t __21__TPSTip_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eyebrow");
}

uint64_t __21__TPSTip_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fullContent");
}

uint64_t __21__TPSTip_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "miniContent");
}

uint64_t __21__TPSTip_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collectionIdentifiers");
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

@end
