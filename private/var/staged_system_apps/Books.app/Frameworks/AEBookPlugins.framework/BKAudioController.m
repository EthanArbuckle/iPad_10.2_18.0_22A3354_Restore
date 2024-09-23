@implementation BKAudioController

- (BKAudioController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAudioController;
  return -[BKViewController initWithNibName:bundle:](&v5, "initWithNibName:bundle:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[BKAudioController releaseViews](self, "releaseViews");
  v3.receiver = self;
  v3.super_class = (Class)BKAudioController;
  -[BKViewController dealloc](&v3, "dealloc");
}

- (void)releaseViews
{
  UISlider *volumeSlider;
  UIButton *readButton;
  UITableView *tableView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAudioController;
  -[BKViewController releaseViews](&v6, "releaseViews");
  volumeSlider = self->_volumeSlider;
  self->_volumeSlider = 0;

  readButton = self->_readButton;
  self->_readButton = 0;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  tableView = self->_tableView;
  self->_tableView = 0;

}

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKAudioController;
  -[BKAudioController viewDidLoad](&v11, "viewDidLoad");
  v3 = AEBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Read Aloud"), &stru_1C3088, 0));
  -[BKAudioController setTitle:](self, "setTitle:", v5);

  -[UITableView setEstimatedSectionHeaderHeight:](self->_tableView, "setEstimatedSectionHeaderHeight:", 0.0);
  -[UITableView setEstimatedSectionFooterHeight:](self->_tableView, "setEstimatedSectionFooterHeight:", 0.0);
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  -[BKAudioController updateControlStates](self, "updateControlStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController view](self, "view"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController navigationController](self, "navigationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
  objc_msgSend(v10, "setBarTintColor:", v8);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAudioController;
  -[BKAudioController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[BKAudioController updateControlStates](self, "updateControlStates");
  -[BKAudioController updateRowHeight](self, "updateRowHeight");
  -[BKAudioController desiredPopoverWidth](self, "desiredPopoverWidth");
  -[BKAudioController setPreferredContentSize:](self, "setPreferredContentSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController view](self, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  -[BKAudioController updatePopoverSize](self, "updatePopoverSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_soundTrackChanged:", CFSTR("BKHTMLContentSoundTrackChangedNotification"), 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAudioController;
  -[BKAudioController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("BKHTMLContentSoundTrackChangedNotification"), 0);

}

- (void)contentSizeCategoryDidChange
{
  -[BKAudioController updateRowHeight](self, "updateRowHeight");
  -[BKAudioController updatePopoverSize](self, "updatePopoverSize");
}

- (void)updateControlStates
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  UIButton *readButton;
  UIButton *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "readAloudState");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
  objc_msgSend(v5, "volume");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController volumeSlider](self, "volumeSlider"));
  LODWORD(v9) = v7;
  objc_msgSend(v8, "setValue:", v9);

  -[UITableView reloadData](self->_tableView, "reloadData");
  readButton = self->_readButton;
  if ((v4 & 0x80000000) != 0)
  {
    -[UIButton setHidden:](readButton, "setHidden:", 1);
  }
  else
  {
    -[UIButton setHidden:](readButton, "setHidden:", 0);
    v11 = self->_readButton;
    v12 = AEBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v16 = v13;
    if (v4)
      v14 = CFSTR("Stop Reading");
    else
      v14 = CFSTR("Start Reading");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_1C3088, 0));
    -[UIButton setTitle:forState:](v11, "setTitle:forState:", v15, 0);

  }
}

- (void)updateRowHeight
{
  unsigned int v3;
  double v4;

  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", 44.0);
  v3 = +[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled");
  v4 = UITableViewAutomaticDimension;
  if (!v3)
    v4 = 44.0;
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", v4);
}

- (double)desiredPopoverWidth
{
  unsigned int v2;
  double result;

  v2 = +[UIFont bc_contentSizeCategoryIsGreaterThan:](UIFont, "bc_contentSizeCategoryIsGreaterThan:", UIContentSizeCategoryAccessibilityExtraLarge);
  result = 274.0;
  if (v2)
    return 290.0;
  return result;
}

- (void)updatePopoverSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;

  -[UITableView contentSize](self->_tableView, "contentSize");
  v4 = v3;
  -[BKAudioController desiredPopoverWidth](self, "desiredPopoverWidth");
  v6 = v5;
  -[UIButton bounds](self->_readButton, "bounds");
  -[BKAudioController setPreferredContentSize:](self, "setPreferredContentSize:", v6, ceil(v4) + CGRectGetHeight(v7));
}

- (void)_soundTrackChanged:(id)a3
{
  -[BKAudioController updateControlStates](self, "updateControlStates", a3);
  -[BKAudioController updatePopoverSize](self, "updatePopoverSize");
}

- (id)volumeSlider
{
  UISlider *volumeSlider;
  UISlider *v4;
  UISlider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  volumeSlider = self->_volumeSlider;
  if (!volumeSlider)
  {
    v4 = (UISlider *)objc_msgSend(objc_alloc((Class)UISlider), "initWithFrame:", 15.0, 5.0, 246.0, 33.0);
    v5 = self->_volumeSlider;
    self->_volumeSlider = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 5, 1, 18.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("speaker.fill")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v7));

    -[UISlider setMinimumValueImage:](self->_volumeSlider, "setMinimumValueImage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider _minValueView](self->_volumeSlider, "_minValueView"));
    objc_msgSend(v10, "setTintColor:", v6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("speaker.3.fill")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithConfiguration:", v7));

    -[UISlider setMaximumValueImage:](self->_volumeSlider, "setMaximumValueImage:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider _maxValueView](self->_volumeSlider, "_maxValueView"));
    objc_msgSend(v13, "setTintColor:", v6);

    -[UISlider addTarget:action:forControlEvents:](self->_volumeSlider, "addTarget:action:forControlEvents:", self, "onVolume:", 4096);
    volumeSlider = self->_volumeSlider;
  }
  return volumeSlider;
}

- (void)onReadButton:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate", a3));
  v5 = objc_msgSend(v4, "readAloudState") == 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
  objc_msgSend(v6, "setReadAloudState:", v5);

  -[BKAudioController updateControlStates](self, "updateControlStates");
}

- (void)onTrackSwitch:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(v6, "setTrackState:", v5);
}

- (void)onTurnSwitch:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "isOn");

  objc_msgSend(v6, "setTurnState:", v5);
}

- (void)onVolume:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate", a3));
  -[UISlider value](self->_volumeSlider, "value");
  objc_msgSend(v4, "setVolume:");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("BKAudioController")));
  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("BKAudioController"));
  if (objc_msgSend(v6, "row"))
  {
    if (objc_msgSend(v6, "row") != (char *)&dword_0 + 1
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate")),
          v9 = objc_msgSend(v8, "readAloudState"),
          v8,
          (v9 & 0x80000000) != 0))
    {
      v17 = AEBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Soundtrack"), &stru_1C3088, 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v20, "setText:", v19);

      v14 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      objc_msgSend(v14, "setPreferredStyle:", 2);
      objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "onTrackSwitch:", 4096);
      objc_msgSend(v14, "sizeToFit");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
      v16 = objc_msgSend(v15, "trackState") == 1;
    }
    else
    {
      v10 = AEBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Turn My Pages"), &stru_1C3088, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
      objc_msgSend(v13, "setText:", v12);

      v14 = objc_msgSend(objc_alloc((Class)UISwitch), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      objc_msgSend(v14, "setPreferredStyle:", 2);
      objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "onTurnSwitch:", 4096);
      objc_msgSend(v14, "sizeToFit");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
      v16 = (unint64_t)objc_msgSend(v15, "turnState");
    }
    objc_msgSend(v14, "setOn:", v16);

    objc_msgSend(v7, "setAccessoryView:", v14);
  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKAudioController volumeSlider](self, "volumeSlider"));
    objc_msgSend(v14, "setNeedsLayout");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentView"));
    objc_msgSend(v21, "addSubview:", v14);

    objc_msgSend(v7, "setAccessoryView:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    objc_msgSend(v22, "setText:", 0);

  }
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5;
  unsigned int v6;
  void *v7;

  v5 = objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate", a3, a4));
  v6 = objc_msgSend((id)v5, "trackState");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudioController delegate](self, "delegate"));
  LODWORD(v5) = objc_msgSend(v7, "readAloudState");

  if ((int)(v6 | v5) < 0)
    return 2;
  else
    return 3;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (BKAudioControllerDelegate)delegate
{
  return (BKAudioControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_readButton, 0);
  objc_storeStrong((id *)&self->_volumeSlider, 0);
}

@end
