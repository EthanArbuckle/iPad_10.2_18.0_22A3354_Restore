@implementation CRDetectedLineRegion

- (CRDetectedLineRegion)init
{
  CRDetectedLineRegion *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRDetectedLineRegion;
  v2 = -[CRDetectedLineRegion init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
    -[CRDetectedLineRegion _copyContentsToObject:](self, "_copyContentsToObject:", v4);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRMutableDetectedLineRegion *v4;

  v4 = objc_alloc_init(CRMutableDetectedLineRegion);
  if (v4)
    -[CRDetectedLineRegion _copyContentsToObject:](self, "_copyContentsToObject:", v4);
  return v4;
}

- (id)rotated180
{
  void *v2;

  v2 = (void *)-[CRDetectedLineRegion copy](self, "copy");
  objc_msgSend(v2, "_rotate180");
  return v2;
}

- (CGSize)rectifiedSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CRDetectedLineRegion polygon](self, "polygon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CRDetectedLineRegion polygon](self, "polygon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "denormalizedPolyline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "estimatedLineSizeForPairedPointPolygon");
  }
  else
  {
    -[CRDetectedLineRegion boundingQuad](self, "boundingQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "denormalizedQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)aspectRatio
{
  double v2;
  double v3;
  double v4;
  BOOL v5;
  double result;

  -[CRDetectedLineRegion rectifiedSize](self, "rectifiedSize");
  v4 = v3 / v2;
  v5 = v2 == 0.0;
  result = 0.0;
  if (!v5)
    return v4;
  return result;
}

- (void)_rotate180
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CRDetectedLineRegion boundingQuad](self, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotated180");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDetectedLineRegion setBoundingQuad:](self, "setBoundingQuad:", v4);

  -[CRDetectedLineRegion polygon](self, "polygon");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rotated180");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRDetectedLineRegion setPolygon:](self, "setPolygon:", v5);

}

- (void)_copyContentsToObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CRDetectedLineRegion boundingQuad](self, "boundingQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBoundingQuad:", v4);

  objc_msgSend(v10, "setLayoutDirection:", -[CRDetectedLineRegion layoutDirection](self, "layoutDirection"));
  objc_msgSend(v10, "setIsCurved:", -[CRDetectedLineRegion isCurved](self, "isCurved"));
  -[CRDetectedLineRegion polygon](self, "polygon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPolygon:", v5);

  -[CRDetectedLineRegion scriptCategoryResults](self, "scriptCategoryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScriptCategoryResults:", v6);

  -[CRDetectedLineRegion topScriptCategory](self, "topScriptCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTopScriptCategory:", v7);

  -[CRDetectedLineRegion scriptCategoryCounts](self, "scriptCategoryCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScriptCategoryCounts:", v8);

  -[CRDetectedLineRegion sequenceScriptOutputResult](self, "sequenceScriptOutputResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSequenceScriptOutputResult:", v9);

  objc_msgSend(v10, "setNmsOutputScale:", -[CRDetectedLineRegion nmsOutputScale](self, "nmsOutputScale"));
  objc_msgSend(v10, "setShouldRunSequenceScript:", -[CRDetectedLineRegion shouldRunSequenceScript](self, "shouldRunSequenceScript"));
  objc_msgSend(v10, "setShouldRunSequenceOrientation:", -[CRDetectedLineRegion shouldRunSequenceOrientation](self, "shouldRunSequenceOrientation"));
  objc_msgSend(v10, "setShouldRotate180DetectorOrientationFallback:", -[CRDetectedLineRegion shouldRotate180DetectorOrientationFallback](self, "shouldRotate180DetectorOrientationFallback"));
  objc_msgSend(v10, "setTextType:", -[CRDetectedLineRegion textType](self, "textType"));

}

- (BOOL)isCurved
{
  return self->_isCurved;
}

- (void)setIsCurved:(BOOL)a3
{
  self->_isCurved = a3;
}

- (CRNormalizedPolyline)polygon
{
  return (CRNormalizedPolyline *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPolygon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldRunSequenceScript
{
  return self->_shouldRunSequenceScript;
}

- (void)setShouldRunSequenceScript:(BOOL)a3
{
  self->_shouldRunSequenceScript = a3;
}

- (BOOL)shouldRunSequenceOrientation
{
  return self->_shouldRunSequenceOrientation;
}

- (void)setShouldRunSequenceOrientation:(BOOL)a3
{
  self->_shouldRunSequenceOrientation = a3;
}

- (BOOL)shouldRotate180DetectorOrientationFallback
{
  return self->_shouldRotate180DetectorOrientationFallback;
}

- (void)setShouldRotate180DetectorOrientationFallback:(BOOL)a3
{
  self->_shouldRotate180DetectorOrientationFallback = a3;
}

- (CRScriptCategory)topScriptCategory
{
  return (CRScriptCategory *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTopScriptCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)scriptCategoryResults
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScriptCategoryResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)scriptCategoryCounts
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setScriptCategoryCounts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)sequenceScriptOutputResult
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSequenceScriptOutputResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (unint64_t)nmsOutputScale
{
  return self->_nmsOutputScale;
}

- (void)setNmsOutputScale:(unint64_t)a3
{
  self->_nmsOutputScale = a3;
}

- (unint64_t)textType
{
  return self->_textType;
}

- (void)setTextType:(unint64_t)a3
{
  self->_textType = a3;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBoundingQuad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_sequenceScriptOutputResult, 0);
  objc_storeStrong((id *)&self->_scriptCategoryCounts, 0);
  objc_storeStrong((id *)&self->_scriptCategoryResults, 0);
  objc_storeStrong((id *)&self->_topScriptCategory, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
}

@end
