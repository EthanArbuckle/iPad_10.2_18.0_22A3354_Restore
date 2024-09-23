@implementation PKExpressBannerTrailingView

- (PKExpressBannerTrailingView)init
{

  return 0;
}

- (PKExpressBannerTrailingView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKExpressBannerTrailingView)initWithCoder:(id)a3
{

  return 0;
}

- (uint64_t)_updateStateAnimated:(double)a3 withDelay:
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  uint64_t result;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  CATransform3D v17;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v20;
  CATransform3D v21;

  memset(&v21, 0, sizeof(v21));
  if (*(_DWORD *)(a1 + 416) == 1)
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v21.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v21.m33 = v6;
    v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v21.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v21.m43 = v7;
    v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v21.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v21.m13 = v8;
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v21.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v21.m23 = v9;
  }
  else
  {
    CATransform3DMakeRotation(&v21, -1.74532925, 0.0, 1.0, 0.0);
  }
  memset(&v20, 0, sizeof(v20));
  v10 = *(void **)(a1 + 424);
  if (v10)
    objc_msgSend(v10, "transform3D");
  a = v20;
  b = v21;
  result = CATransform3DEqualToTransform(&a, &b);
  if ((result & 1) == 0)
  {
    if (a2)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C038]), "initWithMass:stiffness:damping:", 2.0, 100.0, 10.0);
      objc_msgSend(v12, "springAnimationWithKeyPath:", CFSTR("transform"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      a = v20;
      b = v21;
      objc_msgSend(v13, "pkui_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
      if (a3 != 0.0)
        objc_msgSend(v13, "setBeginTime:", a3);
      objc_msgSend(*(id *)(a1 + 424), "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v13);

    }
    v16[1] = 3221225472;
    v17 = v21;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[2] = __62__PKExpressBannerTrailingView__updateStateAnimated_withDelay___block_invoke;
    v16[3] = &unk_1E3E62950;
    v16[4] = a1;
    return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v16);
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKExpressGlyphView sizeThatFits:](self->_glyphView, "sizeThatFits:", 18.0, 18.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PKExpressGlyphView *glyphView;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKExpressBannerTrailingView;
  -[PKExpressBannerTrailingView layoutSubviews](&v16, sel_layoutSubviews);
  -[PKExpressBannerTrailingView bounds](self, "bounds");
  -[PKExpressGlyphView sizeThatFits:](self->_glyphView, "sizeThatFits:", v3, v4);
  PKSizeAlignedInRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKExpressGlyphView setBounds:](self->_glyphView, "setBounds:");
  glyphView = self->_glyphView;
  -[PKExpressGlyphView anchorPoint](glyphView, "anchorPoint");
  -[PKExpressGlyphView setCenter:](glyphView, "setCenter:", v6 + v14 * v10, v8 + v15 * v12);
}

uint64_t __62__PKExpressBannerTrailingView__updateStateAnimated_withDelay___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[8];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  v2 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v2;
  v3 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v3;
  v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  v5 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v5;
  return objc_msgSend(v1, "setTransform3D:", v7);
}

- (void)expressGlyphView:(id)a3 revealingCheckmarkAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "expressTrailingView:revealingCheckmarkAnimated:", self, v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_glyphView, 0);
}

@end
