@implementation PXRoundImageView

- (PXRoundImageView)initWithFrame:(CGRect)a3
{
  PXRoundImageView *v3;
  PXRoundImageView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXRoundImageView;
  v3 = -[PXRoundImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXRoundImageView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

  }
  return v4;
}

- (void)_updateCorner
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[PXRoundImageView bounds](self, "bounds");
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  v6 = v5 * 0.5;
  -[PXRoundImageView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6);

}

- (void)_updateImageForFaceCropRequestID:(int)a3 image:(id)a4 contentsRect:(CGRect)a5 forceUpdate:(BOOL)a6 error:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a7;
  if (a6 || -[PXRoundImageView currentRequestID](self, "currentRequestID") == a3)
  {
    if (v15)
    {
      -[PXRoundImageView setImage:](self, "setImage:", v15);
      -[PXRoundImageView layer](self, "layer");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject setContentsRect:](v17, "setContentsRect:", x, y, width, height);
    }
    else
    {
      if (!v16)
        goto LABEL_6;
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v16;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "PXPeoplePickerCollectionViewItem: error requesting face crop: %@", (uint8_t *)&v18, 0xCu);
      }
    }

  }
LABEL_6:

}

- (void)_updateImageIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PXPeopleFaceCropFetchOptions *v11;
  double v12;
  PXPeopleFaceCropFetchOptions *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  id location;

  -[PXRoundImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRoundImageView representedPerson](self, "representedPerson");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXRoundImageView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  if ((PXPixelSizeAreaIsZero() & 1) == 0)
  {
    if (v4)
    {
      if (!v3 || (-[PXRoundImageView currentRequestSize](self, "currentRequestSize"), v10 != v6) || v9 != v8)
      {
        objc_initWeak(&location, self);
        v11 = [PXPeopleFaceCropFetchOptions alloc];
        -[PXRoundImageView displayScale](self, "displayScale");
        v13 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v11, "initWithPerson:targetSize:displayScale:", v4, v6, v8, v12);
        v18 = 0;
        v19 = &v18;
        v20 = 0x2020000000;
        v21 = 0;
        +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __40__PXRoundImageView__updateImageIfNeeded__block_invoke;
        v16[3] = &unk_1E512A390;
        objc_copyWeak(&v17, &location);
        v16[4] = &v18;
        v15 = objc_msgSend(v14, "requestFaceCropForOptions:resultHandler:", v13, v16);

        *((_DWORD *)v19 + 6) = v15;
        -[PXRoundImageView setCurrentRequestID:](self, "setCurrentRequestID:", v15);
        -[PXRoundImageView setCurrentRequestSize:](self, "setCurrentRequestSize:", v6, v8);
        _Block_object_dispose(&v18, 8);
        objc_destroyWeak(&v17);

        objc_destroyWeak(&location);
      }
    }
  }

}

- (void)setCurrentRequestID:(int)a3
{
  int currentRequestID;
  void *v6;

  currentRequestID = self->_currentRequestID;
  if (currentRequestID != a3)
  {
    if (currentRequestID)
    {
      +[PXPeopleFaceCropManager sharedManager](PXPeopleFaceCropManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelRequestForRequestID:", self->_currentRequestID);

    }
    self->_currentRequestID = a3;
  }
}

- (void)setRepresentedPerson:(id)a3
{
  PHPerson *v5;
  PHPerson *v6;
  char v7;
  PHPerson *v8;

  v8 = (PHPerson *)a3;
  v5 = self->_representedPerson;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PHPerson isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_representedPerson, a3);
      -[PXRoundImageView setCurrentRequestID:](self, "setCurrentRequestID:", 0);
      -[PXRoundImageView setCurrentRequestSize:](self, "setCurrentRequestSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      -[PXRoundImageView setImage:](self, "setImage:", 0);
      -[PXRoundImageView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXRoundImageView;
  -[PXRoundImageView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXRoundImageView _updateCorner](self, "_updateCorner");
  -[PXRoundImageView _updateImageIfNeeded](self, "_updateImageIfNeeded");
}

- (int)currentRequestID
{
  return self->_currentRequestID;
}

- (CGSize)currentRequestSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentRequestSize.width;
  height = self->_currentRequestSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentRequestSize:(CGSize)a3
{
  self->_currentRequestSize = a3;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (PHPerson)representedPerson
{
  return self->_representedPerson;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedPerson, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

void __40__PXRoundImageView__updateImageIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  id v20[5];
  char v21;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleErrorKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PXPeopleContentsRectKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CGRectValue");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = PXRectIdenticalToRect();
  objc_copyWeak(v20, (id *)(a1 + 40));
  v18 = v5;
  v20[1] = v10;
  v20[2] = v12;
  v20[3] = v14;
  v20[4] = v16;
  v21 = v17;
  v19 = v7;
  px_dispatch_on_main_queue();

  objc_destroyWeak(v20);
}

void __40__PXRoundImageView__updateImageIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updateImageForFaceCropRequestID:image:contentsRect:forceUpdate:error:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

}

@end
