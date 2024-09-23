@implementation SFTableHeaderRowCardSection

- (SFTableHeaderRowCardSection)initWithProtobuf:(id)a3
{
  id v4;
  SFTableHeaderRowCardSection *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  SFPunchout *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SFColor *v21;
  void *v22;
  SFColor *v23;
  void *v24;
  void *v25;
  void *v26;
  SFTableAlignmentSchema *v27;
  void *v28;
  SFTableAlignmentSchema *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  SFFormattedText *v37;
  void *v38;
  void *v39;
  SFTableHeaderRowCardSection *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SFTableHeaderRowCardSection;
  v5 = -[SFCardSection init](&v50, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "punchoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v7 = 0;

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v4, "punchoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v8);
          v13 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v10);
    }

    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v7);
    objc_msgSend(v4, "punchoutPickerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "punchoutPickerTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v15);

    }
    objc_msgSend(v4, "punchoutPickerDismissText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "punchoutPickerDismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v17);

    }
    if (objc_msgSend(v4, "canBeHidden"))
      -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", objc_msgSend(v4, "canBeHidden"));
    if (objc_msgSend(v4, "hasTopPadding"))
      -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", objc_msgSend(v4, "hasTopPadding"));
    if (objc_msgSend(v4, "hasBottomPadding"))
      -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", objc_msgSend(v4, "hasBottomPadding"));
    objc_msgSend(v4, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "type");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableRowCardSection setType:](v5, "setType:", v19);

    }
    if (objc_msgSend(v4, "separatorStyle"))
      -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", objc_msgSend(v4, "separatorStyle"));
    objc_msgSend(v4, "backgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFColor alloc];
      objc_msgSend(v4, "backgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFColor initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v23);

    }
    objc_msgSend(v4, "tableIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "tableIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v25);

    }
    objc_msgSend(v4, "alignmentSchema");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = [SFTableAlignmentSchema alloc];
      objc_msgSend(v4, "alignmentSchema");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SFTableAlignmentSchema initWithProtobuf:](v27, "initWithProtobuf:", v28);
      -[SFTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v29);

    }
    objc_msgSend(v4, "datas");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v31 = 0;

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v4, "datas", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v32);
          v37 = -[SFFormattedText initWithProtobuf:]([SFFormattedText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j));
          if (v37)
            objc_msgSend(v31, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v34);
    }

    -[SFTableRowCardSection setData:](v5, "setData:", v31);
    if (objc_msgSend(v4, "isSubHeader"))
      -[SFTableRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", objc_msgSend(v4, "isSubHeader"));
    objc_msgSend(v4, "tabGroupIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "tabGroupIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v39);

    }
    if (objc_msgSend(v4, "reducedRowHeight"))
      -[SFTableRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", objc_msgSend(v4, "reducedRowHeight"));
    if (objc_msgSend(v4, "verticalAlign"))
      -[SFTableRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", objc_msgSend(v4, "verticalAlign"));
    if (objc_msgSend(v4, "alignRowsToHeader"))
      -[SFTableRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", objc_msgSend(v4, "alignRowsToHeader"));
    v40 = v5;

  }
  return v5;
}

- (SFTableHeaderRowCardSection)initWithCoder:(id)a3
{
  id v4;
  SFTableHeaderRowCardSection *v5;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v4 = a3;
  v5 = -[SFCardSection init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCardSection initWithData:]([_SFPBCardSection alloc], "initWithData:", v6);
  v8 = -[SFCardSection initWithProtobuf:]([SFCardSection alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v9);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v10);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v11);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setType:](v5, "setType:", v12);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v13);

    -[SFCardSection tableIdentifier](v8, "tableIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v14);

    -[SFCardSection alignmentSchema](v8, "alignmentSchema");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v15);

    -[SFCardSection data](v8, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setData:](v5, "setData:", v16);

    -[SFTableRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", -[SFCardSection isSubHeader](v8, "isSubHeader"));
    -[SFCardSection tabGroupIdentifier](v8, "tabGroupIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v17);

    -[SFTableRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", -[SFCardSection reducedRowHeight](v8, "reducedRowHeight"));
    -[SFTableRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", -[SFCardSection verticalAlign](v8, "verticalAlign"));
    -[SFTableRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", -[SFCardSection alignRowsToHeader](v8, "alignRowsToHeader"));
    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v18);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v19);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v20);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection type](v8, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setType:](v5, "setType:", v21);

    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v22);

    -[SFCardSection richData](v8, "richData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setRichData:](v5, "setRichData:", v23);

    -[SFCardSection tableIdentifier](v8, "tableIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setTableIdentifier:](v5, "setTableIdentifier:", v24);

    -[SFCardSection alignmentSchema](v8, "alignmentSchema");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setAlignmentSchema:](v5, "setAlignmentSchema:", v25);

    -[SFCardSection data](v8, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setData:](v5, "setData:", v26);

    -[SFTableRowCardSection setIsSubHeader:](v5, "setIsSubHeader:", -[SFCardSection isSubHeader](v8, "isSubHeader"));
    -[SFCardSection tabGroupIdentifier](v8, "tabGroupIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableRowCardSection setTabGroupIdentifier:](v5, "setTabGroupIdentifier:", v27);

    -[SFTableRowCardSection setReducedRowHeight:](v5, "setReducedRowHeight:", -[SFCardSection reducedRowHeight](v8, "reducedRowHeight"));
    -[SFTableRowCardSection setVerticalAlign:](v5, "setVerticalAlign:", -[SFCardSection verticalAlign](v8, "verticalAlign"));
    -[SFTableRowCardSection setAlignRowsToHeader:](v5, "setAlignRowsToHeader:", -[SFCardSection alignRowsToHeader](v8, "alignRowsToHeader"));
    -[SFCardSection nextCard](v8, "nextCard");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setNextCard:](v5, "setNextCard:", v28);

    -[SFCardSection commands](v8, "commands");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommands:](v5, "setCommands:", v29);

    -[SFCardSection parameterKeyPaths](v8, "parameterKeyPaths");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setParameterKeyPaths:](v5, "setParameterKeyPaths:", v30);

    -[SFCardSection cardSectionId](v8, "cardSectionId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionId:](v5, "setCardSectionId:", v31);

    -[SFCardSection resultIdentifier](v8, "resultIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setResultIdentifier:](v5, "setResultIdentifier:", v32);

    -[SFCardSection userReportRequest](v8, "userReportRequest");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setUserReportRequest:](v5, "setUserReportRequest:", v33);

    -[SFCardSection command](v8, "command");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCommand:](v5, "setCommand:", v34);

    -[SFCardSection previewCommand](v8, "previewCommand");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewCommand:](v5, "setPreviewCommand:", v35);

    -[SFCardSection previewButtonItems](v8, "previewButtonItems");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItems:](v5, "setPreviewButtonItems:", v36);

    -[SFCardSection cardSectionDetail](v8, "cardSectionDetail");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setCardSectionDetail:](v5, "setCardSectionDetail:", v37);

    -[SFCardSection previewButtonItemsTitle](v8, "previewButtonItemsTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPreviewButtonItemsTitle:](v5, "setPreviewButtonItemsTitle:", v38);

    -[SFCardSection backgroundColor](v8, "backgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setBackgroundColor:](v5, "setBackgroundColor:", v39);

    -[SFCardSection setShouldHideInAmbientMode:](v5, "setShouldHideInAmbientMode:", -[SFCardSection shouldHideInAmbientMode](v8, "shouldHideInAmbientMode"));
    -[SFCardSection leadingSwipeButtonItems](v8, "leadingSwipeButtonItems");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setLeadingSwipeButtonItems:](v5, "setLeadingSwipeButtonItems:", v40);

    -[SFCardSection trailingSwipeButtonItems](v8, "trailingSwipeButtonItems");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setTrailingSwipeButtonItems:](v5, "setTrailingSwipeButtonItems:", v41);

    -[SFCardSection punchoutOptions](v8, "punchoutOptions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutOptions:](v5, "setPunchoutOptions:", v42);

    -[SFCardSection punchoutPickerTitle](v8, "punchoutPickerTitle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerTitle:](v5, "setPunchoutPickerTitle:", v43);

    -[SFCardSection punchoutPickerDismissText](v8, "punchoutPickerDismissText");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setPunchoutPickerDismissText:](v5, "setPunchoutPickerDismissText:", v44);

    -[SFCardSection setCanBeHidden:](v5, "setCanBeHidden:", -[SFCardSection canBeHidden](v8, "canBeHidden"));
    -[SFCardSection setHasTopPadding:](v5, "setHasTopPadding:", -[SFCardSection hasTopPadding](v8, "hasTopPadding"));
    -[SFCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](v8, "hasBottomPadding"));
    -[SFCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", -[SFCardSection separatorStyle](v8, "separatorStyle"));
    -[SFCardSection referencedCommands](v8, "referencedCommands");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setReferencedCommands:](v5, "setReferencedCommands:", v45);

    -[SFCardSection setForceEnable3DTouch:](v5, "setForceEnable3DTouch:", -[SFCardSection forceEnable3DTouch](v8, "forceEnable3DTouch"));
    -[SFCardSection setShouldShowInSmartDialog:](v5, "setShouldShowInSmartDialog:", -[SFCardSection shouldShowInSmartDialog](v8, "shouldShowInSmartDialog"));
    -[SFCardSection appEntityAnnotation](v8, "appEntityAnnotation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setAppEntityAnnotation:](v5, "setAppEntityAnnotation:", v46);

    -[SFCardSection emphasisSubjectId](v8, "emphasisSubjectId");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCardSection setEmphasisSubjectId:](v5, "setEmphasisSubjectId:", v47);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFTableHeaderRowCardSection;
  -[SFTableRowCardSection encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBTableHeaderRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBTableHeaderRowCardSection initWithFacade:]([_SFPBTableHeaderRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBTableHeaderRowCardSection dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBTableHeaderRowCardSection *v2;
  void *v3;

  v2 = -[_SFPBTableHeaderRowCardSection initWithFacade:]([_SFPBTableHeaderRowCardSection alloc], "initWithFacade:", self);
  -[_SFPBTableHeaderRowCardSection jsonData](v2, "jsonData");
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SFTableHeaderRowCardSection;
  v4 = -[SFTableRowCardSection copyWithZone:](&v24, sel_copyWithZone_, a3);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPunchoutOptions:", v6);

  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPunchoutPickerTitle:", v8);

  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPunchoutPickerDismissText:", v10);

  objc_msgSend(v4, "setCanBeHidden:", -[SFCardSection canBeHidden](self, "canBeHidden"));
  objc_msgSend(v4, "setHasTopPadding:", -[SFCardSection hasTopPadding](self, "hasTopPadding"));
  objc_msgSend(v4, "setHasBottomPadding:", -[SFCardSection hasBottomPadding](self, "hasBottomPadding"));
  -[SFTableRowCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setType:", v12);

  objc_msgSend(v4, "setSeparatorStyle:", -[SFCardSection separatorStyle](self, "separatorStyle"));
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBackgroundColor:", v14);

  -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTableIdentifier:", v16);

  -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setAlignmentSchema:", v18);

  -[SFTableRowCardSection data](self, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setData:", v20);

  objc_msgSend(v4, "setIsSubHeader:", -[SFTableRowCardSection isSubHeader](self, "isSubHeader"));
  -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setTabGroupIdentifier:", v22);

  objc_msgSend(v4, "setReducedRowHeight:", -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight"));
  objc_msgSend(v4, "setVerticalAlign:", -[SFTableRowCardSection verticalAlign](self, "verticalAlign"));
  objc_msgSend(v4, "setAlignRowsToHeader:", -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFTableHeaderRowCardSection *v5;
  SFTableHeaderRowCardSection *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  _BOOL4 v47;
  int v48;
  _BOOL4 v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  SFTableHeaderRowCardSection *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  objc_super v91;

  v5 = (SFTableHeaderRowCardSection *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (-[SFTableHeaderRowCardSection isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v91.receiver = self;
      v91.super_class = (Class)SFTableHeaderRowCardSection;
      if (-[SFTableRowCardSection isEqual:](&v91, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutOptions](v6, "punchoutOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_38:

          goto LABEL_39;
        }
        -[SFCardSection punchoutOptions](self, "punchoutOptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFCardSection punchoutOptions](self, "punchoutOptions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutOptions](v6, "punchoutOptions");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v3))
          {
            LOBYTE(v11) = 0;
            goto LABEL_36;
          }
          v90 = v10;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v12 == 0) == (v13 != 0))
        {
LABEL_35:

          LOBYTE(v11) = 0;
          v10 = v90;
          if (!v9)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
        -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
          v84 = v8;
          v15 = v7;
          v16 = v9;
          v17 = v13;
          v18 = v12;
          v19 = v3;
          v20 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerTitle](v6, "punchoutPickerTitle");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = (void *)v20;
          v21 = (void *)v20;
          v3 = v19;
          v12 = v18;
          v13 = v17;
          v9 = v16;
          v7 = v15;
          v8 = v84;
          if (!objc_msgSend(v21, "isEqual:"))
            goto LABEL_33;
        }
        v88 = v3;
        v89 = v14;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          goto LABEL_32;
        }
        v81 = v22;
        v82 = v23;
        -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (v83)
        {
          -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
          v24 = objc_claimAutoreleasedReturnValue();
          -[SFCardSection punchoutPickerDismissText](v6, "punchoutPickerDismissText");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = (void *)v24;
          v25 = (void *)v24;
          v14 = v89;
          v26 = v83;
          if (!objc_msgSend(v25, "isEqual:"))
            goto LABEL_30;
        }
        v27 = -[SFCardSection canBeHidden](self, "canBeHidden");
        if (v27 == -[SFCardSection canBeHidden](v6, "canBeHidden"))
        {
          v28 = -[SFCardSection hasTopPadding](self, "hasTopPadding");
          if (v28 == -[SFCardSection hasTopPadding](v6, "hasTopPadding"))
          {
            v29 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
            if (v29 == -[SFCardSection hasBottomPadding](v6, "hasBottomPadding"))
            {
              -[SFTableRowCardSection type](self, "type");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFTableRowCardSection type](v6, "type");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v30 == 0) != (v31 != 0))
              {
                v77 = v31;
                v78 = v30;
                -[SFTableRowCardSection type](self, "type");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v83;
                if (v32)
                {
                  -[SFTableRowCardSection type](self, "type");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTableRowCardSection type](v6, "type");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v76, "isEqual:"))
                  {
LABEL_54:

LABEL_55:
                    v14 = v89;
                    if (!v26)
                      goto LABEL_31;
                    goto LABEL_30;
                  }
                }
                v75 = v32;
                v34 = -[SFCardSection separatorStyle](self, "separatorStyle");
                if (v34 != -[SFCardSection separatorStyle](v6, "separatorStyle"))
                {
LABEL_53:
                  v26 = v83;
                  v32 = v75;
                  if (!v75)
                    goto LABEL_55;
                  goto LABEL_54;
                }
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFCardSection backgroundColor](v6, "backgroundColor");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v35 == 0) == (v36 != 0))
                {

                  goto LABEL_53;
                }
                v70 = v36;
                v85 = v8;
                v69 = v7;
                v71 = v13;
                v72 = v12;
                -[SFCardSection backgroundColor](self, "backgroundColor");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if (v37)
                {
                  -[SFCardSection backgroundColor](self, "backgroundColor");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFCardSection backgroundColor](v6, "backgroundColor");
                  v8 = v38;
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!objc_msgSend(v38, "isEqual:"))
                    goto LABEL_51;
                }
                -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = v6;
                -[SFTableRowCardSection tableIdentifier](v6, "tableIdentifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = v40;
                if ((v39 == 0) == (v40 != 0))
                {

                  v6 = v73;
                  if (!v37)
                  {
LABEL_52:

                    v13 = v71;
                    v12 = v72;
                    v7 = v69;
                    v8 = v85;
                    goto LABEL_53;
                  }
LABEL_51:

                  goto LABEL_52;
                }
                -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                if (v68)
                {
                  -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTableRowCardSection tableIdentifier](v73, "tableIdentifier");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  v65 = v42;
                  if (!objc_msgSend(v42, "isEqual:"))
                    goto LABEL_62;
                }
                -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFTableRowCardSection alignmentSchema](v73, "alignmentSchema");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v67 == 0) == (v66 != 0))
                {

                  if (!v68)
                  {
LABEL_63:

                    if (v37)
                    {

                    }
                    if (v75)
                    {

                    }
                    if (v83)
                    {

                    }
                    if (!v89)
                    {
LABEL_89:

                      LOBYTE(v11) = 0;
                      if (v9)
                      {
LABEL_90:
                        v10 = v90;
                        v3 = v88;
                        v7 = v69;
                        v8 = v85;
                        v6 = v73;
                        goto LABEL_36;
                      }
LABEL_120:
                      v7 = v69;
                      v8 = v85;
                      v6 = v73;
                      goto LABEL_37;
                    }
LABEL_87:

LABEL_88:
                    goto LABEL_89;
                  }
LABEL_62:

                  goto LABEL_63;
                }
                -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v63)
                {
                  -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTableRowCardSection alignmentSchema](v73, "alignmentSchema");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = v43;
                  if (!objc_msgSend(v43, "isEqual:"))
                  {
LABEL_77:

LABEL_78:
                    if (v68)
                    {

                    }
                    if (v37)
                    {

                    }
                    if (v75)
                    {

                    }
                    if (v83)
                    {

                    }
                    if (!v89)
                      goto LABEL_88;
                    goto LABEL_87;
                  }
                }
                -[SFTableRowCardSection data](self, "data");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFTableRowCardSection data](v73, "data");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v62 == 0) == (v61 != 0))
                {

                  if (!v63)
                    goto LABEL_78;
                  goto LABEL_77;
                }
                -[SFTableRowCardSection data](self, "data");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                if (v58)
                {
                  -[SFTableRowCardSection data](self, "data");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTableRowCardSection data](v73, "data");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = v44;
                  if (!objc_msgSend(v44, "isEqual:"))
                  {
                    LOBYTE(v11) = 0;
LABEL_106:

LABEL_107:
                    if (v63)
                    {

                    }
                    if (v68)
                    {

                    }
                    if (v37)
                    {

                    }
                    if (v75)
                    {

                    }
                    if (v83)
                    {

                    }
                    if (v89)
                    {

                    }
                    if (v9)
                      goto LABEL_90;
                    goto LABEL_120;
                  }
                }
                v45 = -[SFTableRowCardSection isSubHeader](self, "isSubHeader");
                if (v45 == -[SFTableRowCardSection isSubHeader](v73, "isSubHeader"))
                {
                  -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFTableRowCardSection tabGroupIdentifier](v73, "tabGroupIdentifier");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((v55 == 0) != (v54 != 0))
                  {
                    -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v53
                      || (-[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier"),
                          v46 = (void *)objc_claimAutoreleasedReturnValue(),
                          -[SFTableRowCardSection tabGroupIdentifier](v73, "tabGroupIdentifier"),
                          v51 = (void *)objc_claimAutoreleasedReturnValue(),
                          v52 = v46,
                          objc_msgSend(v46, "isEqual:")))
                    {
                      v47 = -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight");
                      if (v47 == -[SFTableRowCardSection reducedRowHeight](v73, "reducedRowHeight")
                        && (v48 = -[SFTableRowCardSection verticalAlign](self, "verticalAlign"),
                            v48 == -[SFTableRowCardSection verticalAlign](v73, "verticalAlign")))
                      {
                        v49 = -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader");
                        v11 = v49 ^ -[SFTableRowCardSection alignRowsToHeader](v73, "alignRowsToHeader") ^ 1;
                        v50 = v11;
                      }
                      else
                      {
                        LOBYTE(v11) = 0;
                        v50 = 0;
                      }
                      if (!v53)
                      {

                        LOBYTE(v11) = v50;
LABEL_105:
                        if (!v58)
                          goto LABEL_107;
                        goto LABEL_106;
                      }
                    }
                    else
                    {
                      LOBYTE(v11) = 0;
                    }

                    goto LABEL_105;
                  }

                }
                LOBYTE(v11) = 0;
                goto LABEL_105;
              }

            }
          }
        }
        v14 = v89;
        v26 = v83;
        if (!v83)
        {
LABEL_31:

LABEL_32:
          v3 = v88;
          if (!v14)
          {
LABEL_34:

            goto LABEL_35;
          }
LABEL_33:

          goto LABEL_34;
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SFTableHeaderRowCardSection;
  v3 = -[SFTableRowCardSection hash](&v31, sel_hash);
  -[SFCardSection punchoutOptions](self, "punchoutOptions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash");
  -[SFCardSection punchoutPickerTitle](self, "punchoutPickerTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 ^ objc_msgSend(v29, "hash");
  -[SFCardSection punchoutPickerDismissText](self, "punchoutPickerDismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  v8 = v7 ^ -[SFCardSection canBeHidden](self, "canBeHidden");
  v9 = v8 ^ -[SFCardSection hasTopPadding](self, "hasTopPadding") ^ v3;
  v10 = -[SFCardSection hasBottomPadding](self, "hasBottomPadding");
  -[SFTableRowCardSection type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  v13 = v12 ^ -[SFCardSection separatorStyle](self, "separatorStyle");
  -[SFCardSection backgroundColor](self, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[SFTableRowCardSection tableIdentifier](self, "tableIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9 ^ v15 ^ objc_msgSend(v16, "hash");
  -[SFTableRowCardSection alignmentSchema](self, "alignmentSchema");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hash");
  -[SFTableRowCardSection data](self, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19 ^ objc_msgSend(v20, "hash");
  v22 = v21 ^ -[SFTableRowCardSection isSubHeader](self, "isSubHeader");
  -[SFTableRowCardSection tabGroupIdentifier](self, "tabGroupIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  v25 = v24 ^ -[SFTableRowCardSection reducedRowHeight](self, "reducedRowHeight");
  v26 = v25 ^ -[SFTableRowCardSection verticalAlign](self, "verticalAlign");
  v27 = v17 ^ v26 ^ -[SFTableRowCardSection alignRowsToHeader](self, "alignRowsToHeader");

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
