@implementation SearchUIWebClipIconImage

- (SearchUIWebClipIconImage)initWithWebClip:(id)a3 variant:(unint64_t)a4
{
  id v6;
  void *v7;
  SearchUIWebClipIconImage *v8;
  objc_super v10;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)SearchUIWebClipIconImage;
  v8 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](&v10, sel_initWithBundleIdentifier_variant_contentType_, v7, a4, 0);

  if (v8)
    -[SearchUIWebClipIconImage setWebClip:](v8, "setWebClip:", v6);

  return v8;
}

+ (id)convertImage:(id)a3 ofSize:(CGSize)a4 withShape:(unint64_t)a5 scale:(double)a6
{
  double height;
  double width;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    height = a4.height;
    width = a4.width;
    v10 = (objc_class *)MEMORY[0x1E0D3A7C0];
    v11 = a3;
    v12 = [v10 alloc];
    v13 = objc_retainAutorelease(v11);
    v14 = objc_msgSend(v13, "CGImage");

    v15 = (void *)objc_msgSend(v12, "initWithCGImage:scale:", v14, a6);
    v16 = objc_alloc(MEMORY[0x1E0D3A820]);
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithImages:", v17);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", width, height, a6);
    objc_msgSend(v19, "setShape:", a5);
    objc_msgSend((id)objc_opt_class(), "imageForIcon:descriptor:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUIWebClipIconImage webClip](self, "webClip");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "webClip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SearchUIWebClipIconImage webClip](self, "webClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[SearchUIWebClipIconImage webClip](self, "webClip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (void)setWebClip:(id)a3
{
  objc_storeStrong((id *)&self->_webClip, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClip, 0);
}

@end
