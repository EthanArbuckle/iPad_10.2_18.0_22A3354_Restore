@implementation SFUserReportFeedback

- (SFUserReportFeedback)initWithSelection:(id)a3 result:(id)a4 cardSection:(id)a5 resultSections:(id)a6 uploadedDataIdentifier:(id)a7 userReportRequestType:(int)a8
{
  id v15;
  id v16;
  SFUserReportFeedback *v17;
  SFUserReportFeedback *v18;

  v15 = a6;
  v16 = a7;
  v17 = -[SFUserReportFeedback initWithSelection:result:cardSection:](self, "initWithSelection:result:cardSection:", a3, a4, a5);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sections, a6);
    objc_storeStrong((id *)&v18->_uploadedDataIdentifier, a7);
    v18->_reportType = a8;
  }

  return v18;
}

- (SFUserReportFeedback)initWithSelection:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v9;
  id v10;
  id v11;
  SFUserReportFeedback *v12;
  SFUserReportFeedback *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SFUserReportFeedback;
  v12 = -[SFFeedback init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_result, a4);
    objc_storeStrong((id *)&v13->_userSelection, a3);
    objc_storeStrong((id *)&v13->_cardSection, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SFUserReportFeedback;
  v4 = -[SFFeedback copyWithZone:](&v21, sel_copyWithZone_, a3);
  -[SFUserReportFeedback result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[4];
  v4[4] = v6;

  -[SFUserReportFeedback userSelection](self, "userSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  -[SFUserReportFeedback cardSection](self, "cardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[5];
  v4[5] = v12;

  -[SFUserReportFeedback sections](self, "sections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[7];
  v4[7] = v15;

  -[SFUserReportFeedback uploadedDataIdentifier](self, "uploadedDataIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  v19 = (void *)v4[8];
  v4[8] = v18;

  *((_DWORD *)v4 + 6) = -[SFUserReportFeedback reportType](self, "reportType");
  return v4;
}

- (SFUserReportFeedback)initWithCoder:(id)a3
{
  id v4;
  SFUserReportFeedback *v5;
  uint64_t v6;
  SFPunchout *userSelection;
  uint64_t v8;
  SFSearchResult *v9;
  uint64_t v10;
  SFCardSection *cardSection;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFUserReportFeedback;
  v5 = -[SFFeedback initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userSelection"));
    v6 = objc_claimAutoreleasedReturnValue();
    userSelection = v5->_userSelection;
    v5->_userSelection = (SFPunchout *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_result"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_result;
    v5->_result = (SFSearchResult *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cardSection"));
    v10 = objc_claimAutoreleasedReturnValue();
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFUserReportFeedback;
  v4 = a3;
  -[SFFeedback encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userSelection, CFSTR("_userSelection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("_result"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSection, CFSTR("_cardSection"));

}

- (SFSearchResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (SFPunchout)userSelection
{
  return self->_userSelection;
}

- (void)setUserSelection:(id)a3
{
  objc_storeStrong((id *)&self->_userSelection, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSString)uploadedDataIdentifier
{
  return self->_uploadedDataIdentifier;
}

- (void)setUploadedDataIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uploadedDataIdentifier, a3);
}

- (int)reportType
{
  return self->_reportType;
}

- (void)setReportType:(int)a3
{
  self->_reportType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadedDataIdentifier, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
