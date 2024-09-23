@implementation TUIButtonStateBuilder

- (void)addAttributedString:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  NSAttributedString *v8;
  NSAttributedString *title;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("title")))
  {
    v8 = (NSAttributedString *)objc_msgSend(v10, "copy");
    title = self->_title;
    self->_title = v8;

  }
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  UIImage *v8;
  UIImage *image;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("image")))
  {
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
    image = self->_image;
    self->_image = v8;

  }
}

- (void)addContentModel:(id)a3
{
  objc_storeStrong((id *)&self->_contentModel, a3);
}

- (id)finalizeButtonStateModelWithContext:(id)a3
{
  id v4;
  TUIButtonStateModel *v5;
  void *v6;
  TUIModel *contentModel;

  v4 = a3;
  if (*(_OWORD *)&self->_title == 0 && !self->_contentModel)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[TUIButtonStateModel initWithTitle:image:]([TUIButtonStateModel alloc], "initWithTitle:image:", self->_title, self->_image);
    if (self->_contentModel)
    {
      contentModel = self->_contentModel;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &contentModel, 1));
      -[TUIButtonStateModel updateModelChildren:](v5, "updateModelChildren:", v6);

    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentModel, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
