@implementation VUINamedLayerStack

- (VUINamedLayerStack)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUINamedLayerStack;
  return -[VUINamedLayerStack init](&v3, sel_init);
}

+ (id)namedLayerStackWithImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "_representsLayeredImage"))
  {
    objc_msgSend(v3, "imageAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_layerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "layers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "layers", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          +[VUINamedLayerImage namedLayerImageFromNamedLayerImage:](VUINamedLayerImage, "namedLayerImageFromNamedLayerImage:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    if (v5 && objc_msgSend(v8, "count"))
    {
      v15 = -[VUINamedLayerStack _init]([VUIDeflatableNamedLayerImage alloc], "_init");
      objc_msgSend(v15, "setLayerStack:", v5);
      v16 = (void *)MEMORY[0x1E0CEA638];
      v17 = objc_retainAutorelease(v3);
      objc_msgSend(v16, "imageWithCGImage:", objc_msgSend(v17, "CGImage"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setCornerRadiusFlatImage:", v18);

      v19 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v15, "setReplacementLayers:", v19);

      objc_msgSend(v15, "setOriginalImage:", v17);
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)decodedNamedLayerStackWithImage:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  CGImage *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[3];

  height = a4.height;
  width = a4.width;
  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "_representsLayeredImage"))
  {
    v9 = objc_retainAutorelease(v8);
    v34[0] = objc_msgSend(v9, "CGImage");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = VUICompositeBitmapImageOfSizeForImages(v10, 0, 0, width, height, a5);

    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v11);
    v28 = objc_claimAutoreleasedReturnValue();
    CGImageRelease(v11);
    v27 = v9;
    objc_msgSend(v9, "imageAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_layerStack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "layers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v13, "layers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          +[VUINamedLayerImage decodedNamedLayerImageFromNamedLayerImage:](VUINamedLayerImage, "decodedNamedLayerImageFromNamedLayerImage:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v16, "addObject:", v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    if (v13)
    {
      v23 = 0;
      v24 = (void *)v28;
      if (objc_msgSend(v16, "count") && v28)
      {
        v23 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
        objc_msgSend(v23, "setLayerStack:", v13);
        objc_msgSend(v23, "setCornerRadiusFlatImage:", v28);
        v25 = (void *)objc_msgSend(v16, "copy");
        objc_msgSend(v23, "setReplacementLayers:", v25);

        objc_msgSend(v23, "setOriginalImage:", v27);
      }
    }
    else
    {
      v23 = 0;
      v24 = (void *)v28;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSString)name
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  -[VUINamedLayerStack layerStack](self, "layerStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUINamedLayerStack layerStack](self, "layerStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUINamedLayerStack replacementLayers](self, "replacementLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v5 = objc_claimAutoreleasedReturnValue();

  }
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = CFSTR("VUIDefaultLayerStackName");
  return (NSString *)v7;
}

- (NSArray)layers
{
  void *v3;
  void *v4;
  void *v5;

  -[VUINamedLayerStack replacementLayers](self, "replacementLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUINamedLayerStack replacementLayers](self, "replacementLayers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VUINamedLayerStack layerStack](self, "layerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v4;
}

- (CGSize)size
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[VUINamedLayerStack layerStack](self, "layerStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUINamedLayerStack layerStack](self, "layerStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[VUINamedLayerStack replacementLayers](self, "replacementLayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "frame");
    v6 = v10;
    v8 = v11;
  }

  v12 = v6;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)scale
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  -[VUINamedLayerStack layerStack](self, "layerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VUINamedLayerStack layerStack](self, "layerStack");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v5 = v8;

  }
  return v5;
}

- (CGImage)flattenedImage
{
  id v2;
  CGImage *v3;

  -[VUINamedLayerStack cornerRadiusFlatImage](self, "cornerRadiusFlatImage");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGImage *)objc_msgSend(v2, "CGImage");

  return v3;
}

- (id)radiosityImage
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VUINamedLayerStack layerStack](self, "layerStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VUINamedLayerStack layerStack](self, "layerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "radiosityImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (CGSize)radiosityImageScale
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[VUINamedLayerStack layerStack](self, "layerStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VUINamedLayerStack layerStack](self, "layerStack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "radiosityImageScale");
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)flatImageContainsCornerRadius
{
  return !+[VUICoreUtilities canHandleDecodingOnRenderThread](VUICoreUtilities, "canHandleDecodingOnRenderThread");
}

- (UINamedLayerStack)layerStack
{
  return self->_layerStack;
}

- (void)setLayerStack:(id)a3
{
  objc_storeStrong((id *)&self->_layerStack, a3);
}

- (UIImage)cornerRadiusFlatImage
{
  return self->_cornerRadiusFlatImage;
}

- (void)setCornerRadiusFlatImage:(id)a3
{
  objc_storeStrong((id *)&self->_cornerRadiusFlatImage, a3);
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (void)setOriginalImage:(id)a3
{
  objc_storeStrong((id *)&self->_originalImage, a3);
}

- (NSArray)replacementLayers
{
  return self->_replacementLayers;
}

- (void)setReplacementLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementLayers, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_cornerRadiusFlatImage, 0);
  objc_storeStrong((id *)&self->_layerStack, 0);
}

@end
