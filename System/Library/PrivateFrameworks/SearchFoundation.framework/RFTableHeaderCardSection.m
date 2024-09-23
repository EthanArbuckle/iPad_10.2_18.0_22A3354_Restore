@implementation RFTableHeaderCardSection

- (RFTableHeaderCardSection)initWithProtobuf:(id)a3
{
  id v4;
  RFTableHeaderCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  RFTableColumnDefinition *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  RFTableCell *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  RFTableCell *v29;
  RFTableHeaderCardSection *v30;
  RFTableHeaderCardSection *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)RFTableHeaderCardSection;
  v5 = -[SFCardSection init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "columns");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v4, "columns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = -[RFTableColumnDefinition initWithProtobuf:]([RFTableColumnDefinition alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v10);
    }

    -[RFTableHeaderCardSection setColumns:](v5, "setColumns:", v7);
    objc_msgSend(v4, "cells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "cells");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = -[RFTableCell initWithProtobuf:]([RFTableCell alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v18);
    }

    -[RFTableHeaderCardSection setCells:](v5, "setCells:", v15);
    objc_msgSend(v4, "compact_cells");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v5;
    if (v22)
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v23 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "compact_cells");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v34 != v27)
            objc_enumerationMutation(v24);
          v29 = -[RFTableCell initWithProtobuf:]([RFTableCell alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k));
          if (v29)
            objc_msgSend(v23, "addObject:", v29);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
      }
      while (v26);
    }

    v5 = v32;
    -[RFTableHeaderCardSection setCompact_cells:](v32, "setCompact_cells:", v23);
    if (objc_msgSend(v4, "should_repeat_header_in_flow_layout"))
      -[RFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v32, "setShould_repeat_header_in_flow_layout:", objc_msgSend(v4, "should_repeat_header_in_flow_layout"));
    if (objc_msgSend(v4, "vertical_alignment"))
      -[RFTableHeaderCardSection setVertical_alignment:](v32, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    v30 = v32;

  }
  return v5;
}

- (void)setShould_repeat_header_in_flow_layout:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_should_repeat_header_in_flow_layout = a3;
}

- (BOOL)hasShould_repeat_header_in_flow_layout
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setVertical_alignment:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_vertical_alignment = a3;
}

- (BOOL)hasVertical_alignment
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFTableHeaderCardSection)initWithCoder:(id)a3
{
  id v4;
  RFTableHeaderCardSection *v5;
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

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection columns](v8, "columns");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFTableHeaderCardSection setColumns:](v5, "setColumns:", v9);

    -[SFCardSection cells](v8, "cells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFTableHeaderCardSection setCells:](v5, "setCells:", v10);

    -[SFCardSection compact_cells](v8, "compact_cells");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RFTableHeaderCardSection setCompact_cells:](v5, "setCompact_cells:", v11);

    -[RFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v5, "setShould_repeat_header_in_flow_layout:", -[SFCardSection should_repeat_header_in_flow_layout](v8, "should_repeat_header_in_flow_layout"));
    -[RFTableHeaderCardSection setVertical_alignment:](v5, "setVertical_alignment:", -[SFCardSection vertical_alignment](v8, "vertical_alignment"));
    -[SFCardSection nextCard](v8, "nextCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v12);

    -[SFCardSection commands](v8, "commands");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v13);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v14);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v15);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v16);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v17);

    -[SFCardSection command](v8, "command");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v18);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v19);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v20);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v21);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v22);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v24);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v25);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v26);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v27);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v28);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v29);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v30);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v31);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RFTableHeaderCardSection;
  -[SFCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFTableHeaderCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFTableHeaderCardSection initWithFacade:]([_SFPBRFTableHeaderCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFTableHeaderCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFTableHeaderCardSection *v2;
  void *v3;

  v2 = -[_SFPBRFTableHeaderCardSection initWithFacade:]([_SFPBRFTableHeaderCardSection alloc], "initWithFacade:", self);
  -[_SFPBRFTableHeaderCardSection jsonData](v2, "jsonData");
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RFTableHeaderCardSection;
  v4 = -[SFCardSection copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[RFTableHeaderCardSection columns](self, "columns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setColumns:", v6);

  -[RFTableHeaderCardSection cells](self, "cells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCells:", v8);

  -[RFTableHeaderCardSection compact_cells](self, "compact_cells");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCompact_cells:", v10);

  objc_msgSend(v4, "setShould_repeat_header_in_flow_layout:", -[RFTableHeaderCardSection should_repeat_header_in_flow_layout](self, "should_repeat_header_in_flow_layout"));
  objc_msgSend(v4, "setVertical_alignment:", -[RFTableHeaderCardSection vertical_alignment](self, "vertical_alignment"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFTableHeaderCardSection *v5;
  RFTableHeaderCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
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
  int v22;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v5 = (RFTableHeaderCardSection *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFTableHeaderCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v36.receiver = self;
      v36.super_class = (Class)RFTableHeaderCardSection;
      if (-[SFCardSection isEqual:](&v36, sel_isEqual_, v5))
      {
        v6 = v5;
        -[RFTableHeaderCardSection columns](self, "columns");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableHeaderCardSection columns](v6, "columns");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_36:

          goto LABEL_37;
        }
        -[RFTableHeaderCardSection columns](self, "columns");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[RFTableHeaderCardSection columns](self, "columns");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFTableHeaderCardSection columns](v6, "columns");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            v11 = 0;
            goto LABEL_34;
          }
          v35 = v10;
        }
        -[RFTableHeaderCardSection cells](self, "cells");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableHeaderCardSection cells](v6, "cells");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          v11 = 0;
          goto LABEL_33;
        }
        -[RFTableHeaderCardSection cells](self, "cells");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v28 = v14;
          v16 = v12;
          -[RFTableHeaderCardSection cells](self, "cells");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFTableHeaderCardSection cells](v6, "cells");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v17;
          if (!objc_msgSend(v17, "isEqual:"))
          {
            v11 = 0;
            v12 = v16;
            v14 = v28;
            goto LABEL_31;
          }
          v30 = v3;
          v34 = v15;
          v12 = v16;
          v14 = v28;
        }
        else
        {
          v30 = v3;
          v34 = 0;
        }
        -[RFTableHeaderCardSection compact_cells](self, "compact_cells");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFTableHeaderCardSection compact_cells](v6, "compact_cells");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v18 == 0) == (v19 != 0))
        {

          v11 = 0;
          v15 = v34;
          v3 = v30;
          if (!v34)
            goto LABEL_32;
          goto LABEL_31;
        }
        v26 = v19;
        v27 = v18;
        -[RFTableHeaderCardSection compact_cells](self, "compact_cells");
        v15 = v34;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29
          || (-[RFTableHeaderCardSection compact_cells](self, "compact_cells"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              -[RFTableHeaderCardSection compact_cells](v6, "compact_cells"),
              v24 = v20,
              v25 = objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v20, "isEqual:")))
        {
          v3 = v30;
          v31 = -[RFTableHeaderCardSection should_repeat_header_in_flow_layout](self, "should_repeat_header_in_flow_layout");
          if (v31 == -[RFTableHeaderCardSection should_repeat_header_in_flow_layout](v6, "should_repeat_header_in_flow_layout"))
          {
            v22 = -[RFTableHeaderCardSection vertical_alignment](self, "vertical_alignment");
            v11 = v22 == -[RFTableHeaderCardSection vertical_alignment](v6, "vertical_alignment");
          }
          else
          {
            v11 = 0;
          }
          v21 = (void *)v25;
          if (!v29)
          {
LABEL_30:

            if (!v34)
            {
LABEL_32:

LABEL_33:
              v10 = v35;
              if (!v9)
              {
LABEL_35:

                goto LABEL_36;
              }
LABEL_34:

              goto LABEL_35;
            }
LABEL_31:

            goto LABEL_32;
          }
        }
        else
        {
          v11 = 0;
          v3 = v30;
          v21 = (void *)v25;
        }

        goto LABEL_30;
      }
    }
    v11 = 0;
  }
LABEL_37:

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
  uint64_t v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RFTableHeaderCardSection;
  v3 = -[SFCardSection hash](&v13, sel_hash);
  -[RFTableHeaderCardSection columns](self, "columns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[RFTableHeaderCardSection cells](self, "cells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[RFTableHeaderCardSection compact_cells](self, "compact_cells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[RFTableHeaderCardSection should_repeat_header_in_flow_layout](self, "should_repeat_header_in_flow_layout");
  v11 = v10 ^ -[RFTableHeaderCardSection vertical_alignment](self, "vertical_alignment") ^ v3;

  return v11;
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (void)setCompact_cells:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (int)should_repeat_header_in_flow_layout
{
  return self->_should_repeat_header_in_flow_layout;
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
