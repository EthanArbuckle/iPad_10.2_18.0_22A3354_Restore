@implementation VUINamedLayerImage

- (VUINamedLayerImage)init
{

  return 0;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUINamedLayerImage;
  result = -[VUINamedLayerImage init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 2) = 0;
  return result;
}

+ (id)namedLayerImageFromNamedLayerImage:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
    objc_msgSend(v4, "setNamedLayerImage:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)decodedNamedLayerImageFromNamedLayerImage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
    objc_msgSend(v4, "setNamedLayerImage:", v3);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v3, "imageObj"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v6 = (void *)v5;
      +[VUIGraphicsImageRenderer decodedImage:opaque:](VUIGraphicsImageRenderer, "decodedImage:opaque:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "setDecodedImage:", v7);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("VUIDefaultLayerName");
  }
  return (NSString *)v5;
}

- (CGRect)frame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[VUINamedLayerImage decodedImage](self, "decodedImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v6 = *MEMORY[0x1E0C9D648];
      v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      goto LABEL_6;
    }
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[VUINamedLayerImage decodedImage](self, "decodedImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v10 = v14;
    v12 = v15;
  }

LABEL_6:
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (double)opacity
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1.0;
  -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "opacity");
  v6 = v5;

  return v6;
}

- (BOOL)fixedFrame
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[VUINamedLayerImage namedLayerImage](self, "namedLayerImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fixedFrame");

  return v6;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (UIImage)decodedImage
{
  return self->_decodedImage;
}

- (void)setDecodedImage:(id)a3
{
  objc_storeStrong((id *)&self->_decodedImage, a3);
}

- (UINamedLayerImage)namedLayerImage
{
  return self->_namedLayerImage;
}

- (void)setNamedLayerImage:(id)a3
{
  objc_storeStrong((id *)&self->_namedLayerImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedLayerImage, 0);
  objc_storeStrong((id *)&self->_decodedImage, 0);
}

@end
