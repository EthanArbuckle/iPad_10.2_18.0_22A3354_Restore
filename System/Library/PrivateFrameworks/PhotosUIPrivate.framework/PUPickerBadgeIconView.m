@implementation PUPickerBadgeIconView

- (PUPickerBadgeIconView)initWithFrame:(CGRect)a3
{
  PUPickerBadgeIconView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *photosImageView;
  id v8;
  void *v9;
  uint64_t v10;
  UIImageView *privacyImageView;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUPickerBadgeIconView;
  v3 = -[PUPickerBadgeIconView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PhotosIndicator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithImage:", v5);
    photosImageView = v3->_photosImageView;
    v3->_photosImageView = (UIImageView *)v6;

    -[UIImageView setAutoresizingMask:](v3->_photosImageView, "setAutoresizingMask:", 18);
    -[PUPickerBadgeIconView bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_photosImageView, "setFrame:");
    -[PUPickerBadgeIconView addSubview:](v3, "addSubview:", v3->_photosImageView);
    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("PrivacyIndicator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithImage:", v9);
    privacyImageView = v3->_privacyImageView;
    v3->_privacyImageView = (UIImageView *)v10;

    -[UIImageView setAutoresizingMask:](v3->_privacyImageView, "setAutoresizingMask:", 18);
    -[PUPickerBadgeIconView bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_privacyImageView, "setFrame:");
    -[UIImageView setHidden:](v3->_privacyImageView, "setHidden:", 1);
    -[PUPickerBadgeIconView addSubview:](v3, "addSubview:", v3->_privacyImageView);
  }
  return v3;
}

- (void)flipToPrivacyIconAfterDelay:(double)a3
{
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;

  -[PUPickerBadgeIconView photosImageView](self, "photosImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerBadgeIconView privacyImageView](self, "privacyImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke;
  v10[3] = &unk_1E58A9C48;
  v13 = xmmword_1AB0EF480;
  v14 = xmmword_1AB0EF490;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_after(v7, MEMORY[0x1E0C80D38], v10);

}

- (UIImageView)photosImageView
{
  return self->_photosImageView;
}

- (UIImageView)privacyImageView
{
  return self->_privacyImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyImageView, 0);
  objc_storeStrong((id *)&self->_photosImageView, 0);
}

void __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  v2 = objc_alloc(MEMORY[0x1E0DC3F38]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke_2;
  v4[3] = &unk_1E58A9DF0;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = 2097408;
  v3 = (void *)objc_msgSend(v2, "initWithDuration:controlPoint1:controlPoint2:animations:", v4, 0.5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "startAnimation");

}

uint64_t __53__PUPickerBadgeIconView_flipToPrivacyIconAfterDelay___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x1E0DC3F10], "transitionFromView:toView:duration:options:completion:", a1[4], a1[5], a1[6], 0, 0.5);
}

@end
