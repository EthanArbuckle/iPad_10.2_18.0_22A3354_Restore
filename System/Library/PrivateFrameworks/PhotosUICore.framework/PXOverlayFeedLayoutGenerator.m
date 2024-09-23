@implementation PXOverlayFeedLayoutGenerator

- (void)setVisibleOrigin:(CGPoint)a3 updateFirstItemPosition:(BOOL)a4
{
  _BOOL4 v5;

  if (a3.x != self->_visibleOrigin.x || a3.y != self->_visibleOrigin.y)
  {
    v5 = a4;
    -[PXOverlayFeedLayoutGenerator setVisibleOrigin:](self, "setVisibleOrigin:");
    if (v5)
      -[PXCachingLayoutGenerator invalidate](self, "invalidate");
  }
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6
{
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  CGRect *v23;
  double MaxY;
  double v25;
  void *v26;
  void *v27;

  v12 = -[PXOverlayFeedLayoutGenerator itemCount](self, "itemCount");
  -[PXOverlayFeedLayoutGenerator metrics](self, "metrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "referenceSize");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v13, "contentInsets");
  v19 = v18;
  v21 = v20;
  if (v15 > 0.0)
  {
    if (v12)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOverlayFeedLayoutGenerator.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemCount > 0"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOverlayFeedLayoutGenerator.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("referenceSize.width > 0"));

  if (!v12)
    goto LABEL_10;
LABEL_3:
  v22 = 0;
  v23 = a4;
  do
  {
    -[PXOverlayFeedLayoutGenerator _frameForItemAtIndex:in:verticalOffset:](self, "_frameForItemAtIndex:in:verticalOffset:", v22, a4, 0.0);
    v23->origin = 0u;
    v23->size = 0u;
    ++v23;
    a5[v22] = 0;
    a6[v22++] = -1.0;
  }
  while (v12 != v22);
LABEL_5:
  *a6 = 0.0;
  a3->width = v15;
  MaxY = CGRectGetMaxY(a4[v12 - 1]);
  if (v12 > 1)
  {
    v25 = v21 + v19 + MaxY;
    MaxY = v17 + CGRectGetMinY(a4[1]) - v19;
    if (v25 >= MaxY)
      MaxY = v25;
  }
  a3->height = MaxY;

}

- ($AD15B6C785738E514ABCC493A298F7F8)_frameForItemAtIndex:(SEL)a3 in:(int64_t)a4 verticalOffset:(CGRect *)a5
{
  double v10;
  double v11;
  int v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double MaxY;
  void *v33;
  double v34;
  $AD15B6C785738E514ABCC493A298F7F8 *result;
  BOOL v36;
  BOOL v37;
  id v38;

  -[PXOverlayFeedLayoutGenerator metrics](self, "metrics", a4, a5);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "referenceSize");
  if (!a4)
  {
    v17 = v10;
    v18 = v11;
    objc_msgSend(v38, "contentInsets");
    v20 = v18 + v19;
    objc_msgSend(v38, "firstRowTopMargin");
    a6 = v21 + v20;
    -[PXOverlayFeedLayoutGenerator visibleOrigin](self, "visibleOrigin");
    v23 = v22;
    v24 = 0.0;
LABEL_18:
    v33 = v38;
    goto LABEL_19;
  }
  v12 = objc_msgSend(v38, "useSimpleLayout");
  v13 = -[PXOverlayFeedLayoutGenerator itemCount](self, "itemCount");
  v14 = a4 - 1;
  v15 = (a4 - 1) % 15;
  if (!v12)
    v14 = (a4 - 1) % 15;
  if ((v12 & 1) != 0)
  {
LABEL_5:
    v16 = 4;
  }
  else
  {
    v16 = (v13 - 1) % 15;
    if (15 * ((v13 - 1) / 15) >= a4)
    {
      v25 = 1;
      if ((unint64_t)v15 < 0xE)
        v25 = 2;
      v26 = v15 < 12;
LABEL_13:
      if (v26)
        v16 = 4;
      else
        v16 = v25;
    }
    else
    {
      switch(v16)
      {
        case 1:
          break;
        case 2:
        case 3:
          v16 = 2;
          break;
        case 5:
          v36 = v15 < 4;
          goto LABEL_31;
        case 6:
          v37 = v15 < 4;
          goto LABEL_35;
        case 7:
          v25 = 1;
          if ((unint64_t)v15 < 6)
            v25 = 2;
          v26 = v15 < 4;
          goto LABEL_13;
        case 9:
          v36 = v15 < 8;
          goto LABEL_31;
        case 10:
          v37 = v15 < 8;
          goto LABEL_35;
        case 11:
          v25 = 1;
          if ((unint64_t)v15 < 0xA)
            v25 = 2;
          v26 = v15 < 8;
          goto LABEL_13;
        case 13:
          v36 = v15 < 12;
LABEL_31:
          if (v36)
            v16 = 4;
          else
            v16 = 1;
          break;
        case 14:
          v37 = v15 < 12;
LABEL_35:
          if (v37)
            v16 = 4;
          else
            v16 = 2;
          break;
        default:
          goto LABEL_5;
      }
    }
  }
  v27 = v14 % v16;
  -[PXOverlayFeedLayoutGenerator _frameForItemInColumn:columnCount:verticalOffset:](self, "_frameForItemInColumn:columnCount:verticalOffset:", v14 % v16, v16, a6);
  v24 = v28;
  v23 = v29;
  v17 = v30;
  v18 = v31;
  if (v27 != v16 - 1)
    goto LABEL_18;
  MaxY = CGRectGetMaxY(*(CGRect *)&v28);
  objc_msgSend(v38, "interItemSpacing");
  v33 = v38;
  a6 = MaxY + v34;
LABEL_19:
  retstr->var0.origin.x = v24;
  retstr->var0.origin.y = v23;
  retstr->var0.size.width = v17;
  retstr->var0.size.height = v18;
  retstr->var1 = a6;

  return result;
}

- (CGRect)_frameForItemInColumn:(int64_t)a3 columnCount:(int64_t)a4 verticalOffset:(double)a5
{
  void *v8;
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
  CGRect result;

  -[PXOverlayFeedLayoutGenerator metrics](self, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "referenceSize");
  objc_msgSend(v8, "contentInsets");
  PXEdgeInsetsInsetSize();
  v10 = v9;
  objc_msgSend(v8, "interItemSpacing");
  v12 = v11;
  if (a4 < 2)
    objc_msgSend(v8, "largeItemAspectRatio");
  else
    objc_msgSend(v8, "regularItemAspectRatio");
  v14 = (v10 - v12 * (double)(a4 - 1)) / (double)a4;
  v15 = v14 / v13;
  objc_msgSend(v8, "contentInsets");
  v17 = v16 + (v12 + v14) * (double)a3;

  v18 = v17;
  v19 = a5;
  v20 = v14;
  v21 = v15;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPoint)visibleOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_visibleOrigin.x;
  y = self->_visibleOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  self->_visibleOrigin = a3;
}

@end
