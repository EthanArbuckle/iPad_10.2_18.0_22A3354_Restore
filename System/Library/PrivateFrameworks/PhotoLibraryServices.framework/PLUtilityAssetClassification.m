@implementation PLUtilityAssetClassification

- (void)_prepareForRecycle
{
  *(_OWORD *)&self->_sceneIdentifier = 0u;
  *(_OWORD *)&self->_confidence = 0u;
}

- (BOOL)isEqual:(id)a3
{
  PLUtilityAssetClassification *v4;
  PLUtilityAssetClassification *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  CGRect v25;
  CGRect v26;

  v4 = (PLUtilityAssetClassification *)a3;
  if (v4 == self)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PLUtilityAssetClassification sceneIdentifier](self, "sceneIdentifier");
      if (v6 == -[PLUtilityAssetClassification sceneIdentifier](v5, "sceneIdentifier")
        && (-[PLUtilityAssetClassification confidence](self, "confidence"),
            v8 = v7,
            -[PLUtilityAssetClassification confidence](v5, "confidence"),
            v8 == v9)
        && (v10 = -[PLUtilityAssetClassification classificationType](self, "classificationType"),
            v10 == -[PLUtilityAssetClassification classificationType](v5, "classificationType")))
      {
        -[PLUtilityAssetClassification boundingBox](self, "boundingBox");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        -[PLUtilityAssetClassification boundingBox](v5, "boundingBox");
        v26.origin.x = v19;
        v26.origin.y = v20;
        v26.size.width = v21;
        v26.size.height = v22;
        v25.origin.x = v12;
        v25.origin.y = v14;
        v25.size.width = v16;
        v25.size.height = v18;
        v23 = CGRectEqualToRect(v25, v26);
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  int64_t v6;

  v3 = -[PLUtilityAssetClassification sceneIdentifier](self, "sceneIdentifier");
  -[PLUtilityAssetClassification confidence](self, "confidence");
  v5 = (unint64_t)v4;
  v6 = v3 ^ -[PLUtilityAssetClassification classificationType](self, "classificationType");
  return v6 ^ -[PLUtilityAssetClassification packedBoundingBox](self, "packedBoundingBox") ^ v5;
}

- (CGRect)boundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  __int128 v7;
  CGRect result;

  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  -[PLUtilityAssetClassification packedBoundingBox](self, "packedBoundingBox");
  PLSplitToCGRectFromInt64();
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = *((double *)&v7 + 1);
  v4 = *(double *)&v7;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (int64_t)packedBoundingBox
{
  return self->_packedBoundingBox;
}

- (void)setPackedBoundingBox:(int64_t)a3
{
  self->_packedBoundingBox = a3;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  self->_sceneIdentifier = a3;
}

- (int64_t)classificationType
{
  return self->_classificationType;
}

- (void)setClassificationType:(int64_t)a3
{
  self->_classificationType = a3;
}

@end
