@implementation PKPGSVSectionHeader_BackgroundProvisioningHintView

- (void)_updateFonts:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (a1)
  {
    objc_msgSend((id)a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 432) = 0xBFF0000000000000;
    v7 = v4;
    v5 = (void *)_PKFontForDesign(v4, (void *)*MEMORY[0x1E0DC1398], (void *)*MEMORY[0x1E0DC4A88], 0, 0, 0);
    objc_msgSend(*(id *)(a1 + 416), "setFont:", v5);
    objc_msgSend(*(id *)(a1 + 424), "sizeToFit");
    if ((a2 & 1) == 0)
    {
      objc_msgSend((id)a1, "setNeedsLayout");
      v6 = *(_QWORD *)(a1 + 456);
      if (v6)
        (*(void (**)(void))(v6 + 16))();
    }

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[PKPGSVSectionHeader_BackgroundProvisioningHintView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_layoutSubviewsInBounds:(double)a3 withCommitMode:(double)a4
{
  int v8;
  CGRectEdge v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  double v28;
  CGFloat v29;
  CGFloat height;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v37;
  double v38;
  CGRect remainder;
  CGRect slice;
  CGRect v41;

  if (!a1)
    return 0.0;
  v8 = objc_msgSend((id)a1, "_shouldReverseLayoutDirection");
  if (v8)
    v9 = CGRectMaxXEdge;
  else
    v9 = CGRectMinXEdge;
  objc_msgSend(*(id *)(a1 + 424), "frame");
  v11 = v10;
  v37 = v12;
  v38 = a5;
  v13 = v10 + 10.0;
  v14 = fmax(a5 - (v10 + 10.0), 0.0);
  if (*(double *)(a1 + 432) == v14)
  {
    v15 = a5;
    v16 = *(double *)(a1 + 440);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 416), "sizeThatFits:", v14, 1.79769313e308);
    v16 = fmin(v18, v14);
    if (a2)
    {
      *(double *)(a1 + 432) = v14;
      *(double *)(a1 + 440) = v16;
      *(_QWORD *)(a1 + 448) = v17;
    }
    v15 = v38;
  }
  if (v15 - v16 < v13 + v13)
    PKSizeAlignedInRect();
  PKSizeAlignedInRect();
  v23 = v19;
  v24 = v20;
  v25 = v21;
  v26 = v22;
  if ((a2 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 416), "setFrame:", v19, v20, v21, v22);
  memset(&slice, 0, sizeof(slice));
  remainder.origin.x = v23;
  remainder.origin.y = v24;
  remainder.size.width = v25;
  remainder.size.height = v26;
  objc_msgSend(*(id *)(a1 + 416), "font", v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lineHeight");
  v29 = v28;
  v41.origin.x = v23;
  v41.origin.y = v24;
  v41.size.width = v25;
  v41.size.height = v26;
  CGRectDivide(v41, &slice, &remainder, v29, CGRectMinYEdge);
  height = slice.size.height;
  v31 = -v13;
  if (v8)
    v32 = 0.0;
  else
    v32 = -v13;
  if (!v8)
    v31 = 0.0;
  v33 = v32 + slice.origin.x;
  v34 = slice.origin.y + 0.0;
  v35 = slice.size.width - (v32 + v31);
  remainder.origin.x = v32 + slice.origin.x;
  remainder.origin.y = slice.origin.y + 0.0;
  remainder.size.width = v35;
  remainder.size.height = slice.size.height;
  CGRectDivide(*(CGRect *)(&height - 3), &slice, &remainder, v11, v9);
  PKSizeAlignedInRect();
  if (a2)
    objc_msgSend(*(id *)(a1 + 424), "setFrame:");

  return v38;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPGSVSectionHeader_BackgroundProvisioningHintView;
  -[PKPGSVSectionHeader_BackgroundProvisioningHintView layoutSubviews](&v6, sel_layoutSubviews);
  -[PKPGSVSectionHeader_BackgroundProvisioningHintView bounds](self, "bounds");
  -[PKPGSVSectionHeader_BackgroundProvisioningHintView _layoutSubviewsInBounds:withCommitMode:]((uint64_t)self, 1, v3, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
