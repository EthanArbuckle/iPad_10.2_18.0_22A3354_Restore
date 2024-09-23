@implementation SMTSiriIntendedInfo

- (SMTSiriIntendedInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _SMTSiriIntendedInfoMutation *);
  SMTSiriIntendedInfo *v5;
  SMTSiriIntendedInfo *v6;
  _SMTSiriIntendedInfoMutation *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  uint64_t v13;
  NSNumber *invocationType;
  float v15;
  float v16;
  float v17;
  objc_super v19;

  v4 = (void (**)(id, _SMTSiriIntendedInfoMutation *))a3;
  v19.receiver = self;
  v19.super_class = (Class)SMTSiriIntendedInfo;
  v5 = -[SMTSiriIntendedInfo init](&v19, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_SMTSiriIntendedInfoMutation initWithBase:]([_SMTSiriIntendedInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_SMTSiriIntendedInfoMutation isDirty](v7, "isDirty"))
    {
      -[_SMTSiriIntendedInfoMutation getOdldScore](v7, "getOdldScore");
      v6->_odldScore = v8;
      -[_SMTSiriIntendedInfoMutation getAftmScore](v7, "getAftmScore");
      v6->_aftmScore = v9;
      -[_SMTSiriIntendedInfoMutation getSpkrIdScore](v7, "getSpkrIdScore");
      v6->_spkrIdScore = v10;
      -[_SMTSiriIntendedInfoMutation getLrnnScore](v7, "getLrnnScore");
      v6->_lrnnScore = v11;
      -[_SMTSiriIntendedInfoMutation getCheckerScore](v7, "getCheckerScore");
      v6->_checkerScore = v12;
      -[_SMTSiriIntendedInfoMutation getInvocationType](v7, "getInvocationType");
      v13 = objc_claimAutoreleasedReturnValue();
      invocationType = v6->_invocationType;
      v6->_invocationType = (NSNumber *)v13;

      -[_SMTSiriIntendedInfoMutation getLrnnThreshold](v7, "getLrnnThreshold");
      v6->_lrnnThreshold = v15;
      -[_SMTSiriIntendedInfoMutation getLrnnScale](v7, "getLrnnScale");
      v6->_lrnnScale = v16;
      -[_SMTSiriIntendedInfoMutation getLrnnOffset](v7, "getLrnnOffset");
      v6->_lrnnOffset = v17;
      v6->_isGazeSignalPresent = -[_SMTSiriIntendedInfoMutation getGazeSignal](v7, "getGazeSignal");
    }

  }
  return v6;
}

- (SMTSiriIntendedInfo)init
{
  return -[SMTSiriIntendedInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8
{
  id v14;
  id v15;
  SMTSiriIntendedInfo *v16;
  _QWORD v18[4];
  id v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;

  v14 = a8;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __101__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType___block_invoke;
  v18[3] = &unk_2517F95B8;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v19 = v14;
  v15 = v14;
  v16 = -[SMTSiriIntendedInfo initWithBuilder:](self, "initWithBuilder:", v18);

  return v16;
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11
{
  id v20;
  id v21;
  SMTSiriIntendedInfo *v22;
  _QWORD v24[4];
  id v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;

  v20 = a8;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __136__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset___block_invoke;
  v24[3] = &unk_2517F95E0;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v25 = v20;
  v30 = a7;
  v31 = a9;
  v32 = a10;
  v33 = a11;
  v21 = v20;
  v22 = -[SMTSiriIntendedInfo initWithBuilder:](self, "initWithBuilder:", v24);

  return v22;
}

- (SMTSiriIntendedInfo)initWithOdldScore:(float)a3 aftmScore:(float)a4 spkrIdScore:(float)a5 lrnnScore:(float)a6 checkerScore:(float)a7 invocationType:(id)a8 lrnnThreshold:(float)a9 lrnnScale:(float)a10 lrnnOffset:(float)a11 gazeSignal:(BOOL)a12
{
  id v22;
  id v23;
  SMTSiriIntendedInfo *v24;
  _QWORD v26[4];
  id v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  BOOL v36;

  v22 = a8;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __147__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_gazeSignal___block_invoke;
  v26[3] = &unk_2517F9608;
  v28 = a3;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v27 = v22;
  v32 = a7;
  v33 = a9;
  v34 = a10;
  v35 = a11;
  v36 = a12;
  v23 = v22;
  v24 = -[SMTSiriIntendedInfo initWithBuilder:](self, "initWithBuilder:", v26);

  return v24;
}

- (id)description
{
  return -[SMTSiriIntendedInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8.receiver = self;
  v8.super_class = (Class)SMTSiriIntendedInfo;
  -[SMTSiriIntendedInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {odldScore = %f, aftmScore = %f, spkrIdScore = %f, lrnnScore = %f, checkerScore = %f, invocationType = %@, lrnnThreshold = %f, lrnnScale = %f, lrnnOffset = %f, gazeSignalPresent = %u}"), v5, self->_odldScore, self->_aftmScore, self->_spkrIdScore, self->_lrnnScore, self->_checkerScore, self->_invocationType, self->_lrnnThreshold, self->_lrnnScale, self->_lrnnOffset, self->_isGazeSignalPresent);

  return v6;
}

- (unint64_t)hash
{
  double v2;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v29;
  void *v30;

  *(float *)&v2 = self->_odldScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v30, "hash");
  *(float *)&v5 = self->_aftmScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v29, "hash") ^ v4;
  *(float *)&v7 = self->_spkrIdScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  *(float *)&v10 = self->_lrnnScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ v9 ^ objc_msgSend(v11, "hash");
  *(float *)&v13 = self->_checkerScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  v16 = v15 ^ -[NSNumber hash](self->_invocationType, "hash");
  *(float *)&v17 = self->_lrnnThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v12 ^ v16 ^ objc_msgSend(v18, "hash");
  *(float *)&v20 = self->_lrnnScale;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash");
  *(float *)&v23 = self->_lrnnOffset;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v22 ^ objc_msgSend(v24, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGazeSignalPresent);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19 ^ v25 ^ objc_msgSend(v26, "hash");

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  SMTSiriIntendedInfo *v4;
  SMTSiriIntendedInfo *v5;
  float odldScore;
  float v7;
  float aftmScore;
  float v9;
  float spkrIdScore;
  float v11;
  float lrnnScore;
  float v13;
  float checkerScore;
  float v15;
  NSNumber *invocationType;
  NSNumber *v17;
  float lrnnThreshold;
  float v19;
  float lrnnScale;
  float v21;
  float lrnnOffset;
  float v23;
  BOOL v24;
  _BOOL4 isGazeSignalPresent;

  v4 = (SMTSiriIntendedInfo *)a3;
  if (self == v4)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      odldScore = self->_odldScore;
      -[SMTSiriIntendedInfo odldScore](v5, "odldScore");
      if (odldScore != v7)
        goto LABEL_12;
      aftmScore = self->_aftmScore;
      -[SMTSiriIntendedInfo aftmScore](v5, "aftmScore");
      if (aftmScore != v9)
        goto LABEL_12;
      spkrIdScore = self->_spkrIdScore;
      -[SMTSiriIntendedInfo spkrIdScore](v5, "spkrIdScore");
      if (spkrIdScore != v11)
        goto LABEL_12;
      lrnnScore = self->_lrnnScore;
      -[SMTSiriIntendedInfo lrnnScore](v5, "lrnnScore");
      if (lrnnScore != v13)
        goto LABEL_12;
      checkerScore = self->_checkerScore;
      -[SMTSiriIntendedInfo checkerScore](v5, "checkerScore");
      if (checkerScore != v15)
        goto LABEL_12;
      invocationType = self->_invocationType;
      -[SMTSiriIntendedInfo invocationType](v5, "invocationType");
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();

      if (invocationType != v17)
        goto LABEL_12;
      lrnnThreshold = self->_lrnnThreshold;
      -[SMTSiriIntendedInfo lrnnThreshold](v5, "lrnnThreshold");
      if (lrnnThreshold == v19
        && (lrnnScale = self->_lrnnScale, -[SMTSiriIntendedInfo lrnnScale](v5, "lrnnScale"), lrnnScale == v21)
        && (lrnnOffset = self->_lrnnOffset, -[SMTSiriIntendedInfo lrnnOffset](v5, "lrnnOffset"), lrnnOffset == v23))
      {
        isGazeSignalPresent = self->_isGazeSignalPresent;
        v24 = isGazeSignalPresent == -[SMTSiriIntendedInfo isGazeSignalPresent](v5, "isGazeSignalPresent");
      }
      else
      {
LABEL_12:
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (SMTSiriIntendedInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  SMTSiriIntendedInfo *v40;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::odldScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::aftmScore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::spkrIdScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::lrnnScore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::checkerScore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::invocationType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::lrnnThreshold"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  v23 = v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::lrnnScale"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatValue");
  v26 = v25;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::lrnnOffset"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  v29 = v28;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SMTSiriIntendedInfo::isGazeSignalPresent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "BOOLValue");
  LODWORD(v32) = v7;
  LODWORD(v33) = v10;
  LODWORD(v34) = v13;
  LODWORD(v35) = v16;
  LODWORD(v36) = v19;
  LODWORD(v37) = v23;
  LODWORD(v38) = v26;
  LODWORD(v39) = v29;
  v40 = -[SMTSiriIntendedInfo initWithOdldScore:aftmScore:spkrIdScore:lrnnScore:checkerScore:invocationType:lrnnThreshold:lrnnScale:lrnnOffset:gazeSignal:](self, "initWithOdldScore:aftmScore:spkrIdScore:lrnnScore:checkerScore:invocationType:lrnnThreshold:lrnnScale:lrnnOffset:gazeSignal:", v20, v31, v32, v33, v34, v35, v36, v37, v38, v39);

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  float odldScore;
  id v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  id v23;

  v4 = (void *)MEMORY[0x24BDD16E0];
  odldScore = self->_odldScore;
  v6 = a3;
  *(float *)&v7 = odldScore;
  objc_msgSend(v4, "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SMTSiriIntendedInfo::odldScore"));

  *(float *)&v9 = self->_aftmScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("SMTSiriIntendedInfo::aftmScore"));

  *(float *)&v11 = self->_spkrIdScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("SMTSiriIntendedInfo::spkrIdScore"));

  *(float *)&v13 = self->_lrnnScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("SMTSiriIntendedInfo::lrnnScore"));

  *(float *)&v15 = self->_checkerScore;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v16, CFSTR("SMTSiriIntendedInfo::checkerScore"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_invocationType, CFSTR("SMTSiriIntendedInfo::invocationType"));
  *(float *)&v17 = self->_lrnnThreshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v18, CFSTR("SMTSiriIntendedInfo::lrnnThreshold"));

  *(float *)&v19 = self->_lrnnScale;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v20, CFSTR("SMTSiriIntendedInfo::lrnnScale"));

  *(float *)&v21 = self->_lrnnOffset;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v22, CFSTR("SMTSiriIntendedInfo::lrnnOffset"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isGazeSignalPresent);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v23, CFSTR("SMTSiriIntendedInfo::isGazeSignalPresent"));

}

- (float)odldScore
{
  return self->_odldScore;
}

- (float)aftmScore
{
  return self->_aftmScore;
}

- (float)spkrIdScore
{
  return self->_spkrIdScore;
}

- (float)lrnnScore
{
  return self->_lrnnScore;
}

- (float)checkerScore
{
  return self->_checkerScore;
}

- (NSNumber)invocationType
{
  return self->_invocationType;
}

- (float)lrnnThreshold
{
  return self->_lrnnThreshold;
}

- (float)lrnnScale
{
  return self->_lrnnScale;
}

- (float)lrnnOffset
{
  return self->_lrnnOffset;
}

- (BOOL)isGazeSignalPresent
{
  return self->_isGazeSignalPresent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationType, 0);
}

void __147__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset_gazeSignal___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = *(_DWORD *)(a1 + 40);
  v12 = a2;
  LODWORD(v4) = v3;
  objc_msgSend(v12, "setOdldScore:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  objc_msgSend(v12, "setAftmScore:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v12, "setSpkrIdScore:", v6);
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  objc_msgSend(v12, "setLrnnScore:", v7);
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v12, "setCheckerScore:", v8);
  objc_msgSend(v12, "setInvocationType:", *(_QWORD *)(a1 + 32));
  LODWORD(v9) = *(_DWORD *)(a1 + 60);
  objc_msgSend(v12, "setLrnnThreshold:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v12, "setLrnnScale:", v10);
  LODWORD(v11) = *(_DWORD *)(a1 + 68);
  objc_msgSend(v12, "setLrnnOffset:", v11);
  objc_msgSend(v12, "setGazeSignal:", *(unsigned __int8 *)(a1 + 72));

}

void __136__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType_lrnnThreshold_lrnnScale_lrnnOffset___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = *(_DWORD *)(a1 + 40);
  v12 = a2;
  LODWORD(v4) = v3;
  objc_msgSend(v12, "setOdldScore:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  objc_msgSend(v12, "setAftmScore:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v12, "setSpkrIdScore:", v6);
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  objc_msgSend(v12, "setLrnnScore:", v7);
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v12, "setCheckerScore:", v8);
  objc_msgSend(v12, "setInvocationType:", *(_QWORD *)(a1 + 32));
  LODWORD(v9) = *(_DWORD *)(a1 + 60);
  objc_msgSend(v12, "setLrnnThreshold:", v9);
  LODWORD(v10) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v12, "setLrnnScale:", v10);
  LODWORD(v11) = *(_DWORD *)(a1 + 68);
  objc_msgSend(v12, "setLrnnOffset:", v11);

}

void __101__SMTSiriIntendedInfo_initWithOdldScore_aftmScore_spkrIdScore_lrnnScore_checkerScore_invocationType___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = *(_DWORD *)(a1 + 40);
  v12 = a2;
  LODWORD(v4) = v3;
  objc_msgSend(v12, "setOdldScore:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 44);
  objc_msgSend(v12, "setAftmScore:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v12, "setSpkrIdScore:", v6);
  LODWORD(v7) = *(_DWORD *)(a1 + 52);
  objc_msgSend(v12, "setLrnnScore:", v7);
  LODWORD(v8) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v12, "setCheckerScore:", v8);
  objc_msgSend(v12, "setInvocationType:", *(_QWORD *)(a1 + 32));
  LODWORD(v9) = 0;
  objc_msgSend(v12, "setLrnnThreshold:", v9);
  LODWORD(v10) = 1.0;
  objc_msgSend(v12, "setLrnnScale:", v10);
  LODWORD(v11) = 0;
  objc_msgSend(v12, "setLrnnOffset:", v11);

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SMTSiriIntendedInfoMutation *);
  _SMTSiriIntendedInfoMutation *v5;
  SMTSiriIntendedInfo *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  NSNumber *invocationType;
  float v14;
  float v15;
  float v16;

  v4 = (void (**)(id, _SMTSiriIntendedInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_SMTSiriIntendedInfoMutation initWithBase:]([_SMTSiriIntendedInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_SMTSiriIntendedInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(SMTSiriIntendedInfo);
      -[_SMTSiriIntendedInfoMutation getOdldScore](v5, "getOdldScore");
      v6->_odldScore = v7;
      -[_SMTSiriIntendedInfoMutation getAftmScore](v5, "getAftmScore");
      v6->_aftmScore = v8;
      -[_SMTSiriIntendedInfoMutation getSpkrIdScore](v5, "getSpkrIdScore");
      v6->_spkrIdScore = v9;
      -[_SMTSiriIntendedInfoMutation getLrnnScore](v5, "getLrnnScore");
      v6->_lrnnScore = v10;
      -[_SMTSiriIntendedInfoMutation getCheckerScore](v5, "getCheckerScore");
      v6->_checkerScore = v11;
      -[_SMTSiriIntendedInfoMutation getInvocationType](v5, "getInvocationType");
      v12 = objc_claimAutoreleasedReturnValue();
      invocationType = v6->_invocationType;
      v6->_invocationType = (NSNumber *)v12;

      -[_SMTSiriIntendedInfoMutation getLrnnThreshold](v5, "getLrnnThreshold");
      v6->_lrnnThreshold = v14;
      -[_SMTSiriIntendedInfoMutation getLrnnScale](v5, "getLrnnScale");
      v6->_lrnnScale = v15;
      -[_SMTSiriIntendedInfoMutation getLrnnOffset](v5, "getLrnnOffset");
      v6->_lrnnOffset = v16;
      v6->_isGazeSignalPresent = -[_SMTSiriIntendedInfoMutation getGazeSignal](v5, "getGazeSignal");
    }
    else
    {
      v6 = (SMTSiriIntendedInfo *)-[SMTSiriIntendedInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (SMTSiriIntendedInfo *)-[SMTSiriIntendedInfo copy](self, "copy");
  }

  return v6;
}

@end
