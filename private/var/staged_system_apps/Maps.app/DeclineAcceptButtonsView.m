@implementation DeclineAcceptButtonsView

- (DeclineAcceptButtonsView)initWithDeclineTitle:(id)a3 declineAction:(id)a4 acceptTitle:(id)a5 acceptAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DeclineAcceptButtonsView *v14;
  id v15;
  id acceptAction;
  id v17;
  id declineAction;
  DeclineAcceptButton *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  DeclineAcceptButton *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  DeclineAcceptButtonsView *v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  DeclineAcceptButton *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;
  _QWORD v67[10];
  NSAttributedStringKey v68;
  void *v69;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v66.receiver = self;
  v66.super_class = (Class)DeclineAcceptButtonsView;
  v14 = -[DeclineAcceptButtonsView init](&v66, "init");
  if (v14)
  {
    v15 = objc_retainBlock(v13);
    v64 = v13;
    acceptAction = v14->_acceptAction;
    v14->_acceptAction = v15;

    v17 = objc_retainBlock(v11);
    declineAction = v14->_declineAction;
    v14->_declineAction = v17;

    v19 = -[DeclineAcceptButton initWithAccept:]([DeclineAcceptButton alloc], "initWithAccept:", 0);
    -[DeclineAcceptButton setTranslatesAutoresizingMaskIntoConstraints:](v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DeclineAcceptButton addTarget:action:forControlEvents:](v19, "addTarget:action:forControlEvents:", v14, "_declineAction", 64);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton titleLabel](v19, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v20, &stru_1011E7AD8);

    v21 = objc_alloc((Class)NSAttributedString);
    v68 = NSForegroundColorAttributeName;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButtonsView mk_theme](v14, "mk_theme"));
    v65 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tintColor"));
    v69 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
    v63 = objc_msgSend(v21, "initWithString:attributes:", v10, v24);

    -[DeclineAcceptButton setAttributedTitle:forState:](v19, "setAttributedTitle:forState:", v63, 0);
    -[DeclineAcceptButtonsView addSubview:](v14, "addSubview:", v19);
    v25 = -[DeclineAcceptButton initWithAccept:]([DeclineAcceptButton alloc], "initWithAccept:", 1);
    -[DeclineAcceptButton setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DeclineAcceptButton addTarget:action:forControlEvents:](v25, "addTarget:action:forControlEvents:", v14, "_acceptAction", 64);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton titleLabel](v25, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v26, &stru_1011E7AD8);

    -[DeclineAcceptButton setTitle:forState:](v25, "setTitle:forState:", v12, 0);
    -[DeclineAcceptButtonsView addSubview:](v14, "addSubview:", v25);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton leadingAnchor](v19, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButtonsView leadingAnchor](v14, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v67[0] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton trailingAnchor](v19, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton leadingAnchor](v25, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -8.0));
    v67[1] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton topAnchor](v19, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButtonsView topAnchor](v14, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v67[2] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton bottomAnchor](v19, "bottomAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButtonsView bottomAnchor](v14, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v67[3] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton heightAnchor](v19, "heightAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToConstant:", 53.0));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v49, &stru_1011E7AD8, 53.0));
    v67[4] = v48;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton trailingAnchor](v25, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButtonsView trailingAnchor](v14, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v67[5] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton topAnchor](v25, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton topAnchor](v19, "topAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
    v67[6] = v41;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton bottomAnchor](v25, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton bottomAnchor](v19, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
    v67[7] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton heightAnchor](v25, "heightAnchor"));
    v47 = v19;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton heightAnchor](v19, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v27));
    v67[8] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton widthAnchor](v25, "widthAnchor"));
    v30 = v10;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[DeclineAcceptButton widthAnchor](v19, "widthAnchor"));
    v32 = v14;
    v33 = v12;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
    v67[9] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

    v13 = v64;
    v12 = v33;
    v14 = v32;

    v10 = v30;
    v11 = v65;

  }
  return v14;
}

- (void)_acceptAction
{
  (*((void (**)(void))self->_acceptAction + 2))();
}

- (void)_declineAction
{
  (*((void (**)(void))self->_declineAction + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_declineAction, 0);
  objc_storeStrong(&self->_acceptAction, 0);
}

@end
