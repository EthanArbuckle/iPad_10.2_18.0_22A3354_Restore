@implementation RFExpandableStandardCardSection

- (void)setSummary_item_standard_card_section:(id)a3
{
  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, a3);
}

- (BOOL)hasSummary_item_standard_card_section
{
  return *(_BYTE *)&self->_has & 1;
}

- (RFExpandableStandardCardSection)initWithCoder:(id)a3
{
  id v4;
  RFExpandableStandardCardSection *v5;
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
  void *v30;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection summary_item_standard_card_section](v8, "summary_item_standard_card_section");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFExpandableStandardCardSection setSummary_item_standard_card_section:](v5, "setSummary_item_standard_card_section:", v9);

    -[SFCardSection expanding_component_content](v8, "expanding_component_content");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFExpandableStandardCardSection setExpanding_component_content:](v5, "setExpanding_component_content:", v10);

    -[SFCardSection nextCard](v8, "nextCard");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v11);

    -[SFCardSection commands](v8, "commands");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v12);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v13);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v14);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v15);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v16);

    -[SFCardSection command](v8, "command");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v17);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v18);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v19);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v20);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v21);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v22);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v23);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v24);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v25);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v26);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v27);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v28);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v29);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v30);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFExpandableStandardCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFExpandableStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFExpandableStandardCardSection initWithFacade:]([_SFPBRFExpandableStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFExpandableStandardCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFExpandableStandardCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFExpandableStandardCardSection initWithFacade:]([_SFPBRFExpandableStandardCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFExpandableStandardCardSection jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
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
  v10.super_class = (Class)RFExpandableStandardCardSection;
  v4 = -[SFCardSection copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (-[RFExpandableStandardCardSection hasSummary_item_standard_card_section](self, "hasSummary_item_standard_card_section"))
  {
    -[RFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setSummary_item_standard_card_section:", v6);

  }
  -[RFExpandableStandardCardSection expanding_component_content](self, "expanding_component_content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setExpanding_component_content:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFExpandableStandardCardSection *v5;
  RFExpandableStandardCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v5 = (RFExpandableStandardCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFExpandableStandardCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v22.receiver = self;
      v22.super_class = (Class)RFExpandableStandardCardSection;
      if (-[SFCardSection isEqual:](&v22, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFExpandableStandardCardSection summary_item_standard_card_section](v6, "summary_item_standard_card_section");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_20:

          goto LABEL_21;
        }
        -[RFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFExpandableStandardCardSection summary_item_standard_card_section](v6, "summary_item_standard_card_section");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v10))
          {
            v11 = 0;
LABEL_18:

LABEL_19:
            goto LABEL_20;
          }
          v21 = v10;
        }
        -[RFExpandableStandardCardSection expanding_component_content](self, "expanding_component_content");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFExpandableStandardCardSection expanding_component_content](v6, "expanding_component_content");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[RFExpandableStandardCardSection expanding_component_content](self, "expanding_component_content");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            -[RFExpandableStandardCardSection expanding_component_content](self, "expanding_component_content");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[RFExpandableStandardCardSection expanding_component_content](v6, "expanding_component_content");
            v20 = v3;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v19, "isEqual:", v17);

            v3 = v20;
          }
          else
          {

            v11 = 1;
          }
        }
        v10 = v21;
        if (!v9)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RFExpandableStandardCardSection;
  v3 = -[SFCardSection hash](&v9, sel_hash);
  -[RFExpandableStandardCardSection summary_item_standard_card_section](self, "summary_item_standard_card_section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFExpandableStandardCardSection expanding_component_content](self, "expanding_component_content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (RFSummaryItemStandardCardSection)summary_item_standard_card_section
{
  return self->_summary_item_standard_card_section;
}

- (NSArray)expanding_component_content
{
  return self->_expanding_component_content;
}

- (void)setExpanding_component_content:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expanding_component_content, 0);
  objc_storeStrong((id *)&self->_summary_item_standard_card_section, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RFExpandableStandardCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFExpandableStandardCardSection *v5;
  void *v6;
  RFSummaryItemStandardCardSection *v7;
  void *v8;
  RFSummaryItemStandardCardSection *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  RFExpandingComponentContent *v17;
  RFExpandableStandardCardSection *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RFExpandableStandardCardSection;
  v5 = -[SFCardSection init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "summary_item_standard_card_section");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [RFSummaryItemStandardCardSection alloc];
      objc_msgSend(v4, "summary_item_standard_card_section");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[RFSummaryItemStandardCardSection initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFExpandableStandardCardSection setSummary_item_standard_card_section:](v5, "setSummary_item_standard_card_section:", v9);

    }
    objc_msgSend(v4, "expanding_component_contents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v11 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "expanding_component_contents", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = -[RFExpandingComponentContent initWithProtobuf:]([RFExpandingComponentContent alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v14);
    }

    -[RFExpandableStandardCardSection setExpanding_component_content:](v5, "setExpanding_component_content:", v11);
    v18 = v5;

  }
  return v5;
}

@end
