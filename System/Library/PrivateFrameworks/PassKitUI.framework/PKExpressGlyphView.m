@implementation PKExpressGlyphView

- (PKExpressGlyphView)init
{

  return 0;
}

- (PKExpressGlyphView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKExpressGlyphView)initWithCoder:(id)a3
{

  return 0;
}

- (void)_updateGlyphViewAnimated:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)a1, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 416);
  if (v5 == 2)
  {
    objc_msgSend(*(id *)(a1 + 440), "setColorMode:animated:", 3, a2);
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3E88];
    v24[0] = v4;
    v24[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "traitCollectionWithTraitsFromCollections:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 7, 1, 11.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationWithTraitCollection:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark"), v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 10;
  }
  else
  {
    v6 = 7;
    if (v5)
      v6 = 0;
    if (v5 == 1)
      v7 = 11;
    else
      v7 = v6;
    v8 = 0;
  }
  objc_initWeak(&location, (id)a1);
  v15 = *(void **)(a1 + 440);
  v16 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke;
  v21[3] = &unk_1E3E61C58;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v15, "setState:animated:completionHandler:", v7, a2, v21);
  v18[0] = v16;
  v18[1] = 3221225472;
  v18[2] = __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke_2;
  v18[3] = &unk_1E3E61388;
  v17 = v8;
  v19 = v17;
  v20 = a1;
  PKUIPerformWithEffectiveTraitCollection(v4, v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (CGSize)intrinsicContentSize
{
  double maximumLength;
  double v3;
  CGSize result;

  maximumLength = self->_maximumLength;
  v3 = maximumLength;
  result.height = v3;
  result.width = maximumLength;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = fmin(fmin(a3.width, a3.height), self->_maximumLength);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  PKGlyphView *glyphView;
  PKGlyphView *v13;
  double MidX;
  CATransform3D v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)PKExpressGlyphView;
  -[PKExpressGlyphView layoutSubviews](&v16, sel_layoutSubviews);
  -[PKExpressGlyphView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = fmin(v7 / self->_maximumLength, v9 / self->_maximumLength);
  glyphView = self->_glyphView;
  CATransform3DMakeScale(&v15, v11, v11, 1.0);
  -[PKGlyphView setTransform3D:](glyphView, "setTransform3D:", &v15);
  v13 = self->_glyphView;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  -[PKGlyphView setCenter:](v13, "setCenter:", MidX, CGRectGetMidY(v18));
}

void __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v2 = WeakRetained[53];
    v3 = v9[53];
    v9[53] = 0;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    WeakRetained = v9;
  }

}

void __47__PKExpressGlyphView__updateGlyphViewAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 440), "primaryColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_flatImageWithColor:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 440);
  v6 = objc_retainAutorelease(v2);
  v5 = objc_msgSend(v6, "CGImage");
  objc_msgSend(v6, "alignmentRectInsets");
  objc_msgSend(v4, "setCustomImage:withAlignmentEdgeInsets:", v5);

}

- (void)glyphView:(id)a3 revealingCheckmark:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "expressGlyphView:revealingCheckmarkAnimated:", self, v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
