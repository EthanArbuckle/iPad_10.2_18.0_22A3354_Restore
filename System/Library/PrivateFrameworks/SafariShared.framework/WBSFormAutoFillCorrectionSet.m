@implementation WBSFormAutoFillCorrectionSet

- (WBSFormAutoFillCorrectionSet)initWithDomain:(id)a3 fingerprintsToClassifications:(id)a4
{
  id v6;
  id v7;
  WBSFormAutoFillCorrectionSet *v8;
  uint64_t v9;
  NSString *domain;
  uint64_t v11;
  NSDictionary *fingerprintsToClassifications;
  WBSFormAutoFillCorrectionSet *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFormAutoFillCorrectionSet;
  v8 = -[WBSFormAutoFillCorrectionSet init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    fingerprintsToClassifications = v8->_fingerprintsToClassifications;
    v8->_fingerprintsToClassifications = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (WBSFormAutoFillCorrectionSet)initWithDomain:(id)a3 fingerprintsToCorrections:(id)a4
{
  id v6;
  id v7;
  WBSFormAutoFillCorrectionSet *v8;
  uint64_t v9;
  NSString *domain;
  uint64_t v11;
  NSDictionary *fingerprintsToCorrections;
  WBSFormAutoFillCorrectionSet *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFormAutoFillCorrectionSet;
  v8 = -[WBSFormAutoFillCorrectionSet init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    fingerprintsToCorrections = v8->_fingerprintsToCorrections;
    v8->_fingerprintsToCorrections = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  WBSFormAutoFillCorrectionSet *v4;
  WBSFormAutoFillCorrectionSet *v5;
  NSString *domain;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  char v11;
  NSDictionary *fingerprintsToClassifications;
  uint64_t v13;
  void *v14;
  NSDictionary *v15;
  void *v16;
  NSDictionary *fingerprintsToCorrections;
  NSDictionary *v18;
  NSDictionary *v19;
  void *v20;

  v4 = (WBSFormAutoFillCorrectionSet *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      domain = self->_domain;
      -[WBSFormAutoFillCorrectionSet domain](v5, "domain");
      v7 = objc_claimAutoreleasedReturnValue();
      if (domain == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        v9 = self->_domain;
        -[WBSFormAutoFillCorrectionSet domain](v5, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

        if (!(_DWORD)v9)
          goto LABEL_11;
      }
      fingerprintsToClassifications = self->_fingerprintsToClassifications;
      -[WBSFormAutoFillCorrectionSet fingerprintsToClassifications](v5, "fingerprintsToClassifications");
      v13 = objc_claimAutoreleasedReturnValue();
      if (fingerprintsToClassifications == (NSDictionary *)v13)
      {

      }
      else
      {
        v14 = (void *)v13;
        v15 = self->_fingerprintsToClassifications;
        -[WBSFormAutoFillCorrectionSet fingerprintsToClassifications](v5, "fingerprintsToClassifications");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = -[NSDictionary isEqualToDictionary:](v15, "isEqualToDictionary:", v16);

        if (!(_DWORD)v15)
        {
LABEL_11:
          v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      fingerprintsToCorrections = self->_fingerprintsToCorrections;
      -[WBSFormAutoFillCorrectionSet fingerprintsToCorrections](v5, "fingerprintsToCorrections");
      v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (fingerprintsToCorrections == v18)
      {
        v11 = 1;
      }
      else
      {
        v19 = self->_fingerprintsToCorrections;
        -[WBSFormAutoFillCorrectionSet fingerprintsToCorrections](v5, "fingerprintsToCorrections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSDictionary isEqualToDictionary:](v19, "isEqualToDictionary:", v20);

      }
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDictionary hash](self->_fingerprintsToClassifications, "hash");
  return -[NSDictionary hash](self->_fingerprintsToCorrections, "hash") ^ v3;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)fingerprintsToClassifications
{
  return self->_fingerprintsToClassifications;
}

- (NSDictionary)fingerprintsToCorrections
{
  return self->_fingerprintsToCorrections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprintsToCorrections, 0);
  objc_storeStrong((id *)&self->_fingerprintsToClassifications, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
