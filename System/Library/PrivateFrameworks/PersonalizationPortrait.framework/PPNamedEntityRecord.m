@implementation PPNamedEntityRecord

- (PPNamedEntityRecord)initWithCoder:(id)a3
{
  id v4;
  PPNamedEntityRecord *v5;
  uint64_t v6;
  uint64_t v7;
  PPNamedEntity *entity;
  void *v9;
  void *v10;
  uint64_t v11;
  PPSource *source;
  float v13;
  float v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *extractionOsBuild;
  uint64_t v19;
  PPNamedEntityMetadata *metadata;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PPNamedEntityRecord;
  v5 = -[PPNamedEntityRecord init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ent"));
    v7 = objc_claimAutoreleasedReturnValue();
    entity = v5->_entity;
    v5->_entity = (PPNamedEntity *)v7;

    PPGetSourceInternPool();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("src"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intern:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (PPSource *)v11;

    v5->_algorithm = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("alg"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("score"));
    v5->_initialScore = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("dec"));
    v5->_decayRate = v14;
    PPGetStringInternPool();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("bld"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "intern:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    extractionOsBuild = v5->_extractionOsBuild;
    v5->_extractionOsBuild = (NSString *)v17;

    v5->_extractionAssetVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ast"));
    v5->_changeType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cty"));
    v5->_bucketizedSentimentScore = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("snt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("met"));
    v19 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (PPNamedEntityMetadata *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PPNamedEntity *entity;
  double v5;
  double v6;
  id v7;

  entity = self->_entity;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", entity, CFSTR("ent"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_source, CFSTR("src"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_algorithm, CFSTR("alg"));
  *(float *)&v5 = self->_initialScore;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("score"), v5);
  *(float *)&v6 = self->_decayRate;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("dec"), v6);
  objc_msgSend(v7, "encodeObject:forKey:", self->_extractionOsBuild, CFSTR("bld"));
  objc_msgSend(v7, "encodeInt64:forKey:", self->_extractionAssetVersion, CFSTR("ast"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_changeType, CFSTR("cty"));
  objc_msgSend(v7, "encodeInt32:forKey:", self->_bucketizedSentimentScore, CFSTR("snt"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_metadata, CFSTR("met"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PPMutableNamedEntityRecord *v5;
  id v6;
  id v7;

  v5 = -[PPMutableNamedEntityRecord init](+[PPMutableNamedEntityRecord allocWithZone:](PPMutableNamedEntityRecord, "allocWithZone:"), "init");
  v6 = -[PPNamedEntity copyWithZone:](self->_entity, "copyWithZone:", a3);
  -[PPMutableNamedEntityRecord setEntity:](v5, "setEntity:", v6);

  -[PPMutableNamedEntityRecord setSource:](v5, "setSource:", self->_source);
  -[PPMutableNamedEntityRecord setAlgorithm:](v5, "setAlgorithm:", self->_algorithm);
  -[PPMutableNamedEntityRecord setInitialScore:](v5, "setInitialScore:", self->_initialScore);
  -[PPMutableNamedEntityRecord setDecayRate:](v5, "setDecayRate:", self->_decayRate);
  -[PPMutableNamedEntityRecord setExtractionOsBuild:](v5, "setExtractionOsBuild:", self->_extractionOsBuild);
  -[PPMutableNamedEntityRecord setExtractionAssetVersion:](v5, "setExtractionAssetVersion:", self->_extractionAssetVersion);
  -[PPMutableNamedEntityRecord setChangeType:](v5, "setChangeType:", self->_changeType);
  v5->super._bucketizedSentimentScore = self->_bucketizedSentimentScore;
  v7 = -[PPNamedEntityMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  -[PPMutableNamedEntityRecord setMetadata:](v5, "setMetadata:", v7);

  return v5;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (double)initialScore
{
  return self->_initialScore;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (double)sentimentScore
{
  double result;

  +[PPSentimentScoreEncoder decodeSentimentScore:](PPSentimentScoreEncoder, "decodeSentimentScore:", self->_bucketizedSentimentScore);
  return result;
}

- (unsigned)extractionAssetVersion
{
  return self->_extractionAssetVersion;
}

- (PPNamedEntityMetadata)metadata
{
  return self->_metadata;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  double initialScore;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSource bundleId](self->_source, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPNamedEntityRecord describeAlgorithm:](PPNamedEntityRecord, "describeAlgorithm:", self->_algorithm);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  initialScore = self->_initialScore;
  +[PPNamedEntityRecord describeChangeType:](PPNamedEntityRecord, "describeChangeType:", self->_changeType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPNamedEntityRecord src:%@ a:'%@' s:%f ct:%@ e:%@>"), v4, v5, *(_QWORD *)&initialScore, v7, self->_entity);

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[PPNamedEntity hash](self->_entity, "hash");
  v4 = -[PPSource hash](self->_source, "hash");
  v5 = self->_algorithm - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  *(float *)&v6 = self->_initialScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v5 + 32 * v5;

  *(float *)&v9 = self->_decayRate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") - v8 + 32 * v8;

  v12 = -[NSString hash](self->_extractionOsBuild, "hash");
  v13 = self->_extractionAssetVersion - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  v14 = self->_changeType - v13 + 32 * v13;
  return -[PPNamedEntityMetadata hash](self->_metadata, "hash") - v14 + 32 * v14;
}

- (BOOL)isEqual:(id)a3
{
  PPNamedEntityRecord *v4;
  PPNamedEntityRecord *v5;
  BOOL v6;

  v4 = (PPNamedEntityRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && -[PPNamedEntityRecord isEqualToNamedEntityRecord:](self, "isEqualToNamedEntityRecord:", v5);

  return v6;
}

- (BOOL)isEqualToNamedEntityRecord:(id)a3
{
  id *v4;
  id *v5;
  PPNamedEntity *entity;
  PPNamedEntity *v7;
  PPNamedEntity *v8;
  PPNamedEntity *v9;
  BOOL v10;
  PPSource *source;
  PPSource *v12;
  PPSource *v13;
  PPSource *v14;
  BOOL v15;
  NSString *extractionOsBuild;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  PPNamedEntityMetadata *metadata;
  PPNamedEntityMetadata *v22;
  PPNamedEntityMetadata *v23;
  PPNamedEntityMetadata *v24;
  BOOL v25;
  BOOL v26;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_23;
  entity = self->_entity;
  v7 = (PPNamedEntity *)v4[1];
  if (entity == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = entity;
    v10 = -[PPNamedEntity isEqual:](v9, "isEqual:", v8);

    if (!v10)
      goto LABEL_23;
  }
  source = self->_source;
  v12 = (PPSource *)v5[2];
  if (source == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = source;
    v15 = -[PPSource isEqual:](v14, "isEqual:", v13);

    if (!v15)
      goto LABEL_23;
  }
  if (self->_algorithm != *((unsigned __int8 *)v5 + 44)
    || self->_initialScore != *((float *)v5 + 8)
    || self->_decayRate != *((float *)v5 + 9))
  {
    goto LABEL_23;
  }
  extractionOsBuild = self->_extractionOsBuild;
  v17 = (NSString *)v5[3];
  if (extractionOsBuild == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = extractionOsBuild;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_23;
  }
  metadata = self->_metadata;
  v22 = (PPNamedEntityMetadata *)v5[6];
  if (metadata == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = metadata;
    v25 = -[PPNamedEntityMetadata isEqual:](v24, "isEqual:", v23);

    if (!v25)
      goto LABEL_23;
  }
  if (self->_extractionAssetVersion != *((_DWORD *)v5 + 10))
  {
LABEL_23:
    v26 = 0;
    goto LABEL_24;
  }
  v26 = self->_changeType == *((unsigned __int8 *)v5 + 45);
LABEL_24:

  return v26;
}

- (NSSet)featureNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PPNamedEntityRecord_featureNames__block_invoke;
  block[3] = &unk_1E226C130;
  block[4] = self;
  if (featureNames__pasOnceToken9 != -1)
    dispatch_once(&featureNames__pasOnceToken9, block);
  return (NSSet *)(id)featureNames__pasExprOnceResult_269;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t algorithm;
  uint64_t v7;
  void *v8;
  float initialScore;
  double v10;
  void *v11;
  void *v13;
  void *entity;
  __CFString *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("algorithm")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_algorithm;
LABEL_3:
    objc_msgSend(v5, "featureValueWithInt64:", algorithm);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v7;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("initialScore")))
  {
    v8 = (void *)MEMORY[0x1E0C9E918];
    initialScore = self->_initialScore;
LABEL_8:
    v10 = initialScore;
LABEL_9:
    objc_msgSend(v8, "featureValueWithDouble:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("decayRate")))
  {
    v8 = (void *)MEMORY[0x1E0C9E918];
    initialScore = self->_decayRate;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("extractionOsBuild")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", self->_extractionOsBuild);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("extractionAssetVersion")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_extractionAssetVersion;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sentimentScore")))
  {
    v13 = (void *)MEMORY[0x1E0C9E918];
    -[PPNamedEntityRecord sentimentScore](self, "sentimentScore");
    v8 = v13;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("changeType")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_changeType;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("entity_")))
  {
    entity = self->_entity;
    v15 = CFSTR("entity_");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("source_")))
  {
    entity = self->_source;
    v15 = CFSTR("source_");
  }
  else
  {
    if (!objc_msgSend(v4, "hasPrefix:", CFSTR("meta_")))
    {
      v11 = 0;
      goto LABEL_11;
    }
    entity = self->_metadata;
    v15 = CFSTR("meta_");
  }
  objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v15, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(entity, "featureValueForName:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v11;
}

- (id)identifier
{
  return -[PPNamedEntity clusterIdentifier](self->_entity, "clusterIdentifier");
}

- (PPNamedEntity)entity
{
  return self->_entity;
}

- (PPSource)source
{
  return self->_source;
}

- (NSString)extractionOsBuild
{
  return self->_extractionOsBuild;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_extractionOsBuild, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

void __35__PPNamedEntityRecord_featureNames__block_invoke(uint64_t a1)
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
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v2 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_271);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_272);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "featureNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_273);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x18D7805AC]();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("algorithm"), CFSTR("initialScore"), CFSTR("decayRate"), CFSTR("extractionOsBuild"), CFSTR("extractionAssetVersion"), CFSTR("changeType"), CFSTR("sentimentScore"), 0);
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v13, "setByAddingObjectsFromArray:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromArray:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setByAddingObjectsFromArray:", v8);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)featureNames__pasExprOnceResult_269;
  featureNames__pasExprOnceResult_269 = v16;

  objc_autoreleasePoolPop(v2);
}

uint64_t __35__PPNamedEntityRecord_featureNames__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("meta_"), "stringByAppendingString:", a2);
}

uint64_t __35__PPNamedEntityRecord_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("source_"), "stringByAppendingString:", a2);
}

uint64_t __35__PPNamedEntityRecord_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("entity_"), "stringByAppendingString:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeAlgorithm:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 - 1 >= 0x11)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown (%lu)"), a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_1E2269A40[a3 - 1];
  }
  return v3;
}

+ (id)algorithmForName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[16];
  _QWORD v11[17];

  v11[16] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CoreNLP");
  v10[1] = CFSTR("Lookup Hints");
  v11[0] = &unk_1E2284958;
  v11[1] = &unk_1E2284940;
  v10[2] = CFSTR("Data Detectors");
  v10[3] = CFSTR("Custom Tagger");
  v11[2] = &unk_1E2284988;
  v11[3] = &unk_1E2284A00;
  v10[4] = CFSTR("Core Routine");
  v10[5] = CFSTR("NSUA Structured Location");
  v11[4] = &unk_1E2284970;
  v11[5] = &unk_1E22849A0;
  v10[6] = CFSTR("Trusted Location");
  v10[7] = CFSTR("Maps Interaction");
  v11[6] = &unk_1E22849B8;
  v11[7] = &unk_1E22849D0;
  v10[8] = CFSTR("Media Player Now Playing");
  v10[9] = CFSTR("EventKit Import");
  v11[8] = &unk_1E22849E8;
  v11[9] = &unk_1E2284A18;
  v10[10] = CFSTR("Photos Knowledge Graph");
  v10[11] = CFSTR("Parsec Donation");
  v11[10] = &unk_1E2284A30;
  v11[11] = &unk_1E2284A48;
  v10[12] = CFSTR("Podcasts Interaction");
  v10[13] = CFSTR("Contacts Import");
  v11[12] = &unk_1E2284A60;
  v11[13] = &unk_1E2284A78;
  v10[14] = CFSTR("Augmented Gazetteer");
  v10[15] = CFSTR("Knowledge Graph");
  v11[14] = &unk_1E2284AA8;
  v11[15] = &unk_1E2284AC0;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, v10, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &unk_1E2284B38;
  v8 = v7;

  return v8;
}

+ (id)describeChangeType:(unsigned __int8)a3
{
  __CFString *v3;

  if (a3 >= 4u)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid (%lu)"), a3);
  else
    v3 = off_1E2269AC8[a3];
  return v3;
}

@end
