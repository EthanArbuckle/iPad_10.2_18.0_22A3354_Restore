@implementation PSGWordBoundarySuggestionsExpConfigDefaults

- (PSGWordBoundarySuggestionsExpConfigDefaults)init
{
  PSGWordBoundarySuggestionsExpConfigDefaults *v2;
  PSGWordBoundarySuggestionsExpConfigDefaults *v3;
  NSString *treatmentName;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  uint64_t v6;
  TRIExperimentIdentifiers *experimentIdentifiers;
  NSString *inferenceModelConfigPath;
  NSString *espressoBinFilePath;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSGWordBoundarySuggestionsExpConfigDefaults;
  v2 = -[PSGWordBoundarySuggestionsExpConfigDefaults init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isMLModelEnabled = 0;
    treatmentName = v2->_treatmentName;
    v2->_treatmentName = (NSString *)CFSTR("EP_WORD_BOUNDARY_NIL_MODEL");

    rolloutIdentifiers = v3->_rolloutIdentifiers;
    v3->_rolloutIdentifiers = 0;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBA928]), "initWithExperimentId:deploymentId:treatmentId:", CFSTR("EP_WORD_BOUNDARY_NIL_EXP_ID"), 0xFFFFFFFFLL, CFSTR("EP_WORD_BOUNDARY_NIL_TRT_ID"));
    experimentIdentifiers = v3->_experimentIdentifiers;
    v3->_experimentIdentifiers = (TRIExperimentIdentifiers *)v6;

    inferenceModelConfigPath = v3->_inferenceModelConfigPath;
    v3->_inferenceModelConfigPath = 0;

    espressoBinFilePath = v3->_espressoBinFilePath;
    v3->_espressoBinFilePath = 0;

  }
  return v3;
}

- (BOOL)isEqualToConfig:(id)a3
{
  id *v4;
  id *v5;
  TRIRolloutIdentifiers *rolloutIdentifiers;
  TRIRolloutIdentifiers *v7;
  TRIRolloutIdentifiers *v8;
  TRIRolloutIdentifiers *v9;
  char v10;
  TRIExperimentIdentifiers *experimentIdentifiers;
  TRIExperimentIdentifiers *v12;
  TRIExperimentIdentifiers *v13;
  TRIExperimentIdentifiers *v14;
  char v15;
  NSString *inferenceModelConfigPath;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  char v21;
  NSString *v23;
  NSString *v24;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_isMLModelEnabled != *((unsigned __int8 *)v4 + 8))
    goto LABEL_13;
  rolloutIdentifiers = self->_rolloutIdentifiers;
  v7 = (TRIRolloutIdentifiers *)v4[3];
  if (rolloutIdentifiers == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = rolloutIdentifiers;
    v10 = -[TRIRolloutIdentifiers isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_13;
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  v12 = (TRIExperimentIdentifiers *)v5[4];
  if (experimentIdentifiers == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = experimentIdentifiers;
    v15 = -[TRIExperimentIdentifiers isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_13;
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  v17 = (NSString *)v5[5];
  if (inferenceModelConfigPath == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = inferenceModelConfigPath;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
    {
LABEL_13:
      v21 = 0;
      goto LABEL_14;
    }
  }
  v23 = self->_espressoBinFilePath;
  v24 = v23;
  if (v23 == v5[6])
    v21 = 1;
  else
    v21 = -[NSString isEqual:](v23, "isEqual:");

LABEL_14:
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  PSGWordBoundarySuggestionsExpConfigDefaults *v4;
  PSGWordBoundarySuggestionsExpConfigDefaults *v5;
  BOOL v6;

  v4 = (PSGWordBoundarySuggestionsExpConfigDefaults *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGWordBoundarySuggestionsExpConfigDefaults isEqualToConfig:](self, "isEqualToConfig:", v5);

  return v6;
}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (TRIRolloutIdentifiers)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (BOOL)isMLModelEnabled
{
  return self->_isMLModelEnabled;
}

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
}

@end
