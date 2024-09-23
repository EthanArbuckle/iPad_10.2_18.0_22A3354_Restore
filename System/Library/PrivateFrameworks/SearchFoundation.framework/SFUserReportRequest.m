@implementation SFUserReportRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setReportType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reportType = a3;
}

- (BOOL)hasReportType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFUserReportRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBUserReportRequest *v6;
  SFUserReportRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBUserReportRequest initWithData:]([_SFPBUserReportRequest alloc], "initWithData:", v5);
  v7 = -[SFUserReportRequest initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBUserReportRequest *v6;

  v4 = a3;
  v6 = -[_SFPBUserReportRequest initWithFacade:]([_SFPBUserReportRequest alloc], "initWithFacade:", self);
  -[_SFPBUserReportRequest data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBUserReportRequest *v2;
  void *v3;

  v2 = -[_SFPBUserReportRequest initWithFacade:]([_SFPBUserReportRequest alloc], "initWithFacade:", self);
  -[_SFPBUserReportRequest dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBUserReportRequest *v2;
  void *v3;

  v2 = -[_SFPBUserReportRequest initWithFacade:]([_SFPBUserReportRequest alloc], "initWithFacade:", self);
  -[_SFPBUserReportRequest jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFUserReportRequest affordanceText](self, "affordanceText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAffordanceText:", v6);

  -[SFUserReportRequest title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTitle:", v8);

  -[SFUserReportRequest dismissText](self, "dismissText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setDismissText:", v10);

  -[SFUserReportRequest userReportOptions](self, "userReportOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setUserReportOptions:", v12);

  objc_msgSend(v4, "setReportType:", -[SFUserReportRequest reportType](self, "reportType"));
  -[SFUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setReportOptionsSectionTitle:", v14);

  -[SFUserReportRequest disclaimerText](self, "disclaimerText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setDisclaimerText:", v16);

  -[SFUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setDisclaimerLearnMorePunchout:", v18);

  -[SFUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setAttachmentSectionTitle:", v20);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFUserReportRequest *v4;
  SFUserReportRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
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
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
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

  v4 = (SFUserReportRequest *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFUserReportRequest isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFUserReportRequest affordanceText](self, "affordanceText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest affordanceText](v5, "affordanceText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v11 = 0;
LABEL_26:

        goto LABEL_27;
      }
      -[SFUserReportRequest affordanceText](self, "affordanceText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFUserReportRequest affordanceText](self, "affordanceText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest affordanceText](v5, "affordanceText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v71 = v10;
        v72 = v9;
      }
      -[SFUserReportRequest title](self, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest title](v5, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) == (v13 != 0))
        goto LABEL_22;
      -[SFUserReportRequest title](self, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[SFUserReportRequest title](self, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest title](v5, "title");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v15;
        if (!objc_msgSend(v15, "isEqual:", v68))
          goto LABEL_20;
      }
      v70 = v14;
      -[SFUserReportRequest dismissText](self, "dismissText");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest dismissText](v5, "dismissText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_21:

LABEL_22:
          v11 = 0;
          if (!v8)
          {
LABEL_25:

            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_20:

        goto LABEL_21;
      }
      v65 = v16;
      v66 = v17;
      -[SFUserReportRequest dismissText](self, "dismissText");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        -[SFUserReportRequest dismissText](self, "dismissText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest dismissText](v5, "dismissText");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v18;
        if (!objc_msgSend(v18, "isEqual:", v63))
        {
LABEL_50:

LABEL_51:
          if (!v14)
            goto LABEL_21;
          goto LABEL_20;
        }
      }
      -[SFUserReportRequest userReportOptions](self, "userReportOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest userReportOptions](v5, "userReportOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v20 == 0) == (v21 != 0))
      {

        goto LABEL_49;
      }
      v60 = v20;
      v61 = v21;
      -[SFUserReportRequest userReportOptions](self, "userReportOptions");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        -[SFUserReportRequest userReportOptions](self, "userReportOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest userReportOptions](v5, "userReportOptions");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v22;
        v23 = objc_msgSend(v22, "isEqual:");
        v14 = v70;
        if (!v23)
          goto LABEL_47;
      }
      v24 = -[SFUserReportRequest reportType](self, "reportType");
      if (v24 != -[SFUserReportRequest reportType](v5, "reportType"))
      {
LABEL_46:
        if (!v62)
        {
LABEL_48:

LABEL_49:
          if (!v67)
            goto LABEL_51;
          goto LABEL_50;
        }
LABEL_47:

        goto LABEL_48;
      }
      -[SFUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest reportOptionsSectionTitle](v5, "reportOptionsSectionTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v25 == 0) == (v26 != 0))
      {

        v14 = v70;
        goto LABEL_46;
      }
      v55 = v26;
      v56 = v25;
      -[SFUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
      v14 = v70;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        -[SFUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest reportOptionsSectionTitle](v5, "reportOptionsSectionTitle");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v27;
        if (!objc_msgSend(v27, "isEqual:", v53))
          goto LABEL_44;
      }
      -[SFUserReportRequest disclaimerText](self, "disclaimerText");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest disclaimerText](v5, "disclaimerText");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v28 == 0) == (v29 != 0))
      {

        v14 = v70;
        if (!v57)
        {
LABEL_45:

          goto LABEL_46;
        }
LABEL_44:

        goto LABEL_45;
      }
      v51 = v29;
      v52 = v28;
      -[SFUserReportRequest disclaimerText](self, "disclaimerText");
      v50 = objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        -[SFUserReportRequest disclaimerText](self, "disclaimerText");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest disclaimerText](v5, "disclaimerText");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
          v11 = 0;
          v31 = (void *)v50;
          goto LABEL_58;
        }
      }
      -[SFUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest disclaimerLearnMorePunchout](v5, "disclaimerLearnMorePunchout");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v32 == 0) == (v33 != 0))
      {

        v11 = 0;
        v28 = v52;
        v31 = (void *)v50;
        if (!v50)
          goto LABEL_59;
        goto LABEL_58;
      }
      v45 = v33;
      v46 = v32;
      -[SFUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47
        || (-[SFUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFUserReportRequest disclaimerLearnMorePunchout](v5, "disclaimerLearnMorePunchout"),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v44 = v34,
            objc_msgSend(v34, "isEqual:")))
      {
        -[SFUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUserReportRequest attachmentSectionTitle](v5, "attachmentSectionTitle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if ((v42 == 0) == (v36 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
          v38 = objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v39 = (void *)v38;
            -[SFUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFUserReportRequest attachmentSectionTitle](v5, "attachmentSectionTitle");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v41, "isEqual:", v40);

          }
          else
          {

            v11 = 1;
          }
        }
        v32 = v46;
        v35 = (void *)v47;
        if (!v47)
        {
LABEL_76:

          v31 = (void *)v50;
          v28 = v52;
          if (!v50)
          {
LABEL_59:

            if (v57)
            {

            }
            if (v62)
            {

            }
            if (v67)
            {

            }
            if (v70)
            {

            }
            if (!v8)
              goto LABEL_25;
LABEL_23:
            v10 = v71;
            v9 = v72;
            goto LABEL_24;
          }
LABEL_58:

          goto LABEL_59;
        }
      }
      else
      {
        v11 = 0;
        v35 = (void *)v47;
      }

      goto LABEL_76;
    }
    v11 = 0;
  }
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  -[SFUserReportRequest affordanceText](self, "affordanceText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFUserReportRequest title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFUserReportRequest dismissText](self, "dismissText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFUserReportRequest userReportOptions](self, "userReportOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[SFUserReportRequest reportType](self, "reportType");
  -[SFUserReportRequest reportOptionsSectionTitle](self, "reportOptionsSectionTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[SFUserReportRequest disclaimerText](self, "disclaimerText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v10 ^ v13 ^ objc_msgSend(v14, "hash");
  -[SFUserReportRequest disclaimerLearnMorePunchout](self, "disclaimerLearnMorePunchout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hash");
  -[SFUserReportRequest attachmentSectionTitle](self, "attachmentSectionTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (NSString)affordanceText
{
  return self->_affordanceText;
}

- (void)setAffordanceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)dismissText
{
  return self->_dismissText;
}

- (void)setDismissText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)userReportOptions
{
  return self->_userReportOptions;
}

- (void)setUserReportOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int)reportType
{
  return self->_reportType;
}

- (NSString)reportOptionsSectionTitle
{
  return self->_reportOptionsSectionTitle;
}

- (void)setReportOptionsSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (void)setDisclaimerText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SFPunchout)disclaimerLearnMorePunchout
{
  return self->_disclaimerLearnMorePunchout;
}

- (void)setDisclaimerLearnMorePunchout:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLearnMorePunchout, a3);
}

- (NSString)attachmentSectionTitle
{
  return self->_attachmentSectionTitle;
}

- (void)setAttachmentSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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

- (SFUserReportRequest)initWithProtobuf:(id)a3
{
  id v4;
  SFUserReportRequest *v5;
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
  SFPunchout *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SFPunchout *v25;
  void *v26;
  SFPunchout *v27;
  void *v28;
  void *v29;
  SFUserReportRequest *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFUserReportRequest;
  v5 = -[SFUserReportRequest init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "affordanceText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "affordanceText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest setAffordanceText:](v5, "setAffordanceText:", v7);

    }
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest setTitle:](v5, "setTitle:", v9);

    }
    objc_msgSend(v4, "dismissText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "dismissText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest setDismissText:](v5, "setDismissText:", v11);

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
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
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
          v19 = -[SFPunchout initWithProtobuf:]([SFPunchout alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v16);
    }

    -[SFUserReportRequest setUserReportOptions:](v5, "setUserReportOptions:", v13);
    if (objc_msgSend(v4, "reportType"))
      -[SFUserReportRequest setReportType:](v5, "setReportType:", objc_msgSend(v4, "reportType"));
    objc_msgSend(v4, "reportOptionsSectionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "reportOptionsSectionTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest setReportOptionsSectionTitle:](v5, "setReportOptionsSectionTitle:", v21);

    }
    objc_msgSend(v4, "disclaimerText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "disclaimerText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest setDisclaimerText:](v5, "setDisclaimerText:", v23);

    }
    objc_msgSend(v4, "disclaimerLearnMorePunchout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFPunchout alloc];
      objc_msgSend(v4, "disclaimerLearnMorePunchout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFPunchout initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFUserReportRequest setDisclaimerLearnMorePunchout:](v5, "setDisclaimerLearnMorePunchout:", v27);

    }
    objc_msgSend(v4, "attachmentSectionTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "attachmentSectionTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUserReportRequest setAttachmentSectionTitle:](v5, "setAttachmentSectionTitle:", v29);

    }
    v30 = v5;

  }
  return v5;
}

@end
