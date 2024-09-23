@implementation PRIncomingCallTextViewAdapterWrapper

+ (double)idealEmphasizedFontSizeForName:(id)a3 usingLayout:(unint64_t)a4
{
  double result;

  +[PRIncomingCallFontsProvider idealEmphasizedFontSizeForName:usingLayout:](PRIncomingCallFontsProvider, "idealEmphasizedFontSizeForName:usingLayout:", a3, a4);
  return result;
}

- (BOOL)statusLabelIsHidden
{
  return -[PRIncomingCallTextViewAdapter statusIsHidden](self->adapter, "statusIsHidden");
}

- (void)setStatusLabelHidden:(BOOL)a3
{
  -[PRIncomingCallTextViewAdapter setStatusIsHidden:](self->adapter, "setStatusIsHidden:", a3);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PRIncomingCallTextViewAdapter frame](self->adapter, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  -[PRIncomingCallTextViewAdapter setFrame:](self->adapter, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)tightFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[PRIncomingCallTextViewAdapter tightFrame](self->adapter, "tightFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)preferredAlignment
{
  return -[PRIncomingCallTextViewAdapter preferredAlignment](self->adapter, "preferredAlignment");
}

- (void)setPreferredAlignment:(unint64_t)a3
{
  -[PRIncomingCallTextViewAdapter setPreferredAlignment:](self->adapter, "setPreferredAlignment:", a3);
}

- (unint64_t)preferredLayout
{
  return -[PRIncomingCallTextViewAdapter preferredLayout](self->adapter, "preferredLayout");
}

- (void)setPreferredLayout:(unint64_t)a3
{
  -[PRIncomingCallTextViewAdapter setPreferredLayout:](self->adapter, "setPreferredLayout:", a3);
}

- (UIColor)textColor
{
  return -[PRIncomingCallTextViewAdapter textColor](self->adapter, "textColor");
}

- (void)setTextColor:(id)a3
{
  -[PRIncomingCallTextViewAdapter setTextColor:](self->adapter, "setTextColor:", a3);
}

- (UIFont)emphasizedNameFont
{
  return -[PRIncomingCallTextViewAdapter emphasizedNameFont](self->adapter, "emphasizedNameFont");
}

- (void)setEmphasizedNameFont:(id)a3
{
  -[PRIncomingCallTextViewAdapter setEmphasizedNameFont:](self->adapter, "setEmphasizedNameFont:", a3);
}

- (UIFont)secondaryNameFont
{
  return -[PRIncomingCallTextViewAdapter secondaryNameFont](self->adapter, "secondaryNameFont");
}

- (void)setSecondaryNameFont:(id)a3
{
  -[PRIncomingCallTextViewAdapter setSecondaryNameFont:](self->adapter, "setSecondaryNameFont:", a3);
}

- (UIFont)statusFont
{
  return -[PRIncomingCallTextViewAdapter statusFont](self->adapter, "statusFont");
}

- (void)setStatusFont:(id)a3
{
  -[PRIncomingCallTextViewAdapter setStatusFont:](self->adapter, "setStatusFont:", a3);
}

- (NSString)displayNameText
{
  return -[PRIncomingCallTextViewAdapter displayNameText](self->adapter, "displayNameText");
}

- (void)setDisplayNameText:(id)a3
{
  -[PRIncomingCallTextViewAdapter setDisplayNameText:](self->adapter, "setDisplayNameText:", a3);
}

- (NSString)statusText
{
  return -[PRIncomingCallTextViewAdapter statusText](self->adapter, "statusText");
}

- (void)setStatusText:(id)a3
{
  -[PRIncomingCallTextViewAdapter setStatusText:](self->adapter, "setStatusText:", a3);
}

- (BOOL)isMarqueeRunning
{
  return -[PRIncomingCallTextViewAdapter marqueeRunning](self->adapter, "marqueeRunning");
}

- (void)setMarqueeRunning:(BOOL)a3
{
  -[PRIncomingCallTextViewAdapter setMarqueeRunning:](self->adapter, "setMarqueeRunning:", a3);
}

- (id)viewController
{
  return -[PRIncomingCallTextViewAdapter viewController](self->adapter, "viewController");
}

- (id)emojiViewController
{
  return -[PRIncomingCallTextViewAdapter emojiViewController](self->adapter, "emojiViewController");
}

- (unint64_t)alignment
{
  return -[PRIncomingCallTextViewAdapter alignment](self->adapter, "alignment");
}

- (unint64_t)layout
{
  return -[PRIncomingCallTextViewAdapter layout](self->adapter, "layout");
}

- (BOOL)displayNameIsSuitableForVerticalLayout
{
  return -[PRIncomingCallTextViewAdapter displayNameIsSuitableForVerticalLayout](self->adapter, "displayNameIsSuitableForVerticalLayout");
}

- (BOOL)statusIsSuitableForVerticalLayout
{
  return -[PRIncomingCallTextViewAdapter statusIsSuitableForVerticalLayout](self->adapter, "statusIsSuitableForVerticalLayout");
}

- (BOOL)multilineNameIsDisplayed
{
  return -[PRIncomingCallTextViewAdapter multilineNameIsDisplayed](self->adapter, "multilineNameIsDisplayed");
}

- (BOOL)callIsActive
{
  return -[PRIncomingCallTextViewAdapter callIsActive](self->adapter, "callIsActive");
}

- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3
{
  return -[PRIncomingCallTextViewAdapterWrapper initWithName:status:callIsActive:](self, "initWithName:status:callIsActive:", a3, 0, 0);
}

- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3 status:(id)a4
{
  return -[PRIncomingCallTextViewAdapterWrapper initWithName:status:callIsActive:](self, "initWithName:status:callIsActive:", a3, a4, 0);
}

- (PRIncomingCallTextViewAdapterWrapper)initWithName:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PRIncomingCallTextViewAdapterWrapper *v10;
  PRIncomingCallTextViewAdapter *v11;
  PRIncomingCallTextViewAdapter *adapter;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRIncomingCallTextViewAdapterWrapper;
  v10 = -[PRIncomingCallTextViewAdapterWrapper init](&v14, sel_init);
  if (v10)
  {
    v11 = -[PRIncomingCallTextViewAdapter initWithName:status:callIsActive:]([PRIncomingCallTextViewAdapter alloc], "initWithName:status:callIsActive:", v8, v9, v5);
    adapter = v10->adapter;
    v10->adapter = v11;

  }
  return v10;
}

- (PRIncomingCallTextViewAdapterWrapper)initWithContact:(id)a3 status:(id)a4 callIsActive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  PRIncomingCallTextViewAdapterWrapper *v10;
  PRIncomingCallTextViewAdapter *v11;
  PRIncomingCallTextViewAdapter *adapter;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRIncomingCallTextViewAdapterWrapper;
  v10 = -[PRIncomingCallTextViewAdapterWrapper init](&v14, sel_init);
  if (v10)
  {
    v11 = -[PRIncomingCallTextViewAdapter initWithContact:status:callIsActive:]([PRIncomingCallTextViewAdapter alloc], "initWithContact:status:callIsActive:", v8, v9, v5);
    adapter = v10->adapter;
    v10->adapter = v11;

  }
  return v10;
}

- (void)setTextFontUsingDefaultFontSizes:(id)a3
{
  -[PRIncomingCallTextViewAdapter setTextFontUsingDefaultFontSizes:](self->adapter, "setTextFontUsingDefaultFontSizes:", a3);
}

- (void)transitionCallToActiveStateAnimated:(BOOL)a3
{
  -[PRIncomingCallTextViewAdapter transitionCallToActiveStateAnimated:](self->adapter, "transitionCallToActiveStateAnimated:", a3);
}

- (void)overrideTitleLayoutWith:(unint64_t)a3
{
  -[PRIncomingCallTextViewAdapter overrideTitleLayoutWith:](self->adapter, "overrideTitleLayoutWith:", a3);
}

- (void)removeTitleLayoutOverride
{
  -[PRIncomingCallTextViewAdapter removeTitleLayoutOverride](self->adapter, "removeTitleLayoutOverride");
}

- (CGSize)sizeThatFitsIn:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PRIncomingCallTextViewAdapter sizeThatFitsIn:](self->adapter, "sizeThatFitsIn:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsInSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PRIncomingCallTextViewAdapter sizeThatFitsIn:](self->adapter, "sizeThatFitsIn:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)posterAppearanceDidChange:(id)a3
{
  -[PRIncomingCallTextViewAdapter posterAppearanceDidChange:](self->adapter, "posterAppearanceDidChange:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->adapter, 0);
}

- (BOOL)statusDeterminesWritingMode
{
  return 0;
}

- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4
{
  return -[PRIncomingCallTextViewAdapterWrapper initWithGivenName:familyName:status:callIsActive:](self, "initWithGivenName:familyName:status:callIsActive:", a3, a4, 0, 0);
}

- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4 status:(id)a5
{
  return -[PRIncomingCallTextViewAdapterWrapper initWithGivenName:familyName:status:callIsActive:](self, "initWithGivenName:familyName:status:callIsActive:", a3, a4, 0, 0);
}

- (PRIncomingCallTextViewAdapterWrapper)initWithGivenName:(id)a3 familyName:(id)a4 status:(id)a5 callIsActive:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  PRIncomingCallTextViewAdapterWrapper *v13;
  id v14;
  PRIncomingCallTextViewAdapter *v15;
  PRIncomingCallTextViewAdapter *adapter;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PRIncomingCallTextViewAdapterWrapper;
  v13 = -[PRIncomingCallTextViewAdapterWrapper init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v14, "setGivenName:", v10);
    objc_msgSend(v14, "setFamilyName:", v11);
    v15 = -[PRIncomingCallTextViewAdapter initWithContact:status:callIsActive:]([PRIncomingCallTextViewAdapter alloc], "initWithContact:status:callIsActive:", v14, v12, v6);
    adapter = v13->adapter;
    v13->adapter = v15;

  }
  return v13;
}

- (void)setCaptionFont:(id)a3
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "pointSize");
  v5 = v4;
  +[PRIncomingCallFontsProvider defaultStatusFontSize](PRIncomingCallFontsProvider, "defaultStatusFontSize");
  if (v5 == v6)
    -[PRIncomingCallTextViewAdapterWrapper setStatusFont:](self, "setStatusFont:", v7);
  else
    -[PRIncomingCallTextViewAdapterWrapper setSecondaryNameFont:](self, "setSecondaryNameFont:", v7);

}

@end
