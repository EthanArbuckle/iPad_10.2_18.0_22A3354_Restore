@implementation TRIActivationEventRecord

- (TRIActivationEventRecord)initWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleIdentifier:(id)a9 carrierCountryIsoCode:(id)a10 diagnosticsUsageEnabled:(int64_t)a11 hasAne:(int64_t)a12 aneVersion:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  TRIActivationEventRecord *v24;
  TRIActivationEventRecord *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v37;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  objc_super v45;

  v17 = a3;
  v37 = a4;
  v18 = a4;
  v39 = a6;
  v19 = a6;
  v40 = a7;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v44 = a10;
  v23 = a13;
  v41 = v22;
  v42 = v23;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentId != nil"));

    v22 = v41;
    v23 = v42;
    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("factorPackSetId != nil"));

  v22 = v41;
  v23 = v42;
  if (v19)
  {
LABEL_4:
    if (v20)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("osBuild != nil"));

  v22 = v41;
  v23 = v42;
  if (v20)
  {
LABEL_5:
    if (v21)
      goto LABEL_6;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1275, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regionCode != nil"));

    v23 = v42;
    if (v41)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("languageCode != nil"));

  v22 = v41;
  v23 = v42;
  if (!v21)
    goto LABEL_16;
LABEL_6:
  if (v22)
    goto LABEL_7;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierBundleIdentifier != nil"));

  v23 = v42;
LABEL_7:
  if (v44)
  {
    if (v23)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carrierCountryIsoCode != nil"));

    if (v42)
      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aneVersion != nil"));

LABEL_9:
  v45.receiver = self;
  v45.super_class = (Class)TRIActivationEventRecord;
  v24 = -[TRIActivationEventRecord init](&v45, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_parentId, a3);
    objc_storeStrong((id *)&v25->_factorPackSetId, v37);
    v25->_deploymentId = a5;
    objc_storeStrong((id *)&v25->_osBuild, v39);
    objc_storeStrong((id *)&v25->_languageCode, v40);
    objc_storeStrong((id *)&v25->_regionCode, a8);
    objc_storeStrong((id *)&v25->_carrierBundleIdentifier, a9);
    objc_storeStrong((id *)&v25->_carrierCountryIsoCode, a10);
    v25->_diagnosticsUsageEnabled = a11;
    v25->_hasAne = a12;
    objc_storeStrong((id *)&v25->_aneVersion, a13);
  }

  return v25;
}

+ (id)recordWithParentId:(id)a3 factorPackSetId:(id)a4 deploymentId:(int)a5 osBuild:(id)a6 languageCode:(id)a7 regionCode:(id)a8 carrierBundleIdentifier:(id)a9 carrierCountryIsoCode:(id)a10 diagnosticsUsageEnabled:(int64_t)a11 hasAne:(int64_t)a12 aneVersion:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;

  v19 = a13;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a4;
  v26 = a3;
  v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", v26, v25, a5, v24, v23, v22, v21, v20, a11, a12, v19);

  return v27;
}

- (id)copyWithReplacementParentId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", v4, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, v4, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementDeploymentId:(int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, *(_QWORD *)&a3, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);
}

- (id)copyWithReplacementOsBuild:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, v4, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementLanguageCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, v4, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementRegionCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, v4, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementCarrierBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, v4, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementCarrierCountryIsoCode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, v4, self->_diagnosticsUsageEnabled, self->_hasAne, self->_aneVersion);

  return v5;
}

- (id)copyWithReplacementDiagnosticsUsageEnabled:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, a3, self->_hasAne, self->_aneVersion);
}

- (id)copyWithReplacementHasAne:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, a3, self->_aneVersion);
}

- (id)copyWithReplacementAneVersion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParentId:factorPackSetId:deploymentId:osBuild:languageCode:regionCode:carrierBundleIdentifier:carrierCountryIsoCode:diagnosticsUsageEnabled:hasAne:aneVersion:", self->_parentId, self->_factorPackSetId, self->_deploymentId, self->_osBuild, self->_languageCode, self->_regionCode, self->_carrierBundleIdentifier, self->_carrierCountryIsoCode, self->_diagnosticsUsageEnabled, self->_hasAne, v4);

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *parentId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *factorPackSetId;
  void *v16;
  int v17;
  int deploymentId;
  int v19;
  void *v20;
  int v21;
  NSString *osBuild;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  NSString *languageCode;
  void *v29;
  int v30;
  int v31;
  void *v32;
  int v33;
  NSString *regionCode;
  void *v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  NSString *carrierBundleIdentifier;
  void *v41;
  int v42;
  int v43;
  void *v44;
  int v45;
  NSString *carrierCountryIsoCode;
  void *v47;
  int v48;
  int64_t diagnosticsUsageEnabled;
  int64_t hasAne;
  int v51;
  void *v52;
  int v53;
  NSString *aneVersion;
  void *v55;
  char v56;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_29;
  v6 = self->_parentId != 0;
  objc_msgSend(v4, "parentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_29;
  parentId = self->_parentId;
  if (parentId)
  {
    objc_msgSend(v5, "parentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](parentId, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  v12 = self->_factorPackSetId != 0;
  objc_msgSend(v5, "factorPackSetId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_29;
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    objc_msgSend(v5, "factorPackSetId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](factorPackSetId, "isEqual:", v16);

    if (!v17)
      goto LABEL_29;
  }
  deploymentId = self->_deploymentId;
  if (deploymentId != objc_msgSend(v5, "deploymentId"))
    goto LABEL_29;
  v19 = self->_osBuild != 0;
  objc_msgSend(v5, "osBuild");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v19 == v21)
    goto LABEL_29;
  osBuild = self->_osBuild;
  if (osBuild)
  {
    objc_msgSend(v5, "osBuild");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSString isEqual:](osBuild, "isEqual:", v23);

    if (!v24)
      goto LABEL_29;
  }
  v25 = self->_languageCode != 0;
  objc_msgSend(v5, "languageCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (v25 == v27)
    goto LABEL_29;
  languageCode = self->_languageCode;
  if (languageCode)
  {
    objc_msgSend(v5, "languageCode");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[NSString isEqual:](languageCode, "isEqual:", v29);

    if (!v30)
      goto LABEL_29;
  }
  v31 = self->_regionCode != 0;
  objc_msgSend(v5, "regionCode");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (v31 == v33)
    goto LABEL_29;
  regionCode = self->_regionCode;
  if (regionCode)
  {
    objc_msgSend(v5, "regionCode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[NSString isEqual:](regionCode, "isEqual:", v35);

    if (!v36)
      goto LABEL_29;
  }
  v37 = self->_carrierBundleIdentifier != 0;
  objc_msgSend(v5, "carrierBundleIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38 == 0;

  if (v37 == v39)
    goto LABEL_29;
  carrierBundleIdentifier = self->_carrierBundleIdentifier;
  if (carrierBundleIdentifier)
  {
    objc_msgSend(v5, "carrierBundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[NSString isEqual:](carrierBundleIdentifier, "isEqual:", v41);

    if (!v42)
      goto LABEL_29;
  }
  v43 = self->_carrierCountryIsoCode != 0;
  objc_msgSend(v5, "carrierCountryIsoCode");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44 == 0;

  if (v43 == v45)
    goto LABEL_29;
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  if (carrierCountryIsoCode)
  {
    objc_msgSend(v5, "carrierCountryIsoCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[NSString isEqual:](carrierCountryIsoCode, "isEqual:", v47);

    if (!v48)
      goto LABEL_29;
  }
  diagnosticsUsageEnabled = self->_diagnosticsUsageEnabled;
  if (diagnosticsUsageEnabled != objc_msgSend(v5, "diagnosticsUsageEnabled")
    || (hasAne = self->_hasAne, hasAne != objc_msgSend(v5, "hasAne"))
    || (v51 = self->_aneVersion != 0,
        objc_msgSend(v5, "aneVersion"),
        v52 = (void *)objc_claimAutoreleasedReturnValue(),
        v53 = v52 == 0,
        v52,
        v51 == v53))
  {
LABEL_29:
    v56 = 0;
  }
  else
  {
    aneVersion = self->_aneVersion;
    if (aneVersion)
    {
      objc_msgSend(v5, "aneVersion");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = -[NSString isEqual:](aneVersion, "isEqual:", v55);

    }
    else
    {
      v56 = 1;
    }
  }

  return v56;
}

- (BOOL)isEqual:(id)a3
{
  TRIActivationEventRecord *v4;
  TRIActivationEventRecord *v5;
  BOOL v6;

  v4 = (TRIActivationEventRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIActivationEventRecord isEqualToRecord:](self, "isEqualToRecord:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  int64_t v11;
  int64_t v12;

  v3 = -[NSString hash](self->_parentId, "hash");
  v4 = -[NSString hash](self->_factorPackSetId, "hash");
  v5 = self->_deploymentId - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  v6 = -[NSString hash](self->_osBuild, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_languageCode, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_regionCode, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_carrierBundleIdentifier, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_carrierCountryIsoCode, "hash");
  v11 = self->_diagnosticsUsageEnabled - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  v12 = self->_hasAne - v11 + 32 * v11;
  return -[NSString hash](self->_aneVersion, "hash") - v12 + 32 * v12;
}

- (id)description
{
  id v3;
  NSString *parentId;
  NSString *factorPackSetId;
  void *v6;
  NSString *carrierCountryIsoCode;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  parentId = self->_parentId;
  factorPackSetId = self->_factorPackSetId;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deploymentId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&self->_osBuild;
  v12 = *(_OWORD *)&self->_regionCode;
  carrierCountryIsoCode = self->_carrierCountryIsoCode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_diagnosticsUsageEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_hasAne);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIActivationEventRecord | parentId:%@ factorPackSetId:%@ deploymentId:%@ osBuild:%@ languageCode:%@ regionCode:%@ carrierBundleIdentifier:%@ carrierCountryIsoCode:%@ diagnosticsUsageEnabled:%@ hasAne:%@ aneVersion:%@>"), parentId, factorPackSetId, v6, v13, v12, carrierCountryIsoCode, v8, v9, self->_aneVersion);

  return v10;
}

- (NSString)parentId
{
  return self->_parentId;
}

- (NSString)factorPackSetId
{
  return self->_factorPackSetId;
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSString)carrierBundleIdentifier
{
  return self->_carrierBundleIdentifier;
}

- (NSString)carrierCountryIsoCode
{
  return self->_carrierCountryIsoCode;
}

- (int64_t)diagnosticsUsageEnabled
{
  return self->_diagnosticsUsageEnabled;
}

- (int64_t)hasAne
{
  return self->_hasAne;
}

- (NSString)aneVersion
{
  return self->_aneVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneVersion, 0);
  objc_storeStrong((id *)&self->_carrierCountryIsoCode, 0);
  objc_storeStrong((id *)&self->_carrierBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
  objc_storeStrong((id *)&self->_parentId, 0);
}

@end
