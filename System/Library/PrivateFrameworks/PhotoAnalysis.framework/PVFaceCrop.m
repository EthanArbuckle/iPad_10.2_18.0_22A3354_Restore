@implementation PVFaceCrop

- (PVFaceCrop)initWithLocalIdentifier:(id)a3 faceCropData:(id)a4
{
  id v6;
  PVFaceCrop *v7;
  uint64_t v8;
  NSData *faceCropData;
  PVFaceCrop *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PVFaceCrop;
  v7 = -[PVObject initWithLocalIdentifier:](&v12, sel_initWithLocalIdentifier_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    faceCropData = v7->_faceCropData;
    v7->_faceCropData = (NSData *)v8;

    v10 = v7;
  }

  return v7;
}

- (PVFaceCrop)initWithFaceCropData:(id)a3 originatingFace:(id)a4
{
  id v6;
  id v7;
  PVFaceCrop *v8;
  uint64_t v9;
  NSData *faceCropData;
  PVFaceCrop *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVFaceCrop;
  v8 = -[PVObject initWithLocalIdentifier:](&v13, sel_initWithLocalIdentifier_, 0);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    faceCropData = v8->_faceCropData;
    v8->_faceCropData = (NSData *)v9;

    objc_storeStrong((id *)&v8->_originatingFace, a4);
    v11 = v8;
  }

  return v8;
}

- (id)faceCropData
{
  return self->_faceCropData;
}

- (id)originatingFace
{
  return self->_originatingFace;
}

- (CGSize)imageDimensions
{
  CGSize *p_cachedImageDimensions;
  double width;
  double height;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGSize result;

  p_cachedImageDimensions = &self->_cachedImageDimensions;
  width = self->_cachedImageDimensions.width;
  height = self->_cachedImageDimensions.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PVFaceCrop faceCropData](self, "faceCropData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PVFaceCropUtils faceCropDimensionsFromFaceCrop:error:](PVFaceCropUtils, "faceCropDimensionsFromFaceCrop:error:", v6, 0);
    p_cachedImageDimensions->width = v7;
    p_cachedImageDimensions->height = v8;

    width = p_cachedImageDimensions->width;
    height = p_cachedImageDimensions->height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  PVFace *originatingFace;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)PVFaceCrop;
  -[PVObject description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("  state                  : %ld\n"), -[PVFaceCrop state](self, "state"));
  originatingFace = self->_originatingFace;
  if (originatingFace)
  {
    -[PVObject localIdentifier](originatingFace, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  originating face       : %@\n"), v7);

  }
  return v5;
}

- (signed)state
{
  return self->_state;
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingFace, 0);
  objc_storeStrong((id *)&self->_faceCropData, 0);
}

@end
