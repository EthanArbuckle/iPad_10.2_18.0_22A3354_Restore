@implementation SmallButtonOutlineCellModel

- (SmallButtonOutlineCellModel)initWithStyle:(int64_t)a3 title:(id)a4 image:(id)a5 hoverImage:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SmallButtonOutlineCellModel *v16;
  SmallButtonOutlineCellModel *v17;
  NSString *v18;
  NSString *title;
  objc_super v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SmallButtonOutlineCellModel;
  v16 = -[SmallButtonOutlineCellModel init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    v16->_style = a3;
    v18 = (NSString *)objc_msgSend(v12, "copy");
    title = v17->_title;
    v17->_title = v18;

    objc_storeStrong((id *)&v17->_image, a5);
    objc_storeStrong((id *)&v17->_hoverImage, a6);
    objc_storeWeak((id *)&v17->_delegate, v15);
  }

  return v17;
}

- (unint64_t)hash
{
  int64_t style;

  style = self->_style;
  return -[NSString hash](self->_title, "hash") ^ style;
}

- (BOOL)isEqual:(id)a3
{
  SmallButtonOutlineCellModel *v4;
  SmallButtonOutlineCellModel *v5;
  uint64_t v6;
  SmallButtonOutlineCellModel *v7;
  NSString *v8;
  NSString *v9;
  UIImage *v10;
  UIImage *v11;
  UIImage *v12;
  UIImage *v13;
  id v14;
  id WeakRetained;
  unsigned __int8 v16;

  v4 = (SmallButtonOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v16 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    if (-[SmallButtonOutlineCellModel style](v7, "style") == self->_style)
    {
      v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel title](v7, "title"));
      v9 = v8;
      if (v8 == self->_title || -[NSString isEqual:](v8, "isEqual:"))
      {
        v10 = (UIImage *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel image](v7, "image"));
        v11 = v10;
        if (v10 == self->_image || -[UIImage isEqual:](v10, "isEqual:"))
        {
          v12 = (UIImage *)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel hoverImage](v7, "hoverImage"));
          v13 = v12;
          if (v12 == self->_hoverImage || -[UIImage isEqual:](v12, "isEqual:"))
          {
            v14 = (id)objc_claimAutoreleasedReturnValue(-[SmallButtonOutlineCellModel delegate](v7, "delegate"));
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if (v14 == WeakRetained)
              v16 = 1;
            else
              v16 = objc_msgSend(v14, "isEqual:", WeakRetained);

          }
          else
          {
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SmallButtonOutlineCellRegistration sharedRegistration](SmallButtonOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[SmallButtonOutlineCellModel isEqual:](self, "isEqual:", a3);
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)hoverImage
{
  return self->_hoverImage;
}

- (SmallButtonOutlineCellDelegate)delegate
{
  return (SmallButtonOutlineCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
