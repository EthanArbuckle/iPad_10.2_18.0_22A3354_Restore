@implementation SUItemOfferButton

- (SUItemOfferButton)initWithFrame:(CGRect)a3
{
  SUItemOfferButton *v3;
  SUItemOfferButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUItemOfferButton;
  v3 = -[SUItemOfferButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_animationHorizontalAlignment = 1;
    v3->_shouldShowConfirmation = 1;
    -[SUItemOfferButton setItemOfferButtonStyle:](v3, "setItemOfferButtonStyle:", CFSTR("SUItemOfferButtonStyleGrayBlue"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUItemOfferButton removeTarget:action:forControlEvents:](self, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v3.receiver = self;
  v3.super_class = (Class)SUItemOfferButton;
  -[SUItemOfferButton dealloc](&v3, sel_dealloc);
}

+ (double)defaultAnimationDuration
{
  return 0.2;
}

+ (id)itemOfferButtonStyleForItem:(id)a3 offer:(id)a4
{
  uint64_t v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;

  if (!objc_msgSend(a3, "isDownloadable"))
    return CFSTR("SUItemOfferButtonStyleNotPurchasable");
  v6 = objc_msgSend(a3, "itemType");
  v7 = objc_msgSend(a4, "shouldShowPlusIcon");
  v8 = CFSTR("SUItemOfferButtonStyleGrayBlue");
  if (v7)
    v8 = CFSTR("SUItemOfferButtonStyleGrayBluePlus");
  v9 = CFSTR("SUItemOfferButtonStyleBluePlus");
  if (!v7)
    v9 = CFSTR("SUItemOfferButtonStyleBlue");
  if (v6 == 2000)
    return (id)v9;
  else
    return (id)v8;
}

- (BOOL)configureForItem:(id)a3 offer:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = objc_msgSend(a4, "actionDisplayName");
  if (-[NSString isEqualToString:](self->_confirmationTitle, "isEqualToString:", v7))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    -[SUItemOfferButton setConfirmationTitle:](self, "setConfirmationTitle:", v7);
    LOBYTE(v7) = -[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
  }
  v8 = objc_msgSend(a4, "priceDisplay");
  if (!-[NSString isEqualToString:](self->_offerTitle, "isEqualToString:", v8))
  {
    -[SUItemOfferButton setOfferTitle:](self, "setOfferTitle:", v8);
    if ((v7 & 1) != 0)
      LOBYTE(v7) = 1;
    else
      LODWORD(v7) = !-[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
  }
  v9 = objc_msgSend((id)objc_opt_class(), "itemOfferButtonStyleForItem:offer:", a3, a4);
  if (!-[NSString isEqualToString:](self->_buttonStyle, "isEqualToString:", v9))
  {
    -[SUItemOfferButton setItemOfferButtonStyle:](self, "setItemOfferButtonStyle:", v9);
    if ((v7 & 1) != 0)
      LOBYTE(v7) = 1;
    else
      LODWORD(v7) = !-[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation");
  }
  -[SUItemOfferButton setShouldShowConfirmation:](self, "setShouldShowConfirmation:", objc_msgSend(a4, "isOneTapOffer") ^ 1);
  return v7;
}

- (void)setConfirmationTitle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_confirmationTitle, "isEqualToString:"))
  {

    self->_confirmationTitle = (NSString *)objc_msgSend(a3, "copy");
    if (-[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
      -[SUItemOfferButton _reloadButton](self, "_reloadButton");
  }
}

- (void)setItemOfferButtonStyle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_buttonStyle, "isEqualToString:"))
  {
    -[SUItemOfferButton _configurationForStyle:](self, "_configurationForStyle:", a3);
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid button style"));

    self->_buttonStyle = (NSString *)objc_msgSend(a3, "copy");
    -[SUItemOfferButton _reloadButton](self, "_reloadButton");
  }
}

- (void)setOfferTitle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_offerTitle, "isEqualToString:"))
  {

    self->_offerTitle = (NSString *)objc_msgSend(a3, "copy");
    if (!-[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
      -[SUItemOfferButton _reloadButton](self, "_reloadButton");
  }
}

- (void)setShowingConfirmation:(BOOL)a3
{
  -[SUItemOfferButton setShowingConfirmation:duration:](self, "setShowingConfirmation:duration:", a3, 0.0);
}

- (void)setShowingConfirmation:(BOOL)a3 duration:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  double v21;
  float v22;
  double rect;
  _QWORD v24[5];
  _QWORD v25[9];
  CGRect v26;

  if (self->_isShowingConfirmation != a3)
  {
    -[SUItemOfferButton frame](self, "frame");
    v8 = v7;
    rect = v9;
    v11 = v10;
    v13 = v12;
    self->_isShowingConfirmation = a3;
    -[SUItemOfferButton sizeToFit](self, "sizeToFit");
    -[SUItemOfferButton frame](self, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = -[SUItemOfferButton animationHorizontalAlignment](self, "animationHorizontalAlignment");
    if (v20)
    {
      v21 = v8;
      if (v20 == 2)
      {
        v26.origin.x = v8;
        v26.origin.y = rect;
        v26.size.width = v11;
        v26.size.height = v13;
        v21 = CGRectGetMaxX(v26) - v17;
      }
    }
    else
    {
      v22 = (v17 - v11) * 0.5;
      v21 = v8 - floorf(v22);
    }
    if (a4 > 2.22044605e-16)
    {
      -[SUItemOfferButton setTitle:forState:](self, "setTitle:forState:", 0, 0);
      -[SUItemOfferButton setFrame:](self, "setFrame:", v8, rect, v11, v13);
    }
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke;
    v25[3] = &unk_24DE7D9D8;
    v25[4] = self;
    *(double *)&v25[5] = v21;
    v25[6] = v15;
    *(double *)&v25[7] = v17;
    v25[8] = v19;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke_2;
    v24[3] = &unk_24DE7B7E8;
    v24[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v25, v24, a4);
  }
}

uint64_t __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadButton");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SUItemOfferButton;
  -[SUItemOfferButton layoutSubviews](&v15, sel_layoutSubviews);
  v3 = (void *)-[SUItemOfferButton titleLabel](self, "titleLabel");
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "numberOfLines") != 1)
    {
      -[SUItemOfferButton bounds](self, "bounds");
      -[SUItemOfferButton contentRectForBounds:](self, "contentRectForBounds:");
      v6 = v5;
      v8 = v7;
      objc_msgSend(v4, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v4, "numberOfLines"), v9, v5, v10, v7);
      v12 = v11;
      *(float *)&v11 = (v8 - v13) * 0.5;
      objc_msgSend(v4, "setFrame:", v12, v6 + floorf(*(float *)&v11), v14, v13 + ceilf((float)objc_msgSend(v4, "lineSpacing") * 0.5));
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SUItemOfferButton _reloadButton](self, "_reloadButton");
  v18.receiver = self;
  v18.super_class = (Class)SUItemOfferButton;
  -[SUItemOfferButton sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
  v7 = v6;
  v9 = v8;
  v10 = (void *)-[SUItemOfferButton titleLabel](self, "titleLabel");
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, "numberOfLines") != 1)
    {
      objc_msgSend(v11, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v11, "numberOfLines"), 0.0, 0.0, v7, v9);
      v13 = v12;
      -[SUItemOfferButton contentEdgeInsets](self, "contentEdgeInsets");
      if (v7 >= v15 + v13 + v14)
        v7 = v15 + v13 + v14;
    }
  }
  v16 = v7;
  v17 = v9;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_applyConfiguration:(id *)a3
{
  uint64_t v5;
  id var4;
  id var5;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSString *v16;
  uint64_t v17;
  NSArray *v18;

  -[SUItemOfferButton setContentEdgeInsets:](self, "setContentEdgeInsets:", a3->var3.top, a3->var3.left, a3->var3.bottom, a3->var3.right);
  v5 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  var4 = a3->var4;
  if (var4)
    var4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", var4, v5), "stretchableImageWithLeftCapWidth:rightCapWidth:", a3->var1, a3->var2);
  -[SUItemOfferButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", var4, 0);
  var5 = a3->var5;
  if (var5)
    var5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", var5, v5), "stretchableImageWithLeftCapWidth:rightCapWidth:", a3->var1, a3->var2);
  -[SUItemOfferButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", var5, 1);
  v8 = (void *)-[SUItemOfferButton titleLabel](self, "titleLabel");
  objc_msgSend(v8, "setTextAlignment:", 1);
  v9 = objc_msgSend(a3->var0, "isEqualToString:", CFSTR("SUItemOfferButtonStyleNotPurchasable"));
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v8, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 10.0));
    objc_msgSend(v8, "setShadowOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    -[SUItemOfferButton setAlpha:](self, "setAlpha:", 1.0);
    -[SUItemOfferButton setTitleColor:forState:](self, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 0);
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 2;
    v14 = 9;
  }
  else
  {
    v15 = objc_msgSend(a3->var0, "isEqualToString:", CFSTR("SUItemOfferButtonStylePurchasedAlready"));
    objc_msgSend(v8, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 13.0));
    if (v15)
    {
      objc_msgSend(v8, "setShadowOffset:", 0.0, 1.0);
      -[SUItemOfferButton setAlpha:](self, "setAlpha:", 0.5);
      -[SUItemOfferButton setTitleColor:forState:](self, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.462745098, 0.470588235, 0.470588235, 1.0), 0);
      v10 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.721568627, 0.733333333, 0.741176471, 1.0);
      v11 = 0;
      v14 = 0;
      v13 = 1;
      v12 = 4;
    }
    else
    {
      objc_msgSend(v8, "setShadowOffset:", 0.0, -1.0);
      -[SUItemOfferButton setAlpha:](self, "setAlpha:", 1.0);
      -[SUItemOfferButton setTitleColor:forState:](self, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 0);
      v10 = objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.300000012, 1.0);
      v14 = 0;
      v11 = 1;
      v12 = 4;
      v13 = 1;
    }
  }
  -[SUItemOfferButton setTitleShadowColor:forState:](self, "setTitleShadowColor:forState:", v10, 0);
  -[SUItemOfferButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v11);
  objc_msgSend(v8, "setLineBreakMode:", v12);
  objc_msgSend(v8, "setLineSpacing:", v14);
  objc_msgSend(v8, "setNumberOfLines:", v13);
  if (-[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
  {
    -[SUItemOfferButton setTitle:forState:](self, "setTitle:forState:", -[SUItemOfferButton confirmationTitle](self, "confirmationTitle"), 0);
  }
  else
  {
    v16 = -[SUItemOfferButton offerTitle](self, "offerTitle");
    v17 = (uint64_t)v16;
    if (v9)
    {
      v18 = -[NSString componentsSeparatedByString:](v16, "componentsSeparatedByString:", CFSTR(" "));
      if (-[NSArray count](v18, "count") == 2)
        v17 = -[NSArray componentsJoinedByString:](v18, "componentsJoinedByString:", CFSTR("\n"));
    }
    -[SUItemOfferButton setTitle:forState:](self, "setTitle:forState:", v17, 0);
    objc_msgSend(v8, "setText:", v17);
  }
}

- ($4B5500DDDD144FD891C396F8C9BA0187)_configurationForStyle:(SEL)a3
{
  uint64_t v6;
  $4B5500DDDD144FD891C396F8C9BA0187 *result;
  __int128 v8;
  __int128 v9;

  v6 = 0;
  retstr->var5 = 0;
  *(_OWORD *)&retstr->var3.left = 0u;
  *(_OWORD *)&retstr->var3.right = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  while (1)
  {
    result = ($4B5500DDDD144FD891C396F8C9BA0187 *)objc_msgSend((id)__ButtonConfigurations[v6], "isEqualToString:", a4);
    if ((_DWORD)result)
      break;
    v6 += 9;
    if (v6 == 63)
      return result;
  }
  v8 = *(_OWORD *)&__ButtonConfigurations[v6 + 6];
  *(_OWORD *)&retstr->var3.left = *(_OWORD *)&__ButtonConfigurations[v6 + 4];
  *(_OWORD *)&retstr->var3.right = v8;
  retstr->var5 = (id)__ButtonConfigurations[v6 + 8];
  v9 = *(_OWORD *)&__ButtonConfigurations[v6 + 2];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&__ButtonConfigurations[v6];
  *(_OWORD *)&retstr->var2 = v9;
  return result;
}

- (void)_reloadButton
{
  __int128 *v3;
  NSString *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  const __CFString *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFString *v14;

  if (-[SUItemOfferButton isShowingConfirmation](self, "isShowingConfirmation"))
  {
    v12 = xmmword_24DE7DC18;
    v13 = unk_24DE7DC28;
    v14 = CFSTR("PurchaseConfirmButtonPressed.png");
    v10 = __ConfirmationConfiguration;
    v11 = unk_24DE7DC08;
    v3 = &v10;
LABEL_6:
    -[SUItemOfferButton _applyConfiguration:](self, "_applyConfiguration:", v3, v5, v6, v7, v8, v9);
    return;
  }
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[SUItemOfferButton itemOfferButtonStyle](self, "itemOfferButtonStyle");
  if (self)
  {
    -[SUItemOfferButton _configurationForStyle:](self, "_configurationForStyle:", v4);
    if ((_QWORD)v10)
    {
      v7 = v12;
      v8 = v13;
      v9 = v14;
      v5 = v10;
      v6 = v11;
      v3 = &v5;
      goto LABEL_6;
    }
  }
}

- (int64_t)animationHorizontalAlignment
{
  return self->_animationHorizontalAlignment;
}

- (void)setAnimationHorizontalAlignment:(int64_t)a3
{
  self->_animationHorizontalAlignment = a3;
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (NSString)itemOfferButtonStyle
{
  return self->_buttonStyle;
}

- (NSString)offerTitle
{
  return self->_offerTitle;
}

- (BOOL)shouldShowConfirmation
{
  return self->_shouldShowConfirmation;
}

- (void)setShouldShowConfirmation:(BOOL)a3
{
  self->_shouldShowConfirmation = a3;
}

- (BOOL)isShowingConfirmation
{
  return self->_isShowingConfirmation;
}

@end
