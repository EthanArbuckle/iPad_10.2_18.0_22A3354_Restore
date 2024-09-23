@implementation CRLUSDZImageHitTestManager

- (CRLUSDZImageHitTestManager)initWith:(id)a3 naturalBounds:(CGRect)a4 canvasViewScale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  CRLUSDZImageHitTestManager *v13;
  CRLUSDZImageHitTestManager *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect *p_imageVisibleRect;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  objc_class *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  double v31;
  double v32;
  uint64_t v33;
  id v34;
  objc_super v36;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CRLUSDZImageHitTestManager;
  v13 = -[CRLUSDZImageHitTestManager init](&v36, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_imageAsset, a3);
    v14->_naturalBounds.origin.y = y;
    v14->_naturalBounds.size.width = width;
    v14->_naturalBounds.size.height = height;
    v14->_canvasViewScale = a5;
    v14->_naturalBounds.origin.x = x;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "temporaryProviderForAsset:shouldValidate:", v12, 1));

    if (v16 && (objc_msgSend(v16, "isError") & 1) == 0)
    {
      objc_msgSend(v16, "naturalSize");
      v14->_imageNaturalRect.origin.x = sub_10005FDDC();
      v14->_imageNaturalRect.origin.y = v30;
      v14->_imageNaturalRect.size.width = v31;
      v14->_imageNaturalRect.size.height = v32;
      v14->_ctx = sub_10040FA64(2, v31, v32);
      p_imageVisibleRect = &v14->_imageVisibleRect;
      objc_opt_class(v14, v33);
      objc_msgSend(v34, "p_visibleBoundsInContext:withImageProvider:canvasViewScale:", v14->_ctx, v16, a5);
      v26 = 1;
      v27 = 64;
      v28 = 56;
      v29 = 48;
    }
    else
    {
      -[CRLUSDZImageHitTestManager naturalBounds](v14, "naturalBounds");
      v14->_imageVisibleRect.origin.x = v17;
      v14->_imageVisibleRect.origin.y = v18;
      v14->_imageVisibleRect.size.width = v19;
      v14->_imageVisibleRect.size.height = v20;
      p_imageVisibleRect = &v14->_imageNaturalRect;
      -[CRLUSDZImageHitTestManager naturalBounds](v14, "naturalBounds");
      v26 = 0;
      v27 = 32;
      v28 = 24;
      v29 = 16;
    }
    *(_QWORD *)&p_imageVisibleRect->origin.x = v22;
    *(Class *)((char *)&v14->super.isa + v29) = v23;
    *(Class *)((char *)&v14->super.isa + v28) = v24;
    *(Class *)((char *)&v14->super.isa + v27) = v25;
    v14->_visibleBoundsComputedFromAsset = v26;
    -[CRLUSDZImageHitTestManager setNaturalBounds:](v14, "setNaturalBounds:", x, y, width, height);

  }
  return v14;
}

- (void)dealloc
{
  CGContext *ctx;
  objc_super v4;

  ctx = self->_ctx;
  if (ctx)
    CGContextRelease(ctx);
  v4.receiver = self;
  v4.super_class = (Class)CRLUSDZImageHitTestManager;
  -[CRLUSDZImageHitTestManager dealloc](&v4, "dealloc");
}

- (void)setNaturalBounds:(CGRect)a3
{
  double height;
  double v5;
  double v6;
  double y;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;

  height = a3.size.height;
  self->_naturalBounds = a3;
  v5 = 1.0;
  if (a3.size.width == 0.0)
  {
    v6 = 1.0;
  }
  else
  {
    v6 = 1.0;
    if (height != 0.0)
    {
      v5 = a3.size.width / self->_imageNaturalRect.size.width;
      v6 = height / self->_imageNaturalRect.size.height;
    }
  }
  self->_visibleBounds = self->_imageVisibleRect;
  y = self->_visibleBounds.origin.y;
  v8 = v5 * self->_visibleBounds.origin.x;
  v9 = self->_visibleBounds.size.height;
  v10 = v5 * self->_visibleBounds.size.width;
  self->_scale.width = v5;
  self->_scale.height = v6;
  v11 = v6 * y;
  self->_visibleBounds.origin.x = v8;
  self->_visibleBounds.origin.y = v6 * y;
  v12 = v6 * v9;
  self->_visibleBounds.size.width = v10;
  self->_visibleBounds.size.height = v12;
  sub_100062790(v8, v11, v10, v12);
  self->_visibleContentRect.origin.x = v13;
  self->_visibleContentRect.origin.y = v14;
  self->_visibleContentRect.size.width = v15;
  self->_visibleContentRect.size.height = v16;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  CGContext *ctx;
  _BOOL4 v9;
  _BOOL4 v10;
  BOOL v11;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  _BYTE *Data;
  BOOL v21;
  double *v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  unint64_t v29;
  double v30;
  double v31;
  unint64_t v32;
  char *v33;
  int v34;
  unint64_t v35;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  ctx = self->_ctx;
  v9 = CGRectContainsPoint(self->_visibleBounds, a3);
  v10 = v9;
  if (ctx)
  {
    LOBYTE(v9) = 0;
    v11 = !v10;
  }
  else
  {
    v11 = 1;
  }
  if (!v11)
  {
    if (self->_scale.width != 0.0 && self->_scale.height != 0.0)
    {
      Width = CGBitmapContextGetWidth(self->_ctx);
      Height = CGBitmapContextGetHeight(self->_ctx);
      BytesPerRow = CGBitmapContextGetBytesPerRow(self->_ctx);
      v15 = BytesPerRow * Height;
      v16 = (unint64_t)(x / self->_scale.width);
      v17 = (unint64_t)(self->_imageNaturalRect.size.height - y / self->_scale.height);
      v18 = v16 + BytesPerRow * v17;
      if (v18 < BytesPerRow * Height)
      {
        v19 = BytesPerRow;
        Data = CGBitmapContextGetData(self->_ctx);
        if (Data[v18])
        {
          v21 = 1;
LABEL_21:
          LOBYTE(v9) = v21;
          return v9;
        }
        v22 = (double *)&unk_100EF02F0;
        if (!v4)
          v22 = (double *)&unk_100EF02E8;
        v23 = *v22 / self->_canvasViewScale;
        v24 = vcvtpd_u64_f64(v23 + v23);
        if (v16 + (v24 >> 1) >= Width - 1)
          v25 = Width - 1;
        else
          v25 = v16 + (v24 >> 1);
        v26 = v17 - (v24 >> 1);
        if (v17 + (v24 >> 1) >= Height - 1)
          v27 = Height - 1;
        else
          v27 = v17 + (v24 >> 1);
        if (v26 <= v27)
        {
          v21 = 0;
          v28 = v23 * v23;
          v29 = v16 - (v24 >> 1);
          v30 = (double)v17;
          v31 = (double)v16;
          v32 = v19 * v26;
          v33 = &Data[v19 * v26];
          do
          {
            v34 = v21;
            if (v29 <= v25 && !v21)
            {
              v35 = v29;
              do
              {
                if (sub_10006010C(v31, v30, (double)v35, (double)v26) < v28 && v32 + v35 < v15)
                  v21 = v33[v35] != 0;
                ++v35;
                v34 = v21;
              }
              while (v35 <= v25 && !v21);
            }
            if (++v26 > v27)
              break;
            v33 += v19;
            v32 += v19;
          }
          while (!v34);
          goto LABEL_21;
        }
      }
      v21 = 0;
      goto LABEL_21;
    }
    LOBYTE(v9) = 0;
  }
  return v9;
}

+ (CGRect)p_visibleBoundsInContext:(CGContext *)a3 withImageProvider:(id)a4 canvasViewScale:(double)a5
{
  id v8;
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
  CGRect result;

  v8 = a4;
  CGContextSaveGState(a3);
  CGContextSetInterpolationQuality(a3, kCGInterpolationNone);
  objc_msgSend(v8, "naturalSize");
  v9 = sub_10005FDDC();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v8, "drawImageInContext:rect:", a3);

  CGContextRestoreGState(a3);
  _objc_msgSend(a1, "p_visibleBoundsInContext:naturalRect:canvasViewScale:", a3, v9, v11, v13, v15, a5);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGRect)p_visibleBoundsInContext:(CGContext *)a3 naturalRect:(CGRect)a4 canvasViewScale:(double)a5
{
  char *Data;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  uint64_t v11;
  size_t v13;
  size_t v14;
  char *v15;
  int v16;
  _BOOL4 v17;
  size_t v18;
  size_t v19;
  char *v20;
  int v21;
  _BOOL4 v22;
  char *v23;
  char *v24;
  size_t v25;
  int v26;
  _BOOL4 v27;
  unint64_t v28;
  char *v29;
  size_t v30;
  int v31;
  _BOOL4 v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  CGRect v37;
  CGRect result;

  Data = (char *)CGBitmapContextGetData(a3);
  Width = CGBitmapContextGetWidth(a3);
  Height = CGBitmapContextGetHeight(a3);
  BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
  if (Height)
  {
    v13 = Height;
    do
    {
      if (Width)
      {
        v14 = 0;
        v15 = &Data[(v13 - 1) * BytesPerRow];
        do
        {
          v16 = v15[v14];
          v17 = v15[v14++] != 0;
        }
        while (v14 < Width && !v16);
      }
      else
      {
        v17 = 0;
      }
      v13 -= !v17;
    }
    while (v13 && !v17);
    if (v13)
    {
      v18 = 0;
      do
      {
        if (Width)
        {
          v19 = 0;
          v20 = &Data[v18 * BytesPerRow];
          do
          {
            v21 = v20[v19];
            v22 = v20[v19++] != 0;
          }
          while (v19 < Width && !v21);
        }
        else
        {
          v22 = 0;
        }
        v18 += !v22;
      }
      while (v18 < v13 && !v22);
      if (!Width)
        goto LABEL_45;
      goto LABEL_25;
    }
  }
  else
  {
    v13 = 0;
  }
  v18 = 0;
  if (!Width)
  {
LABEL_45:
    v28 = 0;
    goto LABEL_46;
  }
LABEL_25:
  v23 = &Data[BytesPerRow * v18];
  do
  {
    if (v13 <= v18)
    {
      v27 = 0;
    }
    else
    {
      v24 = &v23[Width - 1];
      v25 = v18 + 1;
      do
      {
        v26 = *v24;
        v27 = *v24 != 0;
        if (v25 >= v13)
          break;
        ++v25;
        v24 += BytesPerRow;
      }
      while (!v26);
    }
    Width -= !v27;
  }
  while (Width && !v27);
  if (!Width)
    goto LABEL_45;
  v28 = 0;
  do
  {
    if (v13 <= v18)
    {
      v32 = 0;
    }
    else
    {
      v29 = &v23[v28];
      v30 = v18 + 1;
      do
      {
        v31 = *v29;
        v32 = *v29 != 0;
        if (v30 >= v13)
          break;
        ++v30;
        v29 += BytesPerRow;
      }
      while (!v31);
    }
    v28 += !v32;
  }
  while (v28 < Width && !v32);
LABEL_46:
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)BytesPerRow, *(Swift::String *)&v11);
  if (v13 != v18 && Width != v28)
  {
    v37.size.width = (double)(Width - v28);
    v37.origin.x = v33 + (double)v28;
    v37.origin.y = v34 + (double)(Height - v13);
    v37.size.height = (double)(v13 - v18);
    *(CGRect *)&v33 = CGRectInset(v37, a5 * -25.0, a5 * -25.0);
  }
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (_TtC8Freeform8CRLAsset)imageAsset
{
  return self->_imageAsset;
}

- (BOOL)visibleBoundsComputedFromAsset
{
  return self->_visibleBoundsComputedFromAsset;
}

- (CGRect)naturalBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_naturalBounds.origin.x;
  y = self->_naturalBounds.origin.y;
  width = self->_naturalBounds.size.width;
  height = self->_naturalBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isEmpty
{
  return self->_isEmpty;
}

- (double)canvasViewScale
{
  return self->_canvasViewScale;
}

- (CGRect)visibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleContentRect.origin.x;
  y = self->_visibleContentRect.origin.y;
  width = self->_visibleContentRect.size.width;
  height = self->_visibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleBounds.origin.x;
  y = self->_visibleBounds.origin.y;
  width = self->_visibleBounds.size.width;
  height = self->_visibleBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAsset, 0);
}

@end
