@implementation PPMutableTopicRecord

- (PPMutableTopicRecord)init
{
  PPMutableTopicRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPMutableTopicRecord;
  result = -[PPMutableTopicRecord init](&v3, sel_init);
  if (result)
    result->super._extractionAssetVersion = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->super._topic);
  objc_storeStrong((id *)(v4 + 16), self->super._source);
  *(_QWORD *)(v4 + 24) = self->super._algorithm;
  *(double *)(v4 + 32) = self->super._initialScore;
  *(double *)(v4 + 40) = self->super._decayRate;
  *(_BYTE *)(v4 + 48) = self->super._isLocal;
  objc_storeStrong((id *)(v4 + 56), self->super._extractionOsBuild);
  *(_DWORD *)(v4 + 64) = self->super._extractionAssetVersion;
  *(_BYTE *)(v4 + 80) = self->super._bucketizedSentimentScore;
  objc_storeStrong((id *)(v4 + 72), self->super._metadata);
  return (id)v4;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->super._topic, a3);
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
  self->super._algorithm = a3;
}

- (void)setInitialScore:(double)a3
{
  self->super._initialScore = a3;
}

- (void)setDecayRate:(double)a3
{
  self->super._decayRate = a3;
}

- (void)setIsLocal:(BOOL)a3
{
  self->super._isLocal = a3;
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

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->super._metadata, a3);
}

- (void)setSentimentScore:(double)a3
{
  self->super._bucketizedSentimentScore = +[PPSentimentScoreEncoder encodeSentimentScore:](PPSentimentScoreEncoder, "encodeSentimentScore:", a3);
}

@end
