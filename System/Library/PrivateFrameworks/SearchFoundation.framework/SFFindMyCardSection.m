@implementation SFFindMyCardSection

- (SFFindMyCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFFindMyCardSection *v5;
  void *v6;
  SFPerson *v7;
  void *v8;
  SFPerson *v9;
  SFFindMyCardSection *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFFindMyCardSection;
  v5 = -[SFCardSection init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFPerson alloc];
      objc_msgSend(v4, "person");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFPerson initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFFindMyCardSection setPerson:](v5, "setPerson:", v9);

    }
    v10 = v5;
  }

  return v5;
}

- (SFFindMyCardSection)initWithCoder:(id)a3
{
  id v4;
  SFFindMyCardSection *v5;
  void *v6;
  _SFPBCardSection *v7;
  SFCardSection *v8;
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
  void *v28;
  void *v29;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection person](v8, "person");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFindMyCardSection setPerson:](v5, "setPerson:", v9);

    -[SFCardSection nextCard](v8, "nextCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v10);

    -[SFCardSection commands](v8, "commands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v11);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v12);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v13);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v14);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v15);

    -[SFCardSection command](v8, "command");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v16);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v17);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v18);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v19);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v20);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v21);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v22);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v23);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v24);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v25);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v26);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v27);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v28);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v29);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFFindMyCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBFindMyCardSection *v2;
  void *v3;

  v2 = -[_SFPBFindMyCardSection initWithFacade:]([_SFPBFindMyCardSection alloc], "initWithFacade:", self);
  -[_SFPBFindMyCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBFindMyCardSection *v2;
  void *v3;

  v2 = -[_SFPBFindMyCardSection initWithFacade:]([_SFPBFindMyCardSection alloc], "initWithFacade:", self);
  -[_SFPBFindMyCardSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFFindMyCardSection;
  v4 = -[SFCardSection copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[SFFindMyCardSection person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPerson:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFFindMyCardSection *v4;
  SFFindMyCardSection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (SFFindMyCardSection *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else if (-[SFFindMyCardSection isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
         && (v13.receiver = self,
             v13.super_class = (Class)SFFindMyCardSection,
             -[SFCardSection isEqual:](&v13, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SFFindMyCardSection person](self, "person");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFindMyCardSection person](v5, "person");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) == (v7 != 0))
    {
      v11 = 0;
    }
    else
    {
      -[SFFindMyCardSection person](self, "person");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFFindMyCardSection person](self, "person");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFFindMyCardSection person](v5, "person");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 1;
      }

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
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFFindMyCardSection;
  v3 = -[SFCardSection hash](&v7, sel_hash);
  -[SFFindMyCardSection person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (SFPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
