@implementation PRXIconContentViewController

- (PRXIconContentViewController)initWithContentView:(id)a3
{
  PRXIconContentViewController *v3;
  PRXIconContentViewController *v4;
  NSArray *images;
  NSString *bodyText;
  PRXIconContentViewController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRXIconContentViewController;
  v3 = -[PRXCardContentViewController initWithContentView:](&v9, sel_initWithContentView_, a3);
  v4 = v3;
  if (v3)
  {
    images = v3->_images;
    v3->_images = (NSArray *)MEMORY[0x24BDBD1A8];

    bodyText = v4->_bodyText;
    v4->_bodyText = (NSString *)&stru_24CC320A8;

    v7 = v4;
  }

  return v4;
}

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXIconContentViewController;
  -[PRXCardContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRXIconContentViewController _updateImageViews](self, "_updateImageViews");
  -[PRXIconContentViewController _updateBodyLabel](self, "_updateBodyLabel");
}

- (void)setImages:(id)a3
{
  NSArray *v4;
  NSArray *images;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_images, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    images = self->_images;
    self->_images = v4;

    -[PRXIconContentViewController _updateImageViews](self, "_updateImageViews");
  }

}

- (void)setImageStyle:(int64_t)a3
{
  if (self->_imageStyle != a3)
  {
    self->_imageStyle = a3;
    -[PRXIconContentViewController _updateImageViews](self, "_updateImageViews");
  }
}

- (void)_updateImageViews
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[PRXIconContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_images, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_images;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          +[PRXImageView imageViewWithStyle:](PRXImageView, "imageViewWithStyle:", self->_imageStyle, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setImage:", v9);
          objc_msgSend(v3, "addObject:", v10);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    -[PRXCardContentViewController contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImageViews:", v3);

  }
}

- (void)setBodyText:(id)a3
{
  NSString *v4;
  NSString *bodyText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_bodyText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    bodyText = self->_bodyText;
    self->_bodyText = v4;

    -[PRXIconContentViewController _updateBodyLabel](self, "_updateBodyLabel");
  }

}

- (void)_updateBodyLabel
{
  void *v3;
  id v4;

  if (-[PRXIconContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[NSString length](self->_bodyText, "length"))
    {
      +[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setText:", self->_bodyText);
      -[PRXCardContentViewController contentView](self, "contentView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBodyLabel:", v4);

    }
    else
    {
      -[PRXCardContentViewController contentView](self, "contentView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBodyLabel:", 0);
    }

  }
}

- (int64_t)imageStyle
{
  return self->_imageStyle;
}

- (NSArray)images
{
  return self->_images;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
