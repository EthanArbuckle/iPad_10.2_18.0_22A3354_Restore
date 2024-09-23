@implementation RAPPhotoCarouselTableViewCell

- (RAPPhotoCarouselTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPPhotoCarouselTableViewCell *v4;
  UGCPhotoCarouselCell *v5;
  UGCPhotoCarouselCell *photoCarouselCell;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RAPPhotoCarouselTableViewCell;
  v4 = -[RAPPhotoCarouselTableViewCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = -[UGCPhotoCarouselCell initWithFrame:]([UGCPhotoCarouselCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    photoCarouselCell = v4->_photoCarouselCell;
    v4->_photoCarouselCell = v5;

    -[UGCPhotoCarouselCell setTranslatesAutoresizingMaskIntoConstraints:](v4->_photoCarouselCell, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UGCPhotoCarouselCell setSectionInset:](v4->_photoCarouselCell, "setSectionInset:", 0.0, 12.0, 0.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoCarouselTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v4->_photoCarouselCell);

    -[RAPPhotoCarouselTableViewCell _setupConstraints](v4, "_setupConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoCarouselTableViewCell traitCollection](v4, "traitCollection"));
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == (id)5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      -[RAPPhotoCarouselTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v10);

    }
  }
  return v4;
}

- (void)_setupConstraints
{
  double v3;
  void *v4;
  void *v5;
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
  void *v19;
  void *v20;
  _QWORD v21[4];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell topAnchor](self->_photoCarouselCell, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoCarouselTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v21[0] = v17;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell bottomAnchor](self->_photoCarouselCell, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoCarouselTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  LODWORD(v3) = 1132068864;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:priority:", v14, -0.0, v3));
  v21[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell leadingAnchor](self->_photoCarouselCell, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoCarouselTableViewCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, 0.0));
  v21[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell trailingAnchor](self->_photoCarouselCell, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoCarouselTableViewCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11, -0.0));
  v21[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)setPhotoCarouselController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UGCPhotoCarouselCell carouselController](self->_photoCarouselCell, "carouselController"));

  v5 = v6;
  if (v4 != v6)
  {
    -[UGCPhotoCarouselCell setCarouselController:](self->_photoCarouselCell, "setCarouselController:", v6);
    v5 = v6;
  }

}

- (UGCPhotoCarouselController)photoCarouselController
{
  return -[UGCPhotoCarouselCell carouselController](self->_photoCarouselCell, "carouselController");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoCarouselCell, 0);
}

@end
