@implementation ICStartupViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
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
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ICStartupViewController;
  -[ICStartupBaseViewController viewDidLoad](&v20, "viewDidLoad");
  -[ICStartupViewController addListItems](self, "addListItems");
  v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[ICStartupViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController activityIndicatorView](self, "activityIndicatorView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v12, -40.0));
  objc_msgSend(v7, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController activityIndicatorView](self, "activityIndicatorView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutMarginsGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
  objc_msgSend(v7, "addObject:", v19);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);
}

- (int64_t)behavior
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController navigationController](self, "navigationController"));
  v3 = objc_msgSend(v2, "ic_behavior");

  return (int64_t)v3;
}

- (void)addListItems
{
  uint64_t v3;
  uint64_t v4;

  if ((id)-[ICStartupViewController behavior](self, "behavior") == (id)3)
  {
    -[ICStartupViewController addListItemsvisionOS](self, "addListItemsvisionOS", v3);
  }
  else if ((id)-[ICStartupViewController behavior](self, "behavior") == (id)1)
  {
    -[ICStartupViewController addListItemsCalculatorCompact:](self, "addListItemsCalculatorCompact:", +[UIDevice ic_isiPad](UIDevice, "ic_isiPad") ^ 1);
  }
  else
  {
    -[ICStartupViewController addListItemsiOS](self, "addListItemsiOS", v4);
  }
}

- (void)addListItemsCalculatorCompact:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Solve Math"), &stru_1005704B8, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v3)
    v9 = CFSTR("Type math expressions to instantly see results inline in your Math Notes.");
  else
    v9 = CFSTR("Write math expressions with Apple Pencil or type them to instantly see results inline in your Math Notes.");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1005704B8, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("math.operators")));
  -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v6, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Use Variables"), &stru_1005704B8, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Assign a value to x, y, or any other word, and easily reference these variables in expressions and equations."), &stru_1005704B8, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("x.squareroot")));
  -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v13, v15, v16);

  if (!v3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Plot Graphs"), &stru_1005704B8, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Write or type an equation, plot it on a graph, and adjust variables and values to see your graph update in real time."), &stru_1005704B8, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("chart.xyaxis.line")));
    -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v18, v20, v21);

  }
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Math in Your Notes App"), &stru_1005704B8, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Solve math in any note in the Notes app, and access all of your notes from Calculator in the new Math Notes folder."), &stru_1005704B8, 0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("apple.math.notes")));
  -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v22, v24, v25);

}

- (void)addListItemsiOS
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v30[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v30[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Add Almost Anything"), &stru_1005704B8, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Capture documents, audio, photos, and more for a richer Notes experience."), &stru_1005704B8, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ios_firstlaunch_welcome_1")));
  -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v8, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Note to Self, or with Anyone"), &stru_1005704B8, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Invite others to view or make changes to a note."), &stru_1005704B8, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("person.crop.circle.fill"), v6));
  -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v13, v15, v16);

  if (+[UIDevice ic_isiPad](UIDevice, "ic_isiPad"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Sketch Your Thoughts"), &stru_1005704B8, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Draw using your finger or the Apple Pencil."), &stru_1005704B8, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("ios_firstlaunch_welcome_3")));
    -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v18, v20, v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Create Quick Notes Anywhere"), &stru_1005704B8, 0));
  v24 = +[UIDevice ic_isiPad](UIDevice, "ic_isiPad");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = v25;
  if (v24)
    v27 = CFSTR("Just swipe up from the bottom right corner with your Apple Pencil to start a note when you’re outside the app.");
  else
    v27 = CFSTR("Create new Quick Notes in any app from the Share menu.");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1005704B8, 0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage ic_systemImageNamed:](UIImage, "ic_systemImageNamed:", CFSTR("quicknote")));
  -[ICStartupViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v23, v28, v29);

}

- (void)addListItemsvisionOS
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Add Almost Anything"), &stru_1005704B8, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Capture documents, audio, photos, and more for a richer Notes experience."), &stru_1005704B8, 0));
  -[ICStartupViewController addBulletedListItemWithTitle:description:symbolName:](self, "addBulletedListItemWithTitle:description:symbolName:", v4, v6, CFSTR("note.text"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Fast, Powerful Collaboration"), &stru_1005704B8, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Invite others to view or make changes to a note."), &stru_1005704B8, 0));
  -[ICStartupViewController addBulletedListItemWithTitle:description:symbolName:](self, "addBulletedListItemWithTitle:description:symbolName:", v8, v10, CFSTR("person.crop.circle.fill"));

  v24 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v24, "setButtonSize:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Go to Settings…"), &stru_1005704B8, 0));
  objc_msgSend(v24, "setTitle:", v12);

  objc_msgSend(v24, "setContentInsets:", 2.0, 0.0, 2.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
  objc_msgSend(v24, "setBaseForegroundColor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &stru_100550C80));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[OBBulletedListItemLinkButton buttonWithConfiguration:primaryAction:](OBBulletedListItemLinkButton, "buttonWithConfiguration:primaryAction:", v24, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Make Quick Edits"), &stru_1005704B8, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Pair a supported keyboard, trackpad, or mouse for even faster editing."), &stru_1005704B8, 0));
  -[ICStartupViewController addBulletedListItemWithTitle:description:symbolName:linkButton:](self, "addBulletedListItemWithTitle:description:symbolName:linkButton:", v17, v19, CFSTR("keyboard"), v15);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("And Lots More…"), &stru_1005704B8, 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Using tools like checklists, tables, locked notes, and text formatting."), &stru_1005704B8, 0));
  -[ICStartupViewController addBulletedListItemWithTitle:description:symbolName:](self, "addBulletedListItemWithTitle:description:symbolName:", v21, v23, CFSTR("sparkles"));

}

- (void)choiceSelected:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void (**v8)(void);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController choiceBlocks](self, "choiceBlocks"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 > a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupViewController choiceBlocks](self, "choiceBlocks"));
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

    v8[2]();
  }
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1005704B8, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v3, 0, "continueAction:", CFSTR("\r"), 0, 0));
  objc_msgSend(v4, "setWantsPriorityOverSystemBehavior:", 1);
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v5;
}

- (void)continueAction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController", a3));
  objc_msgSend(v3, "continueAction");

}

- (void)setupChoiceViews
{
  void *v3;
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  _QWORD *v28;
  void ***v29;
  _QWORD *v30;
  void **v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  _QWORD *v46;
  void *v47;
  _QWORD *v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  _QWORD *v52;
  void *v53;
  _QWORD *v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  _QWORD *v58;
  void *v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
  v4 = objc_msgSend(v3, "getStartupMigrationType");

  objc_initWeak(&location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100047C14;
  v43[3] = &unk_10054FF58;
  v24 = &v44;
  objc_copyWeak(&v44, &location);
  v5 = objc_retainBlock(v43);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100047C88;
  v41[3] = &unk_10054FF58;
  v26 = &v42;
  objc_copyWeak(&v42, &location);
  v28 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100047CCC;
  v39[3] = &unk_10054FF58;
  v27 = &v40;
  objc_copyWeak(&v40, &location);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100047D10;
  v36[3] = &unk_100550CA8;
  v6 = objc_retainBlock(v39);
  v37 = v6;
  v7 = v5;
  v38 = v7;
  v36[4] = self;
  v30 = objc_retainBlock(v36);
  v31 = _NSConcreteStackBlock;
  v32 = 3221225472;
  v33 = sub_100047F58;
  v34 = &unk_10054FF58;
  objc_copyWeak(&v35, &location);
  v29 = objc_retainBlock(&v31);
  v8 = objc_alloc_init((Class)NSMutableParagraphStyle);
  objc_msgSend(v8, "setAlignment:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1005704B8, 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Upgrade Now"), &stru_1005704B8, 0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Upgrade Notes"), &stru_1005704B8, 0));

  switch((unint64_t)v4)
  {
    case 0uLL:
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICStartupViewController setupChoiceViews]", 1, 0, CFSTR("Undefined startup migration type"), &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34);
      break;
    case 1uLL:
      v59 = v10;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1, &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v19);

      v16 = objc_retainBlock(v6);
      v58 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
      goto LABEL_10;
    case 2uLL:
      v53 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1, &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v20);

      v16 = objc_retainBlock(v7);
      v52 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
      goto LABEL_10;
    case 3uLL:
    case 4uLL:
      v51 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1, &v44, &v42, &v40, v28, v29, v30, v31, v32, v33, v34));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v15);

      v16 = objc_retainBlock(v7);
      v50 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
      goto LABEL_10;
    case 5uLL:
      v49 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1, &v44, &v42, &v40));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v21);

      v16 = objc_retainBlock(v28);
      v48 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
      goto LABEL_10;
    case 6uLL:
    case 7uLL:
      v55 = v12;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1, &v44, &v42, &v40, v28, v29));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v18);

      v16 = objc_retainBlock(v30);
      v54 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
      goto LABEL_10;
    case 8uLL:
      v47 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1, &v44, &v42, &v40, v28));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v22);

      v16 = objc_retainBlock(v29);
      v46 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
      goto LABEL_10;
    case 9uLL:
      v57 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v57, 1, &v44, &v42, &v40, v28));
      -[ICStartupViewController setChoiceLabels:](self, "setChoiceLabels:", v23);

      v16 = objc_retainBlock(v29);
      v56 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
      -[ICStartupViewController setChoiceBlocks:](self, "setChoiceBlocks:", v17);
LABEL_10:

      break;
    default:
      break;
  }
  -[ICStartupBaseViewController choicesUpdated](self, "choicesUpdated", v24);

  objc_destroyWeak(&v35);
  objc_destroyWeak(v27);

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (BOOL)didFailToDownloadDeviceList
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICStartupBaseViewController startupNavigationController](self, "startupNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryAccountDevices"));
  v4 = v3 == 0;

  return v4;
}

- (void)startIndicatorAnimation
{
  id v3;

  -[ICStartupBaseViewController hideChoices](self, "hideChoices");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v3, "startAnimating");

}

- (void)stopIndicatorAnimation
{
  id v3;

  -[ICStartupViewController setupChoiceViews](self, "setupChoiceViews");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v3, "stopAnimating");

}

- (void)applyAccessibilityInfo
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICStartupViewController view](self, "view"));
  objc_msgSend(v2, "setAccessibilityViewIsModal:", 1);

}

- (UIActivityIndicatorView)activityIndicatorView
{
  return *(UIActivityIndicatorView **)(&self->super + 1);
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)(&self->super + 1), a3);
}

- (NSArray)choiceLabels
{
  return *(NSArray **)((char *)&self->_activityIndicatorView + 1);
}

- (void)setChoiceLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 17);
}

- (NSArray)choiceBlocks
{
  return *(NSArray **)((char *)&self->_choiceLabels + 1);
}

- (void)setChoiceBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 25);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_choiceLabels + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)(&self->super + 1), 0);
}

@end
