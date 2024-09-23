@implementation SSPurchaseRequestResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.people.askToBuyRequest");
}

- (SSPurchaseRequestResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSPurchaseRequestResultBuilder *v5;
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
  float v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SSPurchaseRequestResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v25, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FE8], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6770], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setAgeRating:](v5, "setAgeRating:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setAppName:](v5, "setAppName:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA63C0], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setAppPrice:](v5, "setAppPrice:", v9);

    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v6;
    else
      v11 = 0;
    -[SSPurchaseRequestResultBuilder setApprovers:](v5, "setApprovers:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setAppType:](v5, "setAppType:", v12);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setRequestDate:](v5, "setRequestDate:", v13);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FC0], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setRequestStatus:](v5, "setRequestStatus:", objc_msgSend(v14, "unsignedIntValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FC8], objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setRequestStatusString:](v5, "setRequestStatusString:", v15);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60B0], objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setRequesterContactIdentifier:](v5, "setRequesterContactIdentifier:", v16);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6978], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setRequestIdentifier:](v5, "setRequestIdentifier:", v17);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60E0], objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPurchaseRequestResultBuilder setRespondDate:](v5, "setRespondDate:", v18);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68C0], objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    -[SSPurchaseRequestResultBuilder setStarRating:](v5, "setStarRating:", v20);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6940], objc_opt_class());
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (const __CFString *)v21;
    else
      v23 = &stru_1E6E549F0;
    -[SSPurchaseRequestResultBuilder setThumbnailAppType:](v5, "setThumbnailAppType:", v23);

  }
  return v5;
}

- (id)buildInlineCardSection
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSPurchaseRequestResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v6, sel_buildInlineCardSection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxLines:", 1);

  return v2;
}

- (id)subclassBuildHorizontallyScrollingCardSection
{
  void *v2;

  -[SSPurchaseRequestResultBuilder buildInlineCardSection](self, "buildInlineCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreventThumbnailImageScaling:", 1);
  return v2;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSPurchaseRequestResultBuilder appType](self, "appType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SSPurchaseRequestResultBuilder appType](self, "appType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

  }
  -[SSPurchaseRequestResultBuilder appPrice](self, "appPrice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v3, "appendString:", CFSTR(" · "));
    -[SSPurchaseRequestResultBuilder appPrice](self, "appPrice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

  }
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)buildFootnote
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  __CFString *v7;
  double v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = -[SSPurchaseRequestResultBuilder requestStatus](self, "requestStatus");
  v4 = -[SSPurchaseRequestResultBuilder requestStatus](self, "requestStatus");
  if (v3 == 3 || v4 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v3 == 3)
      v17 = CFSTR("APPROVED");
    else
      v17 = CFSTR("DENIED");
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSPurchaseRequestResultBuilder approvers](self, "approvers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APPROVED_BY_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v21, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v5;
  }
  v5 = (void *)objc_opt_new();
  -[SSPurchaseRequestResultBuilder starRating](self, "starRating");
  objc_msgSend(v5, "setStarRating:");
  -[SSPurchaseRequestResultBuilder ageRating](self, "ageRating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SSPurchaseRequestResultBuilder starRating](self, "starRating");
    v7 = &stru_1E6E549F0;
    if (v8 != 0.0)
      v7 = CFSTR("· ");
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = v7;
    -[SSPurchaseRequestResultBuilder ageRating](self, "ageRating");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", CFSTR("%@%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFormattedTextPieces:", v14);
    goto LABEL_11;
  }
  return v5;
}

- (id)buildSecondaryTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SSPurchaseRequestResultBuilder requestDate](self, "requestDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSPurchaseRequestResultBuilder requestDate](self, "requestDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)buildSecondaryTitleIsDetached
{
  return 1;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildCommand
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSPurchaseRequestResultBuilder requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestIdentifier:", v4);

  return v3;
}

- (id)buildButtonItems
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[SSPurchaseRequestResultBuilder requestStatus](self, "requestStatus") == 3
    || -[SSPurchaseRequestResultBuilder requestStatus](self, "requestStatus") == 2)
  {
    return 0;
  }
  -[SSPurchaseRequestResultBuilder buildCommand](self, "buildCommand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VIEW"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(v5, "setCommand:", v4);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSPurchaseRequestResultBuilder;
  -[SSResultBuilder buildThumbnail](&v7, sel_buildThumbnail);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPurchaseRequestResultBuilder thumbnailAppType](self, "thumbnailAppType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_1E6E9B620, "containsObject:", v4))
    v5 = 3;
  else
    v5 = 0;
  objc_msgSend(v3, "setCornerRoundingStyle:", v5);

  return v3;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (int)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(int)a3
{
  self->_requestStatus = a3;
}

- (double)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(double)a3
{
  self->_starRating = a3;
}

- (NSArray)approvers
{
  return self->_approvers;
}

- (void)setApprovers:(id)a3
{
  objc_storeStrong((id *)&self->_approvers, a3);
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestDate, a3);
}

- (NSDate)respondDate
{
  return self->_respondDate;
}

- (void)setRespondDate:(id)a3
{
  objc_storeStrong((id *)&self->_respondDate, a3);
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(id)a3
{
  objc_storeStrong((id *)&self->_ageRating, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)appPrice
{
  return self->_appPrice;
}

- (void)setAppPrice:(id)a3
{
  objc_storeStrong((id *)&self->_appPrice, a3);
}

- (NSString)appType
{
  return self->_appType;
}

- (void)setAppType:(id)a3
{
  objc_storeStrong((id *)&self->_appType, a3);
}

- (NSString)requesterContactIdentifier
{
  return self->_requesterContactIdentifier;
}

- (void)setRequesterContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requesterContactIdentifier, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (NSString)requestStatusString
{
  return self->_requestStatusString;
}

- (void)setRequestStatusString:(id)a3
{
  objc_storeStrong((id *)&self->_requestStatusString, a3);
}

- (NSString)requesterName
{
  return self->_requesterName;
}

- (void)setRequesterName:(id)a3
{
  objc_storeStrong((id *)&self->_requesterName, a3);
}

- (NSString)thumbnailAppType
{
  return self->_thumbnailAppType;
}

- (void)setThumbnailAppType:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailAppType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailAppType, 0);
  objc_storeStrong((id *)&self->_requesterName, 0);
  objc_storeStrong((id *)&self->_requestStatusString, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterContactIdentifier, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_appPrice, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_respondDate, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_approvers, 0);
}

@end
