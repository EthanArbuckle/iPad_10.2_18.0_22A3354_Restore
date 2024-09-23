@implementation PKPaymentSetupMoreInfoItem

- (PKPaymentSetupMoreInfoItem)initWithMoreInfoDictionary:(id)a3
{
  return -[PKPaymentSetupMoreInfoItem initWithMoreInfoDictionary:imageData:](self, "initWithMoreInfoDictionary:imageData:", a3, 0);
}

- (PKPaymentSetupMoreInfoItem)initWithMoreInfoDictionary:(id)a3 imageData:(id)a4
{
  id v6;
  id v7;
  PKPaymentSetupMoreInfoItem *v8;
  void *v9;
  uint64_t v10;
  NSString *title;
  void *v12;
  uint64_t v13;
  NSString *body;
  void *v15;
  uint64_t v16;
  NSURL *imageURL;
  uint64_t v18;
  NSData *imageData;
  void *v20;
  uint64_t v21;
  NSURL *linkURL;
  void *v23;
  uint64_t v24;
  NSString *linkText;
  NSString *v26;
  NSURL *v27;
  NSObject *v28;
  const char *v29;
  NSString *v30;
  NSURL *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSString *nextActionOverride;
  void *v38;
  uint64_t v39;
  NSString *doneActionOverride;
  void *v41;
  uint64_t v42;
  NSString *alternativeActionOverride;
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  NSDictionary *reportingMetadata;
  objc_super v50;
  uint8_t buf[4];
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentSetupMoreInfoItem;
  v8 = -[PKPaymentSetupMoreInfoItem init](&v50, sel_init);
  if (!v8)
    goto LABEL_18;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  title = v8->_title;
  v8->_title = (NSString *)v10;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("body"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  body = v8->_body;
  v8->_body = (NSString *)v13;

  objc_msgSend(v6, "PKURLForKey:", CFSTR("imageURL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  imageURL = v8->_imageURL;
  v8->_imageURL = (NSURL *)v16;

  v18 = objc_msgSend(v7, "copy");
  imageData = v8->_imageData;
  v8->_imageData = (NSData *)v18;

  objc_msgSend(v6, "PKURLForKey:", CFSTR("linkURL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  linkURL = v8->_linkURL;
  v8->_linkURL = (NSURL *)v21;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("linkText"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "copy");
  linkText = v8->_linkText;
  v8->_linkText = (NSString *)v24;

  v26 = v8->_linkText;
  v27 = v8->_linkURL;
  if (v27)
  {
    if (!v26)
      goto LABEL_6;
  }
  else if (v26)
  {
LABEL_6:
    PKLogFacilityTypeGetObject(6uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = "linkText missing";
      if (!v27)
        v29 = "linkURL missing or malformed";
      *(_DWORD *)buf = 136315138;
      v52 = v29;
      _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_DEFAULT, "more info link invalid: %s", buf, 0xCu);
    }

    v30 = v8->_linkText;
    v8->_linkText = 0;

    v31 = v8->_linkURL;
    v8->_linkURL = 0;

  }
  objc_msgSend(v6, "PKStringForKey:", CFSTR("type"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
    v34 = PKPaymentSetupMoreInfoItemTypeFromDescription(v32);
  else
    v34 = 2;
  v8->_type = v34;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("nextAction"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "copy");
  nextActionOverride = v8->_nextActionOverride;
  v8->_nextActionOverride = (NSString *)v36;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("doneAction"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "copy");
  doneActionOverride = v8->_doneActionOverride;
  v8->_doneActionOverride = (NSString *)v39;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("altAction"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "copy");
  alternativeActionOverride = v8->_alternativeActionOverride;
  v8->_alternativeActionOverride = (NSString *)v42;

  objc_msgSend(v6, "PKNumberForKey:", CFSTR("hideAltAction"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
    v46 = objc_msgSend(v44, "BOOLValue");
  else
    v46 = 1;
  v8->_hideAlternativeAction = v46;
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("reportingMetadata"));
  v47 = objc_claimAutoreleasedReturnValue();
  reportingMetadata = v8->_reportingMetadata;
  v8->_reportingMetadata = (NSDictionary *)v47;

  -[PKPaymentSetupMoreInfoItem _updateActionStrings](v8, "_updateActionStrings");
LABEL_18:

  return v8;
}

- (void)_updateActionStrings
{
  NSString *v3;
  NSString *nextAction;
  NSString *v5;
  NSString *doneAction;
  NSString *alternativeAction;
  NSString *v8;
  NSString *v9;
  NSString *nextActionOverride;
  NSString *doneActionOverride;
  NSString *alternativeActionOverride;

  PKLocalizedPaymentString(CFSTR("NEXT"), 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  nextAction = self->_nextAction;
  self->_nextAction = v3;

  PKLocalizedString(CFSTR("DONE"), 0);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  doneAction = self->_doneAction;
  self->_doneAction = v5;

  alternativeAction = self->_alternativeAction;
  self->_alternativeAction = 0;

  self->_hasAlternativeAction = 0;
  if ((unint64_t)(self->_type - 1) <= 1)
  {
    PKLocalizedTransitString(CFSTR("EXPRESS_TRANSIT_EDUCATION_DISABLE_EXPRESS"), 0);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_alternativeAction;
    self->_alternativeAction = v8;

    self->_hasAlternativeAction = !self->_hideAlternativeAction;
  }
  nextActionOverride = self->_nextActionOverride;
  if (nextActionOverride)
  {
    objc_storeStrong((id *)&self->_nextAction, nextActionOverride);
    objc_storeStrong((id *)&self->_doneAction, self->_doneActionOverride);
  }
  doneActionOverride = self->_doneActionOverride;
  if (doneActionOverride)
    objc_storeStrong((id *)&self->_doneAction, doneActionOverride);
  alternativeActionOverride = self->_alternativeActionOverride;
  if (alternativeActionOverride)
    objc_storeStrong((id *)&self->_alternativeAction, alternativeActionOverride);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupMoreInfoItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupMoreInfoItem *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *body;
  uint64_t v10;
  NSURL *imageURL;
  uint64_t v12;
  NSData *imageData;
  uint64_t v14;
  NSURL *linkURL;
  uint64_t v16;
  NSString *linkText;
  NSString *v18;
  NSURL *v19;
  NSObject *v20;
  const char *v21;
  NSString *v22;
  NSURL *v23;
  void *v24;
  uint64_t v25;
  NSString *nextActionOverride;
  uint64_t v27;
  NSString *doneActionOverride;
  uint64_t v29;
  NSString *alternativeActionOverride;
  uint64_t v31;
  uint64_t v32;
  NSDictionary *reportingMetadata;
  objc_super v35;
  uint8_t buf[4];
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPaymentSetupMoreInfoItem;
  v5 = -[PKPaymentSetupMoreInfoItem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("body"));
    v8 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageDataKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkText"));
    v16 = objc_claimAutoreleasedReturnValue();
    linkText = v5->_linkText;
    v5->_linkText = (NSString *)v16;

    v18 = v5->_linkText;
    v19 = v5->_linkURL;
    if (v19)
    {
      if (!v18)
        goto LABEL_6;
    }
    else if (v18)
    {
LABEL_6:
      PKLogFacilityTypeGetObject(6uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = "linkText missing";
        if (!v19)
          v21 = "linkURL missing or malformed";
        *(_DWORD *)buf = 136315138;
        v37 = v21;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "more info link invalid: %s", buf, 0xCu);
      }

      v22 = v5->_linkText;
      v5->_linkText = 0;

      v23 = v5->_linkURL;
      v5->_linkURL = 0;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentSetupMoreInfoItemTypeFromDescription(v24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextAction"));
    v25 = objc_claimAutoreleasedReturnValue();
    nextActionOverride = v5->_nextActionOverride;
    v5->_nextActionOverride = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doneAction"));
    v27 = objc_claimAutoreleasedReturnValue();
    doneActionOverride = v5->_doneActionOverride;
    v5->_doneActionOverride = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altAction"));
    v29 = objc_claimAutoreleasedReturnValue();
    alternativeActionOverride = v5->_alternativeActionOverride;
    v5->_alternativeActionOverride = (NSString *)v29;

    v5->_hideAlternativeAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hideAltAction"));
    v31 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v31, objc_opt_class(), CFSTR("reportingMetadata"));
    v32 = objc_claimAutoreleasedReturnValue();
    reportingMetadata = v5->_reportingMetadata;
    v5->_reportingMetadata = (NSDictionary *)v32;

    -[PKPaymentSetupMoreInfoItem _updateActionStrings](v5, "_updateActionStrings");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  __CFString *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_body, CFSTR("body"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageURL, CFSTR("imageURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageData, CFSTR("imageDataKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_linkURL, CFSTR("linkURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_linkText, CFSTR("linkText"));
  type = self->_type;
  if (type > 2)
    v5 = 0;
  else
    v5 = off_1E2ABE2A8[type];
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nextActionOverride, CFSTR("nextAction"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_doneActionOverride, CFSTR("doneAction"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_alternativeActionOverride, CFSTR("altAction"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hideAlternativeAction, CFSTR("hideAltAction"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_reportingMetadata, CFSTR("reportingMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSURL copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v10;

  v12 = -[NSData copyWithZone:](self->_imageData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v12;

  v14 = -[NSURL copyWithZone:](self->_linkURL, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v14;

  v16 = -[NSString copyWithZone:](self->_linkText, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v16;

  *(_QWORD *)(v5 + 80) = self->_type;
  v18 = -[NSString copyWithZone:](self->_nextActionOverride, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v18;

  v20 = -[NSString copyWithZone:](self->_doneActionOverride, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v20;

  v22 = -[NSString copyWithZone:](self->_alternativeActionOverride, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  *(_BYTE *)(v5 + 8) = self->_hideAlternativeAction;
  v24 = -[NSDictionary copyWithZone:](self->_reportingMetadata, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v24;

  return (id)v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)hasAlternativeAction
{
  return self->_hasAlternativeAction;
}

- (NSString)nextAction
{
  return self->_nextAction;
}

- (NSString)doneAction
{
  return self->_doneAction;
}

- (NSString)alternativeAction
{
  return self->_alternativeAction;
}

- (NSDictionary)reportingMetadata
{
  return self->_reportingMetadata;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_reportingMetadata, 0);
  objc_storeStrong((id *)&self->_alternativeAction, 0);
  objc_storeStrong((id *)&self->_doneAction, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alternativeActionOverride, 0);
  objc_storeStrong((id *)&self->_doneActionOverride, 0);
  objc_storeStrong((id *)&self->_nextActionOverride, 0);
}

@end
