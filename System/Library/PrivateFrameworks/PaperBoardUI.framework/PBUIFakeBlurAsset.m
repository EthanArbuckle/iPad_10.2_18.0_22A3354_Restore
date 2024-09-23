@implementation PBUIFakeBlurAsset

- (uint64_t)imageURL
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)actualStyle
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)image
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (id)initWithActualStyle:(void *)a3 imageURL:(void *)a4 image:
{
  id v7;
  id v8;
  id *v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PBUIFakeBlurAsset;
    v9 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v10 = objc_msgSend(v7, "copy");
      v11 = a1[2];
      a1[2] = (id)v10;

      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (NSString)description
{
  return (NSString *)-[PBUIFakeBlurAsset descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIFakeBlurAsset descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIWallpaperStyleDescription(self->_actualStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("actualStyle"));

  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_imageURL, CFSTR("imageURL"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_image, CFSTR("image"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIFakeBlurAsset succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
}

@end
