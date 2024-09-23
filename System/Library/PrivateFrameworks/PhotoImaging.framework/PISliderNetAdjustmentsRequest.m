@implementation PISliderNetAdjustmentsRequest

- (PISliderNetAdjustmentsRequest)initWithComposition:(id)a3
{
  PISliderNetAdjustmentsRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PISliderNetAdjustmentsRequest;
  result = -[NURenderRequest initWithComposition:](&v4, sel_initWithComposition_, a3);
  if (result)
    result->_similarityGatingThreshold = -1.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PISliderNetAdjustmentsRequest;
  v4 = -[PISliderNetBaseRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 23, self->_styleFeatureVectorData);
    objc_storeStrong(v5 + 24, self->_contentFeatureVectorData);
    v5[25] = *(id *)&self->_similarityGatingThreshold;
  }
  return v5;
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  return -[NURenderJob initWithRequest:]([PISliderNetAdjustmentsJob alloc], "initWithRequest:", self);
}

- (NSData)styleFeatureVectorData
{
  return self->_styleFeatureVectorData;
}

- (void)setStyleFeatureVectorData:(id)a3
{
  objc_storeStrong((id *)&self->_styleFeatureVectorData, a3);
}

- (NSData)contentFeatureVectorData
{
  return self->_contentFeatureVectorData;
}

- (void)setContentFeatureVectorData:(id)a3
{
  objc_storeStrong((id *)&self->_contentFeatureVectorData, a3);
}

- (double)similarityGatingThreshold
{
  return self->_similarityGatingThreshold;
}

- (void)setSimilarityGatingThreshold:(double)a3
{
  self->_similarityGatingThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFeatureVectorData, 0);
  objc_storeStrong((id *)&self->_styleFeatureVectorData, 0);
}

@end
