@implementation DockedViewControllerState

- (DockedViewControllerState)initWithDockableViewController:(id)a3
{
  id v4;
  DockedViewControllerState *v5;
  void *v6;
  NSString *v7;
  NSString *dockIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DockedViewControllerState;
  v5 = -[RestorableViewControllerState initWithRestorableViewController:](&v10, "initWithRestorableViewController:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dockIdentifier"));
    v7 = (NSString *)objc_msgSend(v6, "copy");
    dockIdentifier = v5->_dockIdentifier;
    v5->_dockIdentifier = v7;

  }
  return v5;
}

- (DockedViewControllerState)initWithCoder:(id)a3
{
  id v4;
  DockedViewControllerState *v5;
  id v6;
  uint64_t v7;
  NSString *dockIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DockedViewControllerState;
  v5 = -[RestorableViewControllerState initWithCoder:](&v10, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("kDockIdentifierKey"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    dockIdentifier = v5->_dockIdentifier;
    v5->_dockIdentifier = (NSString *)v7;

  }
  return v5;
}

- (id)restoreViewControllerWithScene:(id)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DockedViewControllerState;
  v3 = -[RestorableViewControllerState restoreViewControllerWithScene:](&v5, "restoreViewControllerWithScene:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)createDockedViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  void *v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[RestorableViewControllerState storedViewControllerClass](self, "storedViewControllerClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RestorableViewControllerState storedUserActivity](self, "storedUserActivity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class dockedViewForUserActivity:withFrame:](v8, "dockedViewForUserActivity:withFrame:", v9, x, y, width, height));

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *dockIdentifier;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DockedViewControllerState;
  -[RestorableViewControllerState encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  dockIdentifier = self->_dockIdentifier;
  if (dockIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", dockIdentifier, CFSTR("kDockIdentifierKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(DockedViewControllerState);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dockIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DockedViewControllerState dockIdentifier](self, "dockIdentifier"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)dockIdentifier
{
  return self->_dockIdentifier;
}

- (void)setDockIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockIdentifier, 0);
}

+ (id)withID:(id)a3 title:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  DockedViewControllerState *v9;
  NSBundle *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DockPersistenceSerialization));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));

    }
    v20[0] = MSMailActivityHandoffComposeKeyAutosaveID;
    v20[1] = MSMailActivityHandoffComposeKeySubject;
    v21[0] = v5;
    v21[1] = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v13 = objc_alloc((Class)NSUserActivity);
    v14 = objc_msgSend(v13, "initWithActivityType:", MSMailActivityHandoffTypeComposeWithStreams);
    objc_msgSend(v14, "setUserInfo:", v12);
    v9 = -[RestorableViewControllerState initWithUserActivity:viewControllerClass:]([DockedViewControllerState alloc], "initWithUserActivity:viewControllerClass:", v14, objc_opt_class(ComposeNavigationController));
    -[DockedViewControllerState setDockIdentifier:](v9, "setDockIdentifier:", v5);
    v15 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DockedViewControllerState dockIdentifier](v9, "dockIdentifier"));
      v18 = 138412290;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Created docked state with identifier: %@", (uint8_t *)&v18, 0xCu);

    }
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DockPersistenceSerialization log](DockPersistenceSerialization, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1003917E0();
    v9 = 0;
  }

  return v9;
}

@end
