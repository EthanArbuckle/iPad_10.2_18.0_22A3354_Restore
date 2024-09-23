@implementation PGGraphMomentNode

- (id)initFromMoment:(id)a3
{
  id v4;
  PGGraphMomentNode *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphMomentNode;
  v5 = -[PGGraphNode init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "propertiesWithMoment:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphMomentNode setLocalProperties:](v5, "setLocalProperties:", v6);

  }
  return v5;
}

- (PGGraphMomentNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  PGGraphMomentNode *v7;
  PGGraphMomentNode *v8;

  v6 = a5;
  v7 = -[PGGraphNode init](self, "init");
  v8 = v7;
  if (v7)
    -[PGGraphMomentNode setLocalProperties:](v7, "setLocalProperties:", v6);

  return v8;
}

- (void)setLocalProperties:(id)a3
{
  NSString *v4;
  NSString *name;
  NSString *v6;
  NSString *encodedCLIPFeatureVector;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  NSString *v19;
  NSString *localIdentifier;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  double v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  id v49;

  v49 = a3;
  if (objc_msgSend(v49, "count"))
  {
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("name"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v4;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("clipfeature"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    encodedCLIPFeatureVector = self->_encodedCLIPFeatureVector;
    self->_encodedCLIPFeatureVector = v6;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("utcs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    self->_universalStartTimestamp = v9;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("utce"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    self->_universalEndTimestamp = v11;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("tzs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    self->_localStartTimestamp = v13;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("tze"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    self->_localEndTimestamp = v15;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("tnop"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *((_WORD *)self + 37) = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("inhbtscr"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    self->_inhabitationScore = v18;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("lclid"));
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    localIdentifier = self->_localIdentifier;
    self->_localIdentifier = v19;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("nawp"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)self + 16) = objc_msgSend(v21, "unsignedIntegerValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("cnt"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)self + 17) = objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self->_sharingComposition = objc_msgSend(v23, "unsignedShortValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("intng"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "BOOLValue"))
      v25 = 16;
    else
      v25 = 0;
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xEF | v25;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("intngaj"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "BOOLValue"))
      v27 = 32;
    else
      v27 = 0;
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xDF | v27;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("sintng"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "BOOLValue"))
      v29 = 64;
    else
      v29 = 0;
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xBF | v29;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("cntsc"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    self->_contentScore = v31;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("cbsa"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "BOOLValue"))
      v33 = 4;
    else
      v33 = 0;
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xFB | v33;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("hghthnmprv"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xFE | objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("asswis"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "BOOLValue"))
      v36 = 2;
    else
      v36 = 0;
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xFD | v36;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("cnja"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "BOOLValue"))
      v38 = 8;
    else
      v38 = 0;
    *((_BYTE *)self + 84) = *((_BYTE *)self + 84) & 0xF7 | v38;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("sgem"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)self + 19) = objc_msgSend(v39, "unsignedIntegerValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("rgem"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)self + 20) = objc_msgSend(v40, "unsignedIntegerValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("bhsc"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    self->_behavioralScore = v42;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("spr"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "doubleValue");
    self->_scenesProcessedRatio = v44;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("fpr"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    self->_facesProcessedRatio = v46;

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("extc"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numberOfAssetsInExtendedCuration = objc_msgSend(v47, "unsignedIntegerValue");

    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("hasl"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    self->_happensAtSensitiveLocation = objc_msgSend(v48, "BOOLValue");

  }
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  BOOL v43;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lclid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_localIdentifier))
      goto LABEL_59;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_name))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clipfeature"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (!objc_msgSend(v9, "isEqual:", self->_encodedCLIPFeatureVector))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("utcs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      objc_msgSend(v10, "doubleValue");
      if (v11 != self->_universalStartTimestamp)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("utce"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      if (v13 != self->_universalEndTimestamp)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tzs"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v14)
    {
      objc_msgSend(v14, "doubleValue");
      if (v15 != self->_localStartTimestamp)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tze"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    if (v16)
    {
      objc_msgSend(v16, "doubleValue");
      if (v17 != self->_localEndTimestamp)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tnop"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "unsignedIntegerValue") != *((unsigned __int16 *)self + 37))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inhbtscr"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      if (v20 != self->_inhabitationScore)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cnt"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v21)
    {
      if (objc_msgSend(v21, "unsignedIntegerValue") != *((_DWORD *)self + 17))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharingComposition"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    if (v22)
    {
      if (objc_msgSend(v22, "unsignedShortValue") != self->_sharingComposition)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nawp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
    if (v23)
    {
      if (objc_msgSend(v23, "unsignedIntegerValue") != *((_DWORD *)self + 16))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("intng"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    if (v24)
    {
      if (objc_msgSend(v24, "BOOLValue") == ((*((_BYTE *)self + 84) & 0x10) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("intngaj"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    if (v25)
    {
      if (objc_msgSend(v25, "BOOLValue") == ((*((_BYTE *)self + 84) & 0x20) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sintng"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;
    if (v26)
    {
      if (objc_msgSend(v26, "BOOLValue") == ((*((_BYTE *)self + 84) & 0x40) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cntsc"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v27;
    if (v27)
    {
      objc_msgSend(v27, "doubleValue");
      if (v28 != self->_contentScore)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cbsa"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (v29)
    {
      if (objc_msgSend(v29, "BOOLValue") == ((*((_BYTE *)self + 84) & 4) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hghthnmprv"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v30;
    if (v30)
    {
      if (objc_msgSend(v30, "BOOLValue") == ((*((_BYTE *)self + 84) & 1) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asswis"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v31;
    if (v31)
    {
      if (objc_msgSend(v31, "BOOLValue") == ((*((_BYTE *)self + 84) & 2) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cnja"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v32;
    if (v32)
    {
      if (objc_msgSend(v32, "BOOLValue") == ((*((_BYTE *)self + 84) & 8) == 0))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sgem"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v33;
    if (v33)
    {
      if (objc_msgSend(v33, "unsignedIntegerValue") != *((_DWORD *)self + 19))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rgem"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v34;
    if (v34)
    {
      if (objc_msgSend(v34, "unsignedIntegerValue") != *((_DWORD *)self + 20))
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bhsc"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v35;
    if (v35)
    {
      objc_msgSend(v35, "doubleValue");
      if (v36 != self->_behavioralScore)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spr"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v37;
    if (v37)
    {
      objc_msgSend(v37, "doubleValue");
      if (v38 != self->_scenesProcessedRatio)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fpr"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v39;
    if (v39)
    {
      objc_msgSend(v39, "doubleValue");
      if (v40 != self->_facesProcessedRatio)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extc"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v41;
    if (v41)
    {
      if (objc_msgSend(v41, "unsignedIntegerValue") != self->_numberOfAssetsInExtendedCuration)
        goto LABEL_59;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasl"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v42;
    if (v42 && self->_happensAtSensitiveLocation != objc_msgSend(v42, "BOOLValue"))
LABEL_59:
      v43 = 0;
    else
      v43 = 1;

  }
  else
  {
    v43 = 1;
  }

  return v43;
}

- (id)propertyDictionary
{
  NSString *name;
  NSString *encodedCLIPFeatureVector;
  uint64_t v5;
  NSString *localIdentifier;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[27];
  _QWORD v34[29];

  v34[27] = *MEMORY[0x1E0C80C00];
  name = self->_name;
  if (!name)
    name = (NSString *)&stru_1E8436F28;
  v33[0] = CFSTR("name");
  v33[1] = CFSTR("clipfeature");
  encodedCLIPFeatureVector = self->_encodedCLIPFeatureVector;
  if (!encodedCLIPFeatureVector)
    encodedCLIPFeatureVector = (NSString *)&stru_1E8436F28;
  v34[0] = name;
  v34[1] = encodedCLIPFeatureVector;
  v33[2] = CFSTR("utcs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_universalStartTimestamp);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v32;
  v33[3] = CFSTR("utce");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_universalEndTimestamp);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v31;
  v33[4] = CFSTR("tzs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_localStartTimestamp);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v30;
  v33[5] = CFSTR("tze");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_localEndTimestamp);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v29;
  v33[6] = CFSTR("tnop");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned __int16 *)self + 37));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v28;
  v33[7] = CFSTR("inhbtscr");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_inhabitationScore);
  v5 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v5;
  localIdentifier = self->_localIdentifier;
  if (!localIdentifier)
    localIdentifier = (NSString *)&stru_1E8436F28;
  v34[7] = v5;
  v34[8] = localIdentifier;
  v33[8] = CFSTR("lclid");
  v33[9] = CFSTR("cnt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 17));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[9] = v26;
  v33[10] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_sharingComposition);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[10] = v25;
  v33[11] = CFSTR("nawp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 16));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[11] = v24;
  v33[12] = CFSTR("intng");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 84) >> 4) & 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[12] = v23;
  v33[13] = CFSTR("intngaj");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 84) >> 5) & 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[13] = v22;
  v33[14] = CFSTR("sintng");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 84) >> 6) & 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[14] = v21;
  v33[15] = CFSTR("cntsc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_contentScore);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[15] = v20;
  v33[16] = CFSTR("cbsa");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 84) >> 2) & 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34[16] = v19;
  v33[17] = CFSTR("hghthnmprv");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_BYTE *)self + 84) & 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[17] = v18;
  v33[18] = CFSTR("asswis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 84) >> 1) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[18] = v7;
  v33[19] = CFSTR("cnja");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((unsigned __int8 *)self + 84) >> 3) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[19] = v8;
  v33[20] = CFSTR("sgem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 19));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[20] = v9;
  v33[21] = CFSTR("rgem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 20));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[21] = v10;
  v33[22] = CFSTR("bhsc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_behavioralScore);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[22] = v11;
  v33[23] = CFSTR("spr");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_scenesProcessedRatio);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[23] = v12;
  v33[24] = CFSTR("fpr");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_facesProcessedRatio);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[24] = v13;
  v33[25] = CFSTR("extc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfAssetsInExtendedCuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[25] = v14;
  v33[26] = CFSTR("hasl");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_happensAtSensitiveLocation);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[26] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)changingPropertiesWithProperties:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  PGGraphMomentNode *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraphMomentNode propertyDictionary](self, "propertyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lclid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && !-[NSString isEqualToString:](self->_localIdentifier, "isEqualToString:", v8))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = 138412546;
        v14 = v8;
        v15 = 2112;
        v16 = self;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Trying to merge local identifier %@ into moment node %@", (uint8_t *)&v13, 0x16u);
      }
      v7 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v7 = v4;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "length"))
      {
        v11 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v11, "removeObjectForKey:", CFSTR("name"));

        v7 = v11;
      }

    }
  }

  return v7;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  unint64_t numberOfAssetsInExtendedCuration;
  uint64_t v13;
  void *v14;
  uint64_t happensAtSensitiveLocation;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = 88;
LABEL_5:
    v6 = *(id *)((char *)&self->super.super.super.super.isa + v5);
LABEL_15:
    v9 = v6;
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("clipfeature")))
  {
    v5 = 40;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("utcs")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 120;
LABEL_14:
    objc_msgSend(v7, "numberWithDouble:", *(double *)((char *)&self->super.super.super.super.isa + v8));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("utce")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 128;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("tzs")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 48;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("tze")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 56;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("tnop")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    numberOfAssetsInExtendedCuration = *((unsigned __int16 *)self + 37);
LABEL_19:
    objc_msgSend(v11, "numberWithUnsignedInteger:", numberOfAssetsInExtendedCuration);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("inhbtscr")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 96;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lclid")))
  {
    v5 = 32;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cnt")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v13 = 68;
LABEL_26:
    numberOfAssetsInExtendedCuration = *(unsigned int *)((char *)&self->super.super.super.super.isa + v13);
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sharingComposition")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_sharingComposition);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("nawp")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v13 = 64;
    goto LABEL_26;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("intng")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 4) & 1;
LABEL_37:
    objc_msgSend(v14, "numberWithBool:", happensAtSensitiveLocation);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("intngaj")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 5) & 1;
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sintng")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 6) & 1;
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cntsc")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 104;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cbsa")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 2) & 1;
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("hghthnmprv")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = *((_BYTE *)self + 84) & 1;
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("asswis")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 1) & 1;
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cnja")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = (*((unsigned __int8 *)self + 84) >> 3) & 1;
    goto LABEL_37;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sgem")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v13 = 76;
    goto LABEL_26;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("rgem")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v13 = 80;
    goto LABEL_26;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bhsc")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 112;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("spr")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 136;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("fpr")))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = 144;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("extc")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    numberOfAssetsInExtendedCuration = self->_numberOfAssetsInExtendedCuration;
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("hasl")))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    happensAtSensitiveLocation = self->_happensAtSensitiveLocation;
    goto LABEL_37;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on PGGraphMomentNode.", (uint8_t *)&v16, 0xCu);
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphMomentNode (%@, %@)"), self->_localIdentifier, self->_name);
}

- (NSDictionary)jsonDescription
{
  objc_class *v3;
  void *v4;
  NSString *localIdentifier;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("type");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  localIdentifier = self->_localIdentifier;
  v9[0] = v4;
  v9[1] = localIdentifier;
  v8[1] = CFSTR("localIdentifier");
  v8[2] = CFSTR("name");
  v9[2] = self->_name;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("Moment");
  return CFSTR("Moment");
}

- (unsigned)domain
{
  return 100;
}

- (NSString)localIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CD1670], "localIdentifierWithUUID:", self->_localIdentifier);
}

- (NSString)UUID
{
  return self->_localIdentifier;
}

- (MAFloatVector)clipFeatureVector
{
  NSString *encodedCLIPFeatureVector;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *localIdentifier;
  id v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  encodedCLIPFeatureVector = self->_encodedCLIPFeatureVector;
  v12 = 0;
  +[PGMomentIngestCLIPFeatureVectorExtractor decodeEncodedCLIPFeatureVector:withError:](PGMomentIngestCLIPFeatureVectorExtractor, "decodeEncodedCLIPFeatureVector:withError:", encodedCLIPFeatureVector, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    if (objc_msgSend(v4, "count"))
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      localIdentifier = self->_localIdentifier;
      *(_DWORD *)buf = 138412290;
      v14 = localIdentifier;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Error decoding CLIP Feature for moment %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return (MAFloatVector *)v7;
}

- (BOOL)happensPartiallyAtHomeOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphMomentNode collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preciseAddressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addressNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "intersectsCollection:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)happensPartiallyAtWorkOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphMomentNode collection](self, "collection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preciseAddressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addressNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "intersectsCollection:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PGGraphMomentNode collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "happensPartiallyAtHomeOrWorkOfPersonNodes:", v4);

  return v6;
}

- (BOOL)hasEnoughScenesProcessed
{
  double v2;

  -[PGGraphMomentNode scenesProcessedRatio](self, "scenesProcessedRatio");
  return v2 >= 0.9;
}

- (BOOL)hasEnoughFacesProcessed
{
  double v2;

  -[PGGraphMomentNode facesProcessedRatio](self, "facesProcessedRatio");
  return v2 >= 0.9;
}

- (BOOL)isInterestingForMemories
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interestingForMemoriesSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (unint64_t)locationMobilityType
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mobilityNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "mobilityType");
  else
    v5 = 0;

  return v5;
}

- (PGGraphHighlightNode)highlightNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNode *)v4;
}

- (PGGraphHighlightGroupNode)highlightGroupNode
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode highlightNode](self, "highlightNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightGroupNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightGroupNode *)v3;
}

- (BOOL)isPartOfTrip
{
  void *v2;
  char v3;

  -[PGGraphMomentNode highlightNode](self, "highlightNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPartOfTrip");

  return v3;
}

- (BOOL)isMeaningful
{
  return -[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", CFSTR("MEANING"), 700);
}

- (PGGraphMomentNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphMomentNodeCollection alloc], "initWithNode:", self);
}

- (PGGraphMomentNode)previousMomentNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousMomentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNode *)v4;
}

- (PGGraphMomentNode)nextMomentNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextMomentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNode *)v4;
}

- (id)bestAddressNode
{
  id v2;
  _QWORD v4[7];
  _QWORD v5[4];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__54839;
  v11 = __Block_byref_object_dispose__54840;
  v12 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0xFFEFFFFFFFFFFFFFLL;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__PGGraphMomentNode_bestAddressNode__block_invoke;
  v4[3] = &unk_1E8431F20;
  v4[4] = v6;
  v4[5] = v5;
  v4[6] = &v7;
  -[PGGraphMomentNode enumerateAddressEdgesAndNodesUsingBlock:](self, "enumerateAddressEdgesAndNodesUsingBlock:", v4);
  v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (CLLocationCoordinate2D)bestLocationCoordinate
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CLLocationCoordinate2D result;

  -[PGGraphMomentNode bestAddressNode](self, "bestAddressNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "coordinate");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9E500];
    v7 = *(double *)(MEMORY[0x1E0C9E500] + 8);
  }

  v8 = v5;
  v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (unint64_t)partsOfDay
{
  return -[PGGraphMomentNode _partsOfDayWithThreshold:](self, "_partsOfDayWithThreshold:", 0.0);
}

- (unint64_t)significantPartsOfDay
{
  return -[PGGraphMomentNode _partsOfDayWithThreshold:](self, "_partsOfDayWithThreshold:", 0.4);
}

- (void)enumeratePartsOfDayUsingBlock:(id)a3
{
  -[PGGraphMomentNode _enumeratePartsOfDayWithThreshold:usingBlock:](self, "_enumeratePartsOfDayWithThreshold:usingBlock:", a3, 0.0);
}

- (void)enumerateSignificantPartsOfDayUsingBlock:(id)a3
{
  -[PGGraphMomentNode _enumeratePartsOfDayWithThreshold:usingBlock:](self, "_enumeratePartsOfDayWithThreshold:usingBlock:", a3, 0.4);
}

- (unint64_t)_partsOfDayWithThreshold:(double)a3
{
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__PGGraphMomentNode__partsOfDayWithThreshold___block_invoke;
  v5[3] = &unk_1E8431F48;
  v5[4] = &v6;
  v5[5] = &v10;
  -[PGGraphMomentNode _enumeratePartsOfDayWithThreshold:usingBlock:](self, "_enumeratePartsOfDayWithThreshold:usingBlock:", v5, a3);
  if (*((_BYTE *)v7 + 24))
  {
    v3 = v11[3];
  }
  else
  {
    v3 = 1;
    v11[3] = 1;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (void)_enumeratePartsOfDayWithThreshold:(double)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PGGraphMomentNode__enumeratePartsOfDayWithThreshold_usingBlock___block_invoke;
  v8[3] = &unk_1E8431F70;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[PGGraphMomentNode enumeratePartOfDayEdgesAndNodesUsingBlock:](self, "enumeratePartOfDayEdgesAndNodesUsingBlock:", v8);

}

- (void)enumeratePartOfDayEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PARTOFDAY"), 400, a3);
}

- (NSDate)localStartDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_localStartTimestamp);
}

- (NSDate)localEndDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_localEndTimestamp);
}

- (NSDate)universalStartDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_universalStartTimestamp);
}

- (NSDate)universalEndDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", self->_universalEndTimestamp);
}

- (BOOL)startsAfterLocalDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  return self->_localStartTimestamp >= v4;
}

- (BOOL)endsBeforeLocalDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSince1970");
  return self->_localEndTimestamp <= v4;
}

- (BOOL)isLongTrip
{
  return 0;
}

- (BOOL)isShortTrip
{
  return 0;
}

- (BOOL)isTrip
{
  return 0;
}

- (BOOL)isAggregation
{
  return 0;
}

- (void)enumerateDateEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("DATE"), 400, a3);
}

- (void)enumerateDateNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("DATE"), 400, a3);
}

- (void)enumerateCelebratedHolidayNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("CELEBRATING"), 401, a3);
}

- (BOOL)hasPersonNodes
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)addressEdges
{
  return -[MANode edgesForLabel:domain:](self, "edgesForLabel:domain:", CFSTR("ADDRESS"), 200);
}

- (id)preciseAddressEdges
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PGGraphMomentNode_preciseAddressEdges__block_invoke;
  v6[3] = &unk_1E8431FA0;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateAddressEdgesAndNodesUsingBlock:](self, "enumerateAddressEdgesAndNodesUsingBlock:", v6);

  return v4;
}

- (id)cityNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cityNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporarySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)countryNodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temporarySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasAddressNodes
{
  return -[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", CFSTR("ADDRESS"), 200);
}

- (void)enumerateAddressEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("ADDRESS"), 200, a3);
}

- (void)enumeratePreciseAddressEdgesAndNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PGGraphMomentNode_enumeratePreciseAddressEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E8431FC8;
  v7 = v4;
  v5 = v4;
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("ADDRESS"), 200, v6);

}

- (void)enumeratePreciseAddressNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PGGraphMomentNode_enumeratePreciseAddressNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E8431FF0;
  v7 = v4;
  v5 = v4;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("ADDRESS"), 200, v6);

}

- (void)enumerateRemoteAddressNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("REMOTE_ADDRESS"), 200, a3);
}

- (void)enumerateConsolidatedAddressesUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  PGConsolidatedAddress *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PGConsolidatedAddress *v12;
  void *v13;
  void *v14;
  PGConsolidatedAddress *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  PGConsolidatedAddress *v37;
  PGConsolidatedAddress *v38;
  PGConsolidatedAddress *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  PGConsolidatedAddress *v44;
  PGConsolidatedAddress *v45;
  void *v46;
  void *v47;
  void (**v48)(id, id, _BYTE *);
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  _BYTE v57[128];
  void *v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v48 = (void (**)(id, id, _BYTE *))a3;
  v4 = (void *)MEMORY[0x1CAA4EB2C]();
  v56 = 0;
  -[PGGraphMomentNode preciseAddressEdges](self, "preciseAddressEdges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend(v5, "anyObject");
      v7 = (PGConsolidatedAddress *)objc_claimAutoreleasedReturnValue();
      -[PGConsolidatedAddress photoCoordinate](v7, "photoCoordinate");
      v9 = v8;
      v11 = v10;
      v12 = [PGConsolidatedAddress alloc];
      -[PGConsolidatedAddress targetNode](v7, "targetNode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PGConsolidatedAddress initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:](v12, "initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:", v13, v14, v9, v11);

      v48[2](v48, v15, &v56);
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestampUTCStart"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0uLL;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v7 = v18;
    v20 = -[PGConsolidatedAddress countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v20)
    {
      v21 = v20;
      v46 = v5;
      v47 = v4;
      v15 = 0;
      v49 = *(_QWORD *)v52;
      v22 = 0.0;
      v23 = 0.0;
      do
      {
        v24 = 0;
        do
        {
          v25 = v23;
          if (*(_QWORD *)v52 != v49)
            objc_enumerationMutation(v7);
          v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
          v27 = (void *)MEMORY[0x1CAA4EB2C]();
          v28 = v27;
          if (v56)
          {
            objc_autoreleasePoolPop(v27);
            goto LABEL_22;
          }
          objc_msgSend(v26, "targetNode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "timestampUTCEnd");
          v23 = v30;
          objc_msgSend(v26, "photoCoordinate");
          *(_QWORD *)&v50 = v31;
          *((_QWORD *)&v50 + 1) = v32;
          objc_msgSend(v26, "relevance");
          v34 = v33;
          if (v15)
          {
            if (-[PGConsolidatedAddress isSameNodeAsNode:](v15, "isSameNodeAsNode:", v29)
              && (objc_msgSend(v26, "timestampUTCStart"), v35 - v25 <= 14400.0)
              && (CLLocationCoordinate2DGetDistanceFrom(), v36 <= 1500.0))
            {
              objc_msgSend(v19, "addObject:", v26);
              CLSCentroidForCoordinates();
              *(_QWORD *)&v55 = v41;
              *((_QWORD *)&v55 + 1) = v42;
              v22 = v22 + v34;
            }
            else
            {
              v37 = [PGConsolidatedAddress alloc];
              v38 = -[PGConsolidatedAddress initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:](v37, "initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:", v15, v19, v55);
              v48[2](v48, v38, &v56);
              v39 = v29;

              v55 = v50;
              v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v26, 0);

              v19 = (id)v40;
              v22 = v34;
              v15 = v39;
            }
          }
          else
          {
            v15 = v29;
            v55 = v50;
            objc_msgSend(v19, "addObject:", v26);
            v22 = v34;
          }

          objc_autoreleasePoolPop(v28);
          ++v24;
        }
        while (v21 != v24);
        v43 = -[PGConsolidatedAddress countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        v21 = v43;
      }
      while (v43);
LABEL_22:

      if (!v15)
      {
        v5 = v46;
        v4 = v47;
        goto LABEL_29;
      }
      v5 = v46;
      v4 = v47;
      if (!objc_msgSend(v19, "count") || v56)
        goto LABEL_29;
      v44 = [PGConsolidatedAddress alloc];
      v45 = -[PGConsolidatedAddress initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:](v44, "initWithAddressNode:addressEdgesSortedByTime:centerCoordinates:", v15, v19, v55);
      v48[2](v48, v45, &v56);
    }
    else
    {
      v15 = 0;
      v45 = v7;
    }

LABEL_29:
    goto LABEL_30;
  }
LABEL_31:

  objc_autoreleasePoolPop(v4);
}

- (id)remoteAddressEdges
{
  return -[MANode edgesForLabel:domain:](self, "edgesForLabel:domain:", CFSTR("REMOTE_ADDRESS"), 200);
}

- (void)enumeratePersonEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PRESENT"), 300, a3);
}

- (void)enumeratePersonNodesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PGGraphMomentNode collection](self, "collection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v4);

}

- (void)enumerateHighlightNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("CONTAINS"), 102, a3);
}

- (void)enumerateSocialGroupEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SOCIALGROUP"), 302, a3);
}

- (void)enumerateSocialGroupNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SOCIALGROUP"), 302, a3);
}

- (void)enumeratePOIEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("POI"), 501, a3);
}

- (void)enumeratePOINodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("POI"), 501, a3);
}

- (void)enumerateROIEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("ROI"), 502, a3);
}

- (void)enumerateROINodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("ROI"), 502, a3);
}

- (void)enumerateSceneEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SCENE"), 600, a3);
}

- (void)enumerateSceneNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("SCENE"), 600, a3);
}

- (void)enumerateBusinessEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BUSINESS"), 503, a3);
}

- (void)enumerateBusinessNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BUSINESS"), 503, a3);
}

- (void)enumeratePublicEventEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PUBLIC_EVENT"), 900, a3);
}

- (void)enumeratePublicEventNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PUBLIC_EVENT"), 900, a3);
}

- (id)eventSortedMomentNodes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateFrequentLocationNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IN"), 204, a3);
}

- (void)enumeratePetNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PET_IS_PRESENT"), 304, a3);
}

- (NSSet)frequentLocationNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frequentLocationNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)happensAtFrequentLocation
{
  return -[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", CFSTR("IN"), 204);
}

- (BOOL)hasPeopleCountingMe:(BOOL)a3
{
  char v3;
  _QWORD v5[5];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__PGGraphMomentNode_hasPeopleCountingMe___block_invoke;
  v5[3] = &unk_1E8432048;
  v5[4] = &v7;
  v6 = a3;
  -[PGGraphMomentNode enumeratePersonNodesUsingBlock:](self, "enumeratePersonNodesUsingBlock:", v5);
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)personNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)petNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "petNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)socialGroupNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "socialGroupNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)personNodesInProximity
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personNodesInProximity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)consolidatedPersonNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "consolidatedPersonNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)consolidatedPersonNodesPresentInAssets
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "consolidatedPersonNodesPresentInAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dateNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__PGGraphMomentNode_dateNodes__block_invoke;
  v6[3] = &unk_1E8432070;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateDateNodesUsingBlock:](self, "enumerateDateNodesUsingBlock:", v6);

  return v4;
}

- (id)seasonNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PGGraphMomentNode_seasonNodes__block_invoke;
  v6[3] = &unk_1E8432070;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateDateNodesUsingBlock:](self, "enumerateDateNodesUsingBlock:", v6);

  return v4;
}

- (id)holidayNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PGGraphMomentNode_holidayNodes__block_invoke;
  v6[3] = &unk_1E8432070;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateDateNodesUsingBlock:](self, "enumerateDateNodesUsingBlock:", v6);

  return v4;
}

- (id)celebratedHolidayNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphMomentNode_celebratedHolidayNodes__block_invoke;
  v6[3] = &unk_1E8433B30;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateCelebratedHolidayNodesUsingBlock:](self, "enumerateCelebratedHolidayNodesUsingBlock:", v6);

  return v4;
}

- (id)poiNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__PGGraphMomentNode_poiNodes__block_invoke;
  v6[3] = &unk_1E8432098;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumeratePOINodesUsingBlock:](self, "enumeratePOINodesUsingBlock:", v6);

  return v4;
}

- (id)roiNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__PGGraphMomentNode_roiNodes__block_invoke;
  v6[3] = &unk_1E84320C0;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateROINodesUsingBlock:](self, "enumerateROINodesUsingBlock:", v6);

  return v4;
}

- (BOOL)hasLocation
{
  return -[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", 0, 200);
}

- (id)addressNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addressNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)businessNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphMomentNode_businessNodes__block_invoke;
  v6[3] = &unk_1E84320E8;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateBusinessNodesUsingBlock:](self, "enumerateBusinessNodesUsingBlock:", v6);

  return v4;
}

- (id)publicEventNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PGGraphMomentNode_publicEventNodes__block_invoke;
  v6[3] = &unk_1E8432110;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumeratePublicEventNodesUsingBlock:](self, "enumeratePublicEventNodesUsingBlock:", v6);

  return v4;
}

- (double)meaningScore
{
  void *v3;
  id v4;
  double v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[PGGraph frequentMeaningLabels](PGGraph, "frequentMeaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__PGGraphMomentNode_meaningScore__block_invoke;
  v7[3] = &unk_1E8432138;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  -[PGGraphMomentNode enumerateMeaningNodesUsingBlock:](self, "enumerateMeaningNodesUsingBlock:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)hasMeanings
{
  return -[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", CFSTR("MEANING"), 700);
}

- (id)meaningLabels
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode meaningNodes](self, "meaningNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meaningNodes
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meaningNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alternativeMeaningLabels
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode alternativeMeaningNodes](self, "alternativeMeaningNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meaningLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)alternativeMeaningNodes
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternativeMeaningNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)meaningLabelsIncludingParents
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PGGraphMomentNode meaningLabels](self, "meaningLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __50__PGGraphMomentNode_meaningLabelsIncludingParents__block_invoke;
        v12[3] = &unk_1E8432160;
        v13 = v3;
        +[PGGraph traverseParentMeaningsForMeaningLabel:usingBlock:](PGGraph, "traverseParentMeaningsForMeaningLabel:usingBlock:", v9, v12);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)alternativeMeaningLabelsIncludingParents
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PGGraphMomentNode alternativeMeaningLabels](self, "alternativeMeaningLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v2);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v2;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __61__PGGraphMomentNode_alternativeMeaningLabelsIncludingParents__block_invoke;
        v12[3] = &unk_1E8432160;
        v13 = v3;
        +[PGGraph traverseParentMeaningsForMeaningLabel:usingBlock:](PGGraph, "traverseParentMeaningsForMeaningLabel:usingBlock:", v9, v12);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)enumerateMeaningEdgesAndNodesWithDomain:(unsigned __int16)a3 block:(id)a4
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), a3, a4);
}

- (void)enumerateMeaningEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), 700, a3);
}

- (void)enumerateAlternativeMeaningEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), 702, a3);
}

- (void)enumerateMeaningNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MEANING"), 700, a3);
}

- (void)enumerateReliableMeaningNodesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PGGraphMomentNode collection](self, "collection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reliableMeaningNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v4);

}

- (void)enumerateMeaningfulEventsUsingBlock:(id)a3
{
  void (**v4)(id, PGGraphMomentNode *, _BYTE *);
  char v5;

  v4 = (void (**)(id, PGGraphMomentNode *, _BYTE *))a3;
  v5 = 0;
  if (-[PGGraphMomentNode hasMeanings](self, "hasMeanings"))
    v4[2](v4, self, &v5);

}

- (id)earlierMomentNode:(id)a3
{
  PGGraphMomentNode *v4;
  PGGraphMomentNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGGraphMomentNode *v10;
  PGGraphMomentNode *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = (PGGraphMomentNode *)a3;
  v5 = self;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PGGraphMomentNode _compareToMomentNode:withSortDescriptors:](v5, "_compareToMomentNode:withSortDescriptors:", v4, v9) == 1)v10 = v4;
    else
      v10 = v5;
    v11 = v10;

    v5 = v11;
  }

  return v5;
}

- (id)laterMomentNode:(id)a3
{
  PGGraphMomentNode *v4;
  PGGraphMomentNode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGGraphMomentNode *v10;
  PGGraphMomentNode *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = (PGGraphMomentNode *)a3;
  v5 = self;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PGGraphMomentNode _compareToMomentNode:withSortDescriptors:](v5, "_compareToMomentNode:withSortDescriptors:", v4, v9) == -1)v10 = v4;
    else
      v10 = v5;
    v11 = v10;

    v5 = v11;
  }

  return v5;
}

- (int64_t)_compareToMomentNode:(id)a3 withSortDescriptors:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "compareObject:toObject:", self, v6, (_QWORD)v15);
        if (v12)
        {
          v13 = v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)debugDictionaryWithServiceManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PGNeighborScoreComputer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PGGraphMomentNode graphScore](self, "graphScore");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("graphScore"));

  v7 = objc_alloc_init(PGNeighborScoreComputer);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PGNeighborScoreComputer neighborScoreWithMomentNode:](v7, "neighborScoreWithMomentNode:", self);
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("neighborScore"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PGGraphMomentNode contentScore](self, "contentScore");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("curationScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGGraphMomentNode numberOfAssets](self, "numberOfAssets"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("numberOfAssets"));

  -[PGGraphMomentNode keywordsForRelatedType:focusOnNodes:](self, "keywordsForRelatedType:focusOnNodes:", 63, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGManager exportableDictionaryFromKeywords:](PGManager, "exportableDictionaryFromKeywords:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("keywords"));

  return v4;
}

- (id)keywordsForRelatedType:(unint64_t)a3 focusOnNodes:(id)a4
{
  id v6;
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
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  _QWORD v47[6];
  _QWORD v48[8];

  v48[6] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 2) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PGGraphMomentNode localStartDate](self, "localStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("[EventStart] %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PGGraphMomentNode localEndDate](self, "localEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("[EventEnd] %@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v13);
    objc_msgSend(v7, "addObject:", v16);

  }
  v17 = MEMORY[0x1E0C809B0];
  v18 = "MusicKitRequestFactoryError";
  if ((a3 & 1) != 0)
  {
    -[MANode graph](self, "graph");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anyNode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke;
    v43[3] = &unk_1E8432188;
    v44 = v6;
    v45 = v21;
    v22 = v34;
    v46 = v22;
    v23 = v21;
    -[PGGraphMomentNode enumeratePersonEdgesAndNodesUsingBlock:](self, "enumeratePersonEdgesAndNodesUsingBlock:", v43);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[All Persons] %lu"), -[PGGraphMomentNode totalNumberOfPersons](self, "totalNumberOfPersons"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v24);

    v18 = "MusicKitRequestFactoryError";
    v17 = MEMORY[0x1E0C809B0];
  }
  v35[0] = v17;
  v35[1] = *((_QWORD *)v18 + 246);
  v35[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_2;
  v35[3] = &unk_1E8432280;
  v41 = v10;
  v42 = a3;
  v36 = v6;
  v37 = v33;
  v38 = v7;
  v39 = v8;
  v40 = v9;
  v25 = v10;
  v26 = v9;
  v27 = v8;
  v28 = v7;
  v29 = v33;
  v30 = v6;
  -[MANode enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:](self, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v35);
  v47[0] = &unk_1E84E4AA8;
  v47[1] = &unk_1E84E4AC0;
  v48[0] = v34;
  v48[1] = v29;
  v47[2] = &unk_1E84E4AD8;
  v47[3] = &unk_1E84E4AF0;
  v48[2] = v28;
  v48[3] = v27;
  v47[4] = &unk_1E84E4B08;
  v47[5] = &unk_1E84E4B20;
  v48[4] = v26;
  v48[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 6);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (id)naturalLanguageFeatures
{
  PGTextFeatureGenerator *v3;
  void *v4;
  void *v5;
  PGTextFeatureGenerator *v6;
  void *v7;

  v3 = [PGTextFeatureGenerator alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANode graph](self, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGTextFeatureGenerator initWithMomentNodes:graph:](v3, "initWithMomentNodes:graph:", v4, v5);

  -[PGTextFeatureGenerator naturalLanguageFeatures](v6, "naturalLanguageFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventEnrichmentSortedMomentNodes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)uuid
{
  return self->_localIdentifier;
}

- (id)reliableMeaningLabels
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PGGraphMomentNode_reliableMeaningLabels__block_invoke;
  v6[3] = &unk_1E84322A8;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNode enumerateReliableMeaningNodesUsingBlock:](self, "enumerateReliableMeaningNodesUsingBlock:", v6);

  return v4;
}

- (id)birthdayPersonNodes
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "birthdayPersonNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)anniversaryPersonNodes
{
  void *v2;
  void *v3;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anniversaryPersonNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchAssetCollectionInPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MANode graph](self, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "momentForMomentNode:inPhotoLibrary:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)weightForMoment:(id)a3
{
  return 1.0;
}

- (id)connectedEventsWithTargetDomain:(unsigned __int16)a3
{
  int v3;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  PGGraphMomentNode *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (-[PGGraphMomentNode domain](self, "domain") == a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 102)
  {
    -[PGGraphMomentNode highlightNode](self, "highlightNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = self;
        _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Moment node has no highlight node: %@", (uint8_t *)&v13, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v7;

    return v12;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109120;
      LODWORD(v14) = v3;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Unsupported target domain: %u", (uint8_t *)&v13, 8u);
    }

    return 0;
  }
}

- (BOOL)isWeekend
{
  void *v2;
  BOOL v3;

  -[PGGraphMomentNode weekendNode](self, "weekendNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)weekendNode
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weekendNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastWeekendMoments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint8_t v29[128];
  uint8_t buf[24];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANode graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localDatesForMomentNode:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0D4B148], "nextWeekendLocalStartDate:interval:options:afterDate:", &v28, buf, 4, v9);
    objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphMomentNode previousMomentNode](self, "previousMomentNode");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v23 = v9;
      do
      {
        objc_msgSend(v4, "localDatesForMomentNode:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v25;
          v18 = 1;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v25 != v17)
                objc_enumerationMutation(v14);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "compare:", v10) == -1)
              {
                v18 = 0;
              }
              else if (objc_msgSend(v12, "isWeekend"))
              {
                objc_msgSend(v3, "addObject:", v12);
                goto LABEL_17;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          }
          while (v16);
        }
        else
        {
          v18 = 1;
        }
LABEL_17:

        objc_msgSend(v12, "previousMomentNode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v18 & 1) == 0)
          break;
        v12 = v20;
      }
      while (v20);

      v9 = v23;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "No date node for moment node %@", buf, 0xCu);
    }
  }

  return v3;
}

- (id)sameWeekendMoments
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  PGGraphMomentNode *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  id v40;
  id v41;
  id v42;
  PGGraphMomentNode *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGGraphMomentNode isWeekend](self, "isWeekend"))
  {
    v45 = v3;
    -[MANode graph](self, "graph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localDatesForMomentNode:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (!v6)
      goto LABEL_51;
    v7 = v6;
    v44 = self;
    v8 = 0;
    v9 = *(_QWORD *)v57;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v57 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        v54 = 0;
        v55 = 0.0;
        objc_msgSend(MEMORY[0x1E0D4B148], "closestWeekendLocalStartDate:interval:afterDate:", &v54, &v55, v12, v44);
        v13 = v54;
        v14 = v13;
        if (!v8 || v55 < v10)
        {
          v15 = v13;

          v10 = v55;
          v8 = v15;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v7);
    v16 = v44;
    if (v8)
    {
      objc_msgSend(v8, "dateByAddingTimeInterval:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGGraphMomentNode previousMomentNode](v44, "previousMomentNode");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        do
        {
          objc_msgSend(v4, "localDatesForMomentNode:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v23 = v22;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v51;
            v27 = 1;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v51 != v26)
                  objc_enumerationMutation(v23);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "compare:", v18) == -1)
                {
                  v27 = 0;
                }
                else if (objc_msgSend(v21, "isWeekend"))
                {
                  objc_msgSend(v45, "addObject:", v21);
                  goto LABEL_28;
                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
            }
            while (v25);
          }
          else
          {
            v27 = 1;
          }
LABEL_28:

          objc_msgSend(v21, "previousMomentNode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v27 & 1) == 0)
            break;
          v21 = v29;
        }
        while (v29);

        v16 = v44;
      }
      -[PGGraphMomentNode nextMomentNode](v16, "nextMomentNode");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        do
        {
          objc_msgSend(v4, "localDatesForMomentNode:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v33 = v32;
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
          if (v34)
          {
            v35 = v34;
            v36 = 0;
            v37 = *(_QWORD *)v47;
            while (2)
            {
              for (k = 0; k != v35; ++k)
              {
                if (*(_QWORD *)v47 != v37)
                  objc_enumerationMutation(v33);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "compare:", v19) != 1)
                {
                  if (objc_msgSend(v31, "isWeekend"))
                  {
                    objc_msgSend(v45, "addObject:", v31);
                    v36 = 1;
                    goto LABEL_46;
                  }
                  v36 = 1;
                }
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
              if (v35)
                continue;
              break;
            }
          }
          else
          {
            v36 = 0;
          }
LABEL_46:

          objc_msgSend(v31, "nextMomentNode");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v36 & 1) == 0)
            break;
          v31 = v39;
        }
        while (v39);

      }
      v3 = v45;
      v40 = v45;

    }
    else
    {
LABEL_51:
      v42 = v3;
    }

  }
  else
  {
    v41 = v3;
  }

  return v3;
}

- (id)sameMonthMoments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, _QWORD);
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D4B130];
  -[PGGraphMomentNode localStartDate](self, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MANode graph](self, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", objc_msgSend(v6, "year"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMonthNodeCollection monthNodesForMonth:inGraph:](PGGraphMonthNodeCollection, "monthNodesForMonth:inGraph:", objc_msgSend(v6, "month"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__PGGraphMomentNode_sameMonthMoments__block_invoke;
  v16[3] = &unk_1E84322F8;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v10 = v3;
  v19 = v10;
  v11 = v8;
  v12 = v9;
  v13 = (void (**)(void *, _QWORD))_Block_copy(v16);
  v13[2](v13, 0);
  v13[2](v13, 1);
  v14 = v10;

  return v14;
}

- (id)associatedNodesForRemoval
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void (**v21)(void *, const __CFString *, uint64_t);
  id v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[4];
  id v43;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMomentNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke;
  aBlock[3] = &unk_1E8432348;
  v6 = v3;
  v43 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(v4, "addressNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  objc_msgSend(v4, "remoteAddressNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

  v40[0] = v5;
  v40[1] = 3221225472;
  v40[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_3;
  v40[3] = &unk_1E8432070;
  v10 = v6;
  v41 = v10;
  -[PGGraphMomentNode enumerateDateNodesUsingBlock:](self, "enumerateDateNodesUsingBlock:", v40);
  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_4;
  v38[3] = &unk_1E84320E8;
  v11 = v10;
  v39 = v11;
  -[PGGraphMomentNode enumerateBusinessNodesUsingBlock:](self, "enumerateBusinessNodesUsingBlock:", v38);
  v36[0] = v5;
  v36[1] = 3221225472;
  v36[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_5;
  v36[3] = &unk_1E8432110;
  v12 = v11;
  v37 = v12;
  -[PGGraphMomentNode enumeratePublicEventNodesUsingBlock:](self, "enumeratePublicEventNodesUsingBlock:", v36);
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_6;
  v34[3] = &unk_1E8432098;
  v13 = v12;
  v35 = v13;
  -[PGGraphMomentNode enumeratePOINodesUsingBlock:](self, "enumeratePOINodesUsingBlock:", v34);
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_7;
  v32[3] = &unk_1E84320C0;
  v14 = v13;
  v33 = v14;
  -[PGGraphMomentNode enumerateROINodesUsingBlock:](self, "enumerateROINodesUsingBlock:", v32);
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_8;
  v30[3] = &unk_1E8432370;
  v15 = v14;
  v31 = v15;
  -[PGGraphMomentNode enumerateSceneNodesUsingBlock:](self, "enumerateSceneNodesUsingBlock:", v30);
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_9;
  v28[3] = &unk_1E8432398;
  v16 = v15;
  v29 = v16;
  -[PGGraphMomentNode enumerateFrequentLocationNodesUsingBlock:](self, "enumerateFrequentLocationNodesUsingBlock:", v28);
  -[PGGraphMomentNode collection](self, "collection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "personNodes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_10;
  v26[3] = &unk_1E8434020;
  v19 = v16;
  v27 = v19;
  objc_msgSend(v18, "enumerateNodesUsingBlock:", v26);

  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_11;
  v24[3] = &unk_1E84323E8;
  v24[4] = self;
  v20 = v19;
  v25 = v20;
  v21 = (void (**)(void *, const __CFString *, uint64_t))_Block_copy(v24);
  v21[2](v21, CFSTR("MOBILITY"), 203);
  v21[2](v21, CFSTR("PARTOFDAY"), 400);
  v21[2](v21, CFSTR("PARTOFWEEK"), 400);
  v22 = v20;

  return v22;
}

- (BOOL)petIsPresent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PGGraphMomentNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "petNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (unint64_t)featureType
{
  return 11;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMomentNode localIdentifier](self, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (double)inhabitationScore
{
  return self->_inhabitationScore;
}

- (BOOL)hasHigherThanImprovedAssets
{
  return *((_BYTE *)self + 84) & 1;
}

- (BOOL)hasAssetsWithInterestingScenes
{
  return (*((unsigned __int8 *)self + 84) >> 1) & 1;
}

- (BOOL)containsBetterScoringAsset
{
  return (*((unsigned __int8 *)self + 84) >> 2) & 1;
}

- (BOOL)containsNonJunkAssets
{
  return (*((unsigned __int8 *)self + 84) >> 3) & 1;
}

- (unint64_t)numberOfAssetsWithPersons
{
  return *((unsigned int *)self + 16);
}

- (unint64_t)numberOfAssets
{
  return *((unsigned int *)self + 17);
}

- (unsigned)sharingComposition
{
  return self->_sharingComposition;
}

- (unint64_t)numberOfRegularGemAssets
{
  return *((unsigned int *)self + 20);
}

- (unint64_t)numberOfShinyGemAssets
{
  return *((unsigned int *)self + 19);
}

- (double)contentScore
{
  return self->_contentScore;
}

- (double)behavioralScore
{
  return self->_behavioralScore;
}

- (BOOL)isInteresting
{
  return (*((unsigned __int8 *)self + 84) >> 4) & 1;
}

- (BOOL)isInterestingWithAlternateJunking
{
  return (*((unsigned __int8 *)self + 84) >> 5) & 1;
}

- (BOOL)isSmartInteresting
{
  return (*((unsigned __int8 *)self + 84) >> 6) & 1;
}

- (double)timestampUTCStart
{
  return self->_universalStartTimestamp;
}

- (double)timestampUTCEnd
{
  return self->_universalEndTimestamp;
}

- (unint64_t)totalNumberOfPersons
{
  return *((unsigned __int16 *)self + 37);
}

- (double)scenesProcessedRatio
{
  return self->_scenesProcessedRatio;
}

- (double)facesProcessedRatio
{
  return self->_facesProcessedRatio;
}

- (unint64_t)numberOfAssetsInExtendedCuration
{
  return self->_numberOfAssetsInExtendedCuration;
}

- (BOOL)happensAtSensitiveLocation
{
  return self->_happensAtSensitiveLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_encodedCLIPFeatureVector, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_2;
  v3[3] = &unk_1E8432320;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateIdentifiersAsCollectionsWithBlock:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("DATE"), 400) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("BUSINESS"), 503) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("PUBLIC_EVENT"), 900) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("POI"), 501) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("ROI"), 502) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("SCENE"), 600) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("IN"), 204) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __int16 v11;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_12;
  v8[3] = &unk_1E84323C0;
  v9 = v5;
  v11 = a3;
  v6 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v7 = v5;
  objc_msgSend(v6, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", v7, a3, v8);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 48)) == 1)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __46__PGGraphMomentNode_associatedNodesForRemoval__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "anyNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

void __37__PGGraphMomentNode_sameMonthMoments__block_invoke(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  objc_msgSend(*(id *)(a1 + 32), "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v6 = (void *)MEMORY[0x1CAA4EB2C]();
    if ((a2 & 1) != 0)
      objc_msgSend(v4, "nextMomentNodes");
    else
      objc_msgSend(v4, "previousMomentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    objc_msgSend(v7, "dateNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __37__PGGraphMomentNode_sameMonthMoments__block_invoke_2;
    v11[3] = &unk_1E84322D0;
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = &v15;
    objc_msgSend(v8, "enumerateIdentifiersAsCollectionsWithBlock:", v11);

    if (!*((_BYTE *)v16 + 24))
      break;
    v9 = *(void **)(a1 + 56);
    objc_msgSend(v7, "anyNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    _Block_object_dispose(&v15, 8);
    objc_autoreleasePoolPop(v6);
    v4 = v7;
    if (!objc_msgSend(v7, "count"))
      goto LABEL_9;
  }

  _Block_object_dispose(&v15, 8);
  objc_autoreleasePoolPop(v6);
LABEL_9:

}

void __37__PGGraphMomentNode_sameMonthMoments__block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "monthNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", a1[4]))
  {
    objc_msgSend(v8, "yearNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", a1[5]))
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }

  }
}

void __42__PGGraphMomentNode_reliableMeaningLabels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (!v7 || objc_msgSend(v7, "containsObject:", v6))
  {
    v8 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v6, "keywordDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 40) && (objc_msgSend(v6, "isEqualToNode:") & 1) == 0)
    {
      objc_msgSend(v6, "collection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "relationshipEdges");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "labels");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sortedArrayUsingDescriptors:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("/"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR(" - %@ -"), v17);

      }
    }
    objc_msgSend(v5, "importance");
    objc_msgSend(v10, "appendFormat:", CFSTR(" (%0.2f)"), v18);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

  }
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  const __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  int v39;
  __CFString *v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD aBlock[4];
  id v58;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_3;
  aBlock[3] = &unk_1E84321B0;
  v8 = v6;
  v58 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = *(void **)(a1 + 32);
  if (!v10 || objc_msgSend(v10, "containsObject:", v8))
  {
    if (objc_msgSend(v5, "domain") == 200 && (*(_BYTE *)(a1 + 80) & 4) != 0)
    {
      objc_msgSend(v5, "relevance");
      v15 = v14;
      v55[0] = v7;
      v55[1] = 3221225472;
      v55[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_4;
      v55[3] = &unk_1E84321D8;
      v56[1] = v14;
      v13 = (id *)v56;
      v56[0] = *(id *)(a1 + 40);
      v16 = v8;
      objc_msgSend(v16, "enumerateOutEdgesUsingBlock:", v55);
      objc_msgSend(v16, "collection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "homeWorkNodes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v7;
      v52[1] = 3221225472;
      v52[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_5;
      v52[3] = &unk_1E8432228;
      v54 = v15;
      v53 = *(id *)(a1 + 40);
      objc_msgSend(v18, "enumerateNodesUsingBlock:", v52);

      goto LABEL_10;
    }
    if (objc_msgSend(v5, "domain") == 400 && (*(_BYTE *)(a1 + 80) & 2) != 0)
    {
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v8, "keywordDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50[0] = v7;
        v50[1] = 3221225472;
        v50[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_7;
        v50[3] = &unk_1E8432250;
        v13 = &v51;
        v51 = *(id *)(a1 + 48);
        objc_msgSend(v8, "enumerateHolidayEdgesAndNodesUsingBlock:", v50);
LABEL_10:

      }
    }
  }
  if (objc_msgSend(v5, "domain") == 301 && (*(_BYTE *)(a1 + 80) & 8) != 0)
  {
    objc_msgSend(v5, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", CFSTR("BIRTHDAY"))
      || objc_msgSend(v24, "isEqualToString:", CFSTR("BIRTHDAY")))
    {
      v34 = *(void **)(a1 + 56);
      objc_msgSend(v5, "confidence");
      v9[2](v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v35);

    }
    goto LABEL_37;
  }
  if (objc_msgSend(v5, "domain") == 401 && (*(_BYTE *)(a1 + 80) & 8) != 0)
  {
    v33 = *(void **)(a1 + 56);
    goto LABEL_32;
  }
  v19 = objc_msgSend(v5, "domain");
  v20 = *(_QWORD *)(a1 + 80);
  if (v19 == 700 && (v20 & 8) != 0)
  {
    v21 = *(void **)(a1 + 56);
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = v5;
    objc_msgSend(v23, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "capitalizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "label");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "confidence");
    v28 = v27;
    v29 = objc_msgSend(v23, "isReliable");

    v30 = CFSTR("Unreliable");
    if (v29)
      v30 = CFSTR("Reliable");
    objc_msgSend(v22, "stringWithFormat:", CFSTR("[%@] %@ (%.2f, %@)"), v25, v26, v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v31);

    goto LABEL_37;
  }
  v32 = objc_msgSend(v5, "domain");
  if ((v20 & 0x10) != 0)
  {
    if (v32 != 501 && objc_msgSend(v5, "domain") != 502)
      goto LABEL_38;
LABEL_35:
    v33 = *(void **)(a1 + 64);
    objc_msgSend(v5, "confidence");
    v9[2](v9);
    v36 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  if (v32 == 600 && (*(_BYTE *)(a1 + 80) & 0x20) != 0)
  {
    v37 = v5;
    v38 = v8;
    v49 = v38;
    v39 = objc_msgSend(v37, "isReliable");
    v40 = CFSTR("NO");
    if (v39)
      v40 = CFSTR("YES");
    v41 = v40;
    v48 = objc_msgSend(v37, "numberOfAssets");
    v42 = objc_msgSend(v37, "numberOfHighConfidenceAssets");
    v43 = objc_msgSend(v37, "numberOfSearchConfidenceAssets");
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v38, "keywordDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "confidence");
    v47 = v46;

    objc_msgSend(v44, "stringWithFormat:", CFSTR("%@ #all:%lu #highConf:%lu #searchConf:%lu reliable:%@ - (%0.2f)"), v45, v48, v42, v43, v41, v47);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "addObject:", v24);
    goto LABEL_37;
  }
  if (objc_msgSend(v5, "domain") == 503 && (*(_BYTE *)(a1 + 80) & 0x10) != 0)
    goto LABEL_35;
  if (objc_msgSend(v5, "domain") == 900 && (*(_BYTE *)(a1 + 80) & 0x10) != 0)
  {
    v33 = *(void **)(a1 + 64);
LABEL_32:
    objc_msgSend(v8, "keywordDescription");
    v36 = objc_claimAutoreleasedReturnValue();
LABEL_36:
    v24 = (void *)v36;
    objc_msgSend(v33, "addObject:", v36);
LABEL_37:

  }
LABEL_38:

}

id __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_3(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "keywordDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%0.2f)"), v4, *(_QWORD *)&a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "domain") == 200)
  {
    v3 = *(_QWORD *)(a1 + 40);
LABEL_5:
    objc_msgSend(v9, "targetNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "keywordDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%0.2f)"), v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    goto LABEL_6;
  }
  if (objc_msgSend(v9, "domain") == 201)
  {
    objc_msgSend(v9, "relevance");
    v3 = v4;
    goto LABEL_5;
  }
LABEL_6:

}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ownerNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_6;
  v7[3] = &unk_1E8432200;
  v8 = v3;
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v7);

}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "keywordDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

void __57__PGGraphMomentNode_keywordsForRelatedType_focusOnNodes___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] - %@ (%0.2f)"), v6, v7, *(_QWORD *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

uint64_t __61__PGGraphMomentNode_alternativeMeaningLabelsIncludingParents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __50__PGGraphMomentNode_meaningLabelsIncludingParents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __33__PGGraphMomentNode_meaningScore__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = 0.5;
  if ((v5 & 1) == 0)
  {
    *a3 = 1;
    v8 = 1.0;
  }
  *(double *)(v7 + 24) = v8;
}

uint64_t __37__PGGraphMomentNode_publicEventNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __34__PGGraphMomentNode_businessNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __29__PGGraphMomentNode_roiNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __29__PGGraphMomentNode_poiNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __43__PGGraphMomentNode_celebratedHolidayNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __33__PGGraphMomentNode_holidayNodes__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__PGGraphMomentNode_holidayNodes__block_invoke_2;
  v3[3] = &unk_1E8433B30;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateHolidayNodesUsingBlock:", v3);

}

uint64_t __33__PGGraphMomentNode_holidayNodes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __32__PGGraphMomentNode_seasonNodes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "seasonNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __30__PGGraphMomentNode_dateNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __41__PGGraphMomentNode_hasPeopleCountingMe___block_invoke(uint64_t result, void *a2, _BYTE *a3)
{
  uint64_t v4;
  char v5;

  v4 = result;
  if (*(_BYTE *)(result + 40))
  {
    v5 = 1;
  }
  else
  {
    result = objc_msgSend(a2, "isMeNode");
    v5 = result ^ 1;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) = v5;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24);
  return result;
}

void __60__PGGraphMomentNode_enumeratePreciseAddressNodesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isPrecise"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__PGGraphMomentNode_enumeratePreciseAddressEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isPrecise"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __40__PGGraphMomentNode_preciseAddressEdges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isPrecise"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __66__PGGraphMomentNode__enumeratePartsOfDayWithThreshold_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "ratio");
  if (v5 >= *(double *)(a1 + 40))
  {
    objc_msgSend(v6, "partOfDay");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __46__PGGraphMomentNode__partsOfDayWithThreshold___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 != 1)
    *(_QWORD *)(v2 + 24) = v3 | a2;
  return result;
}

void __36__PGGraphMomentNode_bestAddressNode__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(a2, "relevance");
  v7 = v6;
  v8 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v7 > v8)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
    *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
    goto LABEL_10;
  }
  if (v7 == v8)
  {
    v9 = objc_msgSend(v12, "countOfEdgesWithLabel:domain:", CFSTR("ADDRESS"), 200);
    v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "countOfEdgesWithLabel:domain:", CFSTR("ADDRESS"), 200);
      v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    }
    if (v10 < v9)
      goto LABEL_9;
    if (v10 == v9)
    {
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "identifier");
      if (v11 < objc_msgSend(v12, "identifier"))
        goto LABEL_9;
    }
  }
LABEL_10:

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("Moment"), 100);
}

+ (MANodeFilter)filterEncodedCLIPFeatureVectorNotEmpty
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("clipfeature");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &stru_1E8436F28);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v5;
}

+ (id)interestingFilter
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  v6 = CFSTR("intng");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabel:domain:properties:", CFSTR("Moment"), 100, v3);

  return v4;
}

+ (id)interestingWithAlternateJunkingFilter
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  v6 = CFSTR("intngaj");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabel:domain:properties:", CFSTR("Moment"), 100, v3);

  return v4;
}

+ (id)smartInterestingFilter
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  v6 = CFSTR("sintng");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabel:domain:properties:", CFSTR("Moment"), 100, v3);

  return v4;
}

+ (id)filterWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("lclid");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filterWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("lclid");
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filterWithTotalNumberOfPersonsGreaterThanOrEqualTo:(unint64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("tnop");
  v5 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithComparator:value:", 6, v6);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)filterWithLocalDateInterval:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithComparator:value:", 4, v11);

  v13 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithComparator:value:", 6, v14);

  v16 = objc_alloc(MEMORY[0x1E0D42A50]);
  v20[0] = CFSTR("tzs");
  v20[1] = CFSTR("tze");
  v21[0] = v12;
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithLabel:domain:properties:", CFSTR("Moment"), 100, v17);

  return v18;
}

+ (id)filterWithUniversalDateInterval:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithComparator:value:", 4, v11);

  v13 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithComparator:value:", 6, v14);

  v16 = objc_alloc(MEMORY[0x1E0D42A50]);
  v20[0] = CFSTR("utcs");
  v20[1] = CFSTR("utce");
  v21[0] = v12;
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithLabel:domain:properties:", CFSTR("Moment"), 100, v17);

  return v18;
}

+ (id)filterHappeningAtSensitiveLocation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("hasl");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)filterEnoughScenesProcessed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("spr");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 6, &unk_1E84EB448);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)filterEnoughFacesProcessed
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("fpr");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 6, &unk_1E84EB448);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentScoreSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("contentScore"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)breakoutOfRoutineTypeWithNeighborScore:(double)a3
{
  if (a3 >= 0.6)
    return 2;
  else
    return a3 >= 0.43;
}

+ (id)propertiesWithMoment:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
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
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[8];
  _QWORD v35[8];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (propertiesWithMoment__onceToken != -1)
    dispatch_once(&propertiesWithMoment__onceToken, &__block_literal_global_55060);
  objc_msgSend(v4, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v31 = a1;
    v33 = v5;
    objc_msgSend((id)propertiesWithMoment__momentNameDateFormatter, "stringFromDate:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v7 = objc_claimAutoreleasedReturnValue();

    }
    v35[0] = v6;
    v34[0] = CFSTR("name");
    v34[1] = CFSTR("utcs");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "universalStartDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v29;
    v34[2] = CFSTR("utce");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "universalEndDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSince1970");
    objc_msgSend(v10, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v27;
    v34[3] = CFSTR("tzs");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "localStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v32 = v6;
    v26 = (void *)v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v13;
    v34[4] = CFSTR("tze");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "localEndDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v16;
    v34[5] = CFSTR("tnop");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "totalNumberOfPersons"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v35[5] = v17;
    v34[6] = CFSTR("inhbtscr");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "inhabitationScore");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[7] = CFSTR("lclid");
    v35[6] = v19;
    v35[7] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    v22 = v32;
    objc_msgSend(v31, "contentBasedPropertiesWithMoment:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addEntriesFromDictionary:", v23);

    v5 = v33;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v4;
      _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "Cannot insert moment %@: localStartDate returned nil", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

+ (id)contentBasedPropertiesWithMoment:(id)a3
{
  id v3;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[19];
  _QWORD v32[21];

  v32[19] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("clipfeature");
  v3 = a3;
  objc_msgSend(v3, "encodedCLIPFeatureVector");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v30;
  v31[1] = CFSTR("cnt");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfItems"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v29;
  v31[2] = CFSTR("nawp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfItemsWithPersons"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v28;
  v31[3] = CFSTR("intng");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isInteresting"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v27;
  v31[4] = CFSTR("intngaj");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isInterestingWithAlternateJunking"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v26;
  v31[5] = CFSTR("sintng");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isSmartInteresting"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v25;
  v31[6] = CFSTR("cntsc");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "contentScore");
  objc_msgSend(v4, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v24;
  v31[7] = CFSTR("cbsa");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "containsBetterScoringAsset"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v23;
  v31[8] = CFSTR("hghthnmprv");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "hasHigherThanImprovedAssets"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v22;
  v31[9] = CFSTR("asswis");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "hasAssetsWithInterestingScenes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v21;
  v31[10] = CFSTR("cnja");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "containsNonJunkAssets"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v20;
  v31[11] = CFSTR("sgem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfShinyGemItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v5;
  v31[12] = CFSTR("rgem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfRegularGemItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[12] = v6;
  v31[13] = CFSTR("bhsc");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "behavioralScore");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[13] = v8;
  v31[14] = CFSTR("spr");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "scenesProcessedRatio");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[14] = v10;
  v31[15] = CFSTR("fpr");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "facesProcessedRatio");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[15] = v12;
  v31[16] = CFSTR("extc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "numberOfAssetsInExtendedCuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[16] = v13;
  v31[17] = CFSTR("sharingComposition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v3, "sharingComposition"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[17] = v14;
  v31[18] = CFSTR("hasl");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend(v3, "happensAtSensitiveLocation");

  objc_msgSend(v15, "numberWithBool:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[18] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (void)setLocalStartDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forNodeWithIdentifier:", v8, CFSTR("tzs"), a4);

}

+ (void)setLocalEndDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forNodeWithIdentifier:", v8, CFSTR("tze"), a4);

}

+ (void)setUniversalStartDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forNodeWithIdentifier:", v8, CFSTR("utcs"), a4);

}

+ (void)setUniversalEndDate:(id)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forNodeWithIdentifier:", v8, CFSTR("utce"), a4);

}

+ (void)setNumberOfAssets:(unint64_t)a3 onMomentNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  void *v7;
  id v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistModelProperty:forKey:forNodeWithIdentifier:", v9, CFSTR("cnt"), a4);

}

+ (id)firstAndLastMomentNodesInMomentNodes:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (!v4)
  {
    v7 = 0;
    v6 = 0;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v16;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      if (v6)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "earlierMomentNode:", v6);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v11;
        if (v7)
          goto LABEL_8;
      }
      else
      {
        v6 = v10;
        if (v7)
        {
LABEL_8:
          objc_msgSend(v10, "laterMomentNode:", v7);
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v12;
          goto LABEL_11;
        }
      }
      v7 = v10;
LABEL_11:
      ++v9;
    }
    while (v5 != v9);
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  }
  while (v5);
  v13 = (void *)MEMORY[0x1E0C9AA60];
  if (v6 && v7)
  {
    v19[0] = v6;
    v19[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_17:

  return v13;
}

+ (id)pathFromMoment
{
  return &stru_1E8436F28;
}

+ (id)pathToMoment
{
  return &stru_1E8436F28;
}

+ (id)pathFromTargetNodeDomain:(unsigned __int16)a3
{
  int v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 100)
    return &stru_1E8436F28;
  v3 = a3;
  if (a3 == 102)
    return CFSTR("(:Highlight)-[:CONTAINS]->");
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (id)pathToTargetNodeDomain:(unsigned __int16)a3
{
  int v3;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 100)
    return &stru_1E8436F28;
  v3 = a3;
  if (a3 == 102)
    return CFSTR("<-[:CONTAINS]-(:Highlight)");
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (id)inclusivePathFromTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    v7 = &stru_1E8436F28;
    if (v5)
      v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:Highlight)-[:CONTAINS]->(:Moment)"), v7);
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    v6 = &stru_1E8436F28;
    if (v5)
      v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:Moment)"), v6);
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", buf, 8u);
  }

  v8 = 0;
LABEL_13:

  return v8;
}

+ (id)inclusivePathToTargetNodeDomain:(unsigned __int16)a3 withName:(id)a4
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a4;
  if (v4 == 102)
  {
    v7 = &stru_1E8436F28;
    if (v5)
      v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(:Moment)<-[:CONTAINS]-(%@:Highlight)"), v7);
    goto LABEL_9;
  }
  if (v4 == 100)
  {
    v6 = &stru_1E8436F28;
    if (v5)
      v6 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@:Moment)"), v6);
LABEL_9:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Unsupported target event domain: %u", buf, 8u);
  }

  v8 = 0;
LABEL_13:

  return v8;
}

+ (MARelation)preciseAddressOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[PGGraphAddressNode preciseFilter](PGGraphAddressNode, "preciseFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v7;
}

+ (MARelation)nextMomentOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMomentNextEdge filter](PGGraphMomentNextEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)previousMomentOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMomentNextEdge filter](PGGraphMomentNextEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)dateOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphDateEdge filter](PGGraphDateEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphDateNode filter](PGGraphDateNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)sceneOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphSceneEdge filter](PGGraphSceneEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)reliableSceneOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphSceneEdge isReliableFilter](PGGraphSceneEdge, "isReliableFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)weekdayOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPartOfWeekEdge filter](PGGraphPartOfWeekEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphWeekdayNode filter](PGGraphWeekdayNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)weekendOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPartOfWeekEdge filter](PGGraphPartOfWeekEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphWeekendNode filter](PGGraphWeekendNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)roiOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphROIEdge filter](PGGraphROIEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)roiWithNonzeroConfidenceOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphROIEdge filterAboveConfidence:](PGGraphROIEdge, "filterAboveConfidence:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)roiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:(BOOL)a3
{
  void *v3;
  void *v4;

  +[PGGraphROIEdge filterAboveConfidence:hasLegacyWeights:](PGGraphROIEdge, "filterAboveConfidence:hasLegacyWeights:", a3, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (MARelation)poiOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPOIEdge filter](PGGraphPOIEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)poiWithNonzeroConfidenceOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPOIEdge filterAboveConfidence:](PGGraphPOIEdge, "filterAboveConfidence:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)poiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:(BOOL)a3
{
  void *v3;
  void *v4;

  +[PGGraphPOIEdge filterAboveConfidence:hasLegacyWeights:](PGGraphPOIEdge, "filterAboveConfidence:hasLegacyWeights:", a3, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)improvedPOIOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPOIEdge filterImproved](PGGraphPOIEdge, "filterImproved");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)specialPOIOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPOIEdge filterSpecial](PGGraphPOIEdge, "filterSpecial");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MARelation)publicEventOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPublicEventEdge filter](PGGraphPublicEventEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)personInMoment
{
  void *v2;
  void *v3;

  +[PGGraphPersonPresentEdge filter](PGGraphPersonPresentEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)consolidatedPersonInMoment
{
  void *v2;
  void *v3;

  +[PGGraphBasePresentEdge consolidatedFilter](PGGraphBasePresentEdge, "consolidatedFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)consolidatedPersonPresentInAssets
{
  void *v2;
  void *v3;

  +[PGGraphBasePresentEdge consolidatedPresentInAssetsFilter](PGGraphBasePresentEdge, "consolidatedPresentInAssetsFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)personInProximityInMoment
{
  void *v2;
  void *v3;

  +[PGGraphPersonProximityEdge filter](PGGraphPersonProximityEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)personExcludingMeInMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonPresentEdge filter](PGGraphPersonPresentEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)birthdayPersonInMoment
{
  void *v2;
  void *v3;

  +[PGGraphBirthdayEventEdge filter](PGGraphBirthdayEventEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)anniversaryPersonInMoment
{
  void *v2;
  void *v3;

  +[PGGraphAnniversaryEventEdge filter](PGGraphAnniversaryEventEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)authorOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphAuthorEdge filter](PGGraphAuthorEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)personPhysicallyPresentInMoment
{
  void *v2;
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
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPeoplePersonIsAroundEdge filter](PGGraphPeoplePersonIsAroundEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  +[PGGraphPersonProximityEdge filter](PGGraphPersonProximityEdge, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  +[PGGraphPersonPresentEdge filter](PGGraphPersonPresentEdge, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inRelation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  +[PGGraphAuthorEdge filter](PGGraphAuthorEdge, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inRelation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "union:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v12;
}

+ (MARelation)memoryOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMemoryContainsAssetsFromEdge filter](PGGraphMemoryContainsAssetsFromEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)featureOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMomentFeaturesEdge filter](PGGraphMomentFeaturesEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)frequentLocationOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphFrequentLocationInEdge filter](PGGraphFrequentLocationInEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)addressOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphAddressEdge filter](PGGraphAddressEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)remoteAddressOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphRemoteAddressEdge filter](PGGraphRemoteAddressEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)partOfDayOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPartOfDayEdge filter](PGGraphPartOfDayEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)significantPartOfDayOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPartOfDayEdge significantFilter](PGGraphPartOfDayEdge, "significantFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)significantPartOfDayOfMomentWithHasLegacyWeights:(BOOL)a3
{
  void *v3;
  void *v4;

  +[PGGraphPartOfDayEdge significantFilterWithLegacyWeights:](PGGraphPartOfDayEdge, "significantFilterWithLegacyWeights:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (MARelation)mobilityOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMobilityEdge filter](PGGraphMobilityEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)petPresentInMoment
{
  void *v2;
  void *v3;

  +[PGGraphPetPresentEdge filter](PGGraphPetPresentEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)businessOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPlaceBusinessEdge filter](PGGraphPlaceBusinessEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)meaningOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMeaningEdge filter](PGGraphMeaningEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)alternativeMeaningOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMeaningEdge filter](PGGraphAlternativeMeaningEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)reliableMeaningOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphMeaningEdge reliableFilter](PGGraphMeaningEdge, "reliableFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MARelation)personActivityMeaningOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphPersonActivityMeaningEdge filter](PGGraphPersonActivityMeaningEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)celebratedHolidayOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphCelebratingEdge filter](PGGraphCelebratingEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)meaningHierarchyOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "meaningOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[PGGraphMeaningNode parentMeaningOfMeaning](PGGraphMeaningNode, "parentMeaningOfMeaning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionalStep");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v7;
}

+ (MARelation)socialGroupInMoment
{
  void *v2;
  void *v3;

  +[PGGraphSocialGroupEdge filter](PGGraphSocialGroupEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)cityOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transitiveClosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  +[PGGraphLocationCityNode filter](PGGraphLocationCityNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v11;
}

+ (MARelation)highlightOfMoment
{
  void *v2;
  void *v3;

  +[PGGraphContainsEdge filter](PGGraphContainsEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentWithPrivateAssetsOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("sharingComposition");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &unk_1E84E4B38);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

+ (MARelation)momentWithSharedAssetsOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("sharingComposition");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &unk_1E84E4B50);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

+ (MARelation)momentWithPrivateAndSharedAssetsOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("sharingComposition");
  v8[0] = &unk_1E84E4B68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v5;
}

+ (MARelation)momentWithOnlyPrivateAssetsOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("sharingComposition");
  v8[0] = &unk_1E84E4B50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v5;
}

+ (MARelation)momentWithOnlySharedAssetsOfMoment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("sharingComposition");
  v8[0] = &unk_1E84E4B38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v5;
}

void __42__PGGraphMomentNode_propertiesWithMoment___block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)propertiesWithMoment__momentNameDateFormatter;
  propertiesWithMoment__momentNameDateFormatter = (uint64_t)v0;

  objc_msgSend((id)propertiesWithMoment__momentNameDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)propertiesWithMoment__momentNameDateFormatter, "setTimeZone:", v2);

}

- (double)graphScore
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v30;
  unint64_t v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[7];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;

  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v58 = 0;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __40__PGGraphMomentNode_Scoring__graphScore__block_invoke;
  v54[3] = &unk_1E8432910;
  v54[4] = &v55;
  -[PGGraphMomentNode enumeratePersonNodesUsingBlock:](self, "enumeratePersonNodesUsingBlock:", v54);
  v4 = v56[3];
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  -[PGGraphMomentNode collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addressNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v3;
  v41[1] = 3221225472;
  v41[2] = __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_2;
  v41[3] = &unk_1E8432938;
  v41[4] = &v50;
  v41[5] = &v46;
  v41[6] = &v42;
  objc_msgSend(v6, "enumerateNodesUsingBlock:", v41);
  v31 = v4;

  v7 = v51[3];
  v8 = v47[3];
  v30 = v43[3];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v32[0] = v3;
  v32[1] = 3221225472;
  v32[2] = __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_3;
  v32[3] = &unk_1E8432960;
  v32[4] = &v37;
  v32[5] = &v33;
  -[PGGraphMomentNode enumerateDateNodesUsingBlock:](self, "enumerateDateNodesUsingBlock:", v32);
  v9 = v38[3];
  v10 = v34[3];
  v11 = -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("CELEBRATING"), 401);
  v12 = -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", 0, 301);
  v13 = -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("SOCIALGROUP"), 302);
  v14 = -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", 0, 501);
  v15 = -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", 0, 502);
  v16 = -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("SCENE"), 600);
  v17 = 6;
  if (v31 < 6)
    v17 = v31;
  v18 = (double)v17;
  v19 = 3;
  if (v7 < 3)
    v19 = v7;
  v20 = (double)v19;
  v21 = 2;
  if (v8 >= 2)
    v22 = 2;
  else
    v22 = v8;
  v23 = v18 + v20 + (double)v22;
  v24 = 0.0;
  if (v30)
    v25 = 1.0;
  else
    v25 = 0.0;
  v26 = v23 + v25;
  if (v9 < 2)
    v21 = v9;
  v27 = v26 + (double)v21;
  if (v10)
    v24 = 1.0;
  v28 = (v27
       + v24
       + fmin((double)v11, 1.0)
       + fmin((double)v12, 1.0)
       + fmin((double)v13, 1.0)
       + fmin((double)v14, 1.0)
       + fmin((double)v15, 1.0)
       + fmin((double)v16, 3.0))
      / 23.0;
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v55, 8);
  return v28;
}

void __40__PGGraphMomentNode_Scoring__graphScore__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isMeNode") & 1) == 0)
  {
    objc_msgSend(v4, "personScore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += (unint64_t)(v3 * 0.5 + 0.5);
  }

}

void __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  int v4;

  ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("AREA"), 201);
  v4 = objc_msgSend(v3, "hasEdgeWithLabel:domain:", CFSTR("IS_HOME_WORK"), 202);

  if (v4)
    ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

uint64_t __40__PGGraphMomentNode_Scoring__graphScore__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "countOfEdgesWithLabel:domain:", CFSTR("HOLIDAY"), 401);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

@end
