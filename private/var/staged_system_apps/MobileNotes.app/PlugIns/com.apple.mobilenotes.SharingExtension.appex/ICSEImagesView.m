@implementation ICSEImagesView

- (ICSEImagesView)initWithCoder:(id)a3
{
  ICSEImagesView *v3;
  ICSEImagesView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSEImagesView;
  v3 = -[ICSEImagesView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ICSEImagesView commonInit](v3, "commonInit");
  return v4;
}

- (ICSEImagesView)initWithFrame:(CGRect)a3
{
  ICSEImagesView *v3;
  ICSEImagesView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSEImagesView;
  v3 = -[ICSEImagesView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICSEImagesView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v3 = objc_msgSend(objc_alloc((Class)ICImageAndMovieThumbnailView), "initWithFrame:showMovieDuration:", 1, 0.0, 0.0, 64.0, 64.0);
  v35[0] = v3;
  v4 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 2.0, -3.0, 60.0, 60.0);
  v35[1] = v4;
  v5 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 4.0, -6.0, 56.0, 56.0);
  v35[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
  -[ICSEImagesView setImageViews:](self, "setImageViews:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v8, "setAlpha:", 0.8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 2));
  objc_msgSend(v10, "setAlpha:", 0.6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v12, "setClipsToBounds:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v14, "setContentMode:", 2);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 2));
  objc_msgSend(v16, "setClipsToBounds:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 2));
  objc_msgSend(v18, "setContentMode:", 2);

  v19 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 2.0, -1.0, 60.0, 1.0);
  v20 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 4.0, -4.0, 56.0, 4.0, v19);
  v34[1] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v22, "setBackgroundColor:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v24, "setBackgroundColor:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 2));
  -[ICSEImagesView addSubview:](self, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 1));
  -[ICSEImagesView addSubview:](self, "addSubview:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndexedSubscript:", 1));
  -[ICSEImagesView addSubview:](self, "addSubview:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
  -[ICSEImagesView addSubview:](self, "addSubview:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
  -[ICSEImagesView addSubview:](self, "addSubview:", v33);

}

- (void)setMediaPreview:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  _QWORD v8[3];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));
  if (objc_msgSend(v6, "isVideoPreview"))
  {
    if (v6)
      objc_msgSend(v6, "videoDuration");
    else
      memset(v8, 0, sizeof(v8));
    -[ICSEImagesView setImage:movieDuration:atIndex:](self, "setImage:movieDuration:atIndex:", v7, v8, a4);
  }
  else
  {
    -[ICSEImagesView setImage:atIndex:](self, "setImage:atIndex:", v7, a4);
  }

}

- (void)setImage:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v8 = v7;
  if (a4)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));

    objc_msgSend(v9, "setImage:", v6);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

    objc_msgSend(v9, "setImage:", v6);
    objc_msgSend(v9, "setShowAsMovie:", 0);
  }

}

- (void)setImage:(id)a3 movieDuration:(id *)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  int64_t var3;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
  v10 = v9;
  if (a5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a5));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));

  }
  objc_msgSend(v11, "frame");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "size");
  v18 = v17;
  objc_msgSend(v8, "scale");
  v20 = v18 * v19;
  objc_msgSend(v8, "size");
  v22 = v20 * v21;
  objc_msgSend(v8, "scale");
  v24 = v23 * v22;
  objc_msgSend(v11, "contentScaleFactor");
  v26 = v16 * (v14 * v25);
  objc_msgSend(v11, "contentScaleFactor");
  if (v24 <= v27 * v26 * 16.0)
  {
    v29 = v8;
  }
  else
  {
    objc_msgSend(v11, "contentScaleFactor");
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_scaledImageMinDimension:scale:", 64.0, v28));
  }
  v30 = v29;
  if (a5)
  {
    -[ICSEImagesView setImage:atIndex:](self, "setImage:atIndex:", v29, a5);
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEImagesView imageViews](self, "imageViews"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", 0));

    objc_msgSend(v32, "setImage:", v30);
    objc_msgSend(v32, "setShowAsMovie:", 1);
    v33 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v32, "setMovieDuration:", &v33);

  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (UIImageView)movieGlyph
{
  return self->_movieGlyph;
}

- (void)setMovieGlyph:(id)a3
{
  objc_storeStrong((id *)&self->_movieGlyph, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieGlyph, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
}

@end
