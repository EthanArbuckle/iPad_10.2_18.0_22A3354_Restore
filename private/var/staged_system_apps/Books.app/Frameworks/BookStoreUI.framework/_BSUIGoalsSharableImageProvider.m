@implementation _BSUIGoalsSharableImageProvider

- (_BSUIGoalsSharableImageProvider)initWithSharableImage:(id)a3
{
  id v5;
  _BSUIGoalsSharableImageProvider *v6;
  _BSUIGoalsSharableImageProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BSUIGoalsSharableImageProvider;
  v6 = -[_BSUIGoalsSharableImageProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharedImage, a3);

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  UIImage *v5;

  if ((objc_msgSend(a4, "isEqualToString:", UIActivityTypeMail) & 1) != 0)
    v5 = 0;
  else
    v5 = self->_sharedImage;
  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_alloc_init((Class)UIImage);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedImage, 0);
}

@end
