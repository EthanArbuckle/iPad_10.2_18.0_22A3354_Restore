@implementation MatchedPhotoAttribute

- (id)initPhotoFeature:(id)a3 matchedType:(unint64_t)a4 totalFeaturesNum:(id)a5 confidence:(double)a6 boundingBox:(id)a7
{
  id v12;
  id v13;
  id v14;
  MatchedPhotoAttribute *v15;
  MatchedPhotoAttribute *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MatchedPhotoAttribute;
  v15 = -[MatchedPhotoAttribute init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    -[MatchedPhotoAttribute setFeature:](v15, "setFeature:", v12);
    objc_msgSend(v12, "tokens");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedPhotoAttribute setTokenNum:](v16, "setTokenNum:", objc_msgSend(v17, "count"));

    objc_msgSend(v12, "original");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedPhotoAttribute setTokenLength:](v16, "setTokenLength:", objc_msgSend(v18, "length"));

    v19 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedPhotoAttribute setTypes:](v16, "setTypes:", v21);

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MatchedPhotoAttribute setTotalFeaturesNum:](v16, "setTotalFeaturesNum:", v22);

    -[MatchedPhotoAttribute setConfidence:](v16, "setConfidence:", a6);
    -[MatchedPhotoAttribute setBoundingBox:](v16, "setBoundingBox:", v14);
  }

  return v16;
}

- (SSTokenizedString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_storeStrong((id *)&self->_feature, a3);
}

- (unint64_t)tokenNum
{
  return self->_tokenNum;
}

- (void)setTokenNum:(unint64_t)a3
{
  self->_tokenNum = a3;
}

- (unint64_t)tokenLength
{
  return self->_tokenLength;
}

- (void)setTokenLength:(unint64_t)a3
{
  self->_tokenLength = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSArray)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBox, a3);
}

- (NSMutableArray)types
{
  return self->_types;
}

- (void)setTypes:(id)a3
{
  objc_storeStrong((id *)&self->_types, a3);
}

- (NSMutableArray)totalFeaturesNum
{
  return self->_totalFeaturesNum;
}

- (void)setTotalFeaturesNum:(id)a3
{
  objc_storeStrong((id *)&self->_totalFeaturesNum, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalFeaturesNum, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
