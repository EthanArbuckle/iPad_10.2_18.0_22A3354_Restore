@implementation PXImageTitleSubtitleSpec

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXImageTitleSubtitleSpec;
  v3 = -[PXViewSpec hash](&v9, sel_hash);
  -[PXImageTitleSubtitleSpec titleSubtitleSpec](self, "titleSubtitleSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[PXImageTitleSubtitleSpec imageSpec](self, "imageSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXImageTitleSubtitleSpec;
  v5 = -[PXViewSpec isEqual:](&v16, sel_isEqual_, v4);
  v6 = v4;
  v7 = v6;
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v6, "titleSubtitleSpec");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXImageTitleSubtitleSpec titleSubtitleSpec](self, "titleSubtitleSpec");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
LABEL_4:
      v12 = 0;
      goto LABEL_10;
    }
  }
  objc_msgSend(v7, "imageSpec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageTitleSubtitleSpec imageSpec](self, "imageSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v14)
    v12 = 1;
  else
    v12 = objc_msgSend(v13, "isEqual:", v14);

LABEL_10:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXImageTitleSubtitleSpec;
  v5 = -[PXViewSpec copyWithZone:](&v11, sel_copyWithZone_);
  v6 = -[PXTitleSubtitleLabelSpec copyWithZone:](self->_titleSubtitleSpec, "copyWithZone:", a3);
  v7 = (void *)v5[12];
  v5[12] = v6;

  v8 = -[PXImageViewSpec copyWithZone:](self->_imageSpec, "copyWithZone:", a3);
  v9 = (void *)v5[13];
  v5[13] = v8;

  return v5;
}

- (PXTitleSubtitleLabelSpec)titleSubtitleSpec
{
  return self->_titleSubtitleSpec;
}

- (void)setTitleSubtitleSpec:(id)a3
{
  objc_storeStrong((id *)&self->_titleSubtitleSpec, a3);
}

- (PXImageViewSpec)imageSpec
{
  return self->_imageSpec;
}

- (void)setImageSpec:(id)a3
{
  objc_storeStrong((id *)&self->_imageSpec, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSpec, 0);
  objc_storeStrong((id *)&self->_titleSubtitleSpec, 0);
}

@end
