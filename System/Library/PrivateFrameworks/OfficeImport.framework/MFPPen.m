@implementation MFPPen

- (MFPPen)init
{
  MFPPen *result;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFPPen;
  result = -[MFPPen init](&v6, sel_init);
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x24BDBD8B8];
    result->mWidth = 1.0;
    v5 = v3[1];
    v4 = v3[2];
    *(_OWORD *)&result->mTransform.a = *v3;
    *(_OWORD *)&result->mTransform.c = v5;
    *(_OWORD *)&result->mTransform.tx = v4;
    *(_QWORD *)&result->mStartCap = 0;
    *(_QWORD *)&result->mLineJoin = 0x4120000000000000;
    *(_QWORD *)&result->mDashStyle = 0;
  }
  return result;
}

- (void)dealloc
{
  float *mDashPattern;
  float *mCompoundArray;
  objc_super v5;

  mDashPattern = self->mDashPattern;
  if (mDashPattern)
    MEMORY[0x22E2DD3F0](mDashPattern, 0x1000C8052888210);
  mCompoundArray = self->mCompoundArray;
  if (mCompoundArray)
    MEMORY[0x22E2DD3F0](mCompoundArray, 0x1000C8052888210);
  v5.receiver = self;
  v5.super_class = (Class)MFPPen;
  -[MFPPen dealloc](&v5, sel_dealloc);
}

- (id)brush
{
  return self->mBrush;
}

- (void)setBrush:(id)a3
{
  objc_storeStrong((id *)&self->mBrush, a3);
}

- (float)width
{
  return self->mWidth;
}

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransform.c = v4;
  *(_OWORD *)&self->mTransform.a = v3;
}

- (int)startCap
{
  return self->mStartCap;
}

- (void)setStartCap:(int)a3
{
  self->mStartCap = a3;
}

- (int)endCap
{
  return self->mEndCap;
}

- (void)setEndCap:(int)a3
{
  self->mEndCap = a3;
}

- (int)lineJoin
{
  return self->mLineJoin;
}

- (void)setLineJoin:(int)a3
{
  self->mLineJoin = a3;
}

- (float)miterLimit
{
  return self->mMiterLimit;
}

- (void)setMiterLimit:(float)a3
{
  self->mMiterLimit = a3;
}

- (int)dashStyle
{
  return self->mDashStyle;
}

- (void)setDashStyle:(int)a3
{
  self->mDashStyle = a3;
}

- (int)dashCap
{
  return self->mDashCap;
}

- (void)setDashCap:(int)a3
{
  self->mDashCap = a3;
}

- (float)dashOffset
{
  return self->mDashOffset;
}

- (void)setDashOffset:(float)a3
{
  self->mDashOffset = a3;
}

- (int)dashPatternCount
{
  return self->mDashPatternCount;
}

- (const)dashPattern
{
  return self->mDashPattern;
}

- (void)setDashPattern:(const float *)a3 count:(int)a4
{
  size_t v6;
  float *v7;

  self->mDashPatternCount = a4;
  v6 = 4 * a4;
  v7 = (float *)operator new[]();
  self->mDashPattern = v7;
  memcpy(v7, a3, v6);
}

- (int)alignment
{
  return self->mAlignment;
}

- (void)setAlignment:(int)a3
{
  self->mAlignment = a3;
}

- (int)compoundArrayCount
{
  return self->mCompoundArrayCount;
}

- (const)compoundArray
{
  return self->mCompoundArray;
}

- (void)setCompoundArray:(const float *)a3 count:(int)a4
{
  size_t v6;
  float *v7;

  self->mCompoundArrayCount = a4;
  v6 = 4 * a4;
  v7 = (float *)operator new[]();
  self->mCompoundArray = v7;
  memcpy(v7, a3, v6);
}

- (id)customStartCap
{
  return self->mCustomStartCap;
}

- (void)setCustomStartCap:(id)a3
{
  objc_storeStrong((id *)&self->mCustomStartCap, a3);
}

- (id)customEndCap
{
  return self->mCustomEndCap;
}

- (void)setCustomEndCap:(id)a3
{
  objc_storeStrong((id *)&self->mCustomEndCap, a3);
}

- (void)setDashPattern:(const float *)a3 count:(int)a4 toPath:(id)a5
{
  uint64_t v8;
  float mWidth;
  uint64_t v10;
  double *v11;
  float v12;
  id v13;

  v13 = a5;
  v8 = operator new[]();
  mWidth = self->mWidth;
  if (a4 >= 1)
  {
    v10 = a4;
    v11 = (double *)v8;
    do
    {
      v12 = *a3++;
      *v11++ = (float)(v12 * mWidth);
      --v10;
    }
    while (v10);
  }
  objc_msgSend(v13, "setLineDash:count:phase:", v8, a4, (float)(self->mDashOffset * mWidth));
  MEMORY[0x22E2DD3F0](v8, 0x1000C8000313F17);

}

- (void)applyDashPatternToPath:(id)a3
{
  double v4;
  float *v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float *v12;
  float *v13;
  float v14;
  id v15;

  v15 = a3;
  v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dashPattern;
  switch(self->mDashStyle)
  {
    case 0:
      goto LABEL_16;
    case 1:
      goto LABEL_5;
    case 2:
      v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dotPattern;
      goto LABEL_5;
    case 3:
      v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dashDotPattern;
      goto LABEL_5;
    case 4:
      v5 = (float *)&-[MFPPen applyDashPatternToPath:]::dashDotDotPattern;
LABEL_5:
      v6 = 0;
      LODWORD(v4) = -1.0;
      do
        v7 = v5[v6++];
      while (v7 != -1.0);
      v8 = (v6 - 1);
      goto LABEL_8;
    case 5:
      -[MFPPen setDashPattern:count:toPath:](self, "setDashPattern:count:toPath:", self->mDashPattern, self->mDashPatternCount, v15);
      goto LABEL_16;
    default:
      v5 = 0;
      v8 = 0;
LABEL_8:
      if (self->mDashCap)
      {
        v9 = operator new[]();
        v10 = v9;
        if (v8 >= 2)
        {
          v11 = v8 >> 1;
          v12 = (float *)(v9 + 4);
          v13 = v5 + 1;
          do
          {
            *(v12 - 1) = *(v13 - 1) + -1.0;
            v14 = *v13;
            v13 += 2;
            *v12 = v14 + 1.0;
            v12 += 2;
            --v11;
          }
          while (v11);
        }
        -[MFPPen setDashPattern:count:toPath:](self, "setDashPattern:count:toPath:", v9, v8, v15);
        MEMORY[0x22E2DD3F0](v10, 0x1000C8052888210);
      }
      else
      {
        -[MFPPen setDashPattern:count:toPath:](self, "setDashPattern:count:toPath:", v5, v8, v15, v4);
      }
LABEL_16:

      return;
  }
}

- (void)applyLineJoinToPath:(id)a3
{
  id v4;
  int mLineJoin;
  uint64_t v6;
  id v7;

  v4 = a3;
  mLineJoin = self->mLineJoin;
  if (mLineJoin == 2)
    v6 = 1;
  else
    v6 = 2 * (mLineJoin == 1);
  v7 = v4;
  objc_msgSend(v4, "setLineJoinStyle:", v6);
  objc_msgSend(v7, "setMiterLimit:", self->mMiterLimit);

}

- (void)applyLineCapToPath:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = 1;
  switch(self->mStartCap)
  {
    case 1:
    case 0x11:
      v5 = 2;
      break;
    case 2:
    case 0x12:
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = v4;
  objc_msgSend(v4, "setLineCapStyle:", v5);

}

- (void)applyDashCapToPath:(id)a3
{
  id v4;
  uint64_t mDashCap;
  uint64_t v6;
  id v7;

  v4 = a3;
  mDashCap = self->mDashCap;
  if (mDashCap > 3)
    v6 = 0;
  else
    v6 = qword_22A4C0D68[mDashCap];
  v7 = v4;
  objc_msgSend(v4, "setLineCapStyle:", v6);

}

- (void)strokePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->mDashStyle)
    -[MFPPen applyDashCapToPath:](self, "applyDashCapToPath:", v4);
  else
    -[MFPPen applyLineCapToPath:](self, "applyLineCapToPath:", v4);
  -[MFPPen applyLineJoinToPath:](self, "applyLineJoinToPath:", v8);
  -[MFPPen applyDashPatternToPath:](self, "applyDashPatternToPath:", v8);
  -[MFPPen brush](self, "brush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");
  -[MFPPen width](self, "width");
  objc_msgSend(v8, "setLineWidth:", v7);
  objc_msgSend(v8, "stroke");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCustomEndCap, 0);
  objc_storeStrong((id *)&self->mCustomStartCap, 0);
  objc_storeStrong((id *)&self->mBrush, 0);
}

@end
