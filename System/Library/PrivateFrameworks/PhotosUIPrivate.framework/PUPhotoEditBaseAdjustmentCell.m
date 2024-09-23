@implementation PUPhotoEditBaseAdjustmentCell

- (PUPhotoEditBaseAdjustmentCell)initWithFrame:(CGRect)a3
{
  PUPhotoEditBaseAdjustmentCell *v3;
  PUPhotoEditBaseAdjustmentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  v3 = -[PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (PUPhotoEditBaseAdjustmentCell)initWithCoder:(id)a3
{
  PUPhotoEditBaseAdjustmentCell *v3;
  PUPhotoEditBaseAdjustmentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  v3 = -[PUPhotoEditBaseAdjustmentCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit(v3);
  return v4;
}

- (void)_setupContainerButton
{
  double v3;
  double v4;
  double v5;
  double v6;
  PUPhotoEditAdjustmentControl *v7;
  PUPhotoEditAdjustmentControl *containerButton;
  id v9;

  -[PUPhotoEditBaseAdjustmentCell bounds](self, "bounds");
  v7 = -[PUPhotoEditAdjustmentControl initWithFrame:]([PUPhotoEditAdjustmentControl alloc], "initWithFrame:", v3, v4, v5, v6);
  containerButton = self->_containerButton;
  self->_containerButton = v7;

  -[PUPhotoEditAdjustmentControl setUserInteractionEnabled:](self->_containerButton, "setUserInteractionEnabled:", 0);
  -[PUPhotoEditBaseAdjustmentCell contentView](self, "contentView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_containerButton);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell prepareForReuse](&v5, sel_prepareForReuse);
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetToDefaults");

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  -[PUPhotoEditBaseAdjustmentCell setIsUserModifying:](self, "setIsUserModifying:", 0);
  -[PUPhotoEditBaseAdjustmentCell setImageTransformBlock:](self, "setImageTransformBlock:", 0);
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PUPhotoEditBaseAdjustmentCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (id)focusEffect
{
  return 0;
}

- (void)setValue:(double)a3
{
  id v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:", a3);

}

- (double)value
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (void)setDefaultValue:(double)a3
{
  id v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValue:", a3);

}

- (double)defaultValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultValue");
  v4 = v3;

  return v4;
}

- (void)setIdentityValue:(double)a3
{
  id v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityValue:", a3);

}

- (double)identityValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityValue");
  v4 = v3;

  return v4;
}

- (void)setMinValue:(double)a3
{
  id v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinValue:", a3);

}

- (double)minValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue");
  v4 = v3;

  return v4;
}

- (void)setMaxValue:(double)a3
{
  id v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxValue:", a3);

}

- (double)maxValue
{
  void *v2;
  double v3;
  double v4;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxValue");
  v4 = v3;

  return v4;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditBaseAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setSelected:](&v7, sel_setSelected_);
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "alwaysShowValueWhenAdjustmentIsSelected");

  -[PUPhotoEditBaseAdjustmentCell setIsUserModifying:](self, "setIsUserModifying:", v3 & v6);
}

- (void)resetToDefault
{
  -[PUPhotoEditBaseAdjustmentCell defaultValue](self, "defaultValue");
  -[PUPhotoEditBaseAdjustmentCell setValue:](self, "setValue:");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXEdgeInsetsMake();
  -[PUPhotoEditBaseAdjustmentCell frame](self, "frame");
  PXEdgeInsetsInsetRect();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:cornerRadius:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (BOOL)imageIsColor
{
  return self->_imageIsColor;
}

- (void)setImageIsColor:(BOOL)a3
{
  self->_imageIsColor = a3;
}

- (id)imageTransformBlock
{
  return self->_imageTransformBlock;
}

- (void)setImageTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isUserModifying
{
  return self->_isUserModifying;
}

- (void)setIsUserModifying:(BOOL)a3
{
  self->_isUserModifying = a3;
}

- (PUPhotoEditAdjustmentControl)containerButton
{
  return self->_containerButton;
}

- (void)setContainerButton:(id)a3
{
  objc_storeStrong((id *)&self->_containerButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerButton, 0);
  objc_storeStrong(&self->_imageTransformBlock, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
