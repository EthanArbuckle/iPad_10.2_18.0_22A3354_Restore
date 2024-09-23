@implementation CRRegionGeometryInfo

- (id)initFromRegion:(id)a3 layoutDirection:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  CRRegionGeometryInfo *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  objc_super v39;
  objc_super v40;

  v5 = a3;
  objc_msgSend(v5, "boundingQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "denormalizedQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topLeft");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v5, "boundingQuad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "denormalizedQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topRight");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "boundingQuad");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "denormalizedQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomRight");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v5, "boundingQuad");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "denormalizedQuad");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomLeft");
  v40.receiver = self;
  v40.super_class = (Class)CRRegionGeometryInfo;
  v28 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](&v40, sel_initWithTopLeft_topRight_bottomRight_bottomLeft_, v9, v11, v15, v17, v21, v23, v26, v27);

  if (v28)
  {
    -[CRRegionGeometryInfo setLayoutDirection:](v28, "setLayoutDirection:", a4);
    v39.receiver = v28;
    v39.super_class = (Class)CRRegionGeometryInfo;
    -[CRImageSpaceQuad size](&v39, sel_size);
    -[CRRegionGeometryInfo setCachedSize:](v28, "setCachedSize:");
    -[CRRegionGeometryInfo size](v28, "size");
    -[CRRegionGeometryInfo setEstimatedLineHeight:](v28, "setEstimatedLineHeight:", v29);
    -[CRImageSpaceQuad bottomRight](v28, "bottomRight");
    v31 = v30;
    -[CRImageSpaceQuad bottomLeft](v28, "bottomLeft");
    v33 = v31 - v32;
    -[CRImageSpaceQuad bottomRight](v28, "bottomRight");
    v35 = v34;
    -[CRImageSpaceQuad bottomLeft](v28, "bottomLeft");
    v28->_baselineVector.dx = v33;
    v28->_baselineVector.dy = v35 - v36;
  }
  return v28;
}

- (id)mutualGeometryInfoWith:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[CRPairedRegionMutualGeometryInfo initFromGeometryInfo1:geometryInfo2:]([CRPairedRegionMutualGeometryInfo alloc], "initFromGeometryInfo1:geometryInfo2:", self, v4);

  return v5;
}

- (CGSize)cachedSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->cachedSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCachedSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->cachedSize, &v3, 16, 1, 0);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (double)estimatedLineHeight
{
  return self->_estimatedLineHeight;
}

- (void)setEstimatedLineHeight:(double)a3
{
  self->_estimatedLineHeight = a3;
}

- (CGVector)baselineVector
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_baselineVector, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

@end
