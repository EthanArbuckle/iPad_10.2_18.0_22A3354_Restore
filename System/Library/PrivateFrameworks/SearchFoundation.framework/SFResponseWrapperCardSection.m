@implementation SFResponseWrapperCardSection

- (SFResponseWrapperCardSection)initWithCoder:(id)a3
{
  id v4;
  SFResponseWrapperCardSection *v5;
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
  void *v31;
  void *v32;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection catModel](v8, "catModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResponseWrapperCardSection setCatModel:](v5, "setCatModel:", v9);

    -[SFCardSection visualCATOutput](v8, "visualCATOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResponseWrapperCardSection setVisualCATOutput:](v5, "setVisualCATOutput:", v10);

    -[SFCardSection pattern_model](v8, "pattern_model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResponseWrapperCardSection setPattern_model:](v5, "setPattern_model:", v11);

    -[SFCardSection pattern_models](v8, "pattern_models");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFResponseWrapperCardSection setPattern_models:](v5, "setPattern_models:", v12);

    -[SFCardSection nextCard](v8, "nextCard");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v13);

    -[SFCardSection commands](v8, "commands");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v14);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v15);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v16);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v17);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v18);

    -[SFCardSection command](v8, "command");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v19);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v20);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v21);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v22);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v23);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v24);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v25);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v26);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v27);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v28);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v29);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v30);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v31);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v32);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFResponseWrapperCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBResponseWrapperCardSection *v2;
  void *v3;

  v2 = -[_SFPBResponseWrapperCardSection initWithFacade:]([_SFPBResponseWrapperCardSection alloc], "initWithFacade:", self);
  -[_SFPBResponseWrapperCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBResponseWrapperCardSection *v2;
  void *v3;

  v2 = -[_SFPBResponseWrapperCardSection initWithFacade:]([_SFPBResponseWrapperCardSection alloc], "initWithFacade:", self);
  -[_SFPBResponseWrapperCardSection jsonData](v2, "jsonData");
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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFResponseWrapperCardSection;
  v4 = -[SFCardSection copyWithZone:](&v14, sel_copyWithZone_, a3);
  -[SFResponseWrapperCardSection catModel](self, "catModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCatModel:", v6);

  -[SFResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setVisualCATOutput:", v8);

  -[SFResponseWrapperCardSection pattern_model](self, "pattern_model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPattern_model:", v10);

  -[SFResponseWrapperCardSection pattern_models](self, "pattern_models");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPattern_models:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFResponseWrapperCardSection *v5;
  SFResponseWrapperCardSection *v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  v5 = (SFResponseWrapperCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFResponseWrapperCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v42.receiver = self;
      v42.super_class = (Class)SFResponseWrapperCardSection;
      if (-[SFCardSection isEqual:](&v42, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFResponseWrapperCardSection catModel](self, "catModel");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFResponseWrapperCardSection catModel](v6, "catModel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[SFResponseWrapperCardSection catModel](self, "catModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFResponseWrapperCardSection catModel](self, "catModel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFResponseWrapperCardSection catModel](v6, "catModel");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_36;
          }
          v41 = v10;
        }
        -[SFResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFResponseWrapperCardSection visualCATOutput](v6, "visualCATOutput");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_35;
        }
        -[SFResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
        v15 = objc_claimAutoreleasedReturnValue();
        v40 = (void *)v15;
        if (v15)
        {
          v16 = (void *)v15;
          v35 = v14;
          v17 = v12;
          -[SFResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFResponseWrapperCardSection visualCATOutput](v6, "visualCATOutput");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            v11 = 0;
            v12 = v17;
            v14 = v35;
            goto LABEL_33;
          }
          v39 = v3;
          v12 = v17;
          v14 = v35;
        }
        else
        {
          v39 = v3;
        }
        -[SFResponseWrapperCardSection pattern_model](self, "pattern_model");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFResponseWrapperCardSection pattern_model](v6, "pattern_model");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v19 == 0) == (v20 != 0))
        {

          v11 = 0;
          v3 = v39;
          v16 = v40;
          if (!v40)
            goto LABEL_34;
          goto LABEL_33;
        }
        v33 = v20;
        v34 = v19;
        -[SFResponseWrapperCardSection pattern_model](self, "pattern_model");
        v16 = v40;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v36
          || (-[SFResponseWrapperCardSection pattern_model](self, "pattern_model"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              -[SFResponseWrapperCardSection pattern_model](v6, "pattern_model"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              v32 = v21,
              objc_msgSend(v21, "isEqual:")))
        {
          -[SFResponseWrapperCardSection pattern_models](self, "pattern_models");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFResponseWrapperCardSection pattern_models](v6, "pattern_models");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v22 == 0) == (v23 != 0))
          {

            v11 = 0;
            v16 = v40;
          }
          else
          {
            v29 = v22;
            v30 = v23;
            -[SFResponseWrapperCardSection pattern_models](self, "pattern_models");
            v24 = objc_claimAutoreleasedReturnValue();
            v16 = v40;
            if (v24)
            {
              v28 = (void *)v24;
              -[SFResponseWrapperCardSection pattern_models](self, "pattern_models");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFResponseWrapperCardSection pattern_models](v6, "pattern_models");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v27, "isEqual:");

            }
            else
            {

              v11 = 1;
            }
          }
          v3 = v39;
          if (!v36)
          {
LABEL_32:

            if (!v16)
            {
LABEL_34:

LABEL_35:
              v10 = v41;
              if (!v9)
              {
LABEL_37:

                goto LABEL_38;
              }
LABEL_36:

              goto LABEL_37;
            }
LABEL_33:

            goto LABEL_34;
          }
        }
        else
        {
          v11 = 0;
          v3 = v39;
        }

        goto LABEL_32;
      }
    }
    v11 = 0;
  }
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFResponseWrapperCardSection;
  v3 = -[SFCardSection hash](&v13, sel_hash);
  -[SFResponseWrapperCardSection catModel](self, "catModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFResponseWrapperCardSection visualCATOutput](self, "visualCATOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFResponseWrapperCardSection pattern_model](self, "pattern_model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[SFResponseWrapperCardSection pattern_models](self, "pattern_models");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash") ^ v3;

  return v11;
}

- (SFCATModel)catModel
{
  return self->_catModel;
}

- (void)setCatModel:(id)a3
{
  objc_storeStrong((id *)&self->_catModel, a3);
}

- (NSData)visualCATOutput
{
  return self->_visualCATOutput;
}

- (void)setVisualCATOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFPatternModel)pattern_model
{
  return self->_pattern_model;
}

- (void)setPattern_model:(id)a3
{
  objc_storeStrong((id *)&self->_pattern_model, a3);
}

- (NSArray)pattern_models
{
  return self->_pattern_models;
}

- (void)setPattern_models:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_models, 0);
  objc_storeStrong((id *)&self->_pattern_model, 0);
  objc_storeStrong((id *)&self->_visualCATOutput, 0);
  objc_storeStrong((id *)&self->_catModel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFResponseWrapperCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFResponseWrapperCardSection *v5;
  void *v6;
  SFCATModel *v7;
  void *v8;
  SFCATModel *v9;
  void *v10;
  void *v11;
  void *v12;
  SFPatternModel *v13;
  void *v14;
  SFPatternModel *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  SFPatternModel *v23;
  SFResponseWrapperCardSection *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFResponseWrapperCardSection;
  v5 = -[SFCardSection init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "catModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCATModel alloc];
      objc_msgSend(v4, "catModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFCATModel initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[SFResponseWrapperCardSection setCatModel:](v5, "setCatModel:", v9);

    }
    objc_msgSend(v4, "visualCATOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "visualCATOutput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFResponseWrapperCardSection setVisualCATOutput:](v5, "setVisualCATOutput:", v11);

    }
    objc_msgSend(v4, "pattern_model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [SFPatternModel alloc];
      objc_msgSend(v4, "pattern_model");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SFPatternModel initWithProtobuf:](v13, "initWithProtobuf:", v14);
      -[SFResponseWrapperCardSection setPattern_model:](v5, "setPattern_model:", v15);

    }
    objc_msgSend(v4, "pattern_models");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v17 = 0;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "pattern_models", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          v23 = -[SFPatternModel initWithProtobuf:]([SFPatternModel alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          if (v23)
            objc_msgSend(v17, "addObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v20);
    }

    -[SFResponseWrapperCardSection setPattern_models:](v5, "setPattern_models:", v17);
    v24 = v5;

  }
  return v5;
}

@end
