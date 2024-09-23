@implementation CRNormalizedQuad

- (double)boundingBoxIOUWithQuad:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double height;
  double width;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  -[CRNormalizedQuad boundingBox](self, "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "boundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v27.origin.x = v14;
  v27.origin.y = v16;
  v27.size.width = v18;
  v27.size.height = v20;
  v25 = CGRectUnion(v24, v27);
  height = v25.size.height;
  width = v25.size.width;
  v25.origin.x = v6;
  v25.origin.y = v8;
  v25.size.width = v10;
  v25.size.height = v12;
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v18;
  v28.size.height = v20;
  v26 = CGRectIntersection(v25, v28);
  return v26.size.width * v26.size.height / (width * height + 1.0e-23);
}

- (double)boundingBoxClippedIOUWithQuad:(id)a3
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a3;
  -[CRNormalizedQuad boundingBox](self, "boundingBox");
  v34.origin.x = v5;
  v34.origin.y = v6;
  v34.size.width = v7;
  v34.size.height = v8;
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = 1.0;
  v28.size.height = 1.0;
  v29 = CGRectIntersection(v28, v34);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  objc_msgSend(v4, "boundingBox");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = 1.0;
  v30.size.height = 1.0;
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  v31 = CGRectIntersection(v30, v35);
  v21 = v31.origin.x;
  v22 = v31.origin.y;
  v23 = v31.size.width;
  v24 = v31.size.height;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v36.origin.x = v21;
  v36.origin.y = v22;
  v36.size.width = v23;
  v36.size.height = v24;
  v32 = CGRectUnion(v31, v36);
  v26 = v32.size.height;
  v27 = v32.size.width;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v37.origin.x = v21;
  v37.origin.y = v22;
  v37.size.width = v23;
  v37.size.height = v24;
  v33 = CGRectIntersection(v32, v37);
  return v33.size.width * v33.size.height / (v27 * v26 + 1.0e-23);
}

- (CRNormalizedQuad)initWithNormalizedTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 size:(CGSize)a7
{
  CRImageSpaceQuad *v8;
  CRNormalizedQuad *v9;
  double v11;
  double v12;

  v8 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", a3.x * v11, a3.y * v12, a4.x * v11, a4.y * v12, a5.x * v11, a5.y * v12, a6.x * v11, a6.y * v12);
  v9 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](self, "initWithDenormalizedQuad:size:", v8, v11, v12);

  return v9;
}

- (CRNormalizedQuad)initWithNormalizedBoundingBox:(CGRect)a3 size:(CGSize)a4
{
  double height;
  double width;
  CRImageSpaceQuad *v7;
  CRNormalizedQuad *v8;

  height = a4.height;
  width = a4.width;
  v7 = -[CRImageSpaceQuad initWithBoundingBox:]([CRImageSpaceQuad alloc], "initWithBoundingBox:", a3.origin.x * width, a3.origin.y * height, a3.size.width * width, a3.size.height * height);
  v8 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](self, "initWithDenormalizedQuad:size:", v7, width, height);

  return v8;
}

- (CRNormalizedQuad)initWithDenormalizedQuad:(id)a3 size:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  CRNormalizedQuad *v9;
  CRNormalizedQuad *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRNormalizedQuad;
  v9 = -[CRNormalizedQuad init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_denormalizedQuad, a3);
    v10->_normalizationSize.width = width;
    v10->_normalizationSize.height = height;
  }

  return v10;
}

- (CGPoint)topLeft
{
  double v3;
  double v4;
  double height;
  double width;
  CGPoint result;

  -[CRImageSpaceQuad topLeft](self->_denormalizedQuad, "topLeft");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
    }
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)topRight
{
  double v3;
  double v4;
  double height;
  double width;
  CGPoint result;

  -[CRImageSpaceQuad topRight](self->_denormalizedQuad, "topRight");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
    }
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)bottomRight
{
  double v3;
  double v4;
  double height;
  double width;
  CGPoint result;

  -[CRImageSpaceQuad bottomRight](self->_denormalizedQuad, "bottomRight");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
    }
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)bottomLeft
{
  double v3;
  double v4;
  double height;
  double width;
  CGPoint result;

  -[CRImageSpaceQuad bottomLeft](self->_denormalizedQuad, "bottomLeft");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
    }
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)midPoint
{
  double v3;
  double v4;
  double height;
  double width;
  CGPoint result;

  -[CRImageSpaceQuad midPoint](self->_denormalizedQuad, "midPoint");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
    }
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)boundingBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double height;
  double width;
  CGRect result;

  -[CRImageSpaceQuad boundingBox](self->_denormalizedQuad, "boundingBox");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
      v5 = v5 / width;
      v6 = v6 / height;
    }
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)size
{
  double v3;
  double v4;
  double height;
  double width;
  CGSize result;

  -[CRImageSpaceQuad size](self->_denormalizedQuad, "size");
  height = self->_normalizationSize.height;
  if (height != 0.0)
  {
    width = self->_normalizationSize.width;
    if (width != 0.0)
    {
      v3 = v3 / width;
      v4 = v4 / height;
    }
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)aspectRatio
{
  double result;

  -[CRImageSpaceQuad aspectRatio](self->_denormalizedQuad, "aspectRatio");
  return result;
}

- (double)baselineAngle
{
  double result;

  -[CRImageSpaceQuad baselineAngle](self->_denormalizedQuad, "baselineAngle");
  return result;
}

- (BOOL)containsDenormalizedPoint:(CGPoint)a3
{
  return -[CRImageSpaceQuad containsPoint:](self->_denormalizedQuad, "containsPoint:", a3.x, a3.y);
}

- (id)rotated180
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc((Class)objc_opt_class());
  -[CRImageSpaceQuad rotated180](self->_denormalizedQuad, "rotated180");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDenormalizedQuad:size:", v4, self->_normalizationSize.width, self->_normalizationSize.height);

  return v5;
}

- (BOOL)containsNormalizedPoint:(CGPoint)a3
{
  return -[CRNormalizedQuad containsDenormalizedPoint:](self, "containsDenormalizedPoint:", a3.x * self->_normalizationSize.width, a3.y * self->_normalizationSize.height);
}

- (BOOL)overlapsDenormalizedQuad:(id)a3
{
  return -[CRImageSpaceQuad overlapsQuad:](self->_denormalizedQuad, "overlapsQuad:", a3);
}

- (BOOL)overlapsNormalizedQuad:(id)a3
{
  void *v4;

  objc_msgSend(a3, "denormalizedQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CRNormalizedQuad overlapsDenormalizedQuad:](self, "overlapsDenormalizedQuad:", v4);

  return (char)self;
}

- (double)shortestDistanceFromDenormalizedPoint:(CGPoint)a3
{
  double result;

  -[CRImageSpaceQuad shortestDistanceFromPoint:](self->_denormalizedQuad, "shortestDistanceFromPoint:", a3.x, a3.y);
  return result;
}

- (double)shortestDistanceFromNormalizedPoint:(CGPoint)a3
{
  double result;

  -[CRNormalizedQuad shortestDistanceFromDenormalizedPoint:](self, "shortestDistanceFromDenormalizedPoint:", a3.x * self->_normalizationSize.width, a3.y * self->_normalizationSize.height);
  return result;
}

- (id)rotatedAroundDenormalizedPoint:(CGPoint)a3 angle:(float)a4
{
  void *v5;
  void *v6;

  -[CRImageSpaceQuad rotatedAroundPoint:angle:](self->_denormalizedQuad, "rotatedAroundPoint:angle:", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedQuadForImageSize:", self->_normalizationSize.width, self->_normalizationSize.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rotatedAroundNormalizedPoint:(CGPoint)a3 angle:(float)a4
{
  return -[CRNormalizedQuad rotatedAroundDenormalizedPoint:angle:](self, "rotatedAroundDenormalizedPoint:angle:", a3.x * self->_normalizationSize.width, a3.y * self->_normalizationSize.height);
}

- (id)scaledBy:(CGPoint)a3 normalizedOffset:(CGPoint)a4
{
  void *v5;
  void *v6;

  -[CRImageSpaceQuad scaledBy:offset:](self->_denormalizedQuad, "scaledBy:offset:", a3.x, a3.y, a4.x * self->_normalizationSize.width, a4.y * self->_normalizationSize.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedQuadForImageSize:", self->_normalizationSize.width, self->_normalizationSize.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unionWithNormalizedQuad:(id)a3 baselineAngle:(float)a4
{
  CRImageSpaceQuad *denormalizedQuad;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  denormalizedQuad = self->_denormalizedQuad;
  objc_msgSend(a3, "denormalizedQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  -[CRImageSpaceQuad unionWithQuad:baselineAngle:](denormalizedQuad, "unionWithQuad:baselineAngle:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "normalizedQuadForImageSize:", self->_normalizationSize.width, self->_normalizationSize.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSize(self->_normalizationSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Size: %@ | Quad: %@"), v4, self->_denormalizedQuad);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  CRNormalizedQuad *v4;
  CRNormalizedQuad *v5;
  double v6;
  double v7;
  char v9;
  CRImageSpaceQuad *denormalizedQuad;
  void *v11;

  v4 = (CRNormalizedQuad *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CRNormalizedQuad normalizationSize](v5, "normalizationSize");
      if (self->_normalizationSize.width == v7 && self->_normalizationSize.height == v6)
      {
        denormalizedQuad = self->_denormalizedQuad;
        -[CRNormalizedQuad denormalizedQuad](v5, "denormalizedQuad");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CRImageSpaceQuad isEqual:](denormalizedQuad, "isEqual:", v11);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRNormalizedQuad)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  CRNormalizedQuad *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRQuadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CRQuadUncompressedDataSize"));

  uncompressDataOfSize(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRNormalizedQuad initWithCRCodableDataRepresentation:](self, "initWithCRCodableDataRepresentation:", v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRNormalizedQuad crCodableDataRepresentation](self, "crCodableDataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  compressData(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CRQuadData"));
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), CFSTR("CRQuadUncompressedDataSize"));

}

- (id)crCodableDataRepresentation
{
  void *v3;

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v3);
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", self->_denormalizedQuad, v3);
  +[CRCodingUtilities appendSize:toData:](CRCodingUtilities, "appendSize:toData:", v3, self->_normalizationSize.width, self->_normalizationSize.height);
  return v3;
}

- (CRNormalizedQuad)initWithCRCodableDataRepresentation:(id)a3
{
  id v4;
  CRImageSpaceQuad *v5;
  void *v6;
  CRImageSpaceQuad *v7;
  CRNormalizedQuad *v8;
  uint64_t v10;

  v4 = a3;
  v10 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v4, &v10) == 1)
  {
    v5 = [CRImageSpaceQuad alloc];
    +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v4, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CRImageSpaceQuad initWithCRCodableDataRepresentation:](v5, "initWithCRCodableDataRepresentation:", v6);

    +[CRCodingUtilities sizeFromEncodingData:offset:](CRCodingUtilities, "sizeFromEncodingData:offset:", v4, &v10);
    self = -[CRNormalizedQuad initWithDenormalizedQuad:size:](self, "initWithDenormalizedQuad:size:", v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRNormalizedQuad *v4;
  void *v5;
  CRNormalizedQuad *v6;

  v4 = +[CRNormalizedQuad allocWithZone:](CRNormalizedQuad, "allocWithZone:", a3);
  v5 = (void *)-[CRImageSpaceQuad copy](self->_denormalizedQuad, "copy");
  v6 = -[CRNormalizedQuad initWithDenormalizedQuad:size:](v4, "initWithDenormalizedQuad:size:", v5, self->_normalizationSize.width, self->_normalizationSize.height);

  return v6;
}

- (double)area
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  -[CRNormalizedQuad topRight](self, "topRight");
  v4 = v3;
  -[CRNormalizedQuad topLeft](self, "topLeft");
  v6 = v4 - v5;
  -[CRNormalizedQuad topRight](self, "topRight");
  v8 = v7;
  -[CRNormalizedQuad topLeft](self, "topLeft");
  v10 = v8 - v9;
  -[CRNormalizedQuad bottomLeft](self, "bottomLeft");
  v12 = v11;
  -[CRNormalizedQuad topLeft](self, "topLeft");
  v14 = v12 - v13;
  -[CRNormalizedQuad bottomLeft](self, "bottomLeft");
  v16 = v15;
  -[CRNormalizedQuad topLeft](self, "topLeft");
  v18 = fabs(v6 * (v16 - v17) - v10 * v14) * 0.5;
  -[CRNormalizedQuad topRight](self, "topRight");
  v20 = v19;
  -[CRNormalizedQuad bottomRight](self, "bottomRight");
  v22 = v20 - v21;
  -[CRNormalizedQuad topRight](self, "topRight");
  v24 = v23;
  -[CRNormalizedQuad bottomRight](self, "bottomRight");
  v26 = v24 - v25;
  -[CRNormalizedQuad bottomLeft](self, "bottomLeft");
  v28 = v27;
  -[CRNormalizedQuad bottomRight](self, "bottomRight");
  v30 = v28 - v29;
  -[CRNormalizedQuad bottomLeft](self, "bottomLeft");
  v32 = v31;
  -[CRNormalizedQuad bottomRight](self, "bottomRight");
  return v18 + fabs(v22 * (v32 - v33) - v26 * v30) * 0.5;
}

- (CRImageSpaceQuad)denormalizedQuad
{
  return self->_denormalizedQuad;
}

- (CGSize)normalizationSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_normalizationSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denormalizedQuad, 0);
}

@end
