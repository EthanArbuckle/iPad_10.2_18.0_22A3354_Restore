@implementation REImageContentProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (REImageContentProvider)imageContentProviderWithOnePieceImage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:foregroundImage:backgroundImage:", v4, 0, 0);

  return (REImageContentProvider *)v5;
}

+ (REImageContentProvider)imageContentProviderWithOnePieceImage:(id)a3 twoPieceForegroundImage:(id)a4 twoPieceBackgroundImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:foregroundImage:backgroundImage:", v10, v9, v8);

  return (REImageContentProvider *)v11;
}

- (REImageContentProvider)initWithImage:(id)a3 foregroundImage:(id)a4 backgroundImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  REImageContentProvider *v11;
  uint64_t v12;
  REImage *onePieceImage;
  uint64_t v14;
  REImage *twoPieceBackgroundImage;
  uint64_t v16;
  REImage *twoPieceForegroundImage;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)REImageContentProvider;
  v11 = -[REImageContentProvider init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    onePieceImage = v11->_onePieceImage;
    v11->_onePieceImage = (REImage *)v12;

    v14 = objc_msgSend(v10, "copy");
    twoPieceBackgroundImage = v11->_twoPieceBackgroundImage;
    v11->_twoPieceBackgroundImage = (REImage *)v14;

    v16 = objc_msgSend(v9, "copy");
    twoPieceForegroundImage = v11->_twoPieceForegroundImage;
    v11->_twoPieceForegroundImage = (REImage *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:foregroundImage:backgroundImage:", self->_onePieceImage, self->_twoPieceForegroundImage, self->_twoPieceBackgroundImage);
}

+ (id)imageContentProviderFromClockKitImageProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  RelevanceEngineUILibrary();
  objc_msgSend(v4, "onePieceImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REImage imageWithImage:](REImage, "imageWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "twoPieceImageForeground");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[REImage imageWithImage:](REImage, "imageWithImage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "twoPieceImageBackground");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[REImage imageWithImage:](REImage, "imageWithImage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:foregroundImage:backgroundImage:", v6, v8, v10);
  return v11;
}

- (id)clockKitImageProviderRepresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  RelevanceEngineUILibrary();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v3 = (void *)getCLKImageProviderClass_softClass;
  v14 = getCLKImageProviderClass_softClass;
  if (!getCLKImageProviderClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getCLKImageProviderClass_block_invoke;
    v10[3] = &unk_24CF8AC38;
    v10[4] = &v11;
    __getCLKImageProviderClass_block_invoke((uint64_t)v10);
    v3 = (void *)v12[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v11, 8);
  -[REImage image](self->_onePieceImage, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REImage image](self->_twoPieceForegroundImage, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REImage image](self->_twoPieceBackgroundImage, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  REImage *onePieceImage;
  id v5;

  onePieceImage = self->_onePieceImage;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", onePieceImage, CFSTR("onePieceImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_twoPieceForegroundImage, CFSTR("twoPieceForeground"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_twoPieceBackgroundImage, CFSTR("twoPieceBackground"));

}

- (REImageContentProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  REImageContentProvider *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("onePieceImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("twoPieceForeground"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("twoPieceBackground"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[REImageContentProvider initWithImage:foregroundImage:backgroundImage:](self, "initWithImage:foregroundImage:backgroundImage:", v5, v6, v7);
  return v8;
}

- (REImage)onePieceImage
{
  return self->_onePieceImage;
}

- (REImage)twoPieceForegroundImage
{
  return self->_twoPieceForegroundImage;
}

- (REImage)twoPieceBackgroundImage
{
  return self->_twoPieceBackgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_twoPieceBackgroundImage, 0);
  objc_storeStrong((id *)&self->_twoPieceForegroundImage, 0);
  objc_storeStrong((id *)&self->_onePieceImage, 0);
}

@end
