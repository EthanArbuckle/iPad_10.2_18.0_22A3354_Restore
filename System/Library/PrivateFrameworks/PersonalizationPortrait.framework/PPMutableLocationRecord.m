@implementation PPMutableLocationRecord

- (PPMutableLocationRecord)init
{
  PPMutableLocationRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPMutableLocationRecord;
  result = -[PPLocationRecord init_](&v3, sel_init_);
  if (result)
    result->super._extractionAssetVersion = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PPLocationRecord *v6;
  uint64_t v7;
  NSUUID *uuid;
  PPLocation *v9;
  PPLocation *location;
  uint64_t v11;
  NSArray *contextualNamedEntities;
  void *v14;
  void *v15;
  void *v16;

  if (!self->super._uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocation.m"), 649, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_uuid"));

  }
  if (!self->super._location)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocation.m"), 650, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_location"));

  }
  if (!self->super._source)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocation.m"), 651, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_source"));

  }
  v6 = -[PPLocationRecord init](+[PPLocationRecord allocWithZone:](PPLocationRecord, "allocWithZone:", a3), "init");
  v7 = -[NSUUID copyWithZone:](self->super._uuid, "copyWithZone:", a3);
  uuid = v6->_uuid;
  v6->_uuid = (NSUUID *)v7;

  v9 = -[PPLocation copyWithZone:](self->super._location, "copyWithZone:", a3);
  location = v6->_location;
  v6->_location = v9;

  objc_storeStrong((id *)&v6->_source, self->super._source);
  v6->_algorithm = self->super._algorithm;
  v6->_initialScore = self->super._initialScore;
  v6->_decayRate = self->super._decayRate;
  v11 = -[NSArray copyWithZone:](self->super._contextualNamedEntities, "copyWithZone:", a3);
  contextualNamedEntities = v6->_contextualNamedEntities;
  v6->_contextualNamedEntities = (NSArray *)v11;

  objc_storeStrong((id *)&v6->_extractionOsBuild, self->super._extractionOsBuild);
  v6->_extractionAssetVersion = self->super._extractionAssetVersion;
  v6->_bucketizedSentimentScore = self->super._bucketizedSentimentScore;
  return v6;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->super._uuid, a3);
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->super._location, a3);
}

- (void)setSource:(id)a3
{
  id v4;
  PPSource *v5;
  PPSource *source;
  id v7;

  v4 = a3;
  PPGetSourceInternPool();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intern:", v4);
  v5 = (PPSource *)objc_claimAutoreleasedReturnValue();

  source = self->super._source;
  self->super._source = v5;

}

- (void)setAlgorithm:(unsigned __int16)a3
{
  unsigned __int8 v3;
  void *v6;

  v3 = a3;
  if (a3 >= 0x100u)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocation.m"), 688, CFSTR("Algorithm storage too small"));

  }
  self->super._algorithm = v3;
}

- (void)setInitialScore:(double)a3
{
  float v3;

  v3 = a3;
  self->super._initialScore = v3;
}

- (void)setDecayRate:(double)a3
{
  float v3;

  v3 = a3;
  self->super._decayRate = v3;
}

- (void)setContextualNamedEntities:(id)a3
{
  objc_storeStrong((id *)&self->super._contextualNamedEntities, a3);
}

- (void)setExtractionOsBuild:(id)a3
{
  id v4;
  NSString *v5;
  NSString *extractionOsBuild;
  id v7;

  v4 = a3;
  PPGetStringInternPool();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intern:", v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  extractionOsBuild = self->super._extractionOsBuild;
  self->super._extractionOsBuild = v5;

}

- (void)setExtractionAssetVersion:(unsigned int)a3
{
  self->super._extractionAssetVersion = a3;
}

- (void)setSentimentScore:(double)a3
{
  double v3;
  BOOL v4;
  double v5;

  if (a3 < -1.0)
    a3 = -1.0;
  v3 = a3 / 0.00787401575;
  v4 = a3 < 1.0;
  v5 = 127.0;
  if (v4)
    v5 = v3;
  self->super._bucketizedSentimentScore = (int)v5;
}

@end
