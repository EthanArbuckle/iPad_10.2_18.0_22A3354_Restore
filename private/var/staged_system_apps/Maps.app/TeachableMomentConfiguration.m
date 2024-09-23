@implementation TeachableMomentConfiguration

- (TeachableMomentConfiguration)initWithTitle:(id)a3 buttonTitle:(id)a4 userDefaultSaveKey:(id)a5 illustrationViewController:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TeachableMomentConfiguration *v15;
  TeachableMomentConfiguration *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TeachableMomentConfiguration;
  v15 = -[TeachableMomentConfiguration init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_buttonTitle, a4);
    objc_storeStrong((id *)&v16->_userDefaultSaveKey, a5);
    objc_storeStrong((id *)&v16->_illustrationViewController, a6);
  }

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)userDefaultSaveKey
{
  return self->_userDefaultSaveKey;
}

- (UIViewController)illustrationViewController
{
  return self->_illustrationViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_illustrationViewController, 0);
  objc_storeStrong((id *)&self->_userDefaultSaveKey, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
