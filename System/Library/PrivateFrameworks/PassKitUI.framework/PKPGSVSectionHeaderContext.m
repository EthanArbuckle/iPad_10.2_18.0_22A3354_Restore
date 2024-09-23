@implementation PKPGSVSectionHeaderContext

- (uint64_t)boundsForHeaderViewInContainerFrame:(double)a3
{
  uint64_t v4;
  double v5;

  if (result)
  {
    v4 = result;
    v5 = *(double *)(result + 8);
    if (a4 != v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPGSVSectionHeaderContext container width changed from %lu to %lu"), (unint64_t)v5, (unint64_t)a4);
    return objc_msgSend(*(id *)(v4 + 40), "bounds", -[PKPGSVSectionHeaderContext _headerViewSize](v4));
  }
  return result;
}

- (double)totalHeight
{
  double v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  v2 = *(double *)(a1 + 56);
  -[PKPGSVSectionHeaderContext _headerViewSize](a1);
  v4 = *(double *)(a1 + 72) + v2 + v3;
  return -[PKPGSVSectionHeaderContext _subheadersHeight](a1) + v4;
}

- (double)_headerViewSize
{
  double result;
  uint64_t v3;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 32))
    return *(double *)(a1 + 16);
  objc_msgSend(*(id *)(a1 + 40), "sizeThatFits:", *(double *)(a1 + 8) - *(double *)(a1 + 64) - *(double *)(a1 + 80), 1.79769313e308);
  *(double *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = 1;
  return result;
}

- (double)_subheadersHeight
{
  double v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = 0.0;
  if (a1)
  {
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v3 = v2;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v15;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v15 != v6)
              objc_enumerationMutation(v3);
            v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
            if (v8)
            {
              v9 = *(double *)(v8 + 16);
              objc_msgSend(*(id *)(v8 + 8), "bounds", (_QWORD)v14);
              v11 = *(double *)(v8 + 32) + v9 + v10;
            }
            else
            {
              v11 = 0.0;
            }
            v1 = v1 + v11;
            ++v7;
          }
          while (v5 != v7);
          v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v5 = v12;
        }
        while (v12);
      }

    }
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheaderContexts, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

+ (id)createUpdatedHeaderContextForGroupStackView:(void *)a3 passType:(uint64_t)a4 withState:(uint64_t)a5 currentContext:(void *)a6 allowHeader:(int)a7 allowSubheaders:(int)a8 containerWidth:
{
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 *v22;
  __int128 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  PKPGSVSectionSubheaderContext *v35;
  id v36;
  void *v37;
  id *v38;
  id *v39;
  PKPGSVSectionSubheaderContext *v40;
  double v41;
  double v42;
  PKPGSVSectionHeaderContext *v43;
  id v44;
  id v45;
  id *v46;
  id *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v53;
  id v54;
  __int128 v55;
  objc_super v56;
  __int128 v57;

  v14 = a3;
  v15 = a6;
  objc_opt_self();
  objc_msgSend(v14, "datasource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = *(_OWORD *)(a5 + 16);
    v56 = *(objc_super *)a5;
    v57 = v17;
    objc_msgSend(v16, "groupStackView:headerForPassType:withState:", v14, a4, &v56);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PKLayerNullActions();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setActions:", v21);

    }
  }
  else
  {
    v19 = 0;
  }
  v22 = (__int128 *)MEMORY[0x1E0DC49E8];
  if (a8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v53 = v15;
    v54 = v14;
    v23 = *(_OWORD *)(a5 + 16);
    v56 = *(objc_super *)a5;
    v57 = v23;
    objc_msgSend(v16, "groupStackView:subheadersWithState:", v14, &v56);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = 0;
      v55 = *v22;
      v29 = (void *)*((_QWORD *)v22 + 3);
      v30 = v25 - 1;
      do
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "layer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PKLayerNullActions();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setActions:", v33);

        if (v30 == v28)
          v34 = 36.0;
        else
          v34 = 17.0;
        v35 = [PKPGSVSectionSubheaderContext alloc];
        v36 = v31;
        v37 = v36;
        if (v35 && v36)
        {
          v56.receiver = v35;
          v56.super_class = (Class)PKPGSVSectionSubheaderContext;
          v38 = (id *)objc_msgSendSuper2(&v56, sel_init);
          v39 = v38;
          if (v38)
          {
            objc_storeStrong(v38 + 1, v31);
            *((_OWORD *)v39 + 1) = v55;
            *((double *)v39 + 4) = v34;
            v39[5] = v29;
          }
          v35 = v39;
          v40 = v35;
        }
        else
        {
          v40 = 0;
        }

        if (!v27)
          v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        ++v28;
        objc_msgSend(v27, "addObject:", v40);

      }
      while (v26 != v28);
    }
    else
    {
      v27 = 0;
    }

    v15 = v53;
    v14 = v54;
    v22 = (__int128 *)MEMORY[0x1E0DC49E8];
  }
  else
  {
    v27 = 0;
  }
  if (v19)
    v41 = 47.0;
  else
    v41 = *(double *)v22;
  if (v19)
    v42 = 17.0;
  else
    v42 = 36.0;
  v43 = [PKPGSVSectionHeaderContext alloc];
  v44 = v19;
  v45 = v27;
  if (v43)
  {
    v56.receiver = v43;
    v56.super_class = (Class)PKPGSVSectionHeaderContext;
    v46 = (id *)objc_msgSendSuper2(&v56, sel_init);
    v47 = v46;
    if (v46)
    {
      v48 = (void *)*((_QWORD *)v22 + 1);
      v49 = (void *)*((_QWORD *)v22 + 3);
      objc_storeStrong(v46 + 5, v19);
      *((double *)v47 + 7) = v41;
      v47[8] = v48;
      *((double *)v47 + 9) = v42;
      v47[10] = v49;
      *((double *)v47 + 1) = a1;
      if (objc_msgSend(v45, "count"))
      {
        v50 = objc_msgSend(v45, "copy");
        v51 = v47[6];
        v47[6] = (id)v50;
      }
      else
      {
        v51 = v47[6];
        v47[6] = 0;
      }

    }
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  double *v6;
  BOOL v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (char *)v4;
    v6 = (double *)v5;
    if (self
      && self->_headerView == (PKPGSVSectionHeaderView *)*((_QWORD *)v5 + 5)
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_headerMargins.top, *(float64x2_t *)(v5 + 56)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_headerMargins.bottom, *(float64x2_t *)(v5 + 72)))), 0xFuLL))) & 1) != 0&& PKEqualObjects())
    {
      v7 = 0;
      if (self->_cachedHeaderViewSize.width == v6[2] && self->_cachedHeaderViewSize.height == v6[3])
        v7 = self->_containerWidth == v6[1];
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPGSVSectionHeaderContext;
  -[PKPGSVSectionHeaderContext dealloc](&v2, sel_dealloc);
}

- (double)positionForHeaderViewInContainerFrame:(double)a3
{
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  if (!a1)
    return 0.0;
  v8 = *(double *)(a1 + 8);
  if (a4 != v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPGSVSectionHeaderContext container width changed from %lu to %lu"), (unint64_t)v8, (unint64_t)a4);
  -[PKPGSVSectionHeaderContext boundsForHeaderViewInContainerFrame:](a1, a2, a3, a4);
  PKSizeAlignedInRect();
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anchorPoint");

  PKFloatFloorToPixel();
  v13 = v10 + v12;
  PKFloatFloorToPixel();
  return v13;
}

- (PKPGSVSectionHeaderContext)init
{

  return 0;
}

- (unint64_t)hash
{
  __int128 v3;
  unint64_t v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  PKPGSVSectionHeaderView *headerView;
  __int128 v17;
  __int128 v18;
  CGSize cachedHeaderViewSize;
  double containerWidth;
  unint64_t v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  headerView = self->_headerView;
  v3 = *(_OWORD *)&self->_headerMargins.bottom;
  v17 = *(_OWORD *)&self->_headerMargins.top;
  v18 = v3;
  cachedHeaderViewSize = self->_cachedHeaderViewSize;
  containerWidth = self->_containerWidth;
  v4 = PKObjectHash(&headerView);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_subheaderContexts;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v21 = v4;
        v22 = 0;
        v22 = objc_msgSend(v10, "hash", (_QWORD)v12);
        v4 = PKObjectHash(&v21);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v23, 16);
    }
    while (v7);
  }

  return v4;
}

@end
