@implementation PFParallaxImageLayer

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PFParallaxLayer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("foreground"));

  v9 = PFFigEncodeCVPixelBufferToURL((uint64_t)-[PFParallaxImageLayer image](self, "image"), v6, v8);
  if (a4 && (_DWORD)v9)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error writing image to disk, code: %d"), v9, *MEMORY[0x1E0CB2938]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 3, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (_DWORD)v9 == 0;
}

- (id)fileExtension
{
  return CFSTR("HEIC");
}

- (PFParallaxImageLayer)initWithImage:(__CVBuffer *)a3 frame:(CGRect)a4 zPosition:(double)a5 identifier:(id)a6
{
  PFParallaxImageLayer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFParallaxImageLayer;
  v7 = -[PFParallaxLayer initWithFrame:zPosition:identifier:](&v9, sel_initWithFrame_zPosition_identifier_, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  v7->_image = CVPixelBufferRetain(a3);
  return v7;
}

- (id)layerByUpdatingFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PFParallaxImageLayer *v8;
  __CVBuffer *v9;
  double v10;
  double v11;
  void *v12;
  PFParallaxImageLayer *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = [PFParallaxImageLayer alloc];
  v9 = -[PFParallaxImageLayer image](self, "image");
  -[PFParallaxLayer zPosition](self, "zPosition");
  v11 = v10;
  -[PFParallaxLayer identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PFParallaxImageLayer initWithImage:frame:zPosition:identifier:](v8, "initWithImage:frame:zPosition:identifier:", v9, v12, x, y, width, height, v11);

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PFParallaxImageLayer;
  -[PFParallaxImageLayer dealloc](&v3, sel_dealloc);
}

- (CGSize)pixelSize
{
  size_t Width;
  size_t Height;
  double v5;
  double v6;
  CGSize result;

  Width = CVPixelBufferGetWidth(self->_image);
  Height = CVPixelBufferGetHeight(self->_image);
  v5 = (double)Width;
  v6 = (double)Height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (__CVBuffer)image
{
  return self->_image;
}

@end
