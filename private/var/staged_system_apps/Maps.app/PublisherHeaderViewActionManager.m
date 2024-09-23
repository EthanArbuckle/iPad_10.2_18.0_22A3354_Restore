@implementation PublisherHeaderViewActionManager

- (PublisherHeaderViewActionManager)initWithAttribution:(id)a3 withActionsDelegate:(id)a4 usingAnalyticsManager:(id)a5 shouldHideAppIcon:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  PublisherHeaderViewActionManager *v14;
  PublisherHeaderViewActionManager *v15;
  uint64_t v16;
  UIMenu *publisherMenu;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PublisherHeaderViewActionManager;
  v14 = -[PublisherHeaderViewActionManager init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attribution, a3);
    objc_storeWeak((id *)&v15->_actionDelegate, v12);
    objc_storeStrong((id *)&v15->_analyticsManager, a5);
    v15->_shouldHideApp = a6;
    v16 = objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager menuForPublisher](v15, "menuForPublisher"));
    publisherMenu = v15->_publisherMenu;
    v15->_publisherMenu = (UIMenu *)v16;

  }
  return v15;
}

- (id)menuForPublisher
{
  void *v3;
  void *v4;
  BOOL v5;
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
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  void *v28;
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager attribution](self, "attribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "websiteURL"));
  v5 = v4 == 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!v5)
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Publishers_Website_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10073C594;
    v25[3] = &unk_1011AF8A0;
    objc_copyWeak(&v26, &location);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v25));

    v29 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v10));

    objc_msgSend(v6, "addObject:", v11);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("All_Guides_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_10073C5C0;
  v23 = &unk_1011AF8A0;
  objc_copyWeak(&v24, &location);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v13, 0, 0, &v20));

  v28 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1, v20, v21, v22, v23));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v15));

  objc_msgSend(v6, "addObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 0));
  objc_msgSend(v6, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v6));
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager attribution](self, "attribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationAdamId"));
  if (objc_msgSend(v6, "length"))
    v7 = !self->_shouldHideApp;
  else
    v7 = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager attribution](self, "attribution"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "websiteURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
  v11 = objc_msgSend(v10, "length");

  if (v7)
  {
    v12 = objc_alloc((Class)MKPlaceCardActionItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Publishers_App_Store_Action_Row"), CFSTR("localized string not found"), 0));
    v15 = objc_msgSend(v12, "initWithType:displayString:glyph:enabled:", 26, v14, CFSTR("appstore"), 1);

    objc_msgSend(v4, "addObject:", v15);
  }
  if (v11)
  {
    v16 = objc_alloc((Class)MKPlaceCardActionItem);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Publishers_Website_Action_Row"), CFSTR("localized string not found"), 0));
    v19 = objc_msgSend(v16, "initWithType:displayString:glyph:enabled:", 7, v18, CFSTR("safari.fill"), 1);

    objc_msgSend(v4, "addObject:", v19);
  }
  v20 = objc_alloc((Class)MKPlaceCardActionItem);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Publishers_Share_Action_Row"), CFSTR("localized string not found"), 0));
  v23 = objc_msgSend(v20, "initWithType:displayString:glyph:enabled:", 16, v22, CFSTR("square.and.arrow.up"), 1);

  objc_msgSend(v4, "addObject:", v23);
  v24 = objc_msgSend(v4, "copy");

  return v24;
}

- (id)headerEllipsis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 15.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithRenderingMode:", 2));
  objc_msgSend(v3, "setImage:forState:", v6, 0);
  objc_msgSend(v3, "setContextMenuInteractionEnabled:", 1);
  objc_msgSend(v3, "setShowsMenuAsPrimaryAction:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager publisherMenu](self, "publisherMenu"));
  objc_msgSend(v3, "setMenu:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:", 24.0));
  v14[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 24.0));
  v14[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  -[PublisherHeaderViewActionManager setEllipsis:](self, "setEllipsis:", v3);
  return v3;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = objc_msgSend(a3, "type");
  if (v7 == (id)7)
  {
    -[PublisherHeaderViewActionManager didTapWebsiteButton](self, "didTapWebsiteButton");
  }
  else if (v7 == (id)26)
  {
    -[PublisherHeaderViewActionManager didTapAppButton](self, "didTapAppButton");
  }
  else if (v7 == (id)16)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("view")));
    -[PublisherHeaderViewActionManager didTapShareButton:](self, "didTapShareButton:", v8);

  }
}

- (void)didTapAppButton
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager actionDelegate](self, "actionDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "didSelectAppItem");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager actionDelegate](self, "actionDelegate"));
    objc_msgSend(v5, "didSelectAppItem");

    v6 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager analyticsManager](self, "analyticsManager"));
    objc_msgSend(v6, "publisherHeaderAppButtonTapped");

  }
}

- (void)didTapWebsiteButton
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager actionDelegate](self, "actionDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "didSelectWebsiteItem");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager actionDelegate](self, "actionDelegate"));
    objc_msgSend(v5, "didSelectWebsiteItem");

    v6 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager analyticsManager](self, "analyticsManager"));
    objc_msgSend(v6, "publisherHeaderWebsiteButtonTapped");

  }
}

- (void)didTapShareButton:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager actionDelegate](self, "actionDelegate"));
  objc_msgSend(v5, "didSelectShareFromView:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PublisherHeaderViewActionManager analyticsManager](self, "analyticsManager"));
  objc_msgSend(v6, "publisherHeaderShareButtonTapped");

}

- (GEOCollectionPublisherAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (PublisherHeaderActionDelegate)actionDelegate
{
  return (PublisherHeaderActionDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BOOL)shouldHideApp
{
  return self->_shouldHideApp;
}

- (void)setShouldHideApp:(BOOL)a3
{
  self->_shouldHideApp = a3;
}

- (UIMenu)publisherMenu
{
  return self->_publisherMenu;
}

- (void)setPublisherMenu:(id)a3
{
  objc_storeStrong((id *)&self->_publisherMenu, a3);
}

- (UIButton)ellipsis
{
  return self->_ellipsis;
}

- (void)setEllipsis:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsis, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ellipsis, 0);
  objc_storeStrong((id *)&self->_publisherMenu, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
