@implementation PXPeopleAvatarView

- (PXPeopleAvatarView)initWithFrame:(CGRect)a3
{
  PXPeopleAvatarView *v3;
  PXPeopleAvatarView *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  id v10;
  double v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXPeopleAvatarView;
  v3 = -[PXPeopleAvatarView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXPeopleAvatarView traitCollection](v3, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4->_isRTL = objc_msgSend(v5, "layoutDirection") == 1;

    v4->_enabled = 1;
    v4->_avatarSizeClass = 0;
    v4->_ivarLock._os_unfair_lock_opaque = 0;
    -[PXPeopleAvatarView setAccessibilityIgnoresInvertColors:](v4, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXPeopleAvatarView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIAccessibilityIsInvertColorsEnabled())
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v7, "CGColor"));

    LODWORD(v8) = 1041865114;
    objc_msgSend(v6, "setShadowOpacity:", v8);
    objc_msgSend(v6, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(v6, "setShadowRadius:", 2.0);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setFillColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(v9, "setHidden:", v4->_enabled);
    LODWORD(v11) = 0.5;
    objc_msgSend(v9, "setOpacity:", v11);
    objc_msgSend(v6, "addSublayer:", v9);
    -[PXPeopleAvatarView setOverlayLayer:](v4, "setOverlayLayer:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, sel_accessibilityInvertColorsStatusDidChange_, *MEMORY[0x1E0DC4528], 0);

  }
  return v4;
}

- (void)setSharedAlbumCollection:(id)a3
{
  PHAssetCollection *v5;
  PHAssetCollection *v6;

  v5 = (PHAssetCollection *)a3;
  if (self->_sharedAlbumCollection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sharedAlbumCollection, a3);
    -[PXPeopleAvatarView _updateAvatars](self, "_updateAvatars");
    v5 = v6;
  }

}

- (void)setSharedAlbumCollection:(id)a3 forceLayoutSubscriberAvatars:(BOOL)a4
{
  PHAssetCollection *v7;
  PHAssetCollection *v8;

  v7 = (PHAssetCollection *)a3;
  v8 = v7;
  if (a4)
  {
    if (self->_sharedAlbumCollection != v7)
      objc_storeStrong((id *)&self->_sharedAlbumCollection, a3);
    -[PXPeopleAvatarView _updateAvatars](self, "_updateAvatars");
  }
  else
  {
    -[PXPeopleAvatarView setSharedAlbumCollection:](self, "setSharedAlbumCollection:", v7);
  }

}

- (void)setAvatarSizeClass:(unint64_t)a3
{
  os_unfair_lock_s *p_ivarLock;
  unint64_t avatarSizeClass;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  avatarSizeClass = self->_avatarSizeClass;
  self->_avatarSizeClass = a3;
  os_unfair_lock_unlock(p_ivarLock);
  if (avatarSizeClass != a3)
    -[PXPeopleAvatarView _updateAvatars](self, "_updateAvatars");
}

- (unint64_t)avatarSizeClass
{
  os_unfair_lock_s *p_ivarLock;
  unint64_t avatarSizeClass;

  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  avatarSizeClass = self->_avatarSizeClass;
  os_unfair_lock_unlock(p_ivarLock);
  return avatarSizeClass;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    -[PXPeopleAvatarView overlayLayer](self, "overlayLayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (void)prepareForReuse
{
  -[PXPeopleAvatarView _resetImages](self, "_resetImages");
  -[PXPeopleAvatarView _resetViewContents](self, "_resetViewContents");
  -[PXPeopleAvatarView setSharedAlbumCollection:](self, "setSharedAlbumCollection:", 0);
}

- (void)embedInView:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXPeopleAvatarView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleAvatarView.m"), 175, CFSTR("Avatar view cannot be used to decorate view twice."));

  }
  objc_msgSend(v7, "addSubview:", self);

}

- (id)imageRendererForImageCount:(unint64_t)a3
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  UIGraphicsImageRenderer *v9;
  UIGraphicsImageRenderer *imageRenderer;

  if (!self->_imageRenderer
    || -[PXPeopleAvatarView cachedImageRendererAvatarCount](self, "cachedImageRendererAvatarCount") != a3)
  {
    v5 = -[PXPeopleAvatarView avatarSizeClass](self, "avatarSizeClass");
    v6 = 32.0;
    if (v5)
      v6 = 28.0;
    +[PXPeopleAvatarView _sizeForNumberOfAvatars:diameter:](PXPeopleAvatarView, "_sizeForNumberOfAvatars:diameter:", a3, v6);
    v9 = (UIGraphicsImageRenderer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v7, v8);
    imageRenderer = self->_imageRenderer;
    self->_imageRenderer = v9;

    self->_cachedImageRendererAvatarCount = a3;
  }
  return self->_imageRenderer;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  if (-[PXPeopleAvatarView avatarSizeClass](self, "avatarSizeClass"))
    v3 = 28.0;
  else
    v3 = 32.0;
  objc_msgSend((id)objc_opt_class(), "_sizeForNumberOfAvatars:diameter:", -[PXPeopleAvatarView _numberOfAvatars](self, "_numberOfAvatars"), v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateAvatars
{
  void *v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_block_t v10;
  _QWORD block[4];
  NSObject *v12;
  id v13[2];
  id buf[2];

  -[PXPeopleAvatarView sharedAlbumCollection](self, "sharedAlbumCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPeopleAvatarView log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (char *)os_signpost_id_make_with_pointer(v4, self);
    v6 = v4;
    v7 = v6;
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "FetchPeopleAvatars", ", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    objc_msgSend((id)objc_opt_class(), "serialQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PXPeopleAvatarView__updateAvatars__block_invoke;
    block[3] = &unk_1E513FF48;
    objc_copyWeak(v13, buf);
    v12 = v7;
    v13[1] = v5;
    v9 = v7;
    v10 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v8, v10);

    objc_destroyWeak(v13);
    objc_destroyWeak(buf);
  }
}

- (void)_generateAvatars
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, unint64_t);
  void *v18;
  id v19;
  PXPeopleAvatarView *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXPeopleAvatarView _resetImages](self, "_resetImages");
  -[PXPeopleAvatarView sharedAlbumCollection](self, "sharedAlbumCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContextForCurrentQueueQoS");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedAlbumsRecipientsForAlbumWithObjectID(v5, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[PXPeopleAvatarView avatarSizeClass](self, "avatarSizeClass");
  v12 = 32.0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __38__PXPeopleAvatarView__generateAvatars__block_invoke;
  v18 = &unk_1E5139FA0;
  if (v11)
    v12 = 28.0;
  v22 = v12;
  v23 = v12;
  v19 = v10;
  v20 = self;
  v21 = v4;
  v24 = v12;
  v13 = v4;
  v14 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
  -[PXPeopleAvatarView _renderAvatarsForAlbumCollection:](self, "_renderAvatarsForAlbumCollection:", v13, v15, v16, v17, v18);

}

- (void)_resetImages
{
  id v3;
  id location;

  -[PXPeopleAvatarView setFirstAvatar:](self, "setFirstAvatar:", 0);
  -[PXPeopleAvatarView setSecondAvatar:](self, "setSecondAvatar:", 0);
  -[PXPeopleAvatarView setThirdAvatar:](self, "setThirdAvatar:", 0);
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_resetViewContents
{
  id v3;

  -[PXPeopleAvatarView setImage:](self, "setImage:", 0);
  -[PXPeopleAvatarView layer](self, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowPath:", 0);

}

- (void)_resetViewContentsIfNeededForAlbumCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleAvatarView sharedAlbumCollection](self, "sharedAlbumCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[PXPeopleAvatarView _resetViewContents](self, "_resetViewContents");
}

- (void)_setContentsImage:(id)a3 withShadowPath:(CGPath *)a4 forAlbumCollection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  PXPeopleAvatarView *v19;
  double v20;

  v15 = a3;
  v8 = a5;
  -[PXPeopleAvatarView sharedAlbumCollection](self, "sharedAlbumCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[PXPeopleAvatarView superview](self, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleAvatarView setImage:](self, "setImage:", v15);
    if (v15 && v10)
    {
      if (-[PXPeopleAvatarView avatarSizeClass](self, "avatarSizeClass"))
        v11 = 0.0;
      else
        v11 = 8.0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __74__PXPeopleAvatarView__setContentsImage_withShadowPath_forAlbumCollection___block_invoke;
      v16[3] = &unk_1E5139FC8;
      v17 = v10;
      v20 = v11;
      v18 = v15;
      v19 = self;
      +[PXViewLayoutHelper performLayoutWithinView:usingBlock:](PXViewLayoutHelper, "performLayoutWithinView:usingBlock:", v17, v16);

    }
    -[PXPeopleAvatarView layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowPath:", a4);

    -[PXPeopleAvatarView overlayLayer](self, "overlayLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPath:", a4);
    -[PXPeopleAvatarView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    objc_msgSend(v13, "setFrame:");

  }
}

- (unint64_t)_numberOfAvatars
{
  uint64_t v2;
  unint64_t v3;

  v2 = 1;
  if (self->_firstAvatar)
    v2 = 2;
  if (self->_secondAvatar)
    v3 = v2;
  else
    v3 = self->_firstAvatar != 0;
  if (self->_thirdAvatar)
    return v3 + 1;
  else
    return v3;
}

- (void)_setImage:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  switch(a4)
  {
    case 2uLL:
      v7 = v6;
      -[PXPeopleAvatarView setThirdAvatar:](self, "setThirdAvatar:", v6);
      goto LABEL_7;
    case 1uLL:
      v7 = v6;
      -[PXPeopleAvatarView setSecondAvatar:](self, "setSecondAvatar:", v6);
      goto LABEL_7;
    case 0uLL:
      v7 = v6;
      -[PXPeopleAvatarView setFirstAvatar:](self, "setFirstAvatar:", v6);
LABEL_7:
      v6 = v7;
      break;
  }

}

- (void)_setImage:(id)a3 forIndex:(int64_t)a4 albumCollection:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  dispatch_block_t v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17[2];
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "serialQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXPeopleAvatarView__setImage_forIndex_albumCollection___block_invoke;
  block[3] = &unk_1E513A518;
  objc_copyWeak(v17, &location);
  v15 = v9;
  v16 = v8;
  v17[1] = (id)a4;
  v11 = v8;
  v12 = v9;
  v13 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(v10, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_requestMonogramForRecipient:(id)a3 diameter:(double)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  _BOOL8 isRTL;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a3;
  -[PXPeopleAvatarView px_screenScale](self, "px_screenScale");
  v11 = v10;
  isRTL = self->_isRTL;
  objc_msgSend(v9, "firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PXPeopleAvatarView__requestMonogramForRecipient_diameter_resultHandler___block_invoke;
  v16[3] = &unk_1E5147BC8;
  v17 = v8;
  v15 = v8;
  +[PXActivityUtilities requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:](PXActivityUtilities, "requestPersonImageWithTargetSize:displayScale:isRTL:matchingEmail:orPhone:withFirstName:lastName:prefersPhotosImage:withCompletion:", isRTL, 0, 0, v13, v14, 0, a4, a4, v11, v16);

}

- (void)_renderAvatarsForAlbumCollection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CGPath *Mutable;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30[2];
  _QWORD v31[4];
  id v32;
  PXPeopleAvatarView *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  CGPath *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleAvatarView thirdAvatar](self, "thirdAvatar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXPeopleAvatarView thirdAvatar](self, "thirdAvatar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  -[PXPeopleAvatarView secondAvatar](self, "secondAvatar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PXPeopleAvatarView secondAvatar](self, "secondAvatar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  -[PXPeopleAvatarView firstAvatar](self, "firstAvatar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PXPeopleAvatarView firstAvatar](self, "firstAvatar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

  }
  v13 = objc_msgSend(v6, "count");
  if (v13 >= 3)
    v14 = 3;
  else
    v14 = v13;
  if (v14)
  {
    if (-[PXPeopleAvatarView avatarSizeClass](self, "avatarSizeClass"))
      v15 = 28.0;
    else
      v15 = 32.0;
    +[PXPeopleAvatarView _sizeForNumberOfAvatars:diameter:](PXPeopleAvatarView, "_sizeForNumberOfAvatars:diameter:", v14, v15);
    v17 = v16;
    v19 = v18;
    Mutable = CGPathCreateMutable();
    -[PXPeopleAvatarView imageRendererForImageCount:](self, "imageRendererForImageCount:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke_2;
    v31[3] = &unk_1E513A018;
    v34 = v15;
    v35 = v17;
    v36 = v19;
    v32 = v6;
    v33 = self;
    v37 = Mutable;
    objc_msgSend(v21, "imageWithActions:", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathCloseSubpath(Mutable);
    objc_initWeak(&location, self);
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke_4;
    block[3] = &unk_1E513A518;
    objc_copyWeak(v30, &location);
    v30[1] = Mutable;
    v28 = v23;
    v29 = v4;
    v24 = v4;
    v25 = v23;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_initWeak(&location, self);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke;
    v38[3] = &unk_1E5147280;
    objc_copyWeak(&v40, &location);
    v39 = v4;
    v26 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v38);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

}

- (void)accessibilityInvertColorsStatusDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  if (UIAccessibilityIsInvertColorsEnabled())
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v6, "CGColor");
  -[PXPeopleAvatarView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowColor:", v4);

}

- (OS_os_log)log
{
  if (log_onceToken_229564 != -1)
    dispatch_once(&log_onceToken_229564, &__block_literal_global_154_229565);
  return (OS_os_log *)(id)log_dataSourceManagerLog;
}

- (PHAssetCollection)sharedAlbumCollection
{
  return self->_sharedAlbumCollection;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (UIGraphicsImageRenderer)imageRenderer
{
  return self->_imageRenderer;
}

- (void)setImageRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_imageRenderer, a3);
}

- (unint64_t)cachedImageRendererAvatarCount
{
  return self->_cachedImageRendererAvatarCount;
}

- (void)setCachedImageRendererAvatarCount:(unint64_t)a3
{
  self->_cachedImageRendererAvatarCount = a3;
}

- (UIImage)firstAvatar
{
  return self->_firstAvatar;
}

- (void)setFirstAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_firstAvatar, a3);
}

- (UIImage)secondAvatar
{
  return self->_secondAvatar;
}

- (void)setSecondAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_secondAvatar, a3);
}

- (UIImage)thirdAvatar
{
  return self->_thirdAvatar;
}

- (void)setThirdAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_thirdAvatar, a3);
}

- (CAShapeLayer)overlayLayer
{
  return self->_overlayLayer;
}

- (void)setOverlayLayer:(id)a3
{
  objc_storeStrong((id *)&self->_overlayLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayLayer, 0);
  objc_storeStrong((id *)&self->_thirdAvatar, 0);
  objc_storeStrong((id *)&self->_secondAvatar, 0);
  objc_storeStrong((id *)&self->_firstAvatar, 0);
  objc_storeStrong((id *)&self->_imageRenderer, 0);
  objc_storeStrong((id *)&self->_sharedAlbumCollection, 0);
}

void __25__PXPeopleAvatarView_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "PeopleAvatarView");
  v1 = (void *)log_dataSourceManagerLog;
  log_dataSourceManagerLog = (uint64_t)v0;

}

void __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resetViewContentsIfNeededForAlbumCollection:", *(_QWORD *)(a1 + 32));

}

void __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v3 = a2;
  CGContextSetGrayFillColor((CGContextRef)objc_msgSend(v3, "CGContext"), 1.0, 1.0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke_3;
  v6[3] = &unk_1E5139FF0;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v10 = *(_QWORD *)(a1 + 72);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setContentsImage:withShadowPath:forAlbumCollection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  CGPathRelease(*(CGPathRef *)(a1 + 56));
}

void __55__PXPeopleAvatarView__renderAvatarsForAlbumCollection___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v19 = a2;
  v5 = 1.0;
  v7 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v8 = v7 + 1.0 + (double)a3 * 16.0;
  v9 = v6 - v8;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 512))
  {
    v9 = MEMORY[0x1A85CD2B8](v6 - v8, 1.0, *(double *)(a1 + 48), *(double *)(a1 + 48), 0.0, 0.0);
    v5 = v10;
    v12 = v11;
    v7 = v13;
  }
  else
  {
    v12 = *(double *)(a1 + 48);
  }
  v20.origin.x = v9;
  v20.origin.y = v5;
  v20.size.width = v12;
  v20.size.height = v7;
  v21 = CGRectInset(v20, -1.0, -1.0);
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  v18 = (CGContext *)objc_msgSend(*(id *)(a1 + 40), "CGContext");
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  CGContextFillEllipseInRect(v18, v22);
  objc_msgSend(v19, "drawInRect:", v9, v5, v12, v7);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  CGPathAddEllipseInRect(*(CGMutablePathRef *)(a1 + 72), 0, v23);

}

void __74__PXPeopleAvatarView__requestMonogramForRecipient_diameter_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0DC3870];
    v9 = objc_retainAutorelease(v6);
    v10 = objc_msgSend(v9, "CGImage");
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v10, objc_msgSend(v9, "imageOrientation"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "No image returned from PXActivityUtilities. Error: %@", (uint8_t *)&v16, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __57__PXPeopleAvatarView__setImage_forIndex_albumCollection___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "sharedAlbumCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_setImage:forIndex:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_renderAvatarsForAlbumCollection:", *(_QWORD *)(a1 + 32));

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PXPeopleAvatarView__setImage_forIndex_albumCollection___block_invoke_2;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v9, v2);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v9);
  }
}

void __57__PXPeopleAvatarView__setImage_forIndex_albumCollection___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setNeedsLayout");

}

void __74__PXPeopleAvatarView__setContentsImage_withShadowPath_forAlbumCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t v14;

  v3 = a2;
  v13 = vdupq_n_s64(0x7FF8000000000000uLL);
  v14 = v13;
  objc_msgSend(v3, "trailingOfView:", *(_QWORD *)(a1 + 32), *(_OWORD *)&v13, *(_OWORD *)&v13, *(_OWORD *)&v13, *(_OWORD *)&v13);
  *(double *)&v9 = v4 - *(double *)(a1 + 56);
  objc_msgSend(v3, "bottomOfView:", *(_QWORD *)(a1 + 32));
  *((double *)&v10 + 1) = v5 - *(double *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v11 = v6;
  objc_msgSend(*(id *)(a1 + 40), "size");
  v12 = v7;
  objc_msgSend(v3, "layoutView:withAttributes:", *(_QWORD *)(a1 + 48), &v8);

}

void __34__PXPeopleAvatarView__resetImages__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

}

void __38__PXPeopleAvatarView__generateAvatars__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  double v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];
  _QWORD v19[5];
  _QWORD v20[2];

  v5 = a2;
  v6 = v5;
  if (a3 <= 2)
  {
    objc_msgSend(v5, "matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:", *(_QWORD *)(a1 + 32), 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "px_screenScale");
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      v12 = *(unsigned __int8 *)(v10 + 512);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __38__PXPeopleAvatarView__generateAvatars__block_invoke_2;
      v19[3] = &unk_1E5139F50;
      v19[4] = v10;
      v20[1] = a3;
      v13 = (id *)v20;
      v20[0] = v11;
      +[PXActivityUtilities requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:](PXActivityUtilities, "requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v7, v12, 0, v19, *(double *)(a1 + 56), *(double *)(a1 + 64), v9);
    }
    else
    {
      v14 = *(double *)(a1 + 72);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __38__PXPeopleAvatarView__generateAvatars__block_invoke_3;
      v16[3] = &unk_1E5139F78;
      v15 = *(void **)(a1 + 48);
      v17 = *(id *)(a1 + 40);
      v18[1] = a3;
      v13 = (id *)v18;
      v18[0] = v15;
      objc_msgSend(v17, "_requestMonogramForRecipient:diameter:resultHandler:", v6, v16, v14);
    }

  }
}

uint64_t __38__PXPeopleAvatarView__generateAvatars__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setImage:forIndex:albumCollection:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __38__PXPeopleAvatarView__generateAvatars__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setImage:forIndex:albumCollection:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __36__PXPeopleAvatarView__updateAvatars__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_generateAvatars");

  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_END, v5, "FetchPeopleAvatars", ", v6, 2u);
  }

}

+ (OS_dispatch_queue)serialQueue
{
  if (serialQueue_onceToken != -1)
    dispatch_once(&serialQueue_onceToken, &__block_literal_global_229607);
  return (OS_dispatch_queue *)(id)serialQueue_serialQueue;
}

+ (CGSize)maxSizeForSizeClass:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = 32.0;
  if (a3)
    v3 = 28.0;
  objc_msgSend(a1, "_sizeForNumberOfAvatars:diameter:", 3, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)_sizeForNumberOfAvatars:(unint64_t)a3 diameter:(double)a4
{
  double v4;
  double v5;
  double v6;
  CGSize result;

  v4 = 0.0;
  if (a3)
    v4 = a4 + (double)(a3 - 1) * 16.0 + 2.0;
  v5 = a4 + 2.0;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

void __33__PXPeopleAvatarView_serialQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.mobileslideshow.peopleavatarqueue", 0);
  v1 = (void *)serialQueue_serialQueue;
  serialQueue_serialQueue = (uint64_t)v0;

}

@end
