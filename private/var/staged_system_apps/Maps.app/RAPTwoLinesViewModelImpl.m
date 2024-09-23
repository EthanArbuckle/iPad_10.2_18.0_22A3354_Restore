@implementation RAPTwoLinesViewModelImpl

+ (id)viewModelFromRAPMenuItem:(id)a3
{
  id v3;
  RAPTwoLinesViewModelImpl *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(RAPTwoLinesViewModelImpl);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));
  -[RAPTwoLinesViewModelImpl setImage:](v4, "setImage:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedTitle"));
  -[RAPTwoLinesViewModelImpl setTitle:](v4, "setTitle:", v6);

  if ((objc_opt_respondsToSelector(v3, "localizedServerControlledDescription") & 1) != 0
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedServerControlledDescription")),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedServerControlledDescription"));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
  }
  v10 = (void *)v9;
  -[RAPTwoLinesViewModelImpl setSubtitle:](v4, "setSubtitle:", v9);

  return v4;
}

+ (id)viewModelFromMapItem:(id)a3
{
  id v3;
  RAPTwoLinesViewModelImpl *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(RAPTwoLinesViewModelImpl);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForMapItem:forScale:](MKIconManager, "imageForMapItem:forScale:", v3));
  -[RAPTwoLinesViewModelImpl setImage:](v4, "setImage:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  -[RAPTwoLinesViewModelImpl setTitle:](v4, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_shortAddress"));
  -[RAPTwoLinesViewModelImpl setSubtitle:](v4, "setSubtitle:", v8);

  return v4;
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

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
