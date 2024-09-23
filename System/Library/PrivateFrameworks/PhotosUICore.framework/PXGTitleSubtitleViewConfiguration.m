@implementation PXGTitleSubtitleViewConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXGTitleSubtitleViewConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[PXGTitleSubtitleViewConfiguration subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v6);

  -[PXGTitleSubtitleViewConfiguration spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpec:", v7);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXGTitleSubtitleViewConfiguration *v4;
  PXGTitleSubtitleViewConfiguration *v5;
  id v6;
  id v7;
  int v8;
  char v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;

  v4 = (PXGTitleSubtitleViewConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGTitleSubtitleViewConfiguration title](self, "title");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXGTitleSubtitleViewConfiguration title](v5, "title");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      -[PXGTitleSubtitleViewConfiguration subtitle](self, "subtitle");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PXGTitleSubtitleViewConfiguration subtitle](v5, "subtitle");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
      {

      }
      else
      {
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
        {
          v9 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[PXGTitleSubtitleViewConfiguration spec](self, "spec");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTitleSubtitleViewConfiguration spec](v5, "spec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
        v9 = 1;
      else
        v9 = objc_msgSend(v13, "isEqual:", v14);

      goto LABEL_17;
    }
    v9 = 0;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PXGTitleSubtitleViewConfiguration title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXGTitleSubtitleViewConfiguration subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ (2 * objc_msgSend(v5, "hash"));
  -[PXGTitleSubtitleViewConfiguration spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ (4 * objc_msgSend(v7, "hash"));

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PXTitleSubtitleLabelSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
