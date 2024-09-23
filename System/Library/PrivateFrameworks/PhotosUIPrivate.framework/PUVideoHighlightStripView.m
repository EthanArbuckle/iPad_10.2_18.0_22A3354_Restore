@implementation PUVideoHighlightStripView

uint64_t __49___PUVideoHighlightStripView__updateBarsExpanded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL8 v3;

  if (*(_BYTE *)(a1 + 40))
    v3 = *(_QWORD *)(a1 + 32) == a3;
  else
    v3 = 0;
  return objc_msgSend(a2, "setExpanded:animated:", v3, 1);
}

void __44___PUVideoHighlightStripView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  double y;
  double height;
  double v16;
  double x;
  double v18;
  double v19;
  double v20;
  CMTime v21;
  __int128 v22;
  _OWORD v23[2];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v5 = a2;
  objc_msgSend(v5, "setBackgroundColor:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "count") <= a3)
  {
    objc_msgSend(v5, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0, *(double *)(a1 + 48));
    memset(v23, 0, sizeof(v23));
    v22 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "CMTimeRangeValue");
    }
    else
    {
      memset(v23, 0, sizeof(v23));
      v22 = 0u;
    }

    v8 = *(double *)(a1 + 88);
    *(_OWORD *)&v21.value = v22;
    v21.epoch = *(_QWORD *)&v23[0];
    v9 = v8 * CMTimeGetSeconds(&v21);
    v10 = *(double *)(a1 + 48);
    v11 = *(double *)(a1 + 88);
    v21 = *(CMTime *)((char *)v23 + 8);
    v12 = v9 / v10;
    width = v11 * CMTimeGetSeconds(&v21) / *(double *)(a1 + 48);
    y = CGRectGetMaxY(*(CGRect *)(a1 + 56)) + -2.0;
    if (width >= 2.0)
    {
      height = 2.0;
    }
    else
    {
      v24.size.height = 2.0;
      v24.origin.x = v12;
      v24.origin.y = y;
      v24.size.width = width;
      v25 = CGRectInset(v24, (2.0 - width) * -0.5, 0.0);
      y = v25.origin.y;
      width = v25.size.width;
      height = v25.size.height;
      v12 = fmax(v25.origin.x, 0.0);
      v16 = CGRectGetMaxX(*(CGRect *)(a1 + 56)) - v25.size.width;
      if (v16 < v12)
        v12 = v16;
    }
    v26.origin.x = v12;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v27 = CGRectIntersection(v26, *(CGRect *)(a1 + 56));
    x = v27.origin.x;
    v18 = v27.origin.y;
    v19 = v27.size.width;
    v20 = v27.size.height;
    CGRectGetMinX(v27);
    CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v28.origin.x = x;
    v28.origin.y = v18;
    v28.size.width = v19;
    v28.size.height = v20;
    CGRectGetMaxX(v28);
    PXEdgeInsetsMake();
    objc_msgSend(v5, "setExpandedOutsets:");
    objc_msgSend(v5, "setHighlightColor:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setFrame:", x, v18, v19, v20);
  }

}

void __58___PUVideoHighlightStripView__updateCurrentTimeRangeIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  CMTime v9;
  CMTimeRange range;
  CMTimeRange v11;

  v7 = a2;
  v8 = v7;
  memset(&v11, 0, sizeof(v11));
  if (v7)
    objc_msgSend(v7, "CMTimeRangeValue");
  range = v11;
  v9 = *(CMTime *)(a1 + 40);
  if (CMTimeRangeContainsTime(&range, &v9))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }

}

@end
