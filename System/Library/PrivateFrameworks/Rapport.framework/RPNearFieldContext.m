@implementation RPNearFieldContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  RPNearFieldContext *v4;
  RPNearFieldContext *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v31;

  v4 = (RPNearFieldContext *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RPNearFieldContext applicationLabel](self, "applicationLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPNearFieldContext applicationLabel](v5, "applicationLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {
          v12 = 0;
          v17 = v9;
          v15 = v8;
          goto LABEL_31;
        }
        v11 = objc_msgSend(v8, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      -[RPNearFieldContext supportedApplicationLabels](self, "supportedApplicationLabels");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPNearFieldContext supportedApplicationLabels](v5, "supportedApplicationLabels");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = v14;
      v17 = v16;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          v12 = 0;
          v23 = v16;
          v21 = v15;
          goto LABEL_30;
        }
        v18 = objc_msgSend(v15, "isEqual:", v16);

        if (!v18)
        {
          v12 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      -[RPNearFieldContext pkData](self, "pkData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPNearFieldContext pkData](v5, "pkData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      v22 = v20;
      v23 = v22;
      if (v21 == v22)
      {

      }
      else
      {
        if ((v21 == 0) == (v22 != 0))
        {
          v12 = 0;
          v31 = v22;
          v29 = v22;
          v27 = v21;
LABEL_29:

          v23 = v31;
          goto LABEL_30;
        }
        v24 = objc_msgSend(v21, "isEqual:", v22);

        if (!v24)
        {
          v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      v31 = v23;
      -[RPNearFieldContext bonjourListenerUUID](self, "bonjourListenerUUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPNearFieldContext bonjourListenerUUID](v5, "bonjourListenerUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      v28 = v26;
      v29 = v28;
      if (v27 == v28)
      {
        v12 = 1;
      }
      else if ((v27 == 0) == (v28 != 0))
      {
        v12 = 0;
      }
      else
      {
        v12 = objc_msgSend(v27, "isEqual:", v28);
      }

      goto LABEL_29;
    }
    v12 = 0;
  }
LABEL_33:

  return v12;
}

- (RPNearFieldContext)initWithCoder:(id)a3
{
  id v4;
  RPNearFieldContext *v5;
  id v6;
  id v7;
  id v8;
  RPNearFieldContext *v9;

  v4 = a3;
  v5 = -[RPNearFieldContext init](self, "init");
  if (!v5)
    goto LABEL_5;
  v6 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent();
  v7 = v6;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  v8 = v7;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  if (!v5->_pkData)
    goto LABEL_5;
  if (v5->_bonjourListenerUUID)
    v9 = v5;
  else
LABEL_5:
    v9 = 0;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *applicationLabel;
  NSArray *supportedApplicationLabels;
  NSData *pkData;
  NSUUID *bonjourListenerUUID;
  id v9;

  v4 = a3;
  applicationLabel = self->_applicationLabel;
  v9 = v4;
  if (applicationLabel)
  {
    objc_msgSend(v4, "encodeObject:forKey:", applicationLabel, CFSTR("applicationLabel"));
    v4 = v9;
  }
  supportedApplicationLabels = self->_supportedApplicationLabels;
  if (supportedApplicationLabels)
  {
    objc_msgSend(v9, "encodeObject:forKey:", supportedApplicationLabels, CFSTR("supportedApplicationLabels"));
    v4 = v9;
  }
  pkData = self->_pkData;
  if (pkData)
  {
    objc_msgSend(v9, "encodeObject:forKey:", pkData, CFSTR("pkData"));
    v4 = v9;
  }
  bonjourListenerUUID = self->_bonjourListenerUUID;
  if (bonjourListenerUUID)
  {
    objc_msgSend(v9, "encodeObject:forKey:", bonjourListenerUUID, CFSTR("bonjourListenerUUID"));
    v4 = v9;
  }

}

- (id)initWitApplicationLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RPNearFieldContext *v7;

  v4 = a3;
  NSRandomData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RPNearFieldContext initWithApplicationLabel:pkData:bonjourListenerUUID:](self, "initWithApplicationLabel:pkData:bonjourListenerUUID:", v4, v5, v6);

  return v7;
}

- (RPNearFieldContext)initWithApplicationLabel:(id)a3 pkData:(id)a4 bonjourListenerUUID:(id)a5
{
  return -[RPNearFieldContext initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:](self, "initWithApplicationLabel:supportedApplicationLabels:pkData:bonjourListenerUUID:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

- (RPNearFieldContext)initWithApplicationLabel:(id)a3 supportedApplicationLabels:(id)a4 pkData:(id)a5 bonjourListenerUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPNearFieldContext *v14;
  uint64_t v15;
  NSString *applicationLabel;
  uint64_t v17;
  NSArray *supportedApplicationLabels;
  uint64_t v19;
  NSData *pkData;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RPNearFieldContext;
  v14 = -[RPNearFieldContext init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    applicationLabel = v14->_applicationLabel;
    v14->_applicationLabel = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    supportedApplicationLabels = v14->_supportedApplicationLabels;
    v14->_supportedApplicationLabels = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    pkData = v14->_pkData;
    v14->_pkData = (NSData *)v19;

    objc_storeStrong((id *)&v14->_bonjourListenerUUID, a6);
  }

  return v14;
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (NSArray)supportedApplicationLabels
{
  return self->_supportedApplicationLabels;
}

- (NSData)pkData
{
  return self->_pkData;
}

- (NSUUID)bonjourListenerUUID
{
  return self->_bonjourListenerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourListenerUUID, 0);
  objc_storeStrong((id *)&self->_pkData, 0);
  objc_storeStrong((id *)&self->_supportedApplicationLabels, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
}

@end
