@implementation PGInvariantPetMemoryNodeFeatureExtractor

- (PGInvariantPetMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return -[PGInvariantPetMemoryNodeFeatureExtractor initWithVersion:error:](self, "initWithVersion:error:", 1, a3);
}

- (PGInvariantPetMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PGInvariantPetMemoryNodeFeatureExtractor *v12;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_labelsForVersion:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPetNode filter](PGGraphPetNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[1] = 3221225472;
  v15[2] = __66__PGInvariantPetMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke;
  v15[3] = &__block_descriptor_40_e38___NSString_24__0__PGGraphPetNode_8__16l;
  v15[4] = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGInvariantPetMemoryNodeFeatureExtractor;
  v15[0] = MEMORY[0x1E0C809B0];
  v12 = -[PGGraphMemoryNodeFeatureExtractor initWithName:featureNames:relation:labelForTargetBlock:](&v14, sel_initWithName_featureNames_relation_labelForTargetBlock_, CFSTR("InvariantPet"), v6, v11, v15);

  return v12;
}

id __66__PGInvariantPetMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PGInvariantPetMemoryNodeFeatureExtractor _nodeProcessingForVersion:node:](PGInvariantPetMemoryNodeFeatureExtractor, "_nodeProcessingForVersion:node:", *(_QWORD *)(a1 + 32), a2);
}

+ (id)_labelsForVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    objc_msgSend(a1, "_labelProcessingForPetNodeSpecies:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(a1, "_labelProcessingForPetNodeSpecies:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v6;
    objc_msgSend(a1, "_labelProcessingForPetNodeSpecies:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else if (a3 == 1)
  {
    v10[0] = CFSTR("Pet");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return MEMORY[0x1E0C9AA60];
  }
}

+ (id)_nodeProcessingForVersion:(int64_t)a3 node:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  v7 = objc_msgSend(v6, "petSpecies");
  if (a3 == 2)
  {
    objc_msgSend(a1, "_labelProcessingForPetNodeSpecies:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(v6, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a1 = v8;
  }

  return a1;
}

+ (id)_labelProcessingForPetNodeSpecies:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;

  v5 = CFSTR("Pet");
  switch(a3)
  {
    case 2uLL:
      v7 = CFSTR("_Dog");
LABEL_7:
      objc_msgSend(CFSTR("Pet"), "stringByAppendingString:", v7);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      v7 = CFSTR("_Cat");
      goto LABEL_7;
    case 0uLL:
      v3 = CFSTR("Pet");
      v6 = CFSTR("Pet");
      break;
  }

  return v3;
}

@end
