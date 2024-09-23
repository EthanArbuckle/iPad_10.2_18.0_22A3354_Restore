@implementation PPQueryScorableAttributes

- (NSNumber)portraitStaticScore
{
  return self->_portraitStaticScore;
}

- (void)setPortraitStaticScore:(id)a3
{
  objc_storeStrong((id *)&self->_portraitStaticScore, a3);
}

- (NSData)portraitFeatureVector
{
  return self->_portraitFeatureVector;
}

- (void)setPortraitFeatureVector:(id)a3
{
  objc_storeStrong((id *)&self->_portraitFeatureVector, a3);
}

- (NSNumber)portraitFeatureVectorVersion
{
  return self->_portraitFeatureVectorVersion;
}

- (void)setPortraitFeatureVectorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_portraitFeatureVectorVersion, a3);
}

- (NSDictionary)portraitNamedEntities
{
  return self->_portraitNamedEntities;
}

- (void)setPortraitNamedEntities:(id)a3
{
  objc_storeStrong((id *)&self->_portraitNamedEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitNamedEntities, 0);
  objc_storeStrong((id *)&self->_portraitFeatureVectorVersion, 0);
  objc_storeStrong((id *)&self->_portraitFeatureVector, 0);
  objc_storeStrong((id *)&self->_portraitStaticScore, 0);
}

@end
