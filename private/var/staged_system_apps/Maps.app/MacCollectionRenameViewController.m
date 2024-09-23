@implementation MacCollectionRenameViewController

- (MacCollectionRenameViewController)initWithMapItem:(id)a3 saveHandler:(id)a4 cancelHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  MacCollectionRenameViewController *v12;
  MacCollectionRenameViewController *v13;
  id v14;
  id saveHandler;
  id v16;
  id cancelHandler;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MacCollectionRenameViewController;
  v12 = -[MacCollectionRenameViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mapItem, a3);
    v14 = objc_retainBlock(v10);
    saveHandler = v13->_saveHandler;
    v13->_saveHandler = v14;

    v16 = objc_retainBlock(v11);
    cancelHandler = v13->_cancelHandler;
    v13->_cancelHandler = v16;

  }
  return v13;
}

- (void)loadView
{
  MacCollectionRenameView *v3;

  v3 = -[MacCollectionRenameView initWithFrame:]([MacCollectionRenameView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MacCollectionRenameViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  UILabel *v8;
  UILabel *label;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UITextField *v15;
  UITextField *textField;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *cancelButton;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  UIButton *v25;
  UIButton *saveButton;
  UIButton *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  objc_super v99;
  _QWORD v100[16];

  v99.receiver = self;
  v99.super_class = (Class)MacCollectionRenameViewController;
  -[MacCollectionRenameViewController viewDidLoad](&v99, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  objc_msgSend(v3, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = (UILabel *)objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  label = self->_label;
  self->_label = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_label, "setTextColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Rename Editor] Name this Location"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_label, "setText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
  -[UILabel setFont:](self->_label, "setFont:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", self->_label);

  v15 = (UITextField *)objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  textField = self->_textField;
  self->_textField = v15;

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setBorderStyle:](self->_textField, "setBorderStyle:", 3);
  -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", 1);
  -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _maps_defaultCollectionItemTitle](self->_mapItem, "_maps_defaultCollectionItemTitle"));
  -[UITextField setText:](self->_textField, "setText:", v17);

  -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_textField);

  v19 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  cancelButton = self->_cancelButton;
  self->_cancelButton = v19;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_cancelButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setRole:](self->_cancelButton, "setRole:", 2);
  v21 = self->_cancelButton;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Rename Editor] Cancel"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v21, "setTitle:forState:", v23, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, "_cancel", 64);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  objc_msgSend(v24, "addSubview:", self->_cancelButton);

  v25 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  saveButton = self->_saveButton;
  self->_saveButton = v25;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_saveButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setRole:](self->_saveButton, "setRole:", 1);
  v27 = self->_saveButton;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Rename Editor] Save"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v27, "setTitle:forState:", v29, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_saveButton, "addTarget:action:forControlEvents:", self, "_save", 64);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  objc_msgSend(v30, "addSubview:", self->_saveButton);

  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_label, "topAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "layoutMarginsGuide"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "topAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v95));
  v100[0] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](self->_textField, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_label, "bottomAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, 8.0));
  v100[1] = v91;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_cancelButton, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_textField, "bottomAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v89, 20.0));
  v100[2] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_saveButton, "topAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_cancelButton, "topAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
  v100[3] = v85;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_saveButton, "bottomAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "layoutMarginsGuide"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "bottomAnchor"));
  LODWORD(v31) = 1148829696;
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:constant:priority:", v81, 0.0, v31));
  v100[4] = v80;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "widthAnchor"));
  LODWORD(v32) = 1148829696;
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToConstant:priority:", 250.0, v32));
  v100[5] = v77;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_label, "leadingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "layoutMarginsGuide"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v73));
  v100[6] = v72;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_label, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "layoutMarginsGuide"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintLessThanOrEqualToAnchor:", v68));
  v100[7] = v67;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_textField, "leadingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "layoutMarginsGuide"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v63));
  v100[8] = v62;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_textField, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layoutMarginsGuide"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v58));
  v100[9] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_cancelButton, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "layoutMarginsGuide"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintGreaterThanOrEqualToAnchor:", v53));
  v100[10] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_cancelButton, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_saveButton, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -10.0));
  v100[11] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_cancelButton, "widthAnchor"));
  LODWORD(v33) = 1132003328;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintGreaterThanOrEqualToConstant:priority:", 88.0, v33));
  v100[12] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_saveButton, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MacCollectionRenameViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layoutMarginsGuide"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v36));
  v100[13] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_saveButton, "widthAnchor"));
  LODWORD(v39) = 1132003328;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToConstant:priority:", 88.0, v39));
  v100[14] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_saveButton, "widthAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_cancelButton, "widthAnchor"));
  LODWORD(v43) = 1132134400;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:multiplier:priority:", v42, 1.0, v43));
  v100[15] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v100, 16));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacCollectionRenameViewController;
  -[MacCollectionRenameViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)_save
{
  void (**saveHandler)(id, const __CFString *);
  uint64_t v4;
  const __CFString *v5;
  id v6;

  -[MacCollectionRenameViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  saveHandler = (void (**)(id, const __CFString *))self->_saveHandler;
  if (saveHandler)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[UITextField text](self->_textField, "text"));
    v6 = (id)v4;
    if (v4)
      v5 = (const __CFString *)v4;
    else
      v5 = &stru_1011EB268;
    saveHandler[2](saveHandler, v5);

  }
}

- (void)_cancel
{
  void (**cancelHandler)(void);

  -[MacCollectionRenameViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  cancelHandler = (void (**)(void))self->_cancelHandler;
  if (cancelHandler)
    cancelHandler[2]();
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "_cancel"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return v3;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t UInteger;
  id v13;
  uint64_t v14;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9));

  UInteger = GEOConfigGetUInteger(MapsConfig_CollectionMapItemNameMaximumLength, off_1014B4A28);
  v13 = objc_msgSend(v11, "length");
  if ((unint64_t)v13 > UInteger)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", 0, UInteger));

    objc_msgSend(v8, "setText:", v14);
    v11 = (void *)v14;
  }

  return (unint64_t)v13 <= UInteger;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[MacCollectionRenameViewController _save](self, "_save", a3);
  return 1;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (id)saveHandler
{
  return self->_saveHandler;
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_saveHandler, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
