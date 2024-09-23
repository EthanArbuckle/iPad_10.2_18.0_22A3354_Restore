@implementation PKPassThumbnailView

- (PKPassThumbnailView)init
{

  return 0;
}

- (PKPassThumbnailView)initWithCoder:(id)a3
{

  return 0;
}

- (PKPassThumbnailView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (id)initWithPass:(uint64_t)a3 suppressedContent:(void *)a4 rendererState:(int)a5 options:
{
  id v10;
  id v11;
  id *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  id v21;
  objc_super v23;

  v10 = a2;
  v11 = a4;
  if (a1 && v10)
  {
    v23.receiver = a1;
    v23.super_class = (Class)PKPassThumbnailView;
    v12 = (id *)objc_msgSendSuper2(&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v13 = (uint64_t)v12;
    if (v12)
    {
      objc_storeStrong(v12 + 59, a2);
      *(_DWORD *)(v13 + 416) = a5;
      *(_QWORD *)(v13 + 480) = a3;
      *(_BYTE *)(v13 + 465) = 1;
      *(_QWORD *)(v13 + 496) = 0x3FF0000000000000;
      *(_BYTE *)(v13 + 466) = 0;
      v14 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v15 = *(void **)(v13 + 424);
      *(_QWORD *)(v13 + 424) = v14;

      objc_msgSend((id)v13, "addSubview:", *(_QWORD *)(v13 + 424));
      v16 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v17 = *(void **)(v13 + 432);
      *(_QWORD *)(v13 + 432) = v16;

      objc_msgSend(*(id *)(v13 + 424), "addSubview:", *(_QWORD *)(v13 + 432));
      objc_msgSend(*(id *)(v13 + 432), "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "setShadowColor:", objc_msgSend(v19, "CGColor"));

      v20 = *(double *)(v13 + 496) * 0.25;
      *(float *)&v20 = v20;
      objc_msgSend(v18, "setShadowOpacity:", v20);
      objc_msgSend(v18, "setShadowOffset:", 0.0, 12.0);
      objc_msgSend(v18, "setShadowRadius:", 18.0);
      -[PKPassThumbnailView _updateRasterizationScale]((id *)v13);
      -[PKPassThumbnailView _updatePassViewWithRendererState:](v13, v11);

    }
    a1 = (id)v13;
    v21 = a1;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_updateRasterizationScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "scale");
    else
      v4 = PKUIScreenScale();
    v5 = v4;
    objc_msgSend(a1[54], "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rasterizationScale");
    if (v7 != v5)
      objc_msgSend(v6, "setRasterizationScale:", v5);

  }
}

- (void)_updatePassViewWithRendererState:(uint64_t)a1
{
  void *v3;
  void *v4;
  int v5;
  PKPassView *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  if (!a1)
    goto LABEL_16;
  v3 = *(void **)(a1 + 440);
  if (v3)
  {
    objc_msgSend(v3, "removeFromSuperview");
    v4 = *(void **)(a1 + 440);
    *(_QWORD *)(a1 + 440) = 0;

  }
  v5 = *(_DWORD *)(a1 + 416);
  v6 = [PKPassView alloc];
  v7 = v5 & 3;
  v8 = *(_QWORD *)(a1 + 472);
  if (v7)
    v9 = 5;
  else
    v9 = 4;
  v10 = *(_QWORD *)(a1 + 480);
  v11 = v10 | 0x5F7;
  if ((*(_BYTE *)(a1 + 416) & 3) == 0)
    goto LABEL_10;
  if ((v10 & 0x200) != 0)
  {
    __break(1u);
LABEL_10:
    if (PKIsLowEndDevice())
      v11 = v10 | 0x7F7;
  }
  v12 = -[PKPassView initWithPass:content:suppressedContent:rendererState:](v6, "initWithPass:content:suppressedContent:rendererState:", v8, v9, v11, v17);
  v13 = *(void **)(a1 + 440);
  *(_QWORD *)(a1 + 440) = v12;

  objc_msgSend(*(id *)(a1 + 440), "setUserInteractionEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 440), "setModallyPresented:", *(unsigned __int8 *)(a1 + 466));
  objc_msgSend(*(id *)(a1 + 440), "setPaused:", v7 == 0);
  objc_msgSend(*(id *)(a1 + 440), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 440), "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMinificationFilter:", *MEMORY[0x1E0CD2EF8]);
  v15 = *(void **)(a1 + 432);
  v16 = *(_QWORD *)(a1 + 440);
  if (*(_QWORD *)(a1 + 448))
    objc_msgSend(v15, "insertSubview:belowSubview:", v16);
  else
    objc_msgSend(v15, "addSubview:", v16);
  objc_msgSend((id)a1, "setNeedsLayout");

LABEL_16:
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassThumbnailView;
  -[PKPassThumbnailView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PKPassThumbnailView _updateRasterizationScale]((id *)&self->super.super.super.isa);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  _QWORD v5[3];
  CGSize result;

  -[PKPassThumbnailView _layoutWithBounds:commit:]((uint64_t)self, 0, (uint64_t)v5, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  v3 = *(double *)v5;
  v4 = *(double *)&v5[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (uint64_t)_layoutWithBounds:(uint64_t)a3@<X8> commit:(double)a4@<D0>
{
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;
  _BOOL8 v32;
  int v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v62;
  CATransform3D v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  if (result)
  {
    v12 = result;
    objc_msgSend(*(id *)(result + 440), "sizeOfFront");
    v14 = v13;
    v16 = v15;
    v17 = objc_msgSend(*(id *)(v12 + 472), "style");
    v18 = v16;
    if (v17 != 6)
    {
      v18 = v14 * 0.704081633;
      if (v17 == 7)
      {
        v57 = a5;
        v59 = a6;
        objc_msgSend(*(id *)(v12 + 472), "thumbnailRect");
        x = v64.origin.x;
        y = v64.origin.y;
        width = v64.size.width;
        height = v64.size.height;
        if (!CGRectIsEmpty(v64))
        {
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          v18 = fmax(CGRectGetMaxY(v65) + 1.0, v18);
        }
        a5 = v57;
        a6 = v59;
      }
    }
    v23 = fmin(a6 / v14, a7 / v18);
    result = PKSizeRoundToPixel();
    v25 = v24;
    v27 = v26;
    v28 = v26;
    if (v16 != v18)
      result = PKFloatRoundToPixel();
    if (v27 <= a7)
      v29 = v27;
    else
      v29 = a7;
    if (v28 < a7 && *(_BYTE *)(v12 + 465) == 0)
      v31 = v29;
    else
      v31 = v28;
    v32 = v27 != v31;
    if (a2)
    {
      v33 = v23 < 1.0;
      if (*(unsigned __int8 *)(v12 + 420) != v33)
      {
        *(_BYTE *)(v12 + 420) = v33;
        objc_msgSend(*(id *)(v12 + 432), "layer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setShouldRasterize:", *(unsigned __int8 *)(v12 + 420));

      }
      objc_msgSend(*(id *)(v12 + 424), "setFrame:", a4 + -44.0, a5 + -44.0, a6 + 44.0 + 44.0, a7 + 44.0);
      objc_msgSend(*(id *)(v12 + 424), "setClipsToBounds:", v32);
      objc_msgSend(*(id *)(v12 + 456), "setAlpha:", (double)v32);
      PKSizeAlignedInRect();
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      v43 = *(void **)(v12 + 456);
      v58 = v31;
      v60 = v25;
      if (v43)
      {
        objc_msgSend(v43, "pkui_alignmentRect");
        PKSizeAlignedInRect();
        objc_msgSend(*(id *)(v12 + 456), "pkui_setAlignmentRect:", v44 + 44.0, v45 + 44.0);
      }
      v66.origin.x = v36;
      v66.origin.y = v38;
      v66.size.width = v40;
      v66.size.height = v42;
      v67 = CGRectOffset(v66, 44.0, 44.0);
      v62 = v67.size.width;
      v46 = v67.size.height;
      objc_msgSend(*(id *)(v12 + 432), "setFrame:", v67.origin.x, v67.origin.y);
      objc_msgSend(*(id *)(v12 + 440), "layer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "anchorPoint");
      v49 = v48;
      v51 = v50;

      v53 = *MEMORY[0x1E0C9D538];
      v52 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v54 = *MEMORY[0x1E0C9D538] + v49 * v60;
      v55 = *(void **)(v12 + 440);
      CATransform3DMakeScale(&v63, v23, v23, 1.0);
      objc_msgSend(v55, "setTransform3D:", &v63);
      objc_msgSend(*(id *)(v12 + 440), "setCenter:", v54, v52 + v51 * v27);
      v56 = v52;
      v25 = v60;
      result = objc_msgSend(*(id *)(v12 + 448), "setFrame:", v53, v56, v62, v46);
      v31 = v58;
    }
    *(double *)a3 = v25;
    *(double *)(a3 + 8) = v31;
    *(_BYTE *)(a3 + 16) = v32;
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BYTE v7[24];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPassThumbnailView;
  -[PKPassThumbnailView layoutSubviews](&v8, sel_layoutSubviews);
  -[PKPassThumbnailView bounds](self, "bounds");
  -[PKPassThumbnailView _layoutWithBounds:commit:]((uint64_t)self, 1, (uint64_t)v7, v3, v4, v5, v6);
}

- (void)setPass:(uint64_t)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1 && *(id *)(a1 + 472) != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(a1 + 472), a2);
    -[PKPassThumbnailView _updatePassViewWithRendererState:](a1, 0);
    v4 = v5;
  }

}

- (void)setBrighten:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a1 && *(unsigned __int8 *)(a1 + 464) != a2)
  {
    *(_BYTE *)(a1 + 464) = a2;
    if (*(_BYTE *)(a1 + 464))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v4 = *(void **)(a1 + 448);
      *(_QWORD *)(a1 + 448) = v3;

      v5 = *(void **)(a1 + 448);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDisplayP3Red:green:blue:alpha:", 0.921569, 0.2, 0.145098, 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v6);

      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2] = xmmword_19DF166D0;
      v12[3] = unk_19DF166E0;
      v12[4] = xmmword_19DF166F0;
      v12[0] = xmmword_19DF166B0;
      v12[1] = unk_19DF166C0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v8, CFSTR("inputColorMatrix"));

      objc_msgSend(*(id *)(a1 + 448), "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setFilters:", v10);

      objc_msgSend(*(id *)(a1 + 432), "addSubview:", *(_QWORD *)(a1 + 448));
      objc_msgSend((id)a1, "setNeedsLayout");

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 448), "removeFromSuperview");
      v11 = *(void **)(a1 + 448);
      *(_QWORD *)(a1 + 448) = 0;

    }
  }
}

- (void)setShadowVisibility:(uint64_t)a1
{
  double v3;
  double v4;
  id v5;

  if (a1)
  {
    v3 = fmax(fmin(a2, 1.0), 0.0);
    if (*(double *)(a1 + 496) != v3)
    {
      *(double *)(a1 + 496) = v3;
      objc_msgSend(*(id *)(a1 + 432), "layer");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *(double *)(a1 + 496) * 0.25;
      *(float *)&v4 = v4;
      objc_msgSend(v5, "setShadowOpacity:", v4);

    }
  }
}

- (uint64_t)setModallyPresented:(uint64_t)result
{
  if (result && *(unsigned __int8 *)(result + 466) != a2)
  {
    *(_BYTE *)(result + 466) = a2;
    if (*(_QWORD *)(result + 440))
      return objc_msgSend(*(id *)(result + 440), "setModallyPresented:", *(unsigned __int8 *)(result + 466));
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundPocketOverlayImage, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_pocketOverlay, 0);
  objc_storeStrong((id *)&self->_effectOverlayView, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_passContainerView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
}

@end
