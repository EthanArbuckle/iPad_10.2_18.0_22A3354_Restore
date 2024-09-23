@implementation SSScreenTimeRequestResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.people.screenTimeRequest");
}

- (SSScreenTimeRequestResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSScreenTimeRequestResultBuilder *v5;
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
  uint64_t v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SSScreenTimeRequestResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v24, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FE8], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestedItemName:](v5, "setRequestedItemName:", v7);

    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v6;
    else
      v9 = 0;
    -[SSScreenTimeRequestResultBuilder setApprovers:](v5, "setApprovers:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestedItemDescription:](v5, "setRequestedItemDescription:", v10);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestDate:](v5, "setRequestDate:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA62E8], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setExpireDate:](v5, "setExpireDate:", v12);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FC0], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestStatus:](v5, "setRequestStatus:", objc_msgSend(v13, "unsignedIntValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FC8], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestStatusString:](v5, "setRequestStatusString:", v14);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60B0], objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequesterContactIdentifier:](v5, "setRequesterContactIdentifier:", v15);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6978], objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestIdentifier:](v5, "setRequestIdentifier:", v16);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60E0], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRespondDate:](v5, "setRespondDate:", v17);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6020], objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequesterDSID:](v5, "setRequesterDSID:", v18);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A8], objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSScreenTimeRequestResultBuilder setRequestAmountDuration:](v5, "setRequestAmountDuration:", v19);

    -[SSScreenTimeRequestResultBuilder requestAmountDuration](v5, "requestAmountDuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      if (-[SSScreenTimeRequestResultBuilder requestStatus](v5, "requestStatus") == 3)
        v21 = 0xFFFFFFFFLL;
      else
        v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSScreenTimeRequestResultBuilder setRequestAmountDuration:](v5, "setRequestAmountDuration:", v22);

    }
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
  v6.super_class = (Class)SSScreenTimeRequestResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v6, sel_buildInlineCardSection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxLines:", 1);

  return v2;
}

- (id)buildInlineCardSections
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SSScreenTimeRequestResultBuilder buildInlineCardSection](self, "buildInlineCardSection");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)subclassBuildHorizontallyScrollingCardSection
{
  void *v2;

  -[SSScreenTimeRequestResultBuilder buildInlineCardSection](self, "buildInlineCardSection");
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
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSScreenTimeRequestResultBuilder requestedItemDescription](self, "requestedItemDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SSScreenTimeRequestResultBuilder requestedItemDescription](self, "requestedItemDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

  }
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildFootnote
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = -[SSScreenTimeRequestResultBuilder requestStatus](self, "requestStatus");
  v4 = -[SSScreenTimeRequestResultBuilder requestStatus](self, "requestStatus");
  if (v3 == 3 || v4 == 2)
  {
    -[SSScreenTimeRequestResultBuilder requestAmountDuration](self, "requestAmountDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    if (v7 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("ASK_FOR_TIME_APPROVED_DAY");
    }
    else if (v7 == 3600)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("ASK_FOR_TIME_APPROVED_HOUR");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == 900)
      {
        v9 = v8;
        v10 = CFSTR("ASK_FOR_TIME_APPROVED15");
      }
      else
      {
        v9 = v8;
        v10 = CFSTR("ASK_FOR_TIME_DECLINED");
      }
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E6E549F0, CFSTR("SpotlightServices"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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

  -[SSScreenTimeRequestResultBuilder requestDate](self, "requestDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSScreenTimeRequestResultBuilder requestDate](self, "requestDate");
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
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SSScreenTimeRequestResultBuilder requesterDSID](self, "requesterDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SSScreenTimeRequestResultBuilder requestIdentifier](self, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("prefs:root=SCREEN_TIME&path=CHILD_%@#ASK_%@"), v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSScreenTimeRequestResultBuilder requestIdentifier](self, "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabel:", v10);

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setPunchout:", v9);

  return v11;
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
  if (-[SSScreenTimeRequestResultBuilder requestStatus](self, "requestStatus") == 3
    || -[SSScreenTimeRequestResultBuilder requestStatus](self, "requestStatus") == 2)
  {
    return 0;
  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VIEW"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  -[SSScreenTimeRequestResultBuilder buildCommand](self, "buildCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCommand:", v7);

  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildThumbnail
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSScreenTimeRequestResultBuilder;
  -[SSResultBuilder buildThumbnail](&v4, sel_buildThumbnail);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCornerRoundingStyle:", 3);
  return v2;
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

- (NSArray)approvers
{
  return self->_approvers;
}

- (void)setApprovers:(id)a3
{
  objc_storeStrong((id *)&self->_approvers, a3);
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
  objc_storeStrong((id *)&self->_expireDate, a3);
}

- (NSDate)respondDate
{
  return self->_respondDate;
}

- (void)setRespondDate:(id)a3
{
  objc_storeStrong((id *)&self->_respondDate, a3);
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestDate, a3);
}

- (NSString)requestedItemName
{
  return self->_requestedItemName;
}

- (void)setRequestedItemName:(id)a3
{
  objc_storeStrong((id *)&self->_requestedItemName, a3);
}

- (NSString)requestedItemDescription
{
  return self->_requestedItemDescription;
}

- (void)setRequestedItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_requestedItemDescription, a3);
}

- (NSString)requesterContactIdentifier
{
  return self->_requesterContactIdentifier;
}

- (void)setRequesterContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requesterContactIdentifier, a3);
}

- (NSNumber)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
  objc_storeStrong((id *)&self->_requesterDSID, a3);
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

- (NSNumber)requestAmountDuration
{
  return self->_requestAmountDuration;
}

- (void)setRequestAmountDuration:(id)a3
{
  objc_storeStrong((id *)&self->_requestAmountDuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAmountDuration, 0);
  objc_storeStrong((id *)&self->_requestStatusString, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requesterContactIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedItemDescription, 0);
  objc_storeStrong((id *)&self->_requestedItemName, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_respondDate, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_approvers, 0);
}

@end
