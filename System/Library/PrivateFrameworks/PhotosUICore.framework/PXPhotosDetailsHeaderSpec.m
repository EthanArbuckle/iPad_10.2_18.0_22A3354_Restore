@implementation PXPhotosDetailsHeaderSpec

- (PXPhotosDetailsHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  PXPhotosDetailsHeaderSpec *v4;
  PXPhotosDetailsHeaderSpec *v5;
  double v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsHeaderSpec;
  v4 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v9, sel_initWithExtendedTraitCollection_options_, a3, a4);
  v5 = v4;
  if (v4)
  {
    if (-[PXFeatureSpec shouldInsetAllPhotoDetailsContent](v4, "shouldInsetAllPhotoDetailsContent"))
    {
      v5->_contentInsetEdges = 15;
      v8.receiver = v5;
      v8.super_class = (Class)PXPhotosDetailsHeaderSpec;
      -[PXFeatureSpec defaultCornerRadius](&v8, sel_defaultCornerRadius);
      v5->_defaultCornerRadius = v6;
      if (-[PXFeatureSpec userInterfaceIdiom](v5, "userInterfaceIdiom") == 5)
        v5->_defaultCornerRadius = 24.0;
    }
    else
    {
      v5->_contentInsetEdges = 4;
      v5->_defaultCornerRadius = 0.0;
    }
  }
  return v5;
}

- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  CGSize var2;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CGSize v20;
  PXImageViewSpec *v21;
  CGSize v22;
  CGSize v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  __int128 v27;
  CGSize v28;
  objc_super v29;

  switch(a3->var0)
  {
    case 0xFA0:
      a3->var0 = 1964;
      v29.receiver = self;
      v29.super_class = (Class)PXPhotosDetailsHeaderSpec;
      var2 = a3->var2;
      v27 = *(_OWORD *)&a3->var0;
      v28 = var2;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v29, sel_createViewSpecWithDescriptor_, &v27);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom") != 5)
        return v5;
      v6 = v5;
      objc_msgSend(v6, "titleLabelSpec");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subtitleLabelSpec");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AA8], 66, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v11, 36.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0DC1138];
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1138]);
      objc_msgSend(v7, "setTextAttributes:", v10);
      v14 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v14, "setMinimumLineHeight:", 0.0);
      objc_msgSend(v14, "setMaximumLineHeight:", 0.0);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0DC1178]);
      objc_msgSend(v7, "setTextAttributes:", v10);
      objc_msgSend(v8, "textAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      PXFontWithTextStyleAndWeight();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v13);
      objc_msgSend(v8, "setTextAttributes:", v16);
      objc_msgSend(v17, "pointSize");
      objc_msgSend(v6, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:", v18 + 8.0);

      return v6;
    case 0xFA1:
      a3->var0 = 1919;
      v26.receiver = self;
      v26.super_class = (Class)PXPhotosDetailsHeaderSpec;
      v23 = a3->var2;
      v27 = *(_OWORD *)&a3->var0;
      v28 = v23;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v26, sel_createViewSpecWithDescriptor_, &v27);
      v21 = (PXImageViewSpec *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 0xFA2:
      a3->var0 = 1000;
      v25.receiver = self;
      v25.super_class = (Class)PXPhotosDetailsHeaderSpec;
      v20 = a3->var2;
      v27 = *(_OWORD *)&a3->var0;
      v28 = v20;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v25, sel_createViewSpecWithDescriptor_, &v27, v24.receiver, v24.super_class, self, PXPhotosDetailsHeaderSpec);
      return (id)objc_claimAutoreleasedReturnValue();
    case 0xFA3:
      v21 = objc_alloc_init(PXImageViewSpec);
LABEL_9:
      v5 = v21;
      -[PXFeatureSpec configureViewSpec:](self, "configureViewSpec:", v21);
      return v5;
    default:
      v24.receiver = self;
      v24.super_class = (Class)PXPhotosDetailsHeaderSpec;
      v22 = a3->var2;
      v27 = *(_OWORD *)&a3->var0;
      v28 = v22;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v24, sel_createViewSpecWithDescriptor_, &v27, self, PXPhotosDetailsHeaderSpec, v25.receiver, v25.super_class);
      return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CGSize)playButtonSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonSize");
  v4 = v3;
  v6 = v5;
  v7 = -[PXFeatureSpec userInterfaceIdiom](self, "userInterfaceIdiom");
  v8 = 28.0;
  if (v7 == 3)
    v9 = v4;
  else
    v9 = 28.0;
  if (v7 == 3)
    v8 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (unint64_t)contentInsetEdges
{
  return self->_contentInsetEdges;
}

@end
