@implementation PFMessagesStackLayoutFrameSolver

- (PFMessagesStackLayoutFrameSolver)init
{
  PFMessagesStackLayoutFrameSolver *v2;
  PFMessagesStackLayoutFrameSolver *v3;
  uint64_t v4;
  NSArray *normalizedHorizontalOffsets;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFMessagesStackLayoutFrameSolver;
  v2 = -[PFMessagesStackLayoutFrameSolver init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_stackedItemsCount = 4;
    *(_OWORD *)&v2->_normalizedVerticalInsets = xmmword_1A17B6DC0;
    *(_OWORD *)&v2->_normalizedSizeTransform = xmmword_1A17B6DD0;
    v4 = objc_msgSend(&unk_1E45CB330, "copy");
    normalizedHorizontalOffsets = v3->_normalizedHorizontalOffsets;
    v3->_normalizedHorizontalOffsets = (NSArray *)v4;

  }
  return v3;
}

- (void)getGeometries:(id *)a3 count:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v17;
  double v18;
  double v19;
  id v20;
  unint64_t v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  double *p_var6;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  float v46;
  __int128 v47;
  __int128 v48;
  CGPoint var0;
  $A117520C80E9E5F1169540F63FD06D92 *v50;
  $A117520C80E9E5F1169540F63FD06D92 *v51;
  __int128 v52;
  __int128 v53;
  CGSize var1;
  double v55;
  long double __x;
  double v57;
  __int128 v58;
  CGFloat v59;
  long double v60;
  id v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v6 = -[PFMessagesStackLayoutFrameSolver stackedItemsCount](self, "stackedItemsCount", a3, a4);
  v7 = 2 * v6;
  -[PFMessagesStackLayoutFrameSolver normalizedVerticalInsets](self, "normalizedVerticalInsets");
  v9 = v8;
  v10 = 0.0;
  v62.origin.x = 0.0;
  v62.origin.y = 0.0;
  v62.size.width = 1.0;
  v62.size.height = 1.0;
  v63 = CGRectInset(v62, v9, v9);
  x = v63.origin.x;
  y = v63.origin.y;
  width = v63.size.width;
  height = v63.size.height;
  MidX = CGRectGetMidX(v63);
  v64.origin.x = x;
  v64.origin.y = y;
  v59 = height;
  v64.size.width = width;
  v64.size.height = height;
  MidY = CGRectGetMidY(v64);
  -[PFMessagesStackLayoutFrameSolver normalizedVerticalOffset](self, "normalizedVerticalOffset");
  v57 = v17;
  -[PFMessagesStackLayoutFrameSolver normalizedSizeTransform](self, "normalizedSizeTransform");
  __x = v18;
  -[PFMessagesStackLayoutFrameSolver rotationAngle](self, "rotationAngle");
  v55 = v19;
  -[PFMessagesStackLayoutFrameSolver normalizedHorizontalOffsets](self, "normalizedHorizontalOffsets");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v61 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v21 = 0;
    v22 = 0.0;
    do
    {
      if (v21 < objc_msgSend(v20, "count"))
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v10 = v24;

      }
      v22 = v22 + v10;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:atIndexedSubscript:", v25, v21);

      ++v21;
    }
    while (v6 != v21);
  }

  objc_msgSend(v61, "count");
  if (v7 != -2)
  {
    v26 = -v6;
    v27 = (float)((float)v6 * 5.0);
    v28 = v7 + 1;
    p_var6 = &a3[1].var6;
    __asm { FMOV            V0.2D, #1.0 }
    v58 = _Q0;
    do
    {
      if (v26 >= 0)
        v35 = v26;
      else
        v35 = -v26;
      v36 = 0.0;
      if (v26 <= 0)
        v37 = 0.0;
      else
        v37 = v27;
      v38 = (double)v35;
      v39 = MidX;
      v40 = MidY;
      v41 = v58;
      if (v26)
      {
        v60 = pow(__x, (double)v35);
        objc_msgSend(v61, "objectAtIndexedSubscript:", v35 - 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        v44 = v43;

        v45 = -v44;
        if (v26 > 0)
          v45 = v44;
        v39 = MidX + v45;
        v40 = MidY + v57 * v38;
        v36 = v55 * (double)v26;
        v41 = *(unint64_t *)&v60;
      }
      v46 = v37 + (float)((float)v35 * 5.0);
      *(p_var6 - 8) = v39;
      *(p_var6 - 7) = v40;
      *(p_var6 - 6) = width;
      *(p_var6 - 5) = v59;
      *(p_var6 - 4) = v46;
      *(p_var6 - 3) = v36;
      *(p_var6 - 2) = 1.0;
      *(p_var6 - 1) = fmin(v38 * 0.1, 1.0);
      *(_OWORD *)p_var6 = v41;
      p_var6 += 10;
      ++v26;
      --v28;
    }
    while (v28);
  }
  v47 = *(_OWORD *)&a3[1].var6;
  v48 = *(_OWORD *)&a3[1].var2;
  *(_OWORD *)&a3->var4 = *(_OWORD *)&a3[1].var4;
  *(_OWORD *)&a3->var6 = v47;
  var0 = a3[1].var0;
  a3->var1 = a3[1].var1;
  *(_OWORD *)&a3->var2 = v48;
  a3->var0 = var0;
  *(double *)&v48 = a3->var6 * 0.9;
  a3->var4 = 0.0;
  a3->var2 = a3->var2 + 5.0;
  a3->var5 = a3[1].var5;
  *(_QWORD *)&a3->var6 = v48;
  v50 = &a3[v7 + 2];
  v51 = &a3[v7 | 1];
  v52 = *(_OWORD *)&v51->var6;
  v53 = *(_OWORD *)&v51->var2;
  *(_OWORD *)&v50->var4 = *(_OWORD *)&v51->var4;
  *(_OWORD *)&v50->var6 = v52;
  var1 = v51->var1;
  v50->var0 = v51->var0;
  v50->var1 = var1;
  *(_OWORD *)&v50->var2 = v53;
  v50->var6 = v50->var6 * 0.9;
  v50->var4 = 0.0;
  v50->var2 = v50->var2 + 5.0;

}

- (int64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (void)setStackedItemsCount:(int64_t)a3
{
  self->_stackedItemsCount = a3;
}

- (double)normalizedVerticalInsets
{
  return self->_normalizedVerticalInsets;
}

- (void)setNormalizedVerticalInsets:(double)a3
{
  self->_normalizedVerticalInsets = a3;
}

- (double)normalizedVerticalOffset
{
  return self->_normalizedVerticalOffset;
}

- (void)setNormalizedVerticalOffset:(double)a3
{
  self->_normalizedVerticalOffset = a3;
}

- (double)normalizedSizeTransform
{
  return self->_normalizedSizeTransform;
}

- (void)setNormalizedSizeTransform:(double)a3
{
  self->_normalizedSizeTransform = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (NSArray)normalizedHorizontalOffsets
{
  return self->_normalizedHorizontalOffsets;
}

- (void)setNormalizedHorizontalOffsets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedHorizontalOffsets, 0);
}

@end
