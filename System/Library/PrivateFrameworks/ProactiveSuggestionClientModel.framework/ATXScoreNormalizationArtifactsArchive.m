@implementation ATXScoreNormalizationArtifactsArchive

- (ATXScoreNormalizationArtifactsArchive)initWithScoreNormalizationModelsDictionary:(id)a3
{
  id v5;
  ATXScoreNormalizationArtifactsArchive *v6;
  ATXScoreNormalizationArtifactsArchive *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXScoreNormalizationArtifactsArchive;
  v6 = -[ATXScoreNormalizationArtifactsArchive init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scoreNormalizationModelsDict, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATXScoreNormalizationArtifactsArchive scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithScoreNormalizationModelsDictionary:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXScoreNormalizationArtifactsArchive scoreNormalizationModelsDict](self, "scoreNormalizationModelsDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("scoreNormalizationModelsDict"));

}

- (ATXScoreNormalizationArtifactsArchive)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ATXScoreNormalizationArtifactsArchive *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("scoreNormalizationModelsDict"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    self = -[ATXScoreNormalizationArtifactsArchive initWithScoreNormalizationModelsDictionary:](self, "initWithScoreNormalizationModelsDictionary:", v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)scoreNormalizationModelsDict
{
  return self->_scoreNormalizationModelsDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreNormalizationModelsDict, 0);
}

@end
