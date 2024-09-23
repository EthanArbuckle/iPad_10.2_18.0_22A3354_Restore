@implementation REInteractionDescriptor

- (REFeature)biasFeature
{
  return self->_biasFeature;
}

- (REFeature)selectionFeature
{
  return self->_selectionFeature;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setName:", self->_name);
  *(float *)&v5 = self->_weight;
  objc_msgSend(v4, "setWeight:", v5);
  *(float *)&v6 = self->_exploreBias;
  objc_msgSend(v4, "setExploreBias:", v6);
  *(float *)&v7 = self->_trainingSimulationExploreBias;
  objc_msgSend(v4, "setTrainingSimulationExploreBias:", v7);
  *(float *)&v8 = self->_initialProbability;
  objc_msgSend(v4, "setInitialProbability:", v8);
  objc_msgSend(v4, "setEnableExploreExploit:", self->_enableExploreExploit);
  objc_msgSend(v4, "setIdentificationFeature:", self->_identificationFeature);
  objc_msgSend(v4, "setSelectionFeature:", self->_selectionFeature);
  objc_msgSend(v4, "setBiasFeature:", self->_biasFeature);
  *(float *)&v9 = self->_varianceEpsilon;
  objc_msgSend(v4, "setVarianceEpsilon:", v9);
  return v4;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (REInteractionDescriptor)init
{
  char *v2;
  char *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REInteractionDescriptor;
  v2 = -[REInteractionDescriptor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 12) = xmmword_2133E4350;
    v2[8] = 1;
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

    *((_DWORD *)v3 + 7) = 981668463;
  }
  return (REInteractionDescriptor *)v3;
}

- (void)setWeight:(float)a3
{
  self->_weight = a3;
}

- (void)setVarianceEpsilon:(float)a3
{
  self->_varianceEpsilon = a3;
}

- (void)setTrainingSimulationExploreBias:(float)a3
{
  self->_trainingSimulationExploreBias = a3;
}

- (void)setSelectionFeature:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeature, a3);
}

- (void)setInitialProbability:(float)a3
{
  self->_initialProbability = a3;
}

- (void)setIdentificationFeature:(id)a3
{
  objc_storeStrong((id *)&self->_identificationFeature, a3);
}

- (void)setExploreBias:(float)a3
{
  self->_exploreBias = a3;
}

- (void)setEnableExploreExploit:(BOOL)a3
{
  self->_enableExploreExploit = a3;
}

- (void)setBiasFeature:(id)a3
{
  objc_storeStrong((id *)&self->_biasFeature, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasFeature, 0);
  objc_storeStrong((id *)&self->_selectionFeature, 0);
  objc_storeStrong((id *)&self->_identificationFeature, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (float)weight
{
  return self->_weight;
}

- (REFeature)identificationFeature
{
  return self->_identificationFeature;
}

- (float)exploreBias
{
  return self->_exploreBias;
}

- (NSString)name
{
  return self->_name;
}

- (float)varianceEpsilon
{
  return self->_varianceEpsilon;
}

- (float)trainingSimulationExploreBias
{
  return self->_trainingSimulationExploreBias;
}

- (float)initialProbability
{
  return self->_initialProbability;
}

- (BOOL)enableExploreExploit
{
  return self->_enableExploreExploit;
}

- (BOOL)isEqual:(id)a3
{
  REInteractionDescriptor *v4;
  REInteractionDescriptor *v5;
  REInteractionDescriptor *v6;
  NSString *name;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  int v11;
  BOOL v12;
  REFeature *identificationFeature;
  REFeature *v14;
  REFeature *v15;
  REFeature *v16;
  _BOOL4 v17;
  REFeature *selectionFeature;
  REFeature *v19;
  REFeature *v20;
  REFeature *v21;
  _BOOL4 v22;
  REFeature *biasFeature;
  REFeature *v24;
  REFeature *v25;
  REFeature *v26;
  _BOOL4 v27;

  v4 = (REInteractionDescriptor *)a3;
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
      v6 = v5;
      if (vabds_f32(self->_weight, v5->_weight) >= 0.00000011921
        || vabds_f32(self->_exploreBias, v5->_exploreBias) >= 0.00000011921
        || vabds_f32(self->_trainingSimulationExploreBias, v5->_trainingSimulationExploreBias) >= 0.00000011921
        || vabds_f32(self->_initialProbability, v5->_initialProbability) >= 0.00000011921
        || self->_enableExploreExploit != v5->_enableExploreExploit)
      {
        goto LABEL_24;
      }
      name = self->_name;
      v8 = v5->_name;
      if (name == v8)
      {

      }
      else
      {
        v9 = v8;
        v10 = name;
        v11 = -[NSString isEqual:](v10, "isEqual:", v9);

        if (!v11)
          goto LABEL_24;
      }
      identificationFeature = self->_identificationFeature;
      v14 = v6->_identificationFeature;
      if (identificationFeature == v14)
      {

      }
      else
      {
        v15 = v14;
        v16 = identificationFeature;
        v17 = -[REFeature isEqual:](v16, "isEqual:", v15);

        if (!v17)
          goto LABEL_24;
      }
      selectionFeature = self->_selectionFeature;
      v19 = v6->_selectionFeature;
      if (selectionFeature == v19)
      {

      }
      else
      {
        v20 = v19;
        v21 = selectionFeature;
        v22 = -[REFeature isEqual:](v21, "isEqual:", v20);

        if (!v22)
          goto LABEL_24;
      }
      biasFeature = self->_biasFeature;
      v24 = v6->_biasFeature;
      if (biasFeature == v24)
      {

      }
      else
      {
        v25 = v24;
        v26 = biasFeature;
        v27 = -[REFeature isEqual:](v26, "isEqual:", v25);

        if (!v27)
        {
LABEL_24:
          v12 = 0;
LABEL_25:

          goto LABEL_26;
        }
      }
      v12 = vabds_f32(self->_varianceEpsilon, v6->_varianceEpsilon) < 0.00000011921;
      goto LABEL_25;
    }
    v12 = 0;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  double v2;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  void *v22;
  unint64_t v23;

  *(float *)&v2 = self->_weight;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  *(float *)&v6 = self->_exploreBias;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;
  *(float *)&v9 = self->_trainingSimulationExploreBias;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  *(float *)&v12 = self->_initialProbability;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v11 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enableExploreExploit);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash");
  v17 = v16 ^ -[NSString hash](self->_name, "hash");
  v18 = v14 ^ v17 ^ -[REFeature hash](self->_identificationFeature, "hash");
  v19 = -[REFeature hash](self->_selectionFeature, "hash");
  v20 = v19 ^ -[REFeature hash](self->_biasFeature, "hash");
  *(float *)&v21 = self->_varianceEpsilon;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v18 ^ v20 ^ objc_msgSend(v22, "hash");

  return v23;
}

@end
