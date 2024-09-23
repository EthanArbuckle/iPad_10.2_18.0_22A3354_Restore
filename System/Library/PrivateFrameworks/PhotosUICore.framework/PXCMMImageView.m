@implementation PXCMMImageView

- (void)setViewModel:(id)a3
{
  PXCMMImageViewModel **p_viewModel;
  PXCMMImageViewModel *v7;
  PXCMMImageViewModel *v8;
  char v9;
  void *v10;
  PXCMMImageViewModel *v11;

  v11 = (PXCMMImageViewModel *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMImageView.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewModel"));

  }
  p_viewModel = &self->_viewModel;
  v7 = self->_viewModel;
  if (v7 == v11)
  {

  }
  else
  {
    v8 = v11;
    v9 = -[PXCMMImageViewModel isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      -[PXCMMImageViewModel unregisterChangeObserver:context:](*p_viewModel, "unregisterChangeObserver:context:", self, PXCMMImageViewModelObservationContext);
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[PXCMMImageViewModel registerChangeObserver:context:](*p_viewModel, "registerChangeObserver:context:", self, PXCMMImageViewModelObservationContext);
      -[PXCMMImageView _updateImageRequestHelper](self, "_updateImageRequestHelper");
      -[PXCMMImageView _updateHighlighted](self, "_updateHighlighted");
    }
  }

}

- (PXCMMImageView)initWithFrame:(CGRect)a3
{
  PXCMMImageView *v3;
  PXImageRequesterHelper *v4;
  PXImageRequesterHelper *imageRequesterHelper;
  id v6;
  uint64_t v7;
  UIImageView *imageView;
  void *v9;
  id v10;
  uint64_t v11;
  UIView *highlightView;
  void *v13;
  PXCMMImageViewModel *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXCMMImageView;
  v3 = -[PXCMMImageView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PXImageRequesterHelper);
    imageRequesterHelper = v3->_imageRequesterHelper;
    v3->_imageRequesterHelper = v4;

    -[PXImageRequesterHelper registerChangeObserver:context:](v3->_imageRequesterHelper, "registerChangeObserver:context:", v3, PXImageRequesterHelperObservationContext);
    v6 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[PXCMMImageView bounds](v3, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v7;

    -[UIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v3->_imageView, "setBackgroundColor:", v9);

    -[PXCMMImageView addSubview:](v3, "addSubview:", v3->_imageView);
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PXCMMImageView bounds](v3, "bounds");
    v11 = objc_msgSend(v10, "initWithFrame:");
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIView *)v11;

    -[UIView setAutoresizingMask:](v3->_highlightView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_highlightView, "setBackgroundColor:", v13);

    -[UIView setAlpha:](v3->_highlightView, "setAlpha:", 0.3);
    -[UIView setHidden:](v3->_highlightView, "setHidden:", 1);
    -[PXCMMImageView addSubview:](v3, "addSubview:", v3->_highlightView);
    v14 = objc_alloc_init(PXCMMImageViewModel);
    -[PXCMMImageView setViewModel:](v3, "setViewModel:", v14);

    -[PXCMMImageView setAccessibilityIgnoresInvertColors:](v3, "setAccessibilityIgnoresInvertColors:", 1);
  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMImageView;
  -[PXCMMImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PXCMMImageView _updateImageRequestHelper](self, "_updateImageRequestHelper");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMImageView;
  -[PXCMMImageView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PXCMMImageView _updateImageRequestHelper](self, "_updateImageRequestHelper");
}

- (void)_updateImageRequestHelper
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  PXImageRequesterHelper *imageRequesterHelper;
  _QWORD v11[8];

  -[PXCMMImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PXCMMImageView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  if (v8 == 0.0)
    v9 = 1.0;
  else
    v9 = v8;

  imageRequesterHelper = self->_imageRequesterHelper;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__PXCMMImageView__updateImageRequestHelper__block_invoke;
  v11[3] = &unk_1E5137390;
  v11[4] = self;
  v11[5] = v4;
  v11[6] = v6;
  *(double *)&v11[7] = v9;
  -[PXImageRequesterHelper performChanges:](imageRequesterHelper, "performChanges:", v11);
}

- (void)_updateHighlighted
{
  -[UIView setHidden:](self->_highlightView, "setHidden:", -[PXCMMImageViewModel isHighlighted](self->_viewModel, "isHighlighted") ^ 1);
}

- (void)_updateImage
{
  id v3;

  -[PXImageRequesterHelper image](self->_imageRequesterHelper, "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v3);

}

- (void)_updateContentsRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PXImageRequesterHelper contentsRect](self->_imageRequesterHelper, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIImageView layer](self->_imageView, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);

}

- (BOOL)test_highlighted
{
  return !-[UIView isHidden](self->_highlightView, "isHidden");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)PXCMMImageViewModelObservationContext == a5)
  {
    if ((v6 & 3) != 0)
      -[PXCMMImageView _updateImageRequestHelper](self, "_updateImageRequestHelper");
    if ((v6 & 4) != 0)
      -[PXCMMImageView _updateHighlighted](self, "_updateHighlighted");
  }
  else
  {
    if ((void *)PXImageRequesterHelperObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMImageView.m"), 147, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 0x20) != 0)
      -[PXCMMImageView _updateImage](self, "_updateImage");
    if ((v6 & 8) != 0)
      -[PXCMMImageView _updateContentsRect](self, "_updateContentsRect");
  }

}

- (PXCMMImageViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_imageRequesterHelper, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

void __43__PXCMMImageView__updateImageRequestHelper__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v6 = a2;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAsset:", v4);

  objc_msgSend(v6, "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaProvider:", v5);

  objc_msgSend(v6, "setScale:", *(double *)(a1 + 56));
}

@end
