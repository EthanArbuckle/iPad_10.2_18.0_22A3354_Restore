@implementation CRImageSpaceQuad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRImageSpaceQuad)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  CRImageSpaceQuad *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CRQuadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CRQuadUncompressedDataSize"));

  uncompressDataOfSize(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRImageSpaceQuad initWithCRCodableDataRepresentation:](self, "initWithCRCodableDataRepresentation:", v7);

  return v8;
}

- (CRImageSpaceQuad)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4
{
  uint64_t v5;
  float64x2_t v6;
  float64x2_t v7;
  float v8;
  float v9;
  int32x4_t v10;
  float64x2_t v11;
  float v12;
  float v13;
  int32x4_t v14;
  float64x2_t v15;
  float v16;
  float v17;
  int32x4_t v18;
  float64x2_t v19;
  float v20;
  float v21;
  int32x4_t v22;

  *(double *)&v5 = a5;
  v6 = (float64x2_t)vdupq_lane_s64(v5, 0);
  v7 = vdivq_f64(*(float64x2_t *)(a1 + 8), v6);
  v8 = v7.f64[0];
  v9 = v7.f64[1];
  v10 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v8), a3, v9));
  if (*(float *)&v10.i32[2] != 0.0)
    v7 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v10.i8, (float32x2_t)vdup_laneq_s32(v10, 2)));
  v11 = vdivq_f64(*(float64x2_t *)(a1 + 24), v6);
  v12 = v11.f64[0];
  v13 = v11.f64[1];
  v14 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v12), a3, v13));
  if (*(float *)&v14.i32[2] != 0.0)
    v11 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v14.i8, (float32x2_t)vdup_laneq_s32(v14, 2)));
  v15 = vdivq_f64(*(float64x2_t *)(a1 + 56), v6);
  v16 = v15.f64[0];
  v17 = v15.f64[1];
  v18 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v16), a3, v17));
  if (*(float *)&v18.i32[2] != 0.0)
    v15 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_laneq_s32(v18, 2)));
  v19 = vdivq_f64(*(float64x2_t *)(a1 + 40), v6);
  v20 = v19.f64[0];
  v21 = v19.f64[1];
  v22 = (int32x4_t)vaddq_f32(a4, vmlaq_n_f32(vmulq_n_f32(a2, v20), a3, v21));
  if (*(float *)&v22.i32[2] != 0.0)
    v19 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_laneq_s32(v22, 2)));
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", vmulq_n_f64(v7, *(double *)&v5), vmulq_n_f64(v11, *(double *)&v5), vmulq_n_f64(v19, *(double *)&v5), vmulq_n_f64(v15, *(double *)&v5));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CRImageSpaceQuad crCodableDataRepresentation](self, "crCodableDataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  compressData(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CRQuadData"));
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), CFSTR("CRQuadUncompressedDataSize"));

}

- (CRImageSpaceQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CRImageSpaceQuad *result;
  objc_super v15;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)CRImageSpaceQuad;
  result = -[CRImageSpaceQuad init](&v15, sel_init);
  if (result)
  {
    result->_topLeft.x = v13;
    result->_topLeft.y = v12;
    result->_topRight.x = v11;
    result->_topRight.y = v10;
    result->_bottomRight.x = v9;
    result->_bottomRight.y = v8;
    result->_bottomLeft.x = x;
    result->_bottomLeft.y = y;
  }
  return result;
}

- (CRImageSpaceQuad)initWithBoundingBox:(CGRect)a3
{
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](self, "initWithTopLeft:topRight:bottomRight:bottomLeft:", a3.origin.x, a3.origin.y, a3.origin.x + a3.size.width, a3.origin.y, a3.origin.x + a3.size.width, a3.origin.y + a3.size.height, a3.origin.x, a3.origin.y + a3.size.height);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{(%.2f %.2f), (%.2f %.2f), (%.2f %.2f), (%.2f %.2f)}"), *(_QWORD *)&self->_topLeft.x, *(_QWORD *)&self->_topLeft.y, *(_QWORD *)&self->_topRight.x, *(_QWORD *)&self->_topRight.y, *(_QWORD *)&self->_bottomRight.x, *(_QWORD *)&self->_bottomRight.y, *(_QWORD *)&self->_bottomLeft.x, *(_QWORD *)&self->_bottomLeft.y);
}

- (CGRect)boundingBox
{
  uint64_t v2;
  CGPoint topRight;
  CGPoint bottomLeft;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _OWORD v14[4];
  uint64_t v15;
  CGRect result;

  v2 = 0;
  v15 = *MEMORY[0x1E0C80C00];
  topRight = self->_topRight;
  v14[0] = self->_topLeft;
  v14[1] = topRight;
  bottomLeft = self->_bottomLeft;
  v14[2] = self->_bottomRight;
  v14[3] = bottomLeft;
  v5 = *((double *)v14 + 1);
  v9 = v14[0];
  *(_QWORD *)&v8 = v9 >> 64;
  *(_QWORD *)&v6 = v9;
  v7 = *(double *)v14;
  do
  {
    v10 = *(double *)&v14[v2 + 1];
    v11 = *((double *)&v14[v2 + 1] + 1);
    if (v6 >= v10)
      v6 = *(double *)&v14[v2 + 1];
    if (v7 < v10)
      v7 = *(double *)&v14[v2 + 1];
    if (v5 >= v11)
      v5 = *((double *)&v14[v2 + 1] + 1);
    if (v8 < v11)
      v8 = *((double *)&v14[v2 + 1] + 1);
    ++v2;
  }
  while (v2 != 3);
  v12 = v7 - v6;
  v13 = v8 - v5;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v5;
  result.origin.x = v6;
  return result;
}

- (CGSize)size
{
  double x;
  double y;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  BOOL v14;
  double v15;
  BOOL v16;
  double v17;
  CGSize result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  v4 = self->_bottomLeft.x;
  v5 = self->_bottomLeft.y;
  v6 = self->_topRight.x;
  v7 = self->_topRight.y;
  v8 = self->_bottomRight.x;
  v9 = self->_bottomRight.y;
  v10 = (x + v4 - v6 - v8) * 0.5;
  v11 = (y + v5 - v7 - v9) * 0.5;
  v12 = (v4 + v8 - x - v6) * 0.5;
  v13 = (v5 + v9 - y - v7) * 0.5;
  v14 = v11 == 0.0 && v10 == 0.0;
  v15 = sqrtf((float)(v11 * v11) + (float)(v10 * v10));
  if (v14)
    v15 = 0.0;
  v16 = v13 == 0.0 && v12 == 0.0;
  v17 = sqrtf((float)(v13 * v13) + (float)(v12 * v12));
  if (v16)
    v17 = 0.0;
  result.height = v17;
  result.width = v15;
  return result;
}

- (double)area
{
  return fabs((self->_topRight.x - self->_topLeft.x) * (self->_bottomLeft.y - self->_topLeft.y)- (self->_topRight.y - self->_topLeft.y) * (self->_bottomLeft.x - self->_topLeft.x))* 0.5+ fabs((self->_topRight.x - self->_bottomRight.x) * (self->_bottomLeft.y - self->_bottomRight.y)- (self->_topRight.y - self->_bottomRight.y) * (self->_bottomLeft.x - self->_bottomRight.x))* 0.5;
}

- (double)aspectRatio
{
  double v2;
  double v3;
  double v4;
  BOOL v5;
  double result;

  -[CRImageSpaceQuad size](self, "size");
  v4 = v3 / v2;
  v5 = v2 == 0.0;
  result = 0.0;
  if (!v5)
    return v4;
  return result;
}

- (double)baselineAngle
{
  return -atan2(self->_bottomRight.y - self->_bottomLeft.y, self->_bottomRight.x - self->_bottomLeft.x);
}

- (CGPoint)midPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[CRImageSpaceQuad boundingBox](self, "boundingBox");
  v4 = v3 + v2 * 0.5;
  v7 = v6 + v5 * 0.5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (id)rotated180
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTopLeft:topRight:bottomRight:bottomLeft:", self->_bottomRight.x, self->_bottomRight.y, self->_bottomLeft.x, self->_bottomLeft.y, self->_topLeft.x, self->_topLeft.y, self->_topRight.x, self->_topRight.y);
}

- (id)normalizedQuadForImageSize:(CGSize)a3
{
  return -[CRNormalizedQuad initWithDenormalizedQuad:size:]([CRNormalizedQuad alloc], "initWithDenormalizedQuad:size:", self, a3.width, a3.height);
}

- (id)rotatedAroundPoint:(CGPoint)a3 angle:(float)a4
{
  double y;
  double x;
  double v7;
  double v8;
  __double2 v9;
  float v10;
  float v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  float v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  float v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  float v26;
  float v27;

  y = a3.y;
  x = a3.x;
  v7 = self->_topLeft.x;
  v8 = self->_topLeft.y;
  v9 = __sincos_stret(a4);
  v10 = (v7 - x) * v9.__cosval - (v8 - y) * v9.__sinval;
  v11 = v9.__cosval * (v8 - y) + (v7 - x) * v9.__sinval;
  v12 = x + v10;
  v13 = y + v11;
  v14 = self->_topRight.x - x;
  v15 = self->_topRight.y - y;
  v16 = v14 * v9.__cosval - v15 * v9.__sinval;
  *(float *)&v14 = v9.__cosval * v15 + v14 * v9.__sinval;
  v17 = x + v16;
  v18 = y + *(float *)&v14;
  v19 = self->_bottomRight.x - x;
  v20 = self->_bottomRight.y - y;
  v21 = v19 * v9.__cosval - v20 * v9.__sinval;
  *(float *)&v19 = v9.__cosval * v20 + v19 * v9.__sinval;
  v22 = x + v21;
  v23 = y + *(float *)&v19;
  v24 = self->_bottomLeft.x - x;
  v25 = self->_bottomLeft.y - y;
  v26 = v24 * v9.__cosval - v25 * v9.__sinval;
  v27 = v9.__cosval * v25 + v24 * v9.__sinval;
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v12, v13, v17, v18, v22, v23, x + v26, y + v27);
}

- (id)scaledBy:(CGPoint)a3 offset:(CGPoint)a4
{
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", a4.x + self->_topLeft.x * a3.x, a4.y + self->_topLeft.y * a3.y, a4.x + self->_topRight.x * a3.x, a4.y + self->_topRight.y * a3.y, a4.x + self->_bottomRight.x * a3.x, a4.y + self->_bottomRight.y * a3.y, a4.x + self->_bottomLeft.x * a3.x, a4.y + self->_bottomLeft.y * a3.y);
}

- (id)unionWithQuad:(id)a3 baselineAngle:(float)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CRImageSpaceQuad *v55;
  double v56;
  void *v57;
  float v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v6 = a3;
  -[CRImageSpaceQuad boundingBox](self, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "boundingBox");
  v62.origin.x = v15;
  v62.origin.y = v16;
  v62.size.width = v17;
  v62.size.height = v18;
  v60.origin.x = v8;
  v60.origin.y = v10;
  v60.size.width = v12;
  v60.size.height = v14;
  v61 = CGRectUnion(v60, v62);
  v61.size.width = v61.size.width * 0.5;
  v20 = v61.origin.y + v61.size.height * 0.5;
  v19 = v61.origin.x + v61.size.width;
  v59 = a4;
  *(float *)&v61.size.width = a4;
  -[CRImageSpaceQuad rotatedAroundPoint:angle:](self, "rotatedAroundPoint:angle:", v19, v20, v61.size.width);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = a4;
  objc_msgSend(v6, "rotatedAroundPoint:angle:", v19, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "bottomLeft");
  v25 = v24;
  objc_msgSend(v21, "bottomLeft");
  v27 = v26;
  objc_msgSend(v21, "topLeft");
  v29 = v28;
  objc_msgSend(v23, "topLeft");
  if (v29 < v30)
    v30 = v29;
  if (v27 < v30)
    v30 = v27;
  if (v25 >= v30)
    v25 = v30;
  objc_msgSend(v23, "topLeft");
  v32 = v31;
  objc_msgSend(v21, "topLeft");
  v34 = v33;
  objc_msgSend(v21, "topRight");
  v36 = v35;
  objc_msgSend(v23, "topRight");
  if (v36 >= v37)
    v38 = v37;
  else
    v38 = v36;
  if (v34 < v38)
    v38 = v34;
  if (v32 >= v38)
    v32 = v38;
  objc_msgSend(v23, "bottomRight");
  v40 = v39;
  objc_msgSend(v21, "bottomRight");
  v42 = v41;
  objc_msgSend(v21, "topRight");
  v44 = v43;
  objc_msgSend(v23, "topRight");
  if (v44 >= v45)
    v45 = v44;
  if (v42 >= v45)
    v45 = v42;
  if (v40 < v45)
    v40 = v45;
  objc_msgSend(v23, "bottomLeft");
  v47 = v46;
  objc_msgSend(v21, "bottomLeft");
  v49 = v48;
  objc_msgSend(v21, "bottomRight");
  v51 = v50;
  objc_msgSend(v23, "bottomRight");
  if (v51 >= v52)
    v53 = v51;
  else
    v53 = v52;
  if (v49 >= v53)
    v53 = v49;
  if (v47 >= v53)
    v54 = v47;
  else
    v54 = v53;
  v55 = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:]([CRImageSpaceQuad alloc], "initWithTopLeft:topRight:bottomRight:bottomLeft:", v25, v32, v40, v32, v40, v54, v25, v54);
  *(float *)&v56 = -v59;
  -[CRImageSpaceQuad rotatedAroundPoint:angle:](v55, "rotatedAroundPoint:angle:", v19, v20, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

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
  -[CRImageSpaceQuad boundingBox](self, "boundingBox");
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

- (BOOL)overlapsQuad:(id)a3
{
  id v4;
  CRImageSpaceQuad *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  double *v26;
  double v27;
  double v28;
  double *v29;
  double v30;
  double v31;
  uint64_t v32;
  double *v33;
  int v34;
  char v35;
  _QWORD v38[7];
  _QWORD v39[10];

  v39[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  -[CRImageSpaceQuad topLeft](v5, "topLeft");
  v39[0] = v6;
  v39[1] = v7;
  -[CRImageSpaceQuad topRight](v5, "topRight");
  v39[2] = v8;
  v39[3] = v9;
  -[CRImageSpaceQuad bottomRight](v5, "bottomRight");
  v39[4] = v10;
  v39[5] = v11;
  -[CRImageSpaceQuad bottomLeft](v5, "bottomLeft");
  v39[6] = v12;
  v39[7] = v13;
  objc_msgSend(v4, "topLeft");
  objc_msgSend(v4, "topRight", v14, v15);
  v38[1] = v16;
  v38[2] = v17;
  objc_msgSend(v4, "bottomRight");
  v38[3] = v18;
  v38[4] = v19;
  objc_msgSend(v4, "bottomLeft");
  v20 = 0;
  v38[5] = v21;
  v38[6] = v22;
  do
  {
    if (-[CRImageSpaceQuad containsPoint:](v5, "containsPoint:", *(double *)&v38[v20 - 1], *(double *)&v38[v20])
      || (objc_msgSend(v4, "containsPoint:", *(double *)&v39[v20], *(double *)&v39[v20 + 1]) & 1) != 0)
    {
      v35 = 1;
      goto LABEL_13;
    }
    v20 += 2;
  }
  while (v20 != 8);
  v23 = 0;
  v24 = 1;
  do
  {
    v25 = v23;
    v26 = (double *)&v39[2 * v23];
    v27 = *v26;
    v28 = v26[1];
    v29 = (double *)&v39[2 * (++v23 & 3)];
    v30 = *v29;
    v31 = v29[1];
    v32 = 1;
    v33 = (double *)v38;
    while (v32 != 5)
    {
      v34 = -[CRImageSpaceQuad linesIntersectLine1P1:line1P2:line2P1:line2P2:]((uint64_t)v5, v27, v28, v30, v31, *(v33 - 1), *v33, *(double *)&v38[2 * (v32 & 3) - 1], *(double *)&v38[2 * (v32 & 3)]);
      v33 += 2;
      ++v32;
      if (v34)
      {
        v35 = v24;
        goto LABEL_13;
      }
    }
    v35 = 0;
    v24 = v25 < 3;
  }
  while (v23 != 4);
LABEL_13:

  return v35 & 1;
}

- (uint64_t)linesIntersectLine1P1:(double)a3 line1P2:(double)a4 line2P1:(double)a5 line2P2:(double)a6
{
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  char v14;
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

  if (result)
  {
    v9 = (a9 - a7) * (a2 - a8) - (a8 - a6) * (a3 - a9);
    v10 = (a9 - a7) * (a4 - a8) - (a8 - a6) * (a5 - a9);
    v11 = (v9 > 0.0) ^ (v10 <= 0.0);
    if (v10 == 0.0)
      v11 = 0;
    v12 = (a5 - a3) * (a6 - a4) - (a4 - a2) * (a7 - a5);
    v13 = (a5 - a3) * (a8 - a4) - (a4 - a2) * (a9 - a5);
    if (v9 == 0.0)
      v11 = v10 == 0.0;
    v14 = (v12 > 0.0) ^ (v13 <= 0.0);
    if (v13 == 0.0)
      v14 = 0;
    if (v12 == 0.0)
      v14 = v13 == 0.0;
    if ((v14 & 1) == 0 && !v11)
      return 1;
    if (v12 == 0.0)
    {
      v15 = a2 >= a4 ? a2 : a4;
      v16 = a2 >= a4 ? a4 : a2;
      if (a6 <= v15 && a6 >= v16)
      {
        v17 = a3 >= a5 ? a3 : a5;
        v18 = a3 >= a5 ? a5 : a3;
        if (a7 <= v17 && a7 >= v18)
          return 1;
      }
    }
    if (v13 == 0.0)
    {
      v19 = a2 >= a4 ? a2 : a4;
      v20 = a2 >= a4 ? a4 : a2;
      if (a8 <= v19 && a8 >= v20)
      {
        v21 = a3 >= a5 ? a3 : a5;
        v22 = a3 >= a5 ? a5 : a3;
        if (a9 <= v21 && a9 >= v22)
          return 1;
      }
    }
    if (v9 == 0.0)
    {
      v23 = a6 >= a8 ? a6 : a8;
      v24 = a6 >= a8 ? a8 : a6;
      if (a2 <= v23 && a2 >= v24)
      {
        v25 = a7 >= a9 ? a7 : a9;
        v26 = a7 >= a9 ? a9 : a7;
        if (a3 <= v25 && a3 >= v26)
          return 1;
      }
    }
    if (v10 == 0.0
      && (a6 >= a8 ? (v27 = a6) : (v27 = a8),
          a6 >= a8 ? (v28 = a8) : (v28 = a6),
          a4 <= v27
       && a4 >= v28
       && (a7 >= a9 ? (v29 = a7) : (v29 = a9), a7 >= a9 ? (v30 = a9) : (v30 = a7), a5 <= v29 && a5 >= v30)))
    {
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)shortestDistanceFromCornersOfQuad:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "topLeft");
  v17[0] = v5;
  v17[1] = v6;
  objc_msgSend(v4, "topRight");
  v17[2] = v7;
  v17[3] = v8;
  objc_msgSend(v4, "bottomRight");
  v17[4] = v9;
  v17[5] = v10;
  objc_msgSend(v4, "bottomLeft");
  v11 = 0;
  v17[6] = v12;
  v17[7] = v13;
  v14 = 1.79769313e308;
  do
  {
    -[CRImageSpaceQuad shortestDistanceFromPoint:](self, "shortestDistanceFromPoint:", *(double *)&v17[v11], *(double *)&v17[v11 + 1]);
    if (v14 >= v15)
      v14 = v15;
    v11 += 2;
  }
  while (v11 != 8);

  return v14;
}

- (double)squaredDistanceFromCorrespondingCornersOfQuad:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint topRight;
  CGPoint bottomLeft;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  float64x2_t v21;
  _OWORD v23[4];
  _QWORD v24[9];

  v24[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "topLeft");
  v24[0] = v5;
  v24[1] = v6;
  objc_msgSend(v4, "topRight");
  v24[2] = v7;
  v24[3] = v8;
  objc_msgSend(v4, "bottomRight");
  v24[4] = v9;
  v24[5] = v10;
  objc_msgSend(v4, "bottomLeft");
  v11 = 0;
  v24[6] = v12;
  v24[7] = v13;
  topRight = self->_topRight;
  v23[0] = self->_topLeft;
  v23[1] = topRight;
  bottomLeft = self->_bottomLeft;
  v23[2] = self->_bottomRight;
  v23[3] = bottomLeft;
  v16 = 0.0;
  do
  {
    v17 = vsubq_f64(*(float64x2_t *)&v24[v11 / 8], (float64x2_t)v23[v11 / 0x10]);
    v18 = vsubq_f64(*(float64x2_t *)&v24[v11 / 8 + 2], (float64x2_t)v23[v11 / 0x10 + 1]);
    v19 = (int64x2_t)vmulq_f64(v18, v18);
    v20 = (int64x2_t)vmulq_f64(v17, v17);
    v21 = vaddq_f64((float64x2_t)vzip1q_s64(v20, v19), (float64x2_t)vzip2q_s64(v20, v19));
    v16 = v16 + v21.f64[0] + v21.f64[1];
    v11 += 32;
  }
  while (v11 != 64);

  return v16;
}

- (double)squaredDistanceMaxRatioFromCorrespondingCornersOfQuad:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint topRight;
  CGPoint bottomLeft;
  double v16;
  double v17;
  float64x2_t v18;
  double v19;
  _OWORD v21[4];
  _QWORD v22[9];

  v22[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "topLeft");
  v22[0] = v5;
  v22[1] = v6;
  objc_msgSend(v4, "topRight");
  v22[2] = v7;
  v22[3] = v8;
  objc_msgSend(v4, "bottomRight");
  v22[4] = v9;
  v22[5] = v10;
  objc_msgSend(v4, "bottomLeft");
  v11 = 0;
  v22[6] = v12;
  v22[7] = v13;
  topRight = self->_topRight;
  v21[0] = self->_topLeft;
  v21[1] = topRight;
  bottomLeft = self->_bottomLeft;
  v21[2] = self->_bottomRight;
  v21[3] = bottomLeft;
  v16 = 1.79769313e308;
  v17 = 2.22507386e-308;
  do
  {
    v18 = vsubq_f64(*(float64x2_t *)&v22[v11 / 8], (float64x2_t)v21[v11 / 0x10]);
    v19 = vaddvq_f64(vmulq_f64(v18, v18));
    if (v19 > v17)
      v17 = v19;
    if (v19 < v16)
      v16 = v19;
    v11 += 16;
  }
  while (v11 != 64);

  return v17 / v16;
}

- (double)shortestDistanceFromPoint:(CGPoint)a3
{
  double y;
  double x;
  BOOL v5;
  double result;
  double *v7;
  uint64_t i;
  double v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  __int128 v26;
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[CRImageSpaceQuad containsPoint:](self, "containsPoint:", a3.x, a3.y, *(_QWORD *)&self->_topLeft.x, *(_QWORD *)&self->_topLeft.y, *(_QWORD *)&self->_topRight.x, *(_QWORD *)&self->_topRight.y, *(_QWORD *)&self->_bottomRight.x, *(_QWORD *)&self->_bottomRight.y, *(_QWORD *)&self->_bottomLeft.x, *(_QWORD *)&self->_bottomLeft.y);
  result = 0.0;
  if (!v5)
  {
    v7 = (double *)&v26 + 1;
    result = 1.79769313e308;
    for (i = 1; i != 5; ++i)
    {
      v9 = *(v7 - 1);
      v10 = (double *)(&v26 + (i & 3));
      v11 = v10[1];
      v12 = *v10 - v9;
      v13 = y - *v7;
      v14 = v11 - *v7;
      v15 = v13 * v14 + (x - v9) * v12;
      v16 = v13 * v13 + (x - v9) * (x - v9);
      v17 = v14 * v14 + v12 * v12;
      *(float *)&v16 = v16;
      v18 = (y - v11) * (y - v11) + (x - *v10) * (x - *v10);
      v19 = v15 / v17;
      *(float *)&v18 = v18;
      v20 = sqrtf(*(float *)&v16);
      v21 = sqrtf(*(float *)&v18);
      if (*(float *)&v16 >= *(float *)&v18)
        v22 = v21;
      else
        v22 = v20;
      v23 = ((*v7 - y) * v12 - (v9 - x) * v14) / v17;
      v24 = sqrt(v17) * fabsf(v23);
      if (v19 < 0.0 || v19 > 1.0)
        v24 = v22;
      if (result >= v24)
        result = v24;
      v7 += 2;
    }
  }
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  __double2 v15;
  float v16;
  float v17;
  double v18;
  double v19;
  BOOL v20;
  CGPoint v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  -[CRImageSpaceQuad midPoint](self, "midPoint");
  v8 = v7;
  v10 = v9;
  if (self)
  {
    v11 = atan2(self->_topRight.y - self->_topLeft.y, self->_topRight.x - self->_topLeft.x);
    v12 = atan2(self->_bottomRight.y - self->_bottomLeft.y, self->_bottomRight.x - self->_bottomLeft.x);
    v13 = (float)((float)-v12 - v11) * 0.5;
  }
  else
  {
    v13 = 0.0;
  }
  *(float *)&v6 = v13;
  -[CRImageSpaceQuad rotatedAroundPoint:angle:](self, "rotatedAroundPoint:angle:", v8, v10, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = __sincos_stret(v13);
  v16 = (x - v8) * v15.__cosval - (y - v10) * v15.__sinval;
  v17 = (y - v10) * v15.__cosval + (x - v8) * v15.__sinval;
  v18 = v8 + v16;
  v19 = v10 + v17;
  objc_msgSend(v14, "boundingBox");
  v22.x = v18;
  v22.y = v19;
  if (CGRectContainsPoint(v23, v22))
  {
    v20 = 1;
  }
  else
  {
    objc_msgSend(v14, "boundingBox");
    v25.size.width = 1.0;
    v25.size.height = 1.0;
    v25.origin.x = v18 + -0.5;
    v25.origin.y = v19 + -0.5;
    v20 = CGRectIntersectsRect(v24, v25);
  }

  return v20;
}

- (id)cornerAngles
{
  void *v3;
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
  void *v14;
  void *v15;
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
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  _QWORD v53[5];

  v53[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[CRImageSpaceQuad bottomLeft](self, "bottomLeft");
  v5 = v4;
  v7 = v6;
  -[CRImageSpaceQuad topLeft](self, "topLeft");
  v9 = v8;
  v11 = v10;
  -[CRImageSpaceQuad topRight](self, "topRight");
  objc_msgSend(v3, "numberWithDouble:", angleBetweenPoints(v5, v7, v9, v11, v12, v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v14;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[CRImageSpaceQuad topLeft](self, "topLeft");
  v17 = v16;
  v19 = v18;
  -[CRImageSpaceQuad topRight](self, "topRight");
  v21 = v20;
  v23 = v22;
  -[CRImageSpaceQuad bottomRight](self, "bottomRight");
  objc_msgSend(v15, "numberWithDouble:", angleBetweenPoints(v17, v19, v21, v23, v24, v25));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v26;
  v27 = (void *)MEMORY[0x1E0CB37E8];
  -[CRImageSpaceQuad topRight](self, "topRight");
  v29 = v28;
  v31 = v30;
  -[CRImageSpaceQuad bottomRight](self, "bottomRight");
  v33 = v32;
  v35 = v34;
  -[CRImageSpaceQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v27, "numberWithDouble:", angleBetweenPoints(v29, v31, v33, v35, v36, v37));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v38;
  v39 = (void *)MEMORY[0x1E0CB37E8];
  -[CRImageSpaceQuad bottomRight](self, "bottomRight");
  v41 = v40;
  v43 = v42;
  -[CRImageSpaceQuad bottomLeft](self, "bottomLeft");
  v45 = v44;
  v47 = v46;
  -[CRImageSpaceQuad topLeft](self, "topLeft");
  objc_msgSend(v39, "numberWithDouble:", angleBetweenPoints(v41, v43, v45, v47, v48, v49));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (double)orthogonalityScore
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[CRImageSpaceQuad cornerAngles](self, "cornerAngles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v6 / v8;

  return v9;
}

- (BOOL)hasIntersectingEdges
{
  double x;
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  v5 = self->_bottomRight.x;
  v6 = self->_bottomRight.y;
  v7 = self->_topLeft.x;
  v8 = self->_topLeft.y;
  v9 = self->_topRight.x;
  v10 = self->_topRight.y;
  if ((-[CRImageSpaceQuad linesIntersectLine1P1:line1P2:line2P1:line2P2:]((uint64_t)self, x, y, v5, v6, v7, v8, v9, v10) & 1) != 0)
    return 1;
  else
    return -[CRImageSpaceQuad linesIntersectLine1P1:line1P2:line2P1:line2P2:]((uint64_t)self, x, y, v7, v8, v5, v6, v9, v10);
}

- (BOOL)isEqual:(id)a3
{
  CRImageSpaceQuad *v4;
  CRImageSpaceQuad *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  BOOL v18;
  double v20;
  double v21;
  BOOL v22;

  v4 = (CRImageSpaceQuad *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CRImageSpaceQuad topLeft](v5, "topLeft");
      v8 = vabdd_f64(self->_topLeft.y, v7);
      v9 = vabdd_f64(self->_topLeft.x, v6) > 0.5 || v8 > 0.5;
      if (v9
        || ((-[CRImageSpaceQuad topRight](v5, "topRight"),
             v12 = vabdd_f64(self->_topRight.y, v11),
             vabdd_f64(self->_topRight.x, v10) <= 0.5)
          ? (v13 = v12 > 0.5)
          : (v13 = 1),
            v13
         || ((-[CRImageSpaceQuad bottomRight](v5, "bottomRight"),
              v16 = vabdd_f64(self->_bottomRight.y, v15),
              vabdd_f64(self->_bottomRight.x, v14) <= 0.5)
           ? (v17 = v16 > 0.5)
           : (v17 = 1),
             v17)))
      {
        v18 = 0;
      }
      else
      {
        -[CRImageSpaceQuad bottomLeft](v5, "bottomLeft");
        v22 = vabdd_f64(self->_bottomLeft.x, v21) <= 0.5;
        v18 = vabdd_f64(self->_bottomLeft.y, v20) <= 0.5 && v22;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](+[CRImageSpaceQuad allocWithZone:](CRImageSpaceQuad, "allocWithZone:", a3), "initWithTopLeft:topRight:bottomRight:bottomLeft:", self->_topLeft.x, self->_topLeft.y, self->_topRight.x, self->_topRight.y, self->_bottomRight.x, self->_bottomRight.y, self->_bottomLeft.x, self->_bottomLeft.y);
}

- (id)crCodableDataRepresentation
{
  void *v3;

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v3);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_topLeft.x, self->_topLeft.y);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_topRight.x, self->_topRight.y);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_bottomRight.x, self->_bottomRight.y);
  +[CRCodingUtilities appendPoint:toData:](CRCodingUtilities, "appendPoint:toData:", v3, self->_bottomLeft.x, self->_bottomLeft.y);
  return v3;
}

- (CRImageSpaceQuad)initWithCRCodableDataRepresentation:(id)a3
{
  id v4;
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
  CRImageSpaceQuad *v19;
  uint64_t v21;

  v4 = a3;
  v21 = 0;
  if (+[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v4, &v21) == 1)
  {
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v21);
    v6 = v5;
    v8 = v7;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v21);
    v10 = v9;
    v12 = v11;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v21);
    v14 = v13;
    v16 = v15;
    +[CRCodingUtilities pointFromEncodingData:offset:](CRCodingUtilities, "pointFromEncodingData:offset:", v4, &v21);
    self = -[CRImageSpaceQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](self, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v6, v8, v10, v12, v14, v16, v17, v18);
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)intersectsImageMargin:(double)a3 imageSize:(CGSize)a4
{
  double v4;
  double v5;
  double y;
  float64x2_t v7;
  BOOL v8;
  double v9;
  double x;

  v4 = a4.width - a3;
  v5 = a4.height - a3;
  y = self->_topLeft.y;
  v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3, 0);
  v8 = 1;
  if (!(vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vcgeq_f64(v7, (float64x2_t)self->_topRight), (int32x4_t)vcgeq_f64(v7, (float64x2_t)self->_bottomLeft))), 0xFuLL))) & 1 | (self->_topLeft.x >= v4) | (y >= v5|| self->_topRight.x >= v4|| self->_topRight.y >= v5|| self->_bottomLeft.x >= v4|| self->_topLeft.x <= a3|| self->_bottomLeft.y >= v5))&& y > a3)
  {
    x = self->_bottomRight.x;
    v9 = self->_bottomRight.y;
    v8 = x <= a3;
    if (x >= v4)
      v8 = 1;
    if (v9 <= a3)
      v8 = 1;
    if (v9 >= v5)
      return 1;
  }
  return v8;
}

- (BOOL)entirelyContainsQuad:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v4 = a3;
  -[CRImageSpaceQuad area](self, "area");
  v6 = v5;
  objc_msgSend(v4, "area");
  v8 = 0;
  if (v6 > v7)
  {
    objc_msgSend(v4, "topLeft");
    if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
    {
      objc_msgSend(v4, "topRight");
      if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
      {
        objc_msgSend(v4, "bottomRight");
        if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
        {
          objc_msgSend(v4, "bottomLeft");
          if (-[CRImageSpaceQuad containsPoint:](self, "containsPoint:"))
            v8 = 1;
        }
      }
    }
  }

  return v8;
}

- (BOOL)intersectsQuad:(id)a3
{
  id v4;
  CGPoint topRight;
  CGPoint bottomLeft;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD v21[8];
  _OWORD v22[4];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  topRight = self->_topRight;
  v22[0] = self->_topLeft;
  v22[1] = topRight;
  bottomLeft = self->_bottomLeft;
  v22[2] = self->_bottomRight;
  v22[3] = bottomLeft;
  objc_msgSend(v4, "topLeft");
  objc_msgSend(v4, "topRight", v7, v8);
  v21[2] = v9;
  v21[3] = v10;
  objc_msgSend(v4, "bottomRight");
  v21[4] = v11;
  v21[5] = v12;
  objc_msgSend(v4, "bottomLeft");
  v13 = 0;
  v21[6] = v14;
  v21[7] = v15;
  while (2)
  {
    v16 = 0;
    v17 = v13 + 1;
    do
    {
      v18 = v13 + 1;
      if (v13 != v16)
      {
        v18 = v16 + 1;
        if ((doesLineSegmentIntersectLineSegment(*(double *)&v22[v13], *((double *)&v22[v13] + 1), *(double *)&v22[(v13 + 1) & 3], *((double *)&v22[(v13 + 1) & 3] + 1), *(double *)&v21[2 * v16], *(double *)&v21[2 * v16 + 1], *(double *)&v21[2 * ((v16 + 1) & 3)], *(double *)&v21[2 * ((v16 + 1) & 3) + 1]) & 1) != 0)goto LABEL_8;
      }
      v16 = v18;
    }
    while (v18 != 4);
    ++v13;
    if (v17 != 4)
      continue;
    break;
  }
  if (-[CRImageSpaceQuad entirelyContainsQuad:](self, "entirelyContainsQuad:", v4))
  {
LABEL_8:
    v19 = 1;
    goto LABEL_9;
  }
  v19 = objc_msgSend(v4, "entirelyContainsQuad:", self);
LABEL_9:

  return v19;
}

- (void)homographyFromSelfToQuad:(void *)a3
{
  __int128 v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[4];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(a1 + 24);
  v8[0] = *(_OWORD *)(a1 + 8);
  v8[1] = v3;
  v4 = *(_OWORD *)(a1 + 56);
  v8[2] = *(_OWORD *)(a1 + 40);
  v8[3] = v4;
  v5 = a3;
  objc_msgSend(v5, "topLeft");
  objc_msgSend(v5, "topRight", v6, v7);
  objc_msgSend(v5, "bottomRight");
  objc_msgSend(v5, "bottomLeft");

  find_homography((uint64_t)v8);
}

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
