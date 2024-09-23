@implementation DOCItemInfoOpenButton

- (void)commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;
  void *v41;
  _QWORD v42[3];

  v40.receiver = self;
  v40.super_class = (Class)DOCItemInfoOpenButton;
  -[DOCItemInfoDownloadButton commonInit](&v40, "commonInit");
  objc_initWeak(&location, self);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.and.arrow.down")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainGazeableConfiguration](UIButtonConfiguration, "plainGazeableConfiguration"));
  objc_msgSend(v3, "setImage:", v33);
  objc_msgSend(v3, "configureWithZeroInsetsIfAllowed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleBody, 3));
  objc_msgSend(v3, "setPreferredSymbolConfigurationForImage:", v4);
  v34 = v3;

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B71B0;
  v37[3] = &unk_1005BE4E0;
  objc_copyWeak(&v38, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v37));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v5));

  v7 = _DocumentManagerBundle(objc_msgSend(v6, "setConfiguration:", v3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD"), CFSTR("DOWNLOAD"), CFSTR("Localizable")));
  objc_msgSend(v6, "setAccessibilityLabel:", v9);

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration borderedProminentButtonConfiguration](UIButtonConfiguration, "borderedProminentButtonConfiguration"));
  v11 = _DocumentManagerBundle(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OPEN"), CFSTR("OPEN"), CFSTR("Localizable")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedUppercaseString"));

  objc_msgSend(v10, "setTitle:", v14);
  objc_msgSend(v10, "setButtonSize:", 0);
  objc_msgSend(v10, "setCornerStyle:", 4);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000B71DC;
  v35[3] = &unk_1005BE4E0;
  objc_copyWeak(&v36, &location);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v35));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v10, v15));

  objc_msgSend(v16, "setRole:", 1);
  objc_msgSend(v16, "setConfiguration:", v10);
  -[DOCItemInfoOpenButton bounds](self, "bounds");
  objc_msgSend(v16, "setFrame:");
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  LODWORD(v17) = 1148846080;
  objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v17);
  v18 = objc_alloc((Class)DOCDownloadProgressView);
  -[DOCItemInfoOpenButton bounds](self, "bounds");
  v19 = objc_msgSend(v18, "initWithFrame:");
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  objc_msgSend(v19, "setUserInteractionEnabled:", 0);
  v20 = objc_alloc((Class)UIStackView);
  v42[0] = v6;
  v42[1] = v16;
  v42[2] = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 3));
  v22 = objc_msgSend(v20, "initWithArrangedSubviews:", v21);

  objc_msgSend(v22, "setAxis:", 0);
  objc_msgSend(v22, "setDistribution:", 0);
  objc_msgSend(v22, "setAlignment:", 3);
  objc_msgSend(v22, "setSpacing:", 6.0);
  -[DOCItemInfoOpenButton addSubview:](self, "addSubview:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = DOCConstraintsToResizeWithSuperview(v22, NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v23, "addObjectsFromArray:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "heightAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  objc_msgSend(v23, "addObject:", v28);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);
  -[DOCItemInfoDownloadButton setProgressView:](self, "setProgressView:", v19);
  -[DOCItemInfoOpenButton setDownloadButton:](self, "setDownloadButton:", v6);
  -[DOCItemInfoOpenButton setOpenButton:](self, "setOpenButton:", v16);
  -[DOCItemInfoOpenButton updateProgressViewSizeConstraints](self, "updateProgressViewSizeConstraints");
  -[DOCItemInfoOpenButton updateForState](self, "updateForState");
  v29 = objc_opt_self(UITraitPreferredContentSizeCategory);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v41 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  v32 = -[DOCItemInfoOpenButton registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v31, "updateForChangedContentSizeCategory");

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&location);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)DOCItemInfoOpenButton;
  v7 = -[DOCItemInfoOpenButton hitTest:withEvent:](&v12, "hitTest:withEvent:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_opt_class(UIStackView);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    -[DOCItemInfoOpenButton bounds](self, "bounds");
    v13.x = x;
    v13.y = y;
    if (CGRectContainsPoint(v14, v13))
      v10 = objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton underlyingButton](self, "underlyingButton"));
    else
      v10 = 0;

    v8 = (void *)v10;
  }
  return v8;
}

- (void)setNode:(id)a3
{
  _BOOL8 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoOpenButton;
  -[DOCItemInfoDownloadButton setNode:](&v6, "setNode:", a3);
  v4 = -[DOCItemInfoDownloadButton nodeCanBeOpened](self, "nodeCanBeOpened");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton openButton](self, "openButton"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)setNodeCanBeOpened:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCItemInfoOpenButton;
  -[DOCItemInfoDownloadButton setNodeCanBeOpened:](&v6, "setNodeCanBeOpened:", a3);
  v4 = -[DOCItemInfoDownloadButton nodeCanBeOpened](self, "nodeCanBeOpened");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton openButton](self, "openButton"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)updateForState
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = -[DOCItemInfoDownloadButton downloadState](self, "downloadState");
  if (v3 == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton downloadButton](self, "downloadButton"));
    objc_msgSend(v8, "setHidden:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
    objc_msgSend(v9, "setHidden:", 1);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton openButton](self, "openButton"));
    v13 = v10;
    v11 = 0;
  }
  else
  {
    if (v3 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton downloadButton](self, "downloadButton"));
      objc_msgSend(v12, "setHidden:", 1);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
      v6 = v5;
      v7 = 0;
    }
    else
    {
      if (v3)
        return;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton downloadButton](self, "downloadButton"));
      objc_msgSend(v4, "setHidden:", 0);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
      v6 = v5;
      v7 = 1;
    }
    objc_msgSend(v5, "setHidden:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton openButton](self, "openButton"));
    v13 = v10;
    v11 = 1;
  }
  objc_msgSend(v10, "setHidden:", v11);

}

- (void)userDidTapOpenButton
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton node](self, "node"));
  if (v3)
  {
    v13 = v3;
    if (!objc_msgSend(v3, "isCloudItem")
      || (v4 = objc_msgSend(v13, "isDownloaded"), (v4 & 1) != 0)
      || (DOCIsNetworkReachable(v4) & 1) != 0)
    {
      v5 = (id)-[DOCItemInfoDownloadButton downloadState](self, "downloadState") == (id)2;
      v3 = v13;
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton delegate](self, "delegate"));
        v7 = objc_opt_respondsToSelector(v6, "nodeDownloadButton:requestedOpeningNode:");

        v3 = v13;
        if ((v7 & 1) != 0)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton delegate](self, "delegate"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton node](self, "node"));
          objc_msgSend(v8, "nodeDownloadButton:requestedOpeningNode:", self, v9);
LABEL_11:

          v3 = v13;
        }
      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton delegate](self, "delegate"));
      v11 = objc_opt_respondsToSelector(v10, "nodeDownloadButton:downloadingNode:encounteredError:");

      v3 = v13;
      if ((v11 & 1) != 0)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton delegate](self, "delegate"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton node](self, "node"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1009, 0));
        objc_msgSend(v8, "nodeDownloadButton:downloadingNode:encounteredError:", self, v9, v12);

        goto LABEL_11;
      }
    }
  }

}

- (void)updateForChangedContentSizeCategory
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton openButton](self, "openButton"));
  objc_msgSend(v3, "invalidateIntrinsicContentSize");

  -[DOCItemInfoOpenButton updateProgressViewSizeConstraints](self, "updateProgressViewSizeConstraints");
}

- (void)updateProgressViewSizeConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics"));
  objc_msgSend(v3, "scaledValueForValue:", 28.0);
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton progressViewHeightConstraint](self, "progressViewHeightConstraint"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton progressViewHeightConstraint](self, "progressViewHeightConstraint"));
    objc_msgSend(v7, "setConstant:", v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoDownloadButton progressView](self, "progressView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", v5));
    -[DOCItemInfoOpenButton setProgressViewHeightConstraint:](self, "setProgressViewHeightConstraint:", v10);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCItemInfoOpenButton progressViewHeightConstraint](self, "progressViewHeightConstraint"));
    objc_msgSend(v7, "setActive:", 1);
  }

  -[DOCItemInfoOpenButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (UIButton)openButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_openButton);
}

- (void)setOpenButton:(id)a3
{
  objc_storeWeak((id *)&self->_openButton, a3);
}

- (UIButton)downloadButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_downloadButton);
}

- (void)setDownloadButton:(id)a3
{
  objc_storeWeak((id *)&self->_downloadButton, a3);
}

- (NSLayoutConstraint)progressViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_progressViewHeightConstraint);
}

- (void)setProgressViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_progressViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressViewHeightConstraint);
  objc_destroyWeak((id *)&self->_downloadButton);
  objc_destroyWeak((id *)&self->_openButton);
}

@end
