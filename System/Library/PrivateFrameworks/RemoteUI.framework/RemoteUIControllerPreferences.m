@implementation RemoteUIControllerPreferences

- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3 spinnerLabel:(id)a4 navBarImage:(id)a5 navBarImageLabel:(id)a6
{
  id v11;
  id v12;
  id v13;
  RemoteUIControllerPreferences *v14;
  RemoteUIControllerPreferences *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RemoteUIControllerPreferences;
  v14 = -[RemoteUIControllerPreferences init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_showSpinner = a3;
    objc_storeStrong((id *)&v14->_spinnerLabel, a4);
    objc_storeStrong((id *)&v15->_navBarImage, a5);
    objc_storeStrong((id *)&v15->_navBarImageLabel, a6);
  }

  return v15;
}

- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3 spinnerLabel:(id)a4
{
  return -[RemoteUIControllerPreferences initWithSpinner:spinnerLabel:navBarImage:navBarImageLabel:](self, "initWithSpinner:spinnerLabel:navBarImage:navBarImageLabel:", a3, a4, 0, 0);
}

- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3
{
  return -[RemoteUIControllerPreferences initWithSpinner:spinnerLabel:navBarImage:navBarImageLabel:](self, "initWithSpinner:spinnerLabel:navBarImage:navBarImageLabel:", a3, 0, 0, 0);
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (NSString)spinnerLabel
{
  return self->_spinnerLabel;
}

- (void)setSpinnerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerLabel, a3);
}

- (UIImage)navBarImage
{
  return self->_navBarImage;
}

- (void)setNavBarImage:(id)a3
{
  objc_storeStrong((id *)&self->_navBarImage, a3);
}

- (NSString)navBarImageLabel
{
  return self->_navBarImageLabel;
}

- (void)setNavBarImageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_navBarImageLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarImageLabel, 0);
  objc_storeStrong((id *)&self->_navBarImage, 0);
  objc_storeStrong((id *)&self->_spinnerLabel, 0);
}

@end
