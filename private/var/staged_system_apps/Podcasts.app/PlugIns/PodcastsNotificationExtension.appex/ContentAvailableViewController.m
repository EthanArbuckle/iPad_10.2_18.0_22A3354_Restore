@implementation ContentAvailableViewController

- (ContentAvailableViewController)initWithNotification:(id)a3
{
  id v4;
  ContentAvailableViewController *v5;
  EpisodesPropertySourceController *v6;
  EpisodesPropertySourceController *episodesPropertySourceController;
  ContentAvailableViewController *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ContentAvailableViewController;
  v5 = -[ContentAvailableViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  if (v5
    && (v6 = -[EpisodesPropertySourceController initWithNotification:keepSorted:]([EpisodesPropertySourceController alloc], "initWithNotification:keepSorted:", v4, 1), episodesPropertySourceController = v5->_episodesPropertySourceController, v5->_episodesPropertySourceController = v6, episodesPropertySourceController, -[EpisodesPropertySourceController setDelegate:](v5->_episodesPropertySourceController, "setDelegate:", v5), !-[EpisodesPropertySourceController countOfEpisodePropertySources](v5->_episodesPropertySourceController, "countOfEpisodePropertySources")))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContentAvailableViewController;
  -[ContentAvailableViewController viewDidLoad](&v4, "viewDidLoad");
  -[ContentAvailableViewController loadContentViews](self, "loadContentViews");
  -[ContentAvailableViewController loadConstraints](self, "loadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController episodesPropertySourceController](self, "episodesPropertySourceController"));
  objc_msgSend(v3, "beginLoadingFromDatabaseInBackground");

}

- (id)actionsWithDefaultActions:(id)a3
{
  return a3;
}

- (id)headerTitle
{
  uint64_t v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = _MTLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ must implement -%@", (uint8_t *)&v12, 0x16u);

  }
  return CFSTR("Subclass must implement");
}

- (void)loadContentViews
{
  void *v3;
  void *v4;
  void *v5;
  UILabel *v6;
  UILabel *headerTitleLabel;
  double v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColor](UIColor, "backgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController headerTitle](self, "headerTitle"));
  v6 = -[ContentAvailableViewController newLabelWithText:textStyle:traits:numberOfLines:](self, "newLabelWithText:textStyle:traits:numberOfLines:", v5, UIFontTextStyleTitle1, 2, 1);
  headerTitleLabel = self->_headerTitleLabel;
  self->_headerTitleLabel = v6;

  LODWORD(v8) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_headerTitleLabel, "setContentHuggingPriority:forAxis:", 0, v8);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_headerTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController headerTitleLabel](self, "headerTitleLabel"));
  objc_msgSend(v10, "addSubview:", v9);

}

- (id)buttonWithTitleTextStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mt_preferredFontForTextStyle:](UIFont, "mt_preferredFontForTextStyle:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v9, "setLineBreakMode:", 4);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setContentHorizontalAlignment:", 1);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController view](self, "view"));
  objc_msgSend(v11, "addSubview:", v5);

  return v5;
}

- (id)newLabelWithText:(id)a3 textStyle:(id)a4 traits:(unsigned int)a5 numberOfLines:(unint64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;
  MTDynamicTypeLabel *v12;
  double v13;
  void *v14;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  v12 = -[MTDynamicTypeLabel initWithTextStyle:symbolicTraits:]([MTDynamicTypeLabel alloc], "initWithTextStyle:symbolicTraits:", v10, v7);

  -[MTDynamicTypeLabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MTDynamicTypeLabel setNumberOfLines:](v12, "setNumberOfLines:", a6);
  LODWORD(v13) = 1148846080;
  -[MTDynamicTypeLabel setContentCompressionResistancePriority:forAxis:](v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  -[MTDynamicTypeLabel setText:](v12, "setText:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContentAvailableViewController view](self, "view"));
  objc_msgSend(v14, "addSubview:", v12);

  return v12;
}

- (id)newLabelWithTextStyle:(id)a3 traits:(unsigned int)a4 numberOfLines:(unint64_t)a5
{
  return -[ContentAvailableViewController newLabelWithText:textStyle:traits:numberOfLines:](self, "newLabelWithText:textStyle:traits:numberOfLines:", &stru_1000292B8, a3, *(_QWORD *)&a4, a5);
}

- (EpisodesPropertySourceController)episodesPropertySourceController
{
  return self->_episodesPropertySourceController;
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);
  objc_storeStrong((id *)&self->_episodesPropertySourceController, 0);
}

@end
