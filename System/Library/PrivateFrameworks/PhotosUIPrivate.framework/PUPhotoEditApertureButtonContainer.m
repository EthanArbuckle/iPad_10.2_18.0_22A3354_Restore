@implementation PUPhotoEditApertureButtonContainer

- (PUPhotoEditApertureButtonContainer)initWithApertureButton:(id)a3
{
  id v5;
  PUPhotoEditApertureButtonContainer *v6;
  PUPhotoEditApertureButtonContainer *v7;
  id *p_apertureButton;
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
  PUPhotoEditApertureButtonContainer *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PUPhotoEditApertureButtonContainer;
  v6 = -[PUPhotoEditApertureButtonContainer init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    p_apertureButton = (id *)&v6->_apertureButton;
    objc_storeStrong((id *)&v6->_apertureButton, a3);
    -[PUPhotoEditApertureButtonContainer addSubview:](v7, "addSubview:", *p_apertureButton);
    -[PUPhotoEditApertureButtonContainer leadingAnchor](v7, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_apertureButton, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    -[PUPhotoEditApertureButtonContainer widthAnchor](v7, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToConstant:", 50.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[PUPhotoEditApertureButtonContainer topAnchor](v7, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_apertureButton, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[PUPhotoEditApertureButtonContainer bottomAnchor](v7, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_apertureButton, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[PUPhotoEditApertureButtonContainer setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = v7;
  }

  return v7;
}

- (PUPhotoEditApertureButton)apertureButton
{
  return self->_apertureButton;
}

- (void)setApertureButton:(id)a3
{
  objc_storeStrong((id *)&self->_apertureButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apertureButton, 0);
}

@end
