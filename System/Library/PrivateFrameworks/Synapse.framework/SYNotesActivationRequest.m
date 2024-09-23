@implementation SYNotesActivationRequest

- (SYNotesActivationRequest)init
{
  SYNotesActivationRequest *v2;
  uint64_t v3;
  NSMutableArray *urls;
  uint64_t v5;
  NSMutableArray *imagesData;
  uint64_t v7;
  NSMutableArray *imageFileURLs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SYNotesActivationRequest;
  v2 = -[SYNotesActivationRequest init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    urls = v2->__urls;
    v2->__urls = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    imagesData = v2->__imagesData;
    v2->__imagesData = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    imageFileURLs = v2->__imageFileURLs;
    v2->__imageFileURLs = (NSMutableArray *)v7;

  }
  return v2;
}

- (NSArray)urls
{
  void *v2;
  void *v3;

  -[SYNotesActivationRequest _urls](self, "_urls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYNotesActivationRequest _urls](self, "_urls");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addURLs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYNotesActivationRequest _urls](self, "_urls");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (NSArray)imagesData
{
  void *v2;
  void *v3;

  -[SYNotesActivationRequest _imagesData](self, "_imagesData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addImageData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYNotesActivationRequest _imagesData](self, "_imagesData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addImagesData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYNotesActivationRequest _imagesData](self, "_imagesData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (NSArray)imageFileURLs
{
  void *v2;
  void *v3;

  -[SYNotesActivationRequest _imageFileURLs](self, "_imageFileURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addImageFileURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYNotesActivationRequest _imageFileURLs](self, "_imageFileURLs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addImageFileURLs:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SYNotesActivationRequest _imageFileURLs](self, "_imageFileURLs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (BOOL)shouldAutoInsertLinkToCurrentActivity
{
  return self->_shouldAutoInsertLinkToCurrentActivity;
}

- (void)setShouldAutoInsertLinkToCurrentActivity:(BOOL)a3
{
  self->_shouldAutoInsertLinkToCurrentActivity = a3;
}

- (NSMutableArray)_imagesData
{
  return self->__imagesData;
}

- (void)set_imagesData:(id)a3
{
  objc_storeStrong((id *)&self->__imagesData, a3);
}

- (NSMutableArray)_urls
{
  return self->__urls;
}

- (void)set_urls:(id)a3
{
  objc_storeStrong((id *)&self->__urls, a3);
}

- (NSMutableArray)_imageFileURLs
{
  return self->__imageFileURLs;
}

- (void)set_imageFileURLs:(id)a3
{
  objc_storeStrong((id *)&self->__imageFileURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageFileURLs, 0);
  objc_storeStrong((id *)&self->__urls, 0);
  objc_storeStrong((id *)&self->__imagesData, 0);
}

@end
