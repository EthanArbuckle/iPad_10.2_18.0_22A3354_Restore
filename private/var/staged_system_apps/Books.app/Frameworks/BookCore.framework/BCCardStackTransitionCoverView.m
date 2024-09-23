@implementation BCCardStackTransitionCoverView

- (BCCardStackTransitionCoverView)initWithFrame:(CGRect)a3
{
  BCCardStackTransitionCoverView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCCardStackTransitionCoverView;
  v3 = -[BCCardStackTransitionCoverView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
    -[BCCardStackTransitionCoverView addSubview:](v3, "addSubview:", v4);
    imageView = v3->_imageView;
    v3->_imageView = v4;

  }
  return v3;
}

- (CGRect)_frameForImage:(id)a3 forDisplayingInContainerBounds:(CGRect)a4
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "size");
  v7 = CGRectMakeWithSize(v5, v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "alignmentRectInsets");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  BCNormalizedInsetsForRects(v7, v9, v11, v13, v7 + v17, v9 + v15, v11 - (v17 + v21), v13 - (v15 + v19));
  v34 = BCRectByUnapplyingNormalizedInsets(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v30, v31, v32, v33, v22, v23, v24, v25, v26, v27, v28, v29);
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (void)updateContentFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView imageView](self, "imageView"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  -[BCCardStackTransitionCoverView bounds](self, "bounds");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (v17)
  {
    -[BCCardStackTransitionCoverView _frameForImage:forDisplayingInContainerBounds:](self, "_frameForImage:forDisplayingInContainerBounds:", v17, v4, v5, v6, v7);
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v11 = v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView imageView](self, "imageView"));
  objc_msgSend(v16, "setFrame:", v8, v9, v10, v11);

}

- (UIImage)image
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView image](self, "image"));

  v5 = v20;
  if (v4 != v20)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView imageView](self, "imageView"));
    objc_msgSend(v6, "setImage:", v20);

    -[BCCardStackTransitionCoverView bounds](self, "bounds");
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    if (v20)
    {
      -[BCCardStackTransitionCoverView _frameForImage:forDisplayingInContainerBounds:](self, "_frameForImage:forDisplayingInContainerBounds:", v7, v8, v9, v10);
      v11 = v15;
      v12 = v16;
      v13 = v17;
      v14 = v18;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView imageView](self, "imageView"));
    objc_msgSend(v19, "setFrame:", v11, v12, v13, v14);

    v5 = v20;
  }

}

- (void)setImage:(id)a3 animatedWithAnimator:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView image](self, "image"));

  if (v8 != v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionCoverView image](self, "image"));

    if (v6 && v9)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_134038;
      v10[3] = &unk_28B808;
      v10[4] = self;
      v11 = v6;
      objc_msgSend(v7, "addAnimations:", v10);

    }
    else
    {
      -[BCCardStackTransitionCoverView setImage:](self, "setImage:", v6);
    }
  }

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
