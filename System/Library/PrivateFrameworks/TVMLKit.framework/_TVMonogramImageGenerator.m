@implementation _TVMonogramImageGenerator

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
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v10 = a5;
  height = a4.height;
  width = a4.width;
  v14 = a8;
  v15 = a7;
  v16 = a3;
  +[TVURLImageLoader sharedInstance](TVURLImageLoader, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v16, v10, a6, v15, v14, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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
  void *v11;
  unint64_t v12;
  char **__ptr32 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  double v18;
  double v19;
  double v20;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  +[TVURLImageLoader sharedInstance](TVURLImageLoader, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageKeyForObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "tv_isResourceURL") & 1) != 0)
  {
    objc_msgSend(v5, "fillColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v20 = 0.0;
      v18 = 0.0;
      v19 = 0.0;
      v17 = 0;
      objc_msgSend(v5, "fillColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);

      v12 = 0x24BDD1000uLL;
      v13 = &off_222E76000;
      LODWORD(v13) = vcvtad_u64_f64(v20 * 255.0);
      LODWORD(v14) = vcvtad_u64_f64(v19 * 255.0);
      LODWORD(v12) = vcvtad_u64_f64(v18 * 255.0);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%02X%02X%02X%.1f"), v8, v13, v14, v12, v17);
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }
  }
  else
  {

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
      -[_TVMonogramImageGenerator loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForURL:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v20, v11, a6, v16, v17, width, height);
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
  id v3;
  id v4;

  v3 = a3;
  +[TVURLImageLoader sharedInstance](TVURLImageLoader, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelLoad:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageGeneratorQueue, 0);
}

@end
