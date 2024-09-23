@implementation OADSubBlip

- (OADSubBlip)initWithData:(id)a3 type:(int)a4
{
  id v7;
  id v8;
  OADSubBlip *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADSubBlip;
  v8 = -[OADSubBlip init](&v11, sel_init);
  v9 = (OADSubBlip *)v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 3, a3);
    *((_DWORD *)&v9->super.super.mLoaded + 1) = a4;
    if (v7)
      LODWORD(v9->mSizeInPoints.height) = objc_msgSend(v7, "length");
  }

  return v9;
}

- (BOOL)isLoaded
{
  objc_super v3;

  if (!*(_QWORD *)&self->mType)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)OADSubBlip;
  return -[OCDDelayedNode isLoaded](&v3, sel_isLoaded);
}

- (void)setData:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->mType, a3);
  v5 = v6;
  if (v6)
  {
    LODWORD(self->mSizeInPoints.height) = objc_msgSend(v6, "length");
    v5 = v6;
  }

}

- (int)type
{
  return *((_DWORD *)&self->super.super.mLoaded + 1);
}

- (id)data
{
  return *(id *)&self->mType;
}

- (void)setSizeInPoints:(CGSize)a3
{
  *(CGSize *)&self->mData = a3;
}

- (void)setFrame:(CGRect)a3
{
  *(CGRect *)&self->mSizeInBytes = a3;
}

- (void)setSizeInBytes:(int)a3
{
  LODWORD(self->mSizeInPoints.height) = a3;
}

- (void)setType:(int)a3
{
  *((_DWORD *)&self->super.super.mLoaded + 1) = a3;
}

- (CGSize)sizeInPoints
{
  NSData *mData;
  double width;
  CGSize result;

  mData = self->mData;
  width = self->mSizeInPoints.width;
  result.height = width;
  result.width = *(double *)&mData;
  return result;
}

- (int)sizeInBytes
{
  return LODWORD(self->mSizeInPoints.height);
}

- (CGRect)frame
{
  double v2;
  double x;
  double y;
  double width;
  CGRect result;

  v2 = *(double *)&self->mSizeInBytes;
  x = self->mFrame.origin.x;
  y = self->mFrame.origin.y;
  width = self->mFrame.size.width;
  result.size.height = width;
  result.size.width = y;
  result.origin.y = x;
  result.origin.x = v2;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  int8x16_t v5;

  v3 = *((unsigned int *)&self->super.super.mLoaded + 1);
  v4 = objc_msgSend(*(id *)&self->mType, "hash");
  v5 = veorq_s8((int8x16_t)vcvtq_u64_f64(*(float64x2_t *)&self->mData), (int8x16_t)vcvtq_u64_f64(*(float64x2_t *)&self->mFrame.origin.y));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v5.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL)) ^ (unint64_t)*(double *)&self->mSizeInBytes ^ v4 ^ (unint64_t)self->mFrame.origin.x ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  objc_object **v6;
  int v7;
  NSData *mData;
  double width;
  double v10;
  double v11;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  BOOL v21;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v5 = (objc_object **)v4;
  v6 = v5;
  if (!v5)
    goto LABEL_12;
  v7 = *((_DWORD *)&self->super.super.mLoaded + 1);
  if (v7 != objc_msgSend(v5, "type")
    || !TCObjectEqual(*(objc_object **)&self->mType, v6[3]))
  {
    goto LABEL_12;
  }
  mData = self->mData;
  width = self->mSizeInPoints.width;
  objc_msgSend(v6, "sizeInPoints");
  if (*(double *)&mData != v11 || width != v10)
    goto LABEL_12;
  v13 = *(double *)&self->mSizeInBytes;
  x = self->mFrame.origin.x;
  y = self->mFrame.origin.y;
  v16 = self->mFrame.size.width;
  objc_msgSend(v6, "frame");
  v24.origin.x = v17;
  v24.origin.y = v18;
  v24.size.width = v19;
  v24.size.height = v20;
  v23.origin.x = v13;
  v23.origin.y = x;
  v23.size.width = y;
  v23.size.height = v16;
  v21 = CGRectEqualToRect(v23, v24);
LABEL_13:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mType, 0);
}

@end
