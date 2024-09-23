@implementation RFTableRowCardSection

- (RFTableRowCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFTableRowCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFTableCell *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  RFTableCell *v21;
  RFTableRowCardSection *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)RFTableRowCardSection;
  v5 = -[SFCardSection init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "cells");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "cells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = -[RFTableCell initWithProtobuf:]([RFTableCell alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v10);
    }

    -[RFTableRowCardSection setCells:](v5, "setCells:", v7);
    if (objc_msgSend(v4, "vertical_alignment"))
      -[RFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    if (objc_msgSend(v4, "scale_to_fit"))
      -[RFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", objc_msgSend(v4, "scale_to_fit"));
    objc_msgSend(v4, "compact_cells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "compact_cells", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[RFTableCell initWithProtobuf:]([RFTableCell alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v18);
    }

    -[RFTableRowCardSection setCompact_cells:](v5, "setCompact_cells:", v15);
    v22 = v5;

  }
  return v5;
}

- (void)setVertical_alignment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_vertical_alignment = a3;
}

- (BOOL)hasVertical_alignment
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setScale_to_fit:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_scale_to_fit = a3;
}

- (BOOL)hasScale_to_fit
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFTableRowCardSection)initWithCoder:(id)a3
{
  id v4;
  RFTableRowCardSection *v5;
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
    -[SFCardSection cells](v8, "cells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFTableRowCardSection setCells:](v5, "setCells:", v9);

    -[RFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", -[SFCardSection vertical_alignment](v8, "vertical_alignment"));
    -[RFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", -[SFCardSection scale_to_fit](v8, "scale_to_fit"));
    -[SFCardSection compact_cells](v8, "compact_cells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFTableRowCardSection setCompact_cells:](v5, "setCompact_cells:", v10);

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
  v3.super_class = (Class)RFTableRowCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTableRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFTableRowCardSection initWithFacade:]([_SFPBRFTableRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFTableRowCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTableRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFTableRowCardSection initWithFacade:]([_SFPBRFTableRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFTableRowCardSection jsonData](v2, "jsonData");
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
  v10.super_class = (Class)RFTableRowCardSection;
  v4 = -[SFCardSection copyWithZone:](&v10, sel_copyWithZone_, a3);
  -[RFTableRowCardSection cells](self, "cells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCells:", v6);

  objc_msgSend(v4, "setVertical_alignment:", -[RFTableRowCardSection vertical_alignment](self, "vertical_alignment"));
  objc_msgSend(v4, "setScale_to_fit:", -[RFTableRowCardSection scale_to_fit](self, "scale_to_fit"));
  -[RFTableRowCardSection compact_cells](self, "compact_cells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCompact_cells:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  RFTableRowCardSection *v6;
  RFTableRowCardSection *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v6 = (RFTableRowCardSection *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFTableRowCardSection isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
    {
      v23.receiver = self;
      v23.super_class = (Class)RFTableRowCardSection;
      if (-[SFCardSection isEqual:](&v23, sel_isEqual_, v6))
      {
        v7 = v6;
        -[RFTableRowCardSection cells](self, "cells");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableRowCardSection cells](v7, "cells");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 == 0) == (v9 != 0))
        {
          v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        -[RFTableRowCardSection cells](self, "cells");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10
          || (-[RFTableRowCardSection cells](self, "cells"),
              v3 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFTableRowCardSection cells](v7, "cells"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v3, "isEqual:", v4)))
        {
          v12 = -[RFTableRowCardSection vertical_alignment](self, "vertical_alignment");
          if (v12 == -[RFTableRowCardSection vertical_alignment](v7, "vertical_alignment"))
          {
            v13 = -[RFTableRowCardSection scale_to_fit](self, "scale_to_fit");
            if (v13 == -[RFTableRowCardSection scale_to_fit](v7, "scale_to_fit"))
            {
              -[RFTableRowCardSection compact_cells](self, "compact_cells");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[RFTableRowCardSection compact_cells](v7, "compact_cells");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v14 == 0) != (v15 != 0))
              {
                v21 = v14;
                v22 = v15;
                -[RFTableRowCardSection compact_cells](self, "compact_cells");
                v16 = objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v20 = (void *)v16;
                  -[RFTableRowCardSection compact_cells](self, "compact_cells");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RFTableRowCardSection compact_cells](v7, "compact_cells");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = objc_msgSend(v17, "isEqual:", v18);

                  if (!v10)
                    goto LABEL_20;
                }
                else
                {

                  v11 = 1;
                  if (!v10)
                    goto LABEL_20;
                }
                goto LABEL_19;
              }

            }
          }
          v11 = 0;
          if (!v10)
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        else
        {
          v11 = 0;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RFTableRowCardSection;
  v3 = -[SFCardSection hash](&v11, sel_hash);
  -[RFTableRowCardSection cells](self, "cells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[RFTableRowCardSection vertical_alignment](self, "vertical_alignment");
  v7 = v6 ^ -[RFTableRowCardSection scale_to_fit](self, "scale_to_fit");
  -[RFTableRowCardSection compact_cells](self, "compact_cells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash") ^ v3;

  return v9;
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (BOOL)scale_to_fit
{
  return self->_scale_to_fit;
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (void)setCompact_cells:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
