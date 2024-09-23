@implementation PXSharedLibraryFaceTileImageProviderModel

- (PXSharedLibraryFaceTileImageProviderModel)init
{
  PXSharedLibraryFaceTileImageProviderModel *v2;
  PXSharedLibraryFaceTileImageProviderModel *v3;
  NSArray *faceTileCombinerItems;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryFaceTileImageProviderModel;
  v2 = -[PXSharedLibraryFaceTileImageProviderModel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    faceTileCombinerItems = v2->_faceTileCombinerItems;
    v2->_faceTileCombinerItems = (NSArray *)MEMORY[0x1E0C9AA60];

    v3->_isAscending = 1;
    v3->_imageDiameter = 60.0;
    v3->_imageOffset = 0.5;
    v3->_borderWidth = 3.0;
  }
  return v3;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryFaceTileImageProviderModel;
  -[PXSharedLibraryFaceTileImageProviderModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setIncludeMeContact:(BOOL)a3
{
  if (self->_includeMeContact != a3)
  {
    self->_includeMeContact = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setDisplayScale:(double)a3
{
  void *v6;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryFaceTileImageProviderModel.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayScale > 0"));

  }
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)setIsRTL:(BOOL)a3
{
  if (self->_isRTL != a3)
  {
    self->_isRTL = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setIsAscending:(BOOL)a3
{
  if (self->_isAscending != a3)
  {
    self->_isAscending = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setImageDiameter:(double)a3
{
  void *v6;

  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryFaceTileImageProviderModel.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageDiameter > 0"));

  }
  if (self->_imageDiameter != a3)
  {
    self->_imageDiameter = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setImageOffset:(double)a3
{
  if (self->_imageOffset != a3)
  {
    self->_imageOffset = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;
  UIColor *backgroundColor;
  void *v10;
  UIColor *v11;

  v11 = (UIColor *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryFaceTileImageProviderModel.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundColor"));

  }
  v5 = self->_backgroundColor;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:", v11);

    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)-[UIColor copy](v11, "copy");
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v8;

      -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 128);
    }
  }

}

- (void)setBorderColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  char v7;
  UIColor *v8;
  UIColor *borderColor;
  void *v10;
  UIColor *v11;

  v11 = (UIColor *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryFaceTileImageProviderModel.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("borderColor"));

  }
  v5 = self->_borderColor;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[UIColor isEqual:](v5, "isEqual:", v11);

    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)-[UIColor copy](v11, "copy");
      borderColor = self->_borderColor;
      self->_borderColor = v8;

      -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setBorderWidth:(double)a3
{
  void *v6;

  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryFaceTileImageProviderModel.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("borderWidth >= 0"));

  }
  if (self->_borderWidth != a3)
  {
    self->_borderWidth = a3;
    -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setFaceTileCombinerItems:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *faceTileCombinerItems;
  void *v10;
  NSArray *v11;

  v11 = (NSArray *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryFaceTileImageProviderModel.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("faceTileCombinerItems"));

  }
  v5 = self->_faceTileCombinerItems;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSArray isEqual:](v5, "isEqual:", v11);

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)-[NSArray copy](v11, "copy");
      faceTileCombinerItems = self->_faceTileCombinerItems;
      self->_faceTileCombinerItems = v8;

      -[PXSharedLibraryFaceTileImageProviderModel signalChange:](self, "signalChange:", 512);
    }
  }

}

- (BOOL)includeMeContact
{
  return self->_includeMeContact;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (BOOL)isAscending
{
  return self->_isAscending;
}

- (double)imageDiameter
{
  return self->_imageDiameter;
}

- (double)imageOffset
{
  return self->_imageOffset;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (NSArray)faceTileCombinerItems
{
  return self->_faceTileCombinerItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTileCombinerItems, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
