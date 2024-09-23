@implementation _VUIMonogramImageGenerator

- (NSOperationQueue)imageGeneratorQueue
{
  NSOperationQueue *imageGeneratorQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  imageGeneratorQueue = self->_imageGeneratorQueue;
  if (!imageGeneratorQueue)
  {
    v4 = (NSOperationQueue *)objc_opt_new();
    v5 = self->_imageGeneratorQueue;
    self->_imageGeneratorQueue = v4;

    imageGeneratorQueue = self->_imageGeneratorQueue;
  }
  return imageGeneratorQueue;
}

- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  double height;
  double width;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;

  v10 = a5;
  height = a4.height;
  width = a4.width;
  v14 = (void *)MEMORY[0x1E0DC6A98];
  v15 = a8;
  v16 = a7;
  v17 = a3;
  objc_msgSend(v14, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v17, v10, a6, v16, v15, width, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  double v22;
  double v23;
  double v24;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC6A98], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageKeyForObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "imageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "vuicore_isResourceOrSymbolURL") & 1) != 0)
    {
      objc_msgSend(v5, "fillColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v24 = 0.0;
        v22 = 0.0;
        v23 = 0.0;
        v21 = 0;
        objc_msgSend(v5, "fillColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0DC69B0], "vuiColor:getRed:green:blue:alpha:", v13, &v24, &v23, &v22, &v21);
          v14 = v21;
          v15 = v24 * 255.0;
          v16 = v23 * 255.0;
          v17 = v22 * 255.0;
        }
        else
        {
          v14 = 0;
          v17 = 0.0;
          v16 = 0.0;
          v15 = 0.0;
        }
        v18 = 0x1E0CB3000uLL;
        LODWORD(v18) = vcvtad_u64_f64(v15);
        LODWORD(v11) = vcvtad_u64_f64(v16);
        LODWORD(v12) = vcvtad_u64_f64(v17);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%02X%02X%02X%.1f"), v8, v18, v11, v12, v14);
        v19 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v19;
      }
    }
    else
    {

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  _BOOL8 v11;
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  char isKindOfClass;
  void *v19;
  void *v20;

  v11 = a5;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = 0;
  if (v15 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v15, "imageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[_VUIMonogramImageGenerator loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v20, v11, a6, v16, v17, width, height);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (void)cancelLoad:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC6A98];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelLoad:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageGeneratorQueue, 0);
}

@end
