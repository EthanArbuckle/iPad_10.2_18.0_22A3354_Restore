@implementation PPTopicRecord

- (PPTopicRecord)initWithCoder:(id)a3
{
  id v4;
  PPTopicRecord *v5;
  uint64_t v6;
  uint64_t v7;
  PPTopic *topic;
  void *v9;
  void *v10;
  uint64_t v11;
  PPSource *source;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *extractionOsBuild;
  uint64_t v19;
  PPTopicMetadata *metadata;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PPTopicRecord;
  v5 = -[PPTopicRecord init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("top"));
    v7 = objc_claimAutoreleasedReturnValue();
    topic = v5->_topic;
    v5->_topic = (PPTopic *)v7;

    PPGetSourceInternPool();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("src"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intern:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (PPSource *)v11;

    v5->_algorithm = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("alg"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
    v5->_initialScore = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dec"));
    v5->_decayRate = v14;
    v5->_isLocal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("loc"));
    PPGetStringInternPool();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("bld"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "intern:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    extractionOsBuild = v5->_extractionOsBuild;
    v5->_extractionOsBuild = (NSString *)v17;

    v5->_extractionAssetVersion = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ast"));
    v5->_bucketizedSentimentScore = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("snt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("met"));
    v19 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (PPTopicMetadata *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PPTopic *topic;
  id v5;

  topic = self->_topic;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", topic, CFSTR("top"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("src"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_algorithm), CFSTR("alg"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"), self->_initialScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dec"), self->_decayRate);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocal, CFSTR("loc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractionOsBuild, CFSTR("bld"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_extractionAssetVersion, CFSTR("ast"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_bucketizedSentimentScore, CFSTR("snt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("met"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_opt_new();
  objc_msgSend(v4, "setTopic:", self->_topic);
  objc_msgSend(v4, "setSource:", self->_source);
  objc_msgSend(v4, "setAlgorithm:", self->_algorithm);
  objc_msgSend(v4, "setInitialScore:", self->_initialScore);
  objc_msgSend(v4, "setDecayRate:", self->_decayRate);
  objc_msgSend(v4, "setIsLocal:", self->_isLocal);
  objc_msgSend(v4, "setExtractionOsBuild:", self->_extractionOsBuild);
  objc_msgSend(v4, "setExtractionAssetVersion:", self->_extractionAssetVersion);
  v4[80] = self->_bucketizedSentimentScore;
  objc_msgSend(v4, "setMetadata:", self->_metadata);
  return v4;
}

- (id)description
{
  id v3;
  PPTopic *topic;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  topic = self->_topic;
  -[PPSource bundleId](self->_source, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPTopicRecord describeAlgorithm:](PPTopicRecord, "describeAlgorithm:", self->_algorithm);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("true");
  if (!self->_isLocal)
    v8 = CFSTR("false");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPTopicRecord t:%@ src:%@ a:'%@' is:%f dr:%f l:%@ eob:%@ eav:%u m:%@>"), topic, v5, v6, *(_QWORD *)&self->_initialScore, *(_QWORD *)&self->_decayRate, v8, self->_extractionOsBuild, self->_extractionAssetVersion, self->_metadata);

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;

  v3 = -[PPTopic hash](self->_topic, "hash");
  v4 = -[PPSource hash](self->_source, "hash");
  v5 = self->_algorithm - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_decayRate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7;

  v10 = self->_isLocal - v9 + 32 * v9;
  v11 = -[NSString hash](self->_extractionOsBuild, "hash");
  v12 = self->_extractionAssetVersion - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
  return -[PPTopicMetadata hash](self->_metadata, "hash") - v12 + 32 * v12;
}

- (BOOL)isEqual:(id)a3
{
  PPTopicRecord *v4;
  PPTopicRecord *v5;
  BOOL v6;

  v4 = (PPTopicRecord *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPTopicRecord isEqualToTopicRecord:](self, "isEqualToTopicRecord:", v5);

  return v6;
}

- (BOOL)isEqualToTopicRecord:(id)a3
{
  id *v4;
  id *v5;
  PPTopic *topic;
  PPTopic *v7;
  PPTopic *v8;
  PPTopic *v9;
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
  PPTopicMetadata *v21;
  PPTopicMetadata *v22;
  char v23;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_22;
  topic = self->_topic;
  v7 = (PPTopic *)v4[1];
  if (topic == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = topic;
    v10 = -[PPTopic isEqual:](v9, "isEqual:", v8);

    if (!v10)
    {
LABEL_22:
      v23 = 0;
      goto LABEL_23;
    }
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
      goto LABEL_22;
  }
  if ((id)self->_algorithm != v5[3]
    || self->_initialScore != *((double *)v5 + 4)
    || self->_decayRate != *((double *)v5 + 5)
    || self->_isLocal != *((unsigned __int8 *)v5 + 48))
  {
    goto LABEL_22;
  }
  extractionOsBuild = self->_extractionOsBuild;
  v17 = (NSString *)v5[7];
  if (extractionOsBuild == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = extractionOsBuild;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_22;
  }
  if (self->_extractionAssetVersion != *((_DWORD *)v5 + 16)
    || self->_bucketizedSentimentScore != *((unsigned __int8 *)v5 + 80))
  {
    goto LABEL_22;
  }
  v21 = self->_metadata;
  v22 = v21;
  if (v21 == v5[9])
    v23 = 1;
  else
    v23 = -[PPTopicMetadata isEqual:](v21, "isEqual:");

LABEL_23:
  return v23;
}

- (double)sentimentScore
{
  double result;

  +[PPSentimentScoreEncoder decodeSentimentScore:](PPSentimentScoreEncoder, "decodeSentimentScore:", self->_bucketizedSentimentScore);
  return result;
}

- (NSSet)featureNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PPTopicRecord_featureNames__block_invoke;
  block[3] = &unk_1E226C130;
  block[4] = self;
  if (featureNames__pasOnceToken9_7629 != -1)
    dispatch_once(&featureNames__pasOnceToken9_7629, block);
  return (NSSet *)(id)featureNames__pasExprOnceResult_167;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  unint64_t algorithm;
  uint64_t v7;
  void *v8;
  double initialScore;
  void *v10;
  void *topic;
  __CFString *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("algorithm")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_algorithm;
LABEL_3:
    objc_msgSend(v5, "featureValueWithInt64:", algorithm);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = (void *)v7;
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("initialScore")))
  {
    v8 = (void *)MEMORY[0x1E0C9E918];
    initialScore = self->_initialScore;
LABEL_8:
    objc_msgSend(v8, "featureValueWithDouble:", initialScore);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("decayRate")))
  {
    v8 = (void *)MEMORY[0x1E0C9E918];
    initialScore = self->_decayRate;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("isLocal")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_isLocal;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("extractionAssetVersion")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_extractionAssetVersion;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("extractionOsBuild")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithString:", self->_extractionOsBuild);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sentimentScore")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    algorithm = self->_bucketizedSentimentScore;
    goto LABEL_3;
  }
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("topic_")))
  {
    topic = self->_topic;
    v13 = CFSTR("topic_");
  }
  else if (objc_msgSend(v4, "hasPrefix:", CFSTR("meta_")))
  {
    topic = self->_metadata;
    v13 = CFSTR("meta_");
  }
  else
  {
    if (!objc_msgSend(v4, "hasPrefix:", CFSTR("source_")))
    {
      v10 = 0;
      goto LABEL_10;
    }
    topic = self->_source;
    v13 = CFSTR("source_");
  }
  objc_msgSend(v4, "substringFromIndex:", -[__CFString length](v13, "length"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(topic, "featureValueForName:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (id)identifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PPTopic clusterIdentifier](self->_topic, "clusterIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "UUIDString");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (PPTopic)topic
{
  return self->_topic;
}

- (PPSource)source
{
  return self->_source;
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

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (NSString)extractionOsBuild
{
  return self->_extractionOsBuild;
}

- (unsigned)extractionAssetVersion
{
  return self->_extractionAssetVersion;
}

- (PPTopicMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_extractionOsBuild, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

void __29__PPTopicRecord_featureNames__block_invoke(uint64_t a1)
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
  v3 = (void *)MEMORY[0x18D7805AC]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("algorithm"), CFSTR("initialScore"), CFSTR("decayRate"), CFSTR("isLocal"), CFSTR("extractionAssetVersion"), CFSTR("sentimentScore"), CFSTR("extractionOsBuild"), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_169_7630);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "featureNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_170);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "featureNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_171);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setByAddingObjectsFromArray:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromArray:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setByAddingObjectsFromArray:", v13);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)featureNames__pasExprOnceResult_167;
  featureNames__pasExprOnceResult_167 = v16;

  objc_autoreleasePoolPop(v2);
}

uint64_t __29__PPTopicRecord_featureNames__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("source_"), "stringByAppendingString:", a2);
}

uint64_t __29__PPTopicRecord_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("meta_"), "stringByAppendingString:", a2);
}

uint64_t __29__PPTopicRecord_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("topic_"), "stringByAppendingString:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeAlgorithm:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 - 1 >= 0xB)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown (%lu)"), a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_1E226C150[a3 - 1];
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
  _QWORD v10[11];
  _QWORD v11[12];

  v11[11] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("ContextKit");
  v10[1] = CFSTR("Siri Donation");
  v11[0] = &unk_1E2284DC0;
  v11[1] = &unk_1E2284DD8;
  v10[2] = CFSTR("Lookup Hints");
  v10[3] = CFSTR("Named Entity");
  v11[2] = &unk_1E2284DF0;
  v11[3] = &unk_1E2284E08;
  v10[4] = CFSTR("Photos Knowledge Graph");
  v10[5] = CFSTR("High Level Topic Extraction");
  v11[4] = &unk_1E2284E20;
  v11[5] = &unk_1E2284E38;
  v10[6] = CFSTR("Parsec Donation");
  v10[7] = CFSTR("Podcasts Interaction");
  v11[6] = &unk_1E2284E50;
  v11[7] = &unk_1E2284E68;
  v10[8] = CFSTR("HealthKit Import");
  v10[9] = CFSTR("Augmented Gazetteer");
  v11[8] = &unk_1E2284E80;
  v11[9] = &unk_1E2284E98;
  v10[10] = CFSTR("Knowledge Graph");
  v11[10] = &unk_1E2284EB0;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, v10, 11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &unk_1E2284EC8;
  v8 = v7;

  return v8;
}

@end
