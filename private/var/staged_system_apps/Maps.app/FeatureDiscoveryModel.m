@implementation FeatureDiscoveryModel

- (FeatureDiscoveryModel)initWithImage:(id)a3 title:(id)a4 subtitle:(id)a5 actionTitle:(id)a6 actionHandler:(id)a7 bodyTapHandler:(id)a8 displayedHandler:(id)a9 dismissHandler:(id)a10 disableAffordanceAfterAction:(BOOL)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  FeatureDiscoveryModel *v25;
  FeatureDiscoveryModel *v26;
  NSString *v27;
  NSString *title;
  NSString *v29;
  NSString *subtitle;
  NSString *v31;
  NSString *actionTitle;
  id v33;
  id actionHandler;
  id v35;
  id bodyTapHandler;
  id v37;
  id displayedHandler;
  id v39;
  id dismissHandler;
  id v42;
  objc_super v43;

  v42 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v43.receiver = self;
  v43.super_class = (Class)FeatureDiscoveryModel;
  v25 = -[FeatureDiscoveryModel init](&v43, "init");
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_image, a3);
    v27 = (NSString *)objc_msgSend(v18, "copy");
    title = v26->_title;
    v26->_title = v27;

    v29 = (NSString *)objc_msgSend(v19, "copy");
    subtitle = v26->_subtitle;
    v26->_subtitle = v29;

    v31 = (NSString *)objc_msgSend(v20, "copy");
    actionTitle = v26->_actionTitle;
    v26->_actionTitle = v31;

    v33 = objc_msgSend(v21, "copy");
    actionHandler = v26->_actionHandler;
    v26->_actionHandler = v33;

    v35 = objc_msgSend(v22, "copy");
    bodyTapHandler = v26->_bodyTapHandler;
    v26->_bodyTapHandler = v35;

    v37 = objc_msgSend(v23, "copy");
    displayedHandler = v26->_displayedHandler;
    v26->_displayedHandler = v37;

    v39 = objc_msgSend(v24, "copy");
    dismissHandler = v26->_dismissHandler;
    v26->_dismissHandler = v39;

    v26->_shouldDisableAffordanceAfterAction = a11;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  BOOL v30;
  unsigned int v31;
  void *v33;
  char v34;
  void *v35;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel actionHandler](self, "actionHandler"));
    if (v7 && (v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"))) != 0)
    {
      v9 = (void *)v8;
      LODWORD(v10) = 0;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel actionHandler](self, "actionHandler"));
      if (v27)
      {
        LOBYTE(v26) = 0;
        v9 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
      if (v28)
      {

        LOBYTE(v26) = 0;
        if (v7)
        {
          v9 = 0;
LABEL_31:

        }
LABEL_32:

        goto LABEL_33;
      }
      v9 = 0;
      LODWORD(v10) = 1;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel title](self, "title"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v13 = v11;
    v14 = v12;
    if (v13 | v14
      && (v15 = objc_msgSend((id)v13, "isEqual:", v14), (id)v14, (id)v13, !v15))
    {

      LOBYTE(v26) = 0;
      if ((_DWORD)v10)
      {
LABEL_28:
        v27 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v35 = (void *)v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel subtitle](self, "subtitle"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitle"));
      v18 = v16;
      v19 = v17;
      if (v18 | v19
        && (v20 = objc_msgSend((id)v18, "isEqual:", v19),
            (id)v19,
            (id)v18,
            !v20))
      {
        LOBYTE(v26) = 0;
      }
      else
      {
        v34 = v10;
        v33 = v9;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel actionTitle](self, "actionTitle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionTitle"));
        v10 = v21;
        v23 = v22;
        if ((!(v10 | v23)
           || (v24 = objc_msgSend((id)v10, "isEqual:", v23),
               (id)v23,
               (id)v10,
               v24))
          && (v25 = -[FeatureDiscoveryModel shouldDisableAffordanceAfterAction](self, "shouldDisableAffordanceAfterAction"), v25 == objc_msgSend(v6, "shouldDisableAffordanceAfterAction")))
        {
          v29 = -[FeatureDiscoveryModel hasActionExecuted](self, "hasActionExecuted");
          v30 = v29 == objc_msgSend(v6, "hasActionExecuted");
          v9 = v33;
          if (v30)
          {
            v31 = -[FeatureDiscoveryModel isDismissed](self, "isDismissed");
            v26 = v31 ^ objc_msgSend(v6, "isDismissed") ^ 1;
          }
          else
          {
            LOBYTE(v26) = 0;
          }
        }
        else
        {
          LOBYTE(v26) = 0;
          v9 = v33;
        }

        LOBYTE(v10) = v34;
      }

      if ((v10 & 1) != 0)
        goto LABEL_28;
    }
LABEL_30:
    if (v7)
      goto LABEL_31;
    goto LABEL_32;
  }
  LOBYTE(v26) = 0;
LABEL_33:

  return v26;
}

- (void)markAsDisplayed
{
  void *v3;
  void (**v4)(void);

  if (!self->_displayed)
  {
    self->_displayed = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel displayedHandler](self, "displayedHandler"));

    if (v3)
    {
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel displayedHandler](self, "displayedHandler"));
      v4[2]();

    }
  }
}

- (void)markActionExecuted:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_hasActionExecuted != a3)
  {
    self->_hasActionExecuted = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel updatesDelegate](self, "updatesDelegate"));
    v5 = objc_opt_respondsToSelector(v4, "featureDiscoveryModelDidUpdate:");

    if ((v5 & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryModel updatesDelegate](self, "updatesDelegate"));
      objc_msgSend(v6, "featureDiscoveryModelDidUpdate:", self);

    }
  }
}

+ (id)_testModelWithImage
{
  id v2;
  void *v3;
  id v4;
  uint64_t v6;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("closed-big")));
  LOBYTE(v6) = 0;
  v4 = objc_msgSend(v2, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", v3, CFSTR("Drive!"), CFSTR("Go out and drive somewhere"), CFSTR("OK, I will"), &stru_1011B5040, 0, &stru_1011B5060, &stru_1011B5080, v6);

  return v4;
}

+ (id)_testModelWithoutImage
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return objc_msgSend(objc_alloc((Class)a1), "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", 0, CFSTR("Don't drive!"), CFSTR("Stay home"), CFSTR("Sure"), &stru_1011B50A0, 0, &stru_1011B50C0, &stru_1011B50E0, v3);
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return (NSString *)objc_msgSend(CFSTR("FeatureDiscovery%@%@"), "stringByAppendingFormat:", self->_title, self->_subtitle);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (id)displayedHandler
{
  return self->_displayedHandler;
}

- (id)bodyTapHandler
{
  return self->_bodyTapHandler;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (BOOL)hasActionExecuted
{
  return self->_hasActionExecuted;
}

- (void)setHasActionExecuted:(BOOL)a3
{
  self->_hasActionExecuted = a3;
}

- (BOOL)shouldDisableAffordanceAfterAction
{
  return self->_shouldDisableAffordanceAfterAction;
}

- (FeatureDiscoveryModelUpdates)updatesDelegate
{
  return (FeatureDiscoveryModelUpdates *)objc_loadWeakRetained((id *)&self->_updatesDelegate);
}

- (void)setUpdatesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_updatesDelegate, a3);
}

- (BOOL)isTipMode
{
  return self->_isTipMode;
}

- (void)setIsTipMode:(BOOL)a3
{
  self->_isTipMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updatesDelegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong(&self->_bodyTapHandler, 0);
  objc_storeStrong(&self->_displayedHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

+ (id)ratingsAndPhotosDiscoveryModelWithActionHandler:(id)a3 cancelHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FeatureDiscoveryModel *v13;
  id v14;
  id v15;
  FeatureDiscoveryModel *v16;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Ratings and Photos title"), CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Ratings and Photos description"), CFSTR("localized string not found"), 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Get Started [UGC]"), CFSTR("localized string not found"), 0));

  v13 = [FeatureDiscoveryModel alloc];
  v20 = v6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1003F1C48;
  v21[3] = &unk_1011ADA00;
  v22 = v5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1003F1C98;
  v19[3] = &unk_1011ADA00;
  v14 = v6;
  v15 = v5;
  LOBYTE(v18) = 0;
  v16 = -[FeatureDiscoveryModel initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:](v13, "initWithImage:title:subtitle:actionTitle:actionHandler:bodyTapHandler:displayedHandler:dismissHandler:disableAffordanceAfterAction:", 0, v8, v10, v12, v21, 0, &stru_1011B5100, v19, v18);

  return v16;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[FeatureDiscoveryOutlineCellRegistration sharedRegistration](FeatureDiscoveryOutlineCellRegistration, "sharedRegistration");
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return !-[FeatureDiscoveryModel isEqual:](self, "isEqual:", a3);
}

@end
