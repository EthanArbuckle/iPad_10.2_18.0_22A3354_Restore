@implementation ICAddCollaboratorsActivity

- (ICAddCollaboratorsActivity)initWithDelegate:(id)a3
{
  id v4;
  ICAddCollaboratorsActivity *v5;
  ICAddCollaboratorsActivity *v6;
  ICAddCollaboratorsActivity *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAddCollaboratorsActivity;
  v5 = -[ICAddCollaboratorsActivity init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.addCollaborators");
}

- (id)activityTitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddCollaboratorsActivity delegate](self, "delegate"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddCollaboratorsActivity delegate](self, "delegate")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleForAddCollaboratorsActivity:", self)),
        v4,
        !v5))
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "defaultActivityTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

+ (NSString)defaultActivityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add People"), &stru_1005704B8, 0));

  return (NSString *)v3;
}

- (int64_t)activityCategory
{
  return 0;
}

+ (NSString)defaultSystemImageName
{
  return (NSString *)CFSTR("person.crop.circle.badge.plus");
}

- (id)_systemImageName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddCollaboratorsActivity delegate](self, "delegate"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICAddCollaboratorsActivity delegate](self, "delegate")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemImageNameForAddCollaboratorsActivity:", self)),
        v4,
        !v5))
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "defaultSystemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICAddCollaboratorsActivity delegate](self, "delegate"));
  objc_msgSend(v3, "performAddCollaboratorsActivity:", self);

}

- (ICAddCollaboratorsActivityDelegate)delegate
{
  return (ICAddCollaboratorsActivityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
