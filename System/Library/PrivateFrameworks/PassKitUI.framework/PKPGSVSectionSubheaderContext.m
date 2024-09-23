@implementation PKPGSVSectionSubheaderContext

- (PKPGSVSectionSubheaderContext)init
{

  return 0;
}

- (unint64_t)hash
{
  __int128 v2;
  PKPGSVSectionSubheaderView *view;
  __int128 v5;
  __int128 v6;

  view = self->_view;
  v2 = *(_OWORD *)&self->_margins.bottom;
  v5 = *(_OWORD *)&self->_margins.top;
  v6 = v2;
  return PKObjectHash(&view);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float64x2_t *v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = (float64x2_t *)v4;
    if (self)
    {
      if (self->_view == *(PKPGSVSectionSubheaderView **)&v5->f64[1])
        LOBYTE(self) = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_margins.top, v5[1]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_margins.bottom, v5[2]))), 0xFuLL)));
      else
        LOBYTE(self) = 0;
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (double)positionForViewInContainerFrame:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 8), "bounds");
  v5 = v4;
  v6 = a2 + *(double *)(a1 + 24);
  objc_msgSend(*(id *)(a1 + 8), "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anchorPoint");
  v9 = v8;

  PKFloatFloorToPixel();
  v11 = v6 + v10 + v9 * v5;
  PKFloatFloorToPixel();
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
