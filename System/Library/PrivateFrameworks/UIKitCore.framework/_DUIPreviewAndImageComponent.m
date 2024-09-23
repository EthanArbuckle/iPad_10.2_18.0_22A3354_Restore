@implementation _DUIPreviewAndImageComponent

- (_DUIPreviewAndImageComponent)initWithPreviewAndImageComponent:(id)a3
{
  _DUIPreviewAndImageComponent *v3;
  _DUIPreviewAndImageComponent *v4;
  void *v5;
  uint64_t v6;
  _DUIImageComponent *imageComponent;
  void *v8;
  uint64_t v9;
  _DUIPreview *preview;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DUIPreviewAndImageComponent;
  v3 = -[_DUIPreviewAndImageComponent init](&v12, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    v3->_index = -[_DUIPreviewAndImageComponent index](v3, "index");
    -[_DUIPreviewAndImageComponent imageComponent](v4, "imageComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    imageComponent = v4->_imageComponent;
    v4->_imageComponent = (_DUIImageComponent *)v6;

    -[_DUIPreviewAndImageComponent preview](v4, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    preview = v4->_preview;
    v4->_preview = (_DUIPreview *)v9;

  }
  return v4;
}

- (_DUIPreviewAndImageComponent)initWithCoder:(id)a3
{
  id v4;
  _DUIPreviewAndImageComponent *v5;
  uint64_t v6;
  _DUIPreview *preview;
  uint64_t v8;
  _DUIImageComponent *imageComponent;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DUIPreviewAndImageComponent;
  v5 = -[_DUIPreviewAndImageComponent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preview"));
    v6 = objc_claimAutoreleasedReturnValue();
    preview = v5->_preview;
    v5->_preview = (_DUIPreview *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageComponent"));
    v8 = objc_claimAutoreleasedReturnValue();
    imageComponent = v5->_imageComponent;
    v5->_imageComponent = (_DUIImageComponent *)v8;

    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("index"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_DUIPreviewAndImageComponent preview](self, "preview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("preview"));

  -[_DUIPreviewAndImageComponent imageComponent](self, "imageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("imageComponent"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[_DUIPreviewAndImageComponent index](self, "index"), CFSTR("index"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  _DUIPreview *v8;
  _DUIPreview *v9;
  _DUIPreview *v10;
  _BOOL4 v11;
  _DUIImageComponent *imageComponent;
  void *v13;
  _DUIPreview *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self->_index != v5[3])
    {
      LOBYTE(v11) = 0;
LABEL_17:

      goto LABEL_18;
    }
    v7 = (void *)v5[1];
    v8 = self->_preview;
    v9 = v7;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      LOBYTE(v11) = 0;
      if (!v8 || !v9)
      {
LABEL_16:

        goto LABEL_17;
      }
      v11 = -[_DUIPreview isEqual:](v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_17;
    }
    imageComponent = self->_imageComponent;
    v13 = (void *)v6[2];
    v8 = imageComponent;
    v14 = v13;
    if (v8 == v14)
    {
      LOBYTE(v11) = 1;
      v10 = v8;
    }
    else
    {
      v10 = v14;
      LOBYTE(v11) = 0;
      if (v8 && v14)
        LOBYTE(v11) = -[_DUIPreview isEqual:](v8, "isEqual:", v14);
    }
    goto LABEL_16;
  }
  LOBYTE(v11) = 0;
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  unint64_t index;
  uint64_t v4;

  index = self->_index;
  v4 = -[_DUIPreview hash](self->_preview, "hash") ^ index;
  return v4 ^ -[_DUIImageComponent hash](self->_imageComponent, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPreviewAndImageComponent:", self);
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (void)setPreview:(id)a3
{
  objc_storeStrong((id *)&self->_preview, a3);
}

- (_DUIImageComponent)imageComponent
{
  return self->_imageComponent;
}

- (void)setImageComponent:(id)a3
{
  objc_storeStrong((id *)&self->_imageComponent, a3);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageComponent, 0);
  objc_storeStrong((id *)&self->_preview, 0);
}

@end
