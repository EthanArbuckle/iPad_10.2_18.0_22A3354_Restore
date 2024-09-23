@implementation PUPhotoStreamAlbumTableViewCell

- (NSString)text
{
  void *v2;
  void *v3;

  -[PUPhotoStreamAlbumTableViewCell textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoStreamAlbumTableViewCell textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)detailText
{
  void *v2;
  void *v3;

  -[PUPhotoStreamAlbumTableViewCell detailTextLabel](self, "detailTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDetailText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoStreamAlbumTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double Width;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v51.receiver = self;
  v51.super_class = (Class)PUPhotoStreamAlbumTableViewCell;
  -[PUPhotoStreamAlbumTableViewCell layoutSubviews](&v51, sel_layoutSubviews);
  v3 = -[PUPhotoStreamAlbumTableViewCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PUPhotoStreamAlbumTableViewCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend((id)objc_opt_class(), "cellHeight");
  v14 = v13;
  objc_msgSend((id)objc_opt_class(), "cellHeight");
  v16 = v15;
  if ((_DWORD)v3)
  {
    v52.origin.y = 0.0;
    v52.origin.x = v6;
    v52.size.width = v14;
    v52.size.height = v16;
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.width = v10;
    v58.size.height = v12;
    if (!CGRectEqualToRect(v52, v58))
    {
      v53.origin.y = 0.0;
      v53.origin.x = v6;
      v53.size.width = v14;
      v53.size.height = v16;
      Width = CGRectGetWidth(v53);
      v54.origin.x = v6;
      v54.origin.y = v8;
      v54.size.width = v10;
      v54.size.height = v12;
      v6 = v6 - (Width - CGRectGetWidth(v54));
    }
  }
  -[PUPhotoStreamAlbumTableViewCell imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v6, 0.0, v14, v16);

  -[PUPhotoStreamAlbumTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "frame");
  v20 = CGRectGetWidth(v55);

  -[PUPhotoStreamAlbumTableViewCell textLabel](self, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoStreamAlbumTableViewCell textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v56.origin.x = v24;
  v56.origin.y = v26;
  v56.size.width = v28;
  v56.size.height = v30;
  v31 = CGRectGetWidth(v56);
  objc_msgSend((id)objc_opt_class(), "labelXOriginForContentWidth:labelWidth:isRTL:", v3, v20, v31);
  v33 = v32;
  -[PUPhotoStreamAlbumTableViewCell detailTextLabel](self, "detailTextLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "text");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (v36)
    v37 = v26 + -4.0;
  else
    v37 = v26;
  objc_msgSend(v21, "setFrame:", v33, v37, v28, v30);
  -[PUPhotoStreamAlbumTableViewCell detailTextLabel](self, "detailTextLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  v57.origin.x = v40;
  v57.origin.y = v42;
  v57.size.width = v44;
  v57.size.height = v46;
  v47 = CGRectGetWidth(v57);
  objc_msgSend((id)objc_opt_class(), "labelXOriginForContentWidth:labelWidth:isRTL:", v3, v20, v47);
  v49 = v48;
  -[PUPhotoStreamAlbumTableViewCell detailTextLabel](self, "detailTextLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v49, v42, v44, v46);

}

+ (double)cellHeight
{
  return 50.0;
}

+ (double)labelHorizontalInset
{
  return 80.0;
}

+ (double)labelXOriginForContentWidth:(double)a3 labelWidth:(double)a4 isRTL:(BOOL)a5
{
  _BOOL4 v5;
  double result;

  v5 = a5;
  objc_msgSend((id)objc_opt_class(), "labelHorizontalInset");
  if (v5)
    return a3 - result - a4;
  return result;
}

@end
