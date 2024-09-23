@implementation PPMutableNamedEntityRecord

- (PPMutableNamedEntityRecord)init
{
  PPMutableNamedEntityRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPMutableNamedEntityRecord;
  result = -[PPMutableNamedEntityRecord init](&v3, sel_init);
  if (result)
    result->super._extractionAssetVersion = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PPNamedEntityRecord *v5;
  PPNamedEntity *v6;
  PPNamedEntity *entity;
  PPNamedEntityMetadata *v8;
  PPNamedEntityMetadata *metadata;

  v5 = -[PPNamedEntityRecord init](+[PPNamedEntityRecord allocWithZone:](PPNamedEntityRecord, "allocWithZone:"), "init");
  v6 = -[PPNamedEntity copyWithZone:](self->super._entity, "copyWithZone:", a3);
  entity = v5->_entity;
  v5->_entity = v6;

  objc_storeStrong((id *)&v5->_source, self->super._source);
  v5->_algorithm = self->super._algorithm;
  v5->_initialScore = self->super._initialScore;
  v5->_decayRate = self->super._decayRate;
  objc_storeStrong((id *)&v5->_extractionOsBuild, self->super._extractionOsBuild);
  v5->_extractionAssetVersion = self->super._extractionAssetVersion;
  v5->_changeType = self->super._changeType;
  v5->_bucketizedSentimentScore = self->super._bucketizedSentimentScore;
  v8 = -[PPNamedEntityMetadata copyWithZone:](self->super._metadata, "copyWithZone:", a3);
  metadata = v5->_metadata;
  v5->_metadata = v8;

  return v5;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->super._entity, a3);
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

- (void)setAlgorithm:(unint64_t)a3
{
  unsigned __int8 v3;
  void *v6;

  v3 = a3;
  if (a3 >= 0x100)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntity.m"), 672, CFSTR("Algorithm storage too small"));

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

- (void)setChangeType:(unsigned __int8)a3
{
  self->super._changeType = a3;
}

- (void)setSentimentScore:(double)a3
{
  self->super._bucketizedSentimentScore = +[PPSentimentScoreEncoder encodeSentimentScore:](PPSentimentScoreEncoder, "encodeSentimentScore:", a3);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->super._metadata, a3);
}

@end
