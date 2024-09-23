@implementation THTOCGlossaryMenuPopoverViewController

- (THTOCGlossaryMenuPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THTOCGlossaryMenuPopoverViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  v4 = -[THTOCGlossaryMenuPopoverViewController initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  if (v4)
    -[THTOCGlossaryMenuPopoverViewController setTheme:](v4, "setTheme:", +[IMTheme themeWithIdentifier:](IMTheme, "themeWithIdentifier:", kIMThemeIdentifierBlissClassicTheme));
  return v4;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  -[THTOCGlossaryMenuPopoverViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)viewDidLoad
{
  id v3;
  UIFont *v4;
  UIButton *v5;
  BEHairlineDividerView *v6;
  UIButton *v7;
  objc_super v8;
  _QWORD v9[12];

  v8.receiver = self;
  v8.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  -[THTOCGlossaryMenuPopoverViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = -[THTOCGlossaryMenuPopoverViewController view](self, "view");
  objc_msgSend(v3, "setBackgroundColor:", +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0);
  v5 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  self->mTOCButton = v5;
  -[UILabel setFont:](-[UIButton titleLabel](v5, "titleLabel"), "setFont:", v4);
  -[UIButton setTitleColor:forState:](self->mTOCButton, "setTitleColor:forState:", +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"), 0);
  -[UIButton setTitle:forState:](self->mTOCButton, "setTitle:forState:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Table of Contents"), &stru_43D7D8, 0), 0);
  -[UIButton addTarget:action:forControlEvents:](self->mTOCButton, "addTarget:action:forControlEvents:", self, "showTOC:", 64);
  objc_msgSend(v3, "addSubview:", self->mTOCButton);
  v6 = (BEHairlineDividerView *)objc_msgSend(objc_alloc((Class)BEHairlineDividerView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  self->mDividerView = v6;
  -[BEHairlineDividerView setHorizontal:](v6, "setHorizontal:", 1);
  -[BEHairlineDividerView setDividerColor:](self->mDividerView, "setDividerColor:", objc_msgSend(-[THTOCGlossaryMenuPopoverViewController theme](self, "theme"), "dividerColor"));
  objc_msgSend(v3, "addSubview:", self->mDividerView);
  v7 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  self->mGlossaryButton = v7;
  -[UILabel setFont:](-[UIButton titleLabel](v7, "titleLabel"), "setFont:", v4);
  -[UIButton setTitleColor:forState:](self->mGlossaryButton, "setTitleColor:forState:", +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"), 0);
  -[UIButton setTitle:forState:](self->mGlossaryButton, "setTitle:forState:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Glossary"), &stru_43D7D8, 0), 0);
  -[UIButton addTarget:action:forControlEvents:](self->mGlossaryButton, "addTarget:action:forControlEvents:", self, "showGlossary:", 64);
  objc_msgSend(v3, "addSubview:", self->mGlossaryButton);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->mTOCButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->mGlossaryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BEHairlineDividerView setTranslatesAutoresizingMaskIntoConstraints:](self->mDividerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9[0] = objc_msgSend(-[UIButton topAnchor](self->mTOCButton, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v3, "safeAreaLayoutGuide"), "topAnchor"));
  v9[1] = objc_msgSend(-[BEHairlineDividerView topAnchor](self->mDividerView, "topAnchor"), "constraintEqualToAnchor:", -[UIButton bottomAnchor](self->mTOCButton, "bottomAnchor"));
  v9[2] = objc_msgSend(-[UIButton topAnchor](self->mGlossaryButton, "topAnchor"), "constraintEqualToAnchor:", -[BEHairlineDividerView bottomAnchor](self->mDividerView, "bottomAnchor"));
  v9[3] = objc_msgSend(-[UIButton bottomAnchor](self->mGlossaryButton, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend(v3, "bottomAnchor"));
  v9[4] = objc_msgSend(-[UIButton widthAnchor](self->mTOCButton, "widthAnchor"), "constraintEqualToConstant:", 284.0);
  v9[5] = objc_msgSend(-[UIButton heightAnchor](self->mTOCButton, "heightAnchor"), "constraintEqualToConstant:", 44.0);
  v9[6] = objc_msgSend(-[UIButton widthAnchor](self->mGlossaryButton, "widthAnchor"), "constraintEqualToAnchor:", -[UIButton widthAnchor](self->mTOCButton, "widthAnchor"));
  v9[7] = objc_msgSend(-[UIButton heightAnchor](self->mGlossaryButton, "heightAnchor"), "constraintEqualToAnchor:", -[UIButton heightAnchor](self->mTOCButton, "heightAnchor"));
  v9[8] = objc_msgSend(-[UIButton leadingAnchor](self->mTOCButton, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v3, "safeAreaLayoutGuide"), "leadingAnchor"));
  v9[9] = objc_msgSend(-[UIButton trailingAnchor](self->mTOCButton, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(objc_msgSend(v3, "safeAreaLayoutGuide"), "trailingAnchor"));
  v9[10] = objc_msgSend(-[BEHairlineDividerView leadingAnchor](self->mDividerView, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v3, "leadingAnchor"));
  v9[11] = objc_msgSend(-[BEHairlineDividerView trailingAnchor](self->mDividerView, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v3, "trailingAnchor"));
  objc_msgSend(v3, "addConstraints:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 12));
  objc_msgSend(-[THTOCGlossaryMenuPopoverViewController view](self, "view"), "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[THTOCGlossaryMenuPopoverViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  -[THTOCGlossaryMenuPopoverViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[UIButton setEnabled:](-[THTOCGlossaryMenuPopoverViewController TOCButton](self, "TOCButton"), "setEnabled:", -[THTOCGlossaryMenuPopoverViewControllerDelegate isTOCButtonApplicable](-[THTOCGlossaryMenuPopoverViewController delegate](self, "delegate"), "isTOCButtonApplicable"));
}

- (void)showTOC:(id)a3
{
  -[THTOCGlossaryMenuPopoverViewControllerDelegate willJumpToTOC](self->mDelegate, "willJumpToTOC", a3);
  -[THTOCGlossaryMenuPopoverViewControllerDelegate showTOC](self->mDelegate, "showTOC");
}

- (void)showGlossary:(id)a3
{
  -[THTOCGlossaryMenuPopoverViewControllerDelegate showGlossary:](self->mDelegate, "showGlossary:", a3);
}

- (void)dealloc
{
  objc_super v3;

  self->mTOCButton = 0;
  self->mGlossaryButton = 0;

  self->mDividerView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCGlossaryMenuPopoverViewController;
  -[THTOCGlossaryMenuPopoverViewController dealloc](&v3, "dealloc");
}

- (UIButton)TOCButton
{
  return self->mTOCButton;
}

- (void)setTOCButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UIButton)glossaryButton
{
  return self->mGlossaryButton;
}

- (void)setGlossaryButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BEHairlineDividerView)dividerView
{
  return self->mDividerView;
}

- (void)setDividerView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (THTOCGlossaryMenuPopoverViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THTOCGlossaryMenuPopoverViewControllerDelegate *)a3;
}

@end
