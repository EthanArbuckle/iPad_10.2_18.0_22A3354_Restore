@implementation _SFPBUserReportRequest

- (_SFPBUserReportRequest)initWithFacade:(id)a3
{
  id v4;
  _SFPBUserReportRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _SFPBPunchout *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _SFPBPunchout *v25;
  void *v26;
  _SFPBPunchout *v27;
  void *v28;
  void *v29;
  _SFPBUserReportRequest *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBUserReportRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "affordanceText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "affordanceText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserReportRequest setAffordanceText:](v5, "setAffordanceText:", v7);

    }
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserReportRequest setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "dismissText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "dismissText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserReportRequest setDismissText:](v5, "setDismissText:", v11);

    }
    objc_msgSend(v4, "userReportOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v4, "userReportOptions", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          v19 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v16);
    }

    -[_SFPBUserReportRequest setUserReportOptions:](v5, "setUserReportOptions:", v13);
    if (objc_msgSend(v4, "hasReportType"))
      -[_SFPBUserReportRequest setReportType:](v5, "setReportType:", objc_msgSend(v4, "reportType"));
    objc_msgSend(v4, "reportOptionsSectionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "reportOptionsSectionTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserReportRequest setReportOptionsSectionTitle:](v5, "setReportOptionsSectionTitle:", v21);

    }
    objc_msgSend(v4, "disclaimerText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "disclaimerText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserReportRequest setDisclaimerText:](v5, "setDisclaimerText:", v23);

    }
    objc_msgSend(v4, "disclaimerLearnMorePunchout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "disclaimerLearnMorePunchout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[_SFPBPunchout initWithFacade:](v25, "initWithFacade:", v26);
      -[_SFPBUserReportRequest setDisclaimerLearnMorePunchout:](v5, "setDisclaimerLearnMorePunchout:", v27);

    }
    objc_msgSend(v4, "attachmentSectionTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "attachmentSectionTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBUserReportRequest setAttachmentSectionTitle:](v5, "setAttachmentSectionTitle:", v29);

    }
    v30 = v5;

  }
  return v5;
}

- (void)setAffordanceText:(id)a3
{
  NSString *v4;
  NSString *affordanceText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  affordanceText = self->_affordanceText;
  self->_affordanceText = v4;

}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  title = self->_title;
  self->_title = v4;

}

- (void)setDismissText:(id)a3
{
  NSString *v4;
  NSString *dismissText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  dismissText = self->_dismissText;
  self->_dismissText = v4;

}

- (void)setUserReportOptions:(id)a3
{
  NSArray *v4;
  NSArray *userReportOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  userReportOptions = self->_userReportOptions;
  self->_userReportOptions = v4;

}

- (void)clearUserReportOptions
{
  -[NSArray removeAllObjects](self->_userReportOptions, "removeAllObjects");
}

- (void)addUserReportOptions:(id)a3
{
  id v4;
  NSArray *userReportOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  userReportOptions = self->_userReportOptions;
  v8 = v4;
  if (!userReportOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_userReportOptions;
    self->_userReportOptions = v6;

    v4 = v8;
    userReportOptions = self->_userReportOptions;
  }
  -[NSArray addObject:](userReportOptions, "addObject:", v4);

}

- (unint64_t)userReportOptionsCount
{
  return -[NSArray count](self->_userReportOptions, "count");
}

- (id)userReportOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_userReportOptions, "objectAtIndexedSubscript:", a3);
}

- (void)setReportType:(int)a3
{
  self->_reportType = a3;
}

- (void)setReportOptionsSectionTitle:(id)a3
{
  NSString *v4;
  NSString *reportOptionsSectionTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reportOptionsSectionTitle = self->_reportOptionsSectionTitle;
  self->_reportOptionsSectionTitle = v4;

}

- (void)setDisclaimerText:(id)a3
{
  NSString *v4;
  NSString *disclaimerText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  disclaimerText = self->_disclaimerText;
  self->_disclaimerText = v4;

}

- (void)setDisclaimerLearnMorePunchout:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLearnMorePunchout, a3);
}

- (void)setAttachmentSectionTitle:(id)a3
{
  NSString *v4;
  NSString *attachmentSectionTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  attachmentSectionTitle = self->_attachmentSectionTitle;
  self->_attachmentSectionTitle = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUserReportRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBUserReportRequest affordanceText](self, "affordanceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBUserReportRequest title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBUserReportRequest dismissText](self, "dismissText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBUserReportRequest userReportOptions](self, "userReportOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if (-[_SFPBUserReportRequest reportType](self, "reportType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteStringField();

  -[_SFPBUserReportRequest disclaimerText](self, "disclaimerText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteSubmessage();

  -[_SFPBUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int reportType;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  BOOL v48;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_43;
  -[_SFPBUserReportRequest affordanceText](self, "affordanceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "affordanceText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest affordanceText](self, "affordanceText");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBUserReportRequest affordanceText](self, "affordanceText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "affordanceText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_43;
  }
  else
  {

  }
  -[_SFPBUserReportRequest title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest title](self, "title");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBUserReportRequest title](self, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_43;
  }
  else
  {

  }
  -[_SFPBUserReportRequest dismissText](self, "dismissText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest dismissText](self, "dismissText");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBUserReportRequest dismissText](self, "dismissText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_43;
  }
  else
  {

  }
  -[_SFPBUserReportRequest userReportOptions](self, "userReportOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userReportOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest userReportOptions](self, "userReportOptions");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBUserReportRequest userReportOptions](self, "userReportOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userReportOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_43;
  }
  else
  {

  }
  reportType = self->_reportType;
  if (reportType != objc_msgSend(v4, "reportType"))
    goto LABEL_43;
  -[_SFPBUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportOptionsSectionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[_SFPBUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportOptionsSectionTitle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_43;
  }
  else
  {

  }
  -[_SFPBUserReportRequest disclaimerText](self, "disclaimerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disclaimerText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest disclaimerText](self, "disclaimerText");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_SFPBUserReportRequest disclaimerText](self, "disclaimerText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disclaimerText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_43;
  }
  else
  {

  }
  -[_SFPBUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disclaimerLearnMorePunchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_42;
  -[_SFPBUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[_SFPBUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disclaimerLearnMorePunchout");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_43;
  }
  else
  {

  }
  -[_SFPBUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentSectionTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_42:

    goto LABEL_43;
  }
  -[_SFPBUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
  v43 = objc_claimAutoreleasedReturnValue();
  if (!v43)
  {

LABEL_46:
    v48 = 1;
    goto LABEL_44;
  }
  v44 = (void *)v43;
  -[_SFPBUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentSectionTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "isEqual:", v46);

  if ((v47 & 1) != 0)
    goto LABEL_46;
LABEL_43:
  v48 = 0;
LABEL_44:

  return v48;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_affordanceText, "hash");
  v4 = -[NSString hash](self->_title, "hash");
  v5 = -[NSString hash](self->_dismissText, "hash");
  v6 = -[NSArray hash](self->_userReportOptions, "hash");
  v7 = 2654435761 * self->_reportType;
  v8 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_reportOptionsSectionTitle, "hash");
  v9 = v8 ^ -[NSString hash](self->_disclaimerText, "hash") ^ v7;
  v10 = -[_SFPBPunchout hash](self->_disclaimerLearnMorePunchout, "hash");
  return v9 ^ v10 ^ -[NSString hash](self->_attachmentSectionTitle, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_affordanceText)
  {
    -[_SFPBUserReportRequest affordanceText](self, "affordanceText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("affordanceText"));

  }
  if (self->_attachmentSectionTitle)
  {
    -[_SFPBUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("attachmentSectionTitle"));

  }
  if (self->_disclaimerLearnMorePunchout)
  {
    -[_SFPBUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("disclaimerLearnMorePunchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("disclaimerLearnMorePunchout"));

    }
  }
  if (self->_disclaimerText)
  {
    -[_SFPBUserReportRequest disclaimerText](self, "disclaimerText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("disclaimerText"));

  }
  if (self->_dismissText)
  {
    -[_SFPBUserReportRequest dismissText](self, "dismissText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("dismissText"));

  }
  if (self->_reportOptionsSectionTitle)
  {
    -[_SFPBUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("reportOptionsSectionTitle"));

  }
  if (self->_reportType)
  {
    v17 = -[_SFPBUserReportRequest reportType](self, "reportType");
    if (v17 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = *(&off_1E4042190 + v17);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("reportType"));

  }
  if (self->_title)
  {
    -[_SFPBUserReportRequest title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("title"));

  }
  if (-[NSArray count](self->_userReportOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = self->_userReportOptions;
    v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(v21, "addObject:", v27);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v28);

          }
        }
        v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("userReportOptions"));
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBUserReportRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBUserReportRequest)initWithJSON:(id)a3
{
  void *v4;
  _SFPBUserReportRequest *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBUserReportRequest initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBUserReportRequest)initWithDictionary:(id)a3
{
  id v4;
  _SFPBUserReportRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  _SFPBPunchout *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _SFPBPunchout *v26;
  void *v27;
  void *v28;
  _SFPBUserReportRequest *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)_SFPBUserReportRequest;
  v5 = -[_SFPBUserReportRequest init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("affordanceText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBUserReportRequest setAffordanceText:](v5, "setAffordanceText:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBUserReportRequest setTitle:](v5, "setTitle:", v9);

    }
    v33 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBUserReportRequest setDismissText:](v5, "setDismissText:", v11);

    }
    v32 = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userReportOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v6;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v18);
              -[_SFPBUserReportRequest addUserReportOptions:](v5, "addUserReportOptions:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v15);
      }

      v6 = v31;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reportType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBUserReportRequest setReportType:](v5, "setReportType:", objc_msgSend(v20, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reportOptionsSectionTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = (void *)objc_msgSend(v21, "copy");
      -[_SFPBUserReportRequest setReportOptionsSectionTitle:](v5, "setReportOptionsSectionTitle:", v22);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disclaimerText"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(v23, "copy");
      -[_SFPBUserReportRequest setDisclaimerText:](v5, "setDisclaimerText:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("disclaimerLearnMorePunchout"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v25);
      -[_SFPBUserReportRequest setDisclaimerLearnMorePunchout:](v5, "setDisclaimerLearnMorePunchout:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attachmentSectionTitle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (void *)objc_msgSend(v27, "copy");
      -[_SFPBUserReportRequest setAttachmentSectionTitle:](v5, "setAttachmentSectionTitle:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (NSString)affordanceText
{
  return self->_affordanceText;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)dismissText
{
  return self->_dismissText;
}

- (NSArray)userReportOptions
{
  return self->_userReportOptions;
}

- (int)reportType
{
  return self->_reportType;
}

- (NSString)reportOptionsSectionTitle
{
  return self->_reportOptionsSectionTitle;
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (_SFPBPunchout)disclaimerLearnMorePunchout
{
  return self->_disclaimerLearnMorePunchout;
}

- (NSString)attachmentSectionTitle
{
  return self->_attachmentSectionTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentSectionTitle, 0);
  objc_storeStrong((id *)&self->_disclaimerLearnMorePunchout, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_reportOptionsSectionTitle, 0);
  objc_storeStrong((id *)&self->_userReportOptions, 0);
  objc_storeStrong((id *)&self->_dismissText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_affordanceText, 0);
}

@end
