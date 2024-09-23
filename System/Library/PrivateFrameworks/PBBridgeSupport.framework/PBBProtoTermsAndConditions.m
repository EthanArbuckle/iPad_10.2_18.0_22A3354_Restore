@implementation PBBProtoTermsAndConditions

- (BOOL)hasLicense
{
  return self->_license != 0;
}

- (BOOL)hasMultiterms
{
  return self->_multiterms != 0;
}

- (BOOL)hasWarranty
{
  return self->_warranty != 0;
}

- (BOOL)hasLicenseLabel
{
  return self->_licenseLabel != 0;
}

- (BOOL)hasWarrantyLabel
{
  return self->_warrantyLabel != 0;
}

- (BOOL)hasAgreeDialogTitle
{
  return self->_agreeDialogTitle != 0;
}

- (BOOL)hasAgreeDialogText
{
  return self->_agreeDialogText != 0;
}

- (BOOL)hasAgreeLabel
{
  return self->_agreeLabel != 0;
}

- (BOOL)hasCancelLabel
{
  return self->_cancelLabel != 0;
}

- (BOOL)hasDisagreeLabel
{
  return self->_disagreeLabel != 0;
}

- (BOOL)hasServerTerms
{
  return self->_serverTerms != 0;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTermsAndConditions;
  -[PBBProtoTermsAndConditions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoTermsAndConditions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *license;
  NSData *multiterms;
  NSData *warranty;
  NSString *licenseLabel;
  NSString *warrantyLabel;
  NSString *agreeDialogTitle;
  NSString *agreeDialogText;
  NSString *agreeLabel;
  NSString *cancelLabel;
  NSString *disagreeLabel;
  NSData *serverTerms;
  NSString *userAgent;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  license = self->_license;
  if (license)
    objc_msgSend(v3, "setObject:forKey:", license, CFSTR("license"));
  multiterms = self->_multiterms;
  if (multiterms)
    objc_msgSend(v4, "setObject:forKey:", multiterms, CFSTR("multiterms"));
  warranty = self->_warranty;
  if (warranty)
    objc_msgSend(v4, "setObject:forKey:", warranty, CFSTR("warranty"));
  licenseLabel = self->_licenseLabel;
  if (licenseLabel)
    objc_msgSend(v4, "setObject:forKey:", licenseLabel, CFSTR("licenseLabel"));
  warrantyLabel = self->_warrantyLabel;
  if (warrantyLabel)
    objc_msgSend(v4, "setObject:forKey:", warrantyLabel, CFSTR("warrantyLabel"));
  agreeDialogTitle = self->_agreeDialogTitle;
  if (agreeDialogTitle)
    objc_msgSend(v4, "setObject:forKey:", agreeDialogTitle, CFSTR("agreeDialogTitle"));
  agreeDialogText = self->_agreeDialogText;
  if (agreeDialogText)
    objc_msgSend(v4, "setObject:forKey:", agreeDialogText, CFSTR("agreeDialogText"));
  agreeLabel = self->_agreeLabel;
  if (agreeLabel)
    objc_msgSend(v4, "setObject:forKey:", agreeLabel, CFSTR("agreeLabel"));
  cancelLabel = self->_cancelLabel;
  if (cancelLabel)
    objc_msgSend(v4, "setObject:forKey:", cancelLabel, CFSTR("cancelLabel"));
  disagreeLabel = self->_disagreeLabel;
  if (disagreeLabel)
    objc_msgSend(v4, "setObject:forKey:", disagreeLabel, CFSTR("disagreeLabel"));
  serverTerms = self->_serverTerms;
  if (serverTerms)
    objc_msgSend(v4, "setObject:forKey:", serverTerms, CFSTR("serverTerms"));
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v4, "setObject:forKey:", userAgent, CFSTR("userAgent"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTermsAndConditionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_license)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_multiterms)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_warranty)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_licenseLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_warrantyLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_agreeDialogTitle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_agreeDialogText)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_agreeLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_cancelLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_disagreeLabel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_serverTerms)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_userAgent)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_license)
  {
    objc_msgSend(v4, "setLicense:");
    v4 = v5;
  }
  if (self->_multiterms)
  {
    objc_msgSend(v5, "setMultiterms:");
    v4 = v5;
  }
  if (self->_warranty)
  {
    objc_msgSend(v5, "setWarranty:");
    v4 = v5;
  }
  if (self->_licenseLabel)
  {
    objc_msgSend(v5, "setLicenseLabel:");
    v4 = v5;
  }
  if (self->_warrantyLabel)
  {
    objc_msgSend(v5, "setWarrantyLabel:");
    v4 = v5;
  }
  if (self->_agreeDialogTitle)
  {
    objc_msgSend(v5, "setAgreeDialogTitle:");
    v4 = v5;
  }
  if (self->_agreeDialogText)
  {
    objc_msgSend(v5, "setAgreeDialogText:");
    v4 = v5;
  }
  if (self->_agreeLabel)
  {
    objc_msgSend(v5, "setAgreeLabel:");
    v4 = v5;
  }
  if (self->_cancelLabel)
  {
    objc_msgSend(v5, "setCancelLabel:");
    v4 = v5;
  }
  if (self->_disagreeLabel)
  {
    objc_msgSend(v5, "setDisagreeLabel:");
    v4 = v5;
  }
  if (self->_serverTerms)
  {
    objc_msgSend(v5, "setServerTerms:");
    v4 = v5;
  }
  if (self->_userAgent)
  {
    objc_msgSend(v5, "setUserAgent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
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
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_license, "copyWithZone:", a3);
  v7 = (void *)v5[6];
  v5[6] = v6;

  v8 = -[NSData copyWithZone:](self->_multiterms, "copyWithZone:", a3);
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSData copyWithZone:](self->_warranty, "copyWithZone:", a3);
  v11 = (void *)v5[11];
  v5[11] = v10;

  v12 = -[NSString copyWithZone:](self->_licenseLabel, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSString copyWithZone:](self->_warrantyLabel, "copyWithZone:", a3);
  v15 = (void *)v5[12];
  v5[12] = v14;

  v16 = -[NSString copyWithZone:](self->_agreeDialogTitle, "copyWithZone:", a3);
  v17 = (void *)v5[2];
  v5[2] = v16;

  v18 = -[NSString copyWithZone:](self->_agreeDialogText, "copyWithZone:", a3);
  v19 = (void *)v5[1];
  v5[1] = v18;

  v20 = -[NSString copyWithZone:](self->_agreeLabel, "copyWithZone:", a3);
  v21 = (void *)v5[3];
  v5[3] = v20;

  v22 = -[NSString copyWithZone:](self->_cancelLabel, "copyWithZone:", a3);
  v23 = (void *)v5[4];
  v5[4] = v22;

  v24 = -[NSString copyWithZone:](self->_disagreeLabel, "copyWithZone:", a3);
  v25 = (void *)v5[5];
  v5[5] = v24;

  v26 = -[NSData copyWithZone:](self->_serverTerms, "copyWithZone:", a3);
  v27 = (void *)v5[9];
  v5[9] = v26;

  v28 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  v29 = (void *)v5[10];
  v5[10] = v28;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *license;
  NSData *multiterms;
  NSData *warranty;
  NSString *licenseLabel;
  NSString *warrantyLabel;
  NSString *agreeDialogTitle;
  NSString *agreeDialogText;
  NSString *agreeLabel;
  NSString *cancelLabel;
  NSString *disagreeLabel;
  NSData *serverTerms;
  NSString *userAgent;
  char v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  license = self->_license;
  if ((unint64_t)license | v4[6])
  {
    if (!-[NSData isEqual:](license, "isEqual:"))
      goto LABEL_26;
  }
  multiterms = self->_multiterms;
  if ((unint64_t)multiterms | v4[8] && !-[NSData isEqual:](multiterms, "isEqual:"))
    goto LABEL_26;
  warranty = self->_warranty;
  if ((unint64_t)warranty | v4[11] && !-[NSData isEqual:](warranty, "isEqual:"))
    goto LABEL_26;
  licenseLabel = self->_licenseLabel;
  if ((unint64_t)licenseLabel | v4[7] && !-[NSString isEqual:](licenseLabel, "isEqual:"))
    goto LABEL_26;
  if (((warrantyLabel = self->_warrantyLabel, !((unint64_t)warrantyLabel | v4[12]))
     || -[NSString isEqual:](warrantyLabel, "isEqual:"))
    && ((agreeDialogTitle = self->_agreeDialogTitle, !((unint64_t)agreeDialogTitle | v4[2]))
     || -[NSString isEqual:](agreeDialogTitle, "isEqual:"))
    && ((agreeDialogText = self->_agreeDialogText, !((unint64_t)agreeDialogText | v4[1]))
     || -[NSString isEqual:](agreeDialogText, "isEqual:"))
    && ((agreeLabel = self->_agreeLabel, !((unint64_t)agreeLabel | v4[3]))
     || -[NSString isEqual:](agreeLabel, "isEqual:"))
    && ((cancelLabel = self->_cancelLabel, !((unint64_t)cancelLabel | v4[4]))
     || -[NSString isEqual:](cancelLabel, "isEqual:"))
    && ((disagreeLabel = self->_disagreeLabel, !((unint64_t)disagreeLabel | v4[5]))
     || -[NSString isEqual:](disagreeLabel, "isEqual:"))
    && ((serverTerms = self->_serverTerms, !((unint64_t)serverTerms | v4[9]))
     || -[NSData isEqual:](serverTerms, "isEqual:")))
  {
    userAgent = self->_userAgent;
    if ((unint64_t)userAgent | v4[10])
      v17 = -[NSString isEqual:](userAgent, "isEqual:");
    else
      v17 = 1;
  }
  else
  {
LABEL_26:
    v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;

  v3 = -[NSData hash](self->_license, "hash");
  v4 = -[NSData hash](self->_multiterms, "hash") ^ v3;
  v5 = -[NSData hash](self->_warranty, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_licenseLabel, "hash");
  v7 = -[NSString hash](self->_warrantyLabel, "hash");
  v8 = v7 ^ -[NSString hash](self->_agreeDialogTitle, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_agreeDialogText, "hash");
  v10 = -[NSString hash](self->_agreeLabel, "hash");
  v11 = v10 ^ -[NSString hash](self->_cancelLabel, "hash");
  v12 = v11 ^ -[NSString hash](self->_disagreeLabel, "hash");
  v13 = v9 ^ v12 ^ -[NSData hash](self->_serverTerms, "hash");
  return v13 ^ -[NSString hash](self->_userAgent, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[6])
    -[PBBProtoTermsAndConditions setLicense:](self, "setLicense:");
  if (v4[8])
    -[PBBProtoTermsAndConditions setMultiterms:](self, "setMultiterms:");
  if (v4[11])
    -[PBBProtoTermsAndConditions setWarranty:](self, "setWarranty:");
  if (v4[7])
    -[PBBProtoTermsAndConditions setLicenseLabel:](self, "setLicenseLabel:");
  if (v4[12])
    -[PBBProtoTermsAndConditions setWarrantyLabel:](self, "setWarrantyLabel:");
  if (v4[2])
    -[PBBProtoTermsAndConditions setAgreeDialogTitle:](self, "setAgreeDialogTitle:");
  if (v4[1])
    -[PBBProtoTermsAndConditions setAgreeDialogText:](self, "setAgreeDialogText:");
  if (v4[3])
    -[PBBProtoTermsAndConditions setAgreeLabel:](self, "setAgreeLabel:");
  if (v4[4])
    -[PBBProtoTermsAndConditions setCancelLabel:](self, "setCancelLabel:");
  if (v4[5])
    -[PBBProtoTermsAndConditions setDisagreeLabel:](self, "setDisagreeLabel:");
  if (v4[9])
    -[PBBProtoTermsAndConditions setServerTerms:](self, "setServerTerms:");
  if (v4[10])
    -[PBBProtoTermsAndConditions setUserAgent:](self, "setUserAgent:");

}

- (NSData)license
{
  return self->_license;
}

- (void)setLicense:(id)a3
{
  objc_storeStrong((id *)&self->_license, a3);
}

- (NSData)multiterms
{
  return self->_multiterms;
}

- (void)setMultiterms:(id)a3
{
  objc_storeStrong((id *)&self->_multiterms, a3);
}

- (NSData)warranty
{
  return self->_warranty;
}

- (void)setWarranty:(id)a3
{
  objc_storeStrong((id *)&self->_warranty, a3);
}

- (NSString)licenseLabel
{
  return self->_licenseLabel;
}

- (void)setLicenseLabel:(id)a3
{
  objc_storeStrong((id *)&self->_licenseLabel, a3);
}

- (NSString)warrantyLabel
{
  return self->_warrantyLabel;
}

- (void)setWarrantyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_warrantyLabel, a3);
}

- (NSString)agreeDialogTitle
{
  return self->_agreeDialogTitle;
}

- (void)setAgreeDialogTitle:(id)a3
{
  objc_storeStrong((id *)&self->_agreeDialogTitle, a3);
}

- (NSString)agreeDialogText
{
  return self->_agreeDialogText;
}

- (void)setAgreeDialogText:(id)a3
{
  objc_storeStrong((id *)&self->_agreeDialogText, a3);
}

- (NSString)agreeLabel
{
  return self->_agreeLabel;
}

- (void)setAgreeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_agreeLabel, a3);
}

- (NSString)cancelLabel
{
  return self->_cancelLabel;
}

- (void)setCancelLabel:(id)a3
{
  objc_storeStrong((id *)&self->_cancelLabel, a3);
}

- (NSString)disagreeLabel
{
  return self->_disagreeLabel;
}

- (void)setDisagreeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_disagreeLabel, a3);
}

- (NSData)serverTerms
{
  return self->_serverTerms;
}

- (void)setServerTerms:(id)a3
{
  objc_storeStrong((id *)&self->_serverTerms, a3);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warrantyLabel, 0);
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_serverTerms, 0);
  objc_storeStrong((id *)&self->_multiterms, 0);
  objc_storeStrong((id *)&self->_licenseLabel, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_disagreeLabel, 0);
  objc_storeStrong((id *)&self->_cancelLabel, 0);
  objc_storeStrong((id *)&self->_agreeLabel, 0);
  objc_storeStrong((id *)&self->_agreeDialogTitle, 0);
  objc_storeStrong((id *)&self->_agreeDialogText, 0);
}

@end
