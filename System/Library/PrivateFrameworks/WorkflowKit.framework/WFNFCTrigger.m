@implementation WFNFCTrigger

- (BOOL)hasValidConfiguration
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WFNFCTrigger tagIdentifier](self, "tagIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFNFCTrigger name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("When “%@” is detected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNFCTrigger name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedPastTenseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("“%@” detected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNFCTrigger name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFNFCTrigger;
  v4 = a3;
  -[WFTrigger encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[WFNFCTrigger tagIdentifier](self, "tagIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tagIdentifier"));

  -[WFNFCTrigger name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

}

- (WFNFCTrigger)initWithCoder:(id)a3
{
  id v4;
  WFNFCTrigger *v5;
  uint64_t v6;
  NSString *tagIdentifier;
  void *v8;
  void *v9;
  WFNFCTrigger *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFNFCTrigger;
  v5 = -[WFTrigger initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tagIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    tagIdentifier = v5->_tagIdentifier;
    v5->_tagIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      WFLocalizedString(CFSTR("NFC tag"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v5->_name, v9);
    if (!v8)

    v10 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFNFCTrigger;
  v4 = -[WFTrigger copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[WFNFCTrigger tagIdentifier](self, "tagIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTagIdentifier:", v5);

  -[WFNFCTrigger name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v6);

  return v4;
}

- (id)suggestedActions
{
  void *v2;
  void *v3;

  +[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createActionsWithIdentifiers:serializedParameterArray:", &unk_1E7B8D928, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)tagIdentifier
{
  return self->_tagIdentifier;
}

- (void)setTagIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

+ (BOOL)isUserInitiated
{
  return 1;
}

+ (BOOL)isSupportedOnThisDevice
{
  void *v2;
  id v3;
  void *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getNFHardwareManagerClass_softClass;
  v11 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getNFHardwareManagerClass_block_invoke;
    v7[3] = &unk_1E7AF9520;
    v7[4] = &v8;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedHardwareManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBackgroundTagReadingAvailable");

  return v5;
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(CFSTR("NFC"));
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(CFSTR("Ex. “When I tap an NFC tag”"));
}

+ (id)displayGlyphName
{
  return CFSTR("nfc");
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
