@implementation BCBuyGetTwoStateButton

- (BCBuyGetTwoStateButton)initWithFrame:(CGRect)a3
{
  BCBuyGetTwoStateButton *v3;
  BCBuyGetTwoStateButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCBuyGetTwoStateButton;
  v3 = -[BCBuyGetTwoStateButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BCBuyGetTwoStateButton _commonInit](v3, "_commonInit");
  return v4;
}

- (BCBuyGetTwoStateButton)initWithCoder:(id)a3
{
  BCBuyGetTwoStateButton *v3;
  BCBuyGetTwoStateButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCBuyGetTwoStateButton;
  v3 = -[BCBuyGetTwoStateButton initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BCBuyGetTwoStateButton _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIFont *v3;
  UIFont *buttonFont;
  UIColor *v5;
  UIColor *textColor;
  UIColor *v7;
  UIColor *disabledTextColor;
  UIColor *v9;
  UIColor *backgroundFillColor;
  UIColor *v11;
  UIColor *textHilightColor;
  UIColor *v13;
  UIColor *backgroundFillHighlightColor;
  UIColor *v15;
  UIColor *frameColor;
  UIColor *v17;
  UIColor *buyStateFrameColor;
  UIColor *v19;
  UIColor *buyStateTextColor;
  UIColor *v21;
  UIColor *buyStateBackgroundFillColor;
  id v23;
  void *v24;
  NSString *v25;
  NSString *readDefaultTitle;
  id v27;
  void *v28;
  NSString *v29;
  NSString *listenDefaultTitle;
  id v31;
  void *v32;
  NSString *v33;
  NSString *buyDefaultTitle;
  id v35;
  void *v36;
  NSString *v37;
  NSString *canPreorderDefaultTitle;
  id v39;
  void *v40;
  NSString *v41;
  NSString *preorderedDefaultTitle;
  id v43;

  -[BCBuyGetTwoStateButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, "buttonTouched:event:", 64);
  -[BCBuyGetTwoStateButton setClipsToBounds:](self, "setClipsToBounds:", 1);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightSemibold));
  buttonFont = self->_buttonFont;
  self->_buttonFont = v3;

  v5 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  textColor = self->_textColor;
  self->_textColor = v5;

  v7 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
  disabledTextColor = self->_disabledTextColor;
  self->_disabledTextColor = v7;

  v9 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  backgroundFillColor = self->_backgroundFillColor;
  self->_backgroundFillColor = v9;

  v11 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  textHilightColor = self->_textHilightColor;
  self->_textHilightColor = v11;

  v13 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  backgroundFillHighlightColor = self->_backgroundFillHighlightColor;
  self->_backgroundFillHighlightColor = v13;

  v15 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  frameColor = self->_frameColor;
  self->_frameColor = v15;

  self->_frameWidth = 2.0;
  self->_isSingleState = 1;
  v17 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2117647, 0.580392, 0.3843137, 1.0));
  buyStateFrameColor = self->_buyStateFrameColor;
  self->_buyStateFrameColor = v17;

  v19 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.2117647, 0.580392, 0.3843137, 1.0));
  buyStateTextColor = self->_buyStateTextColor;
  self->_buyStateTextColor = v19;

  v21 = (UIColor *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  buyStateBackgroundFillColor = self->_buyStateBackgroundFillColor;
  self->_buyStateBackgroundFillColor = v21;

  self->_buttonState = 0;
  v23 = IMCommonCoreBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("READ"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  readDefaultTitle = self->_readDefaultTitle;
  self->_readDefaultTitle = v25;

  v27 = IMCommonCoreBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("LISTEN"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  listenDefaultTitle = self->_listenDefaultTitle;
  self->_listenDefaultTitle = v29;

  v31 = IMCommonCoreBundle();
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("BUY"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  buyDefaultTitle = self->_buyDefaultTitle;
  self->_buyDefaultTitle = v33;

  v35 = IMCommonCoreBundle();
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("PRE-ORDER"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  canPreorderDefaultTitle = self->_canPreorderDefaultTitle;
  self->_canPreorderDefaultTitle = v37;

  v39 = IMCommonCoreBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v41 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR(" PRE-ORDERED"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  preorderedDefaultTitle = self->_preorderedDefaultTitle;
  self->_preorderedDefaultTitle = v41;

  v43 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  objc_msgSend(v43, "setCornerStyle:", 4);
  objc_msgSend(v43, "setMacIdiomStyle:", 1);
  objc_msgSend(v43, "setButtonSize:", 3);
  objc_msgSend(v43, "setContentInsets:", 6.0, 20.0, 6.0, 20.0);
  -[BCBuyGetTwoStateButton setConfiguration:](self, "setConfiguration:", v43);

}

- (CGRect)alignmentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[BCBuyGetTwoStateButton frame](self, "frame");
  -[BCBuyGetTwoStateButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setAlignmentFrame:(CGRect)a3
{
  -[BCBuyGetTwoStateButton frameForAlignmentRect:](self, "frameForAlignmentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BCBuyGetTwoStateButton setFrame:](self, "setFrame:");
}

- (CGSize)alignmentSizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[BCBuyGetTwoStateButton sizeThatFits:](self, "sizeThatFits:", a3.width, a3.height);
  -[BCBuyGetTwoStateButton alignmentRectForFrame:](self, "alignmentRectForFrame:", CGRectMakeWithSize(v4, v5));
  v7 = v6;
  v9 = v8;
  result.height = v9;
  result.width = v7;
  return result;
}

- (BOOL)buttonShouldBeReadState
{
  if ((-[BCBuyGetTwoStateButton isCloud](self, "isCloud")
     || -[BCBuyGetTwoStateButton isLocal](self, "isLocal")
     || -[BCBuyGetTwoStateButton isDownloading](self, "isDownloading")
     || !-[BCBuyGetTwoStateButton isStore](self, "isStore"))
    && !-[BCBuyGetTwoStateButton isSample](self, "isSample")
    && !-[BCBuyGetTwoStateButton canPreorder](self, "canPreorder"))
  {
    return !-[BCBuyGetTwoStateButton wasPreordered](self, "wasPreordered");
  }
  else
  {
    return 0;
  }
}

- (void)resetButtonState
{
  uint64_t v3;

  if (-[BCBuyGetTwoStateButton buttonShouldBeReadState](self, "buttonShouldBeReadState"))
  {
    v3 = 3;
  }
  else if (-[BCBuyGetTwoStateButton buttonShouldBeWasPreorderedState](self, "buttonShouldBeWasPreorderedState"))
  {
    v3 = 6;
  }
  else if (-[BCBuyGetTwoStateButton buttonShouldBeCanPreorderState](self, "buttonShouldBeCanPreorderState"))
  {
    v3 = 4;
  }
  else
  {
    v3 = 1;
  }
  -[BCBuyGetTwoStateButton setButtonState:](self, "setButtonState:", v3);
}

- (void)setButtonState:(unint64_t)a3
{
  unint64_t buttonState;
  void *v5;
  char v6;
  void *v7;

  buttonState = self->_buttonState;
  if (buttonState != a3)
  {
    self->_buttonState = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "buyButton:stateDidChange:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
      objc_msgSend(v7, "buyButton:stateDidChange:", self, buttonState);

    }
    -[BCBuyGetTwoStateButton updateButton](self, "updateButton");
  }
}

- (void)buttonTouched:(id)a3 event:(id)a4
{
  void *v5;
  UITouch *v6;
  UITouch *lastTouch;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "touchesForView:", a3));
  v6 = (UITouch *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
  lastTouch = self->_lastTouch;
  self->_lastTouch = v6;

  if (!-[BCBuyGetTwoStateButton buttonState](self, "buttonState")
    || (char *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == (char *)&dword_0 + 1)
  {
    -[BCBuyGetTwoStateButton pricePressed](self, "pricePressed");
    return;
  }
  if ((int *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == &dword_4)
  {
    -[BCBuyGetTwoStateButton preorderPressed](self, "preorderPressed");
    return;
  }
  if ((char *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == (char *)&dword_4 + 2)
    goto LABEL_7;
  if ((char *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == (char *)&dword_0 + 2
    || (char *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == (char *)&dword_4 + 1)
  {
    -[BCBuyGetTwoStateButton buyPressed](self, "buyPressed");
  }
  else if ((char *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == (char *)&dword_4 + 3)
  {
    -[BCBuyGetTwoStateButton spinnerPressed](self, "spinnerPressed");
  }
  else if ((char *)-[BCBuyGetTwoStateButton buttonState](self, "buttonState") == (char *)&dword_0 + 3)
  {
LABEL_7:
    -[BCBuyGetTwoStateButton readOrProductPressed](self, "readOrProductPressed");
  }
}

- (void)pricePressed
{
  if (-[BCBuyGetTwoStateButton isSingleState](self, "isSingleState"))
    -[BCBuyGetTwoStateButton buyPressed](self, "buyPressed");
  else
    -[BCBuyGetTwoStateButton setButtonState:](self, "setButtonState:", 2);
}

- (void)preorderPressed
{
  if (-[BCBuyGetTwoStateButton isSingleState](self, "isSingleState"))
    -[BCBuyGetTwoStateButton buyPressed](self, "buyPressed");
  else
    -[BCBuyGetTwoStateButton setButtonState:](self, "setButtonState:", 5);
}

- (void)buyPressed
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyParameters](self, "buyParameters"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton asset](self, "asset"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton asset](self, "asset"));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buyParams"));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton productProfile](self, "productProfile"));
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buyParameters"));
    }
    v3 = (void *)v6;

  }
  -[BCBuyGetTwoStateButton setButtonState:](self, "setButtonState:", 7);
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_147654;
  v8[3] = &unk_28CC40;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "buyButton:initialBuy:completion:", self, v3, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)readOrProductPressed
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1477CC;
  v4[3] = &unk_28CC40;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "buyButton:initialBuy:completion:", self, 0, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)spinnerPressed
{
  -[BCBuyGetTwoStateButton setButtonState:](self, "setButtonState:", 8);
}

- (void)pausedSpinnerPressed
{
  -[BCBuyGetTwoStateButton setButtonState:](self, "setButtonState:", 7);
}

- (void)setAsset:(id)a3
{
  BFMAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BFMAsset *v10;

  v5 = (BFMAsset *)a3;
  if (self->_asset != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset buyParams](v10, "buyParams"));
    -[BCBuyGetTwoStateButton setBuyParameters:](self, "setBuyParameters:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset priceFormatted](v10, "priceFormatted"));
    if (v7)
    {
      -[BCBuyGetTwoStateButton setPriceString:](self, "setPriceString:", v7);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCMAssetWrapper actionTextForType:withAsset:](BCMAssetWrapper, "actionTextForType:withAsset:", 0, v10));
      -[BCBuyGetTwoStateButton setPriceString:](self, "setPriceString:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BFMAsset offer](v10, "offer"));
      if (v9)
        -[BCBuyGetTwoStateButton setIsSingleState:](self, "setIsSingleState:", 1);
    }
    -[BCBuyGetTwoStateButton resetButtonState](self, "resetButtonState");
    -[BCBuyGetTwoStateButton updateButton](self, "updateButton");

    v5 = v10;
  }

}

- (void)setProductProfile:(id)a3
{
  AEUserPublishingProductProfile *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AEUserPublishingProductProfile *v10;

  v5 = (AEUserPublishingProductProfile *)a3;
  if (self->_productProfile != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_productProfile, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile buyParameters](v10, "buyParameters"));
    -[BCBuyGetTwoStateButton setBuyParameters:](self, "setBuyParameters:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile priceString](v10, "priceString"));
    if (v7)
    {
      -[BCBuyGetTwoStateButton setPriceString:](self, "setPriceString:", v7);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile actionTextWithType:](v10, "actionTextWithType:", 0));
      -[BCBuyGetTwoStateButton setPriceString:](self, "setPriceString:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEUserPublishingProductProfile offer](v10, "offer"));
      if (v9)
        -[BCBuyGetTwoStateButton setIsSingleState:](self, "setIsSingleState:", 1);
    }
    -[BCBuyGetTwoStateButton resetButtonState](self, "resetButtonState");
    -[BCBuyGetTwoStateButton updateButton](self, "updateButton");

    v5 = v10;
  }

}

- (void)updateConfiguration
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  unsigned __int8 v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  objc_super v77;
  _QWORD v78[2];
  _QWORD v79[2];

  v77.receiver = self;
  v77.super_class = (Class)BCBuyGetTwoStateButton;
  -[BCBuyGetTwoStateButton updateConfiguration](&v77, "updateConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
  objc_msgSend(v5, "setStrokeWidth:", 0.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
  objc_msgSend(v6, "setStrokeColor:", 0);

  objc_msgSend(v4, "setImage:", 0);
  objc_msgSend(v4, "setPreferredSymbolConfigurationForImage:", 0);
  v10 = -[BCBuyGetTwoStateButton buttonState](self, "buttonState");
  switch(v10)
  {
    case 0uLL:
      -[BCBuyGetTwoStateButton resetButtonState](self, "resetButtonState");
      goto LABEL_59;
    case 1uLL:
    case 3uLL:
    case 7uLL:
    case 9uLL:
    case 0xAuLL:
      goto LABEL_2;
    case 2uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyStateTextColor](self, "buyStateTextColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyDefaultTitle](self, "buyDefaultTitle"));
      v25 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyStateFrameColor](self, "buyStateFrameColor"));
      if (v25)
      {
        v26 = (void *)v25;
        -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
        v28 = vabdd_f64(0.0, v27);

        if (v28 >= 0.00999999978)
        {
          -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
          v30 = v29;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
          objc_msgSend(v31, "setStrokeWidth:", v30);

          if (-[BCBuyGetTwoStateButton isEnabled](self, "isEnabled"))
            v32 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyStateFrameColor](self, "buyStateFrameColor"));
          else
            v32 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton disabledTextColor](self, "disabledTextColor"));
          v61 = (void *)v32;
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
          objc_msgSend(v62, "setStrokeColor:", v61);

        }
      }
      v51 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyStateBackgroundFillColor](self, "buyStateBackgroundFillColor"));
      goto LABEL_48;
    case 4uLL:
      goto LABEL_28;
    case 5uLL:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton canPreorderDefaultTitle](self, "canPreorderDefaultTitle"));
      -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
      if (vabdd_f64(0.0, v33) >= 0.00999999978)
      {
        -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
        v35 = v34;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
        objc_msgSend(v36, "setStrokeWidth:", v35);

        if (-[BCBuyGetTwoStateButton isEnabled](self, "isEnabled"))
          v37 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
        else
          v37 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton disabledTextColor](self, "disabledTextColor"));
        v59 = (void *)v37;
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
        objc_msgSend(v60, "setStrokeColor:", v59);

      }
      v51 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      goto LABEL_48;
    case 6uLL:
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton titleLabel](self, "titleLabel"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "font"));

      objc_msgSend(v39, "pointSize");
      v41 = v40;
      -[BCBuyGetTwoStateButton buttonShrinkFactor](self, "buttonShrinkFactor");
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "fontWithSize:", v41 * v42));

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v43));
      objc_msgSend(v4, "setPreferredSymbolConfigurationForImage:", v44);

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
      objc_msgSend(v4, "setImage:", v45);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton preorderedDefaultTitle](self, "preorderedDefaultTitle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
      -[BCBuyGetTwoStateButton setNormalBackgroundColor:](self, "setNormalBackgroundColor:", v46);

      goto LABEL_49;
    case 8uLL:
      if (-[BCBuyGetTwoStateButton buttonShouldBeCanPreorderState](self, "buttonShouldBeCanPreorderState"))
      {
LABEL_28:
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton priceString](self, "priceString"));
        if (objc_msgSend(v47, "length"))
          v48 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton priceString](self, "priceString"));
        else
          v48 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton canPreorderDefaultTitle](self, "canPreorderDefaultTitle"));
        v11 = (void *)v48;

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
        if (vabdd_f64(0.0, v52) >= 0.00999999978)
        {
          -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
          v54 = v53;
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
          objc_msgSend(v55, "setStrokeWidth:", v54);

          if (-[BCBuyGetTwoStateButton isEnabled](self, "isEnabled"))
            v56 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
          else
            v56 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton disabledTextColor](self, "disabledTextColor"));
          v57 = (void *)v56;
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
          objc_msgSend(v58, "setStrokeColor:", v57);

        }
        v51 = objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
      }
      else
      {
LABEL_2:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyDefaultTitle](self, "buyDefaultTitle"));
        if (v10 == 3)
        {
          if (-[BCBuyGetTwoStateButton isAudiobook](self, "isAudiobook"))
            v12 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton listenDefaultTitle](self, "listenDefaultTitle"));
          else
            v12 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton readDefaultTitle](self, "readDefaultTitle"));
          v13 = v11;
          v11 = (void *)v12;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton priceString](self, "priceString"));
          if (objc_msgSend(v13, "length"))
          {
            v14 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton priceString](self, "priceString"));

            v11 = (void *)v14;
          }
        }

        if (-[BCBuyGetTwoStateButton invertedContent](self, "invertedContent"))
          v15 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton backgroundFillColor](self, "backgroundFillColor"));
        else
          v15 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton textColor](self, "textColor"));
        v16 = (void *)v15;
        v17 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton frameColor](self, "frameColor"));
        if (v17)
        {
          v18 = (void *)v17;
          -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
          v20 = vabdd_f64(0.0, v19);

          if (v20 >= 0.00999999978)
          {
            -[BCBuyGetTwoStateButton frameWidth](self, "frameWidth");
            v22 = v21;
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
            objc_msgSend(v23, "setStrokeWidth:", v22);

            if (-[BCBuyGetTwoStateButton isEnabled](self, "isEnabled"))
              v24 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton frameColor](self, "frameColor"));
            else
              v24 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton disabledTextColor](self, "disabledTextColor"));
            v49 = (void *)v24;
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
            objc_msgSend(v50, "setStrokeColor:", v49);

          }
        }
        if (-[BCBuyGetTwoStateButton invertedContent](self, "invertedContent"))
          v51 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton textColor](self, "textColor"));
        else
          v51 = objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton backgroundFillColor](self, "backgroundFillColor"));
      }
LABEL_48:
      v43 = (void *)v51;
      -[BCBuyGetTwoStateButton setNormalBackgroundColor:](self, "setNormalBackgroundColor:", v51);
LABEL_49:

      if (v11)
        goto LABEL_50;
      goto LABEL_17;
    default:
      v16 = 0;
LABEL_17:
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/BCBuyGetTwoStateButton.m", 421, (uint64_t)"-[BCBuyGetTwoStateButton updateConfiguration]", (uint64_t)"buttonTitle", 0, v7, v8, v9, v76);
      v11 = 0;
LABEL_50:
      if (!v16)
        BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/BCBuyGetTwoStateButton.m", 422, (uint64_t)"-[BCBuyGetTwoStateButton updateConfiguration]", (uint64_t)"enabledTextColor", 0, v7, v8, v9, v76);
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buttonFont](self, "buttonFont"));

      if (!v63)
        BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/BCBuyGetTwoStateButton.m", 423, (uint64_t)"-[BCBuyGetTwoStateButton updateConfiguration]", (uint64_t)"self.buttonFont", 0, v64, v65, v66, v76);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton normalBackgroundColor](self, "normalBackgroundColor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
      objc_msgSend(v68, "setBackgroundColor:", v67);

      objc_msgSend(v4, "setBaseForegroundColor:", v16);
      v69 = objc_alloc((Class)NSAttributedString);
      v78[0] = NSFontAttributeName;
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buttonFont](self, "buttonFont"));
      v79[0] = v70;
      v78[1] = NSForegroundColorAttributeName;
      v71 = -[BCBuyGetTwoStateButton isEnabled](self, "isEnabled");
      v72 = v16;
      if ((v71 & 1) == 0)
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton disabledTextColor](self, "disabledTextColor"));
      v79[1] = v72;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 2));
      v74 = objc_msgSend(v69, "initWithString:attributes:", v11, v73);
      objc_msgSend(v4, "setAttributedTitle:", v74);

      if ((v71 & 1) == 0)
      -[BCBuyGetTwoStateButton setConfiguration:](self, "setConfiguration:", v4);
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedTitle"));
      -[BCBuyGetTwoStateButton setAccessibilityAttributedLabel:](self, "setAccessibilityAttributedLabel:", v75);

LABEL_59:
      return;
  }
}

- (void)updateButton
{
  void *v2;
  unsigned __int8 v4;
  uint64_t v5;
  BCBuyGetTwoStateButton *v6;

  v4 = -[BCBuyGetTwoStateButton buttonShouldBeReadState](self, "buttonShouldBeReadState");
  if ((v4 & 1) == 0)
  {
    if (!-[BCBuyGetTwoStateButton storeReachable](self, "storeReachable"))
    {
      -[BCBuyGetTwoStateButton setEnabled:](self, "setEnabled:", 0);
      goto LABEL_13;
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyParameters](self, "buyParameters"));
    if (!objc_msgSend(v2, "length"))
    {
      -[BCBuyGetTwoStateButton setEnabled:](self, "setEnabled:", 0);
LABEL_12:

      goto LABEL_13;
    }
  }
  if (-[BCBuyGetTwoStateButton isDownloading](self, "isDownloading")
    && !-[BCBuyGetTwoStateButton isAudiobook](self, "isAudiobook"))
  {
    v6 = self;
    v5 = 0;
  }
  else
  {
    v5 = +[UIApplication isRunningInStoreDemoMode](UIApplication, "isRunningInStoreDemoMode") ^ 1;
    v6 = self;
  }
  -[BCBuyGetTwoStateButton setEnabled:](v6, "setEnabled:", v5);
  if ((v4 & 1) == 0)
    goto LABEL_12;
LABEL_13:
  -[BCBuyGetTwoStateButton updateConfiguration](self, "updateConfiguration");
}

- (BOOL)isStore
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isStore");

  return v3;
}

- (BOOL)isDownloading
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isDownloading");

  return v3;
}

- (BOOL)isLocal
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isLocal");

  return v3;
}

- (BOOL)isCloud
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isCloud");

  return v3;
}

- (BOOL)isSample
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isSample");

  return v3;
}

- (BOOL)isAudiobook
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "isAudiobook");

  return v3;
}

- (BOOL)wasPreordered
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v3 = objc_msgSend(v2, "wasPreordered");

  return v3;
}

- (BOOL)canPreorder
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton asset](self, "asset"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton asset](self, "asset"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton productProfile](self, "productProfile"));
  v5 = v4;
  v6 = objc_msgSend(v4, "isPreorder");

  return v6;
}

- (BOOL)storeReachable
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "storeReachable");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "storeReachable");
LABEL_8:

    return v6;
  }
  if (!+[BKReachability isOffline](BKReachability, "isOffline"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    if ((objc_msgSend(v5, "isStoreAccountManagedAppleID") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
      v6 = objc_msgSend(v7, "isBookStoreAllowed");

    }
    goto LABEL_8;
  }
  return 0;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)BCBuyGetTwoStateButton;
  v3 = -[BCBuyGetTwoStateButton description](&v23, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "appendFormat:", CFSTR(" \n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton currentAttributedTitle](self, "currentAttributedTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t currentTitle = %@ \n"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton priceString](self, "priceString"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t priceString = %@ \n"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCBuyGetTwoStateButton buyParameters](self, "buyParameters"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t buyParameters = %@ \n"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton invertedContent](self, "invertedContent")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t invertedContent = %@ \n"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isSingleState](self, "isSingleState")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isSingleState = %@ \n"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isStore](self, "isStore")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isStore = %@ \n"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isLocal](self, "isLocal")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isLocal = %@ \n"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isCloud](self, "isCloud")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isCloud = %@ \n"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isSample](self, "isSample")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isSample = %@ \n"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isAudiobook](self, "isAudiobook")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isAudiobook = %@ \n"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isDownloading](self, "isDownloading")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t isDownloading = %@ \n"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton isEnabled](self, "isEnabled")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t button state enabled = %@ \n"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton canPreorder](self, "canPreorder")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t canPreorder = %@ \n"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton wasPreordered](self, "wasPreordered")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t wasPreordered = %@ \n"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[BCBuyGetTwoStateButton storeReachable](self, "storeReachable")));
  objc_msgSend(v5, "appendFormat:", CFSTR("\t storeReachable = %@ \n"), v21);

  return v5;
}

- (BCBuyGetTwoStateButtonDelegate)delegate
{
  return (BCBuyGetTwoStateButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BFMAsset)asset
{
  return self->_asset;
}

- (AEUserPublishingProductProfile)productProfile
{
  return self->_productProfile;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)priceString
{
  return self->_priceString;
}

- (void)setPriceString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)invertedContent
{
  return self->_invertedContent;
}

- (void)setInvertedContent:(BOOL)a3
{
  self->_invertedContent = a3;
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

- (double)buttonShrinkFactor
{
  return self->_buttonShrinkFactor;
}

- (void)setButtonShrinkFactor:(double)a3
{
  self->_buttonShrinkFactor = a3;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (void)setButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_buttonFont, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledTextColor, a3);
}

- (UIColor)backgroundFillColor
{
  return self->_backgroundFillColor;
}

- (void)setBackgroundFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFillColor, a3);
}

- (UIColor)disabledBackgroundFillColor
{
  return self->_disabledBackgroundFillColor;
}

- (void)setDisabledBackgroundFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledBackgroundFillColor, a3);
}

- (UIColor)textHilightColor
{
  return self->_textHilightColor;
}

- (void)setTextHilightColor:(id)a3
{
  objc_storeStrong((id *)&self->_textHilightColor, a3);
}

- (UIColor)backgroundFillHighlightColor
{
  return self->_backgroundFillHighlightColor;
}

- (void)setBackgroundFillHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFillHighlightColor, a3);
}

- (UIColor)frameColor
{
  return self->_frameColor;
}

- (void)setFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_frameColor, a3);
}

- (double)frameWidth
{
  return self->_frameWidth;
}

- (void)setFrameWidth:(double)a3
{
  self->_frameWidth = a3;
}

- (UIColor)buyStateTextColor
{
  return self->_buyStateTextColor;
}

- (void)setBuyStateTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_buyStateTextColor, a3);
}

- (UIColor)buyStateBackgroundFillColor
{
  return self->_buyStateBackgroundFillColor;
}

- (void)setBuyStateBackgroundFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_buyStateBackgroundFillColor, a3);
}

- (UIColor)buyStateFrameColor
{
  return self->_buyStateFrameColor;
}

- (void)setBuyStateFrameColor:(id)a3
{
  objc_storeStrong((id *)&self->_buyStateFrameColor, a3);
}

- (NSString)buyDefaultTitle
{
  return self->_buyDefaultTitle;
}

- (void)setBuyDefaultTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)canPreorderDefaultTitle
{
  return self->_canPreorderDefaultTitle;
}

- (void)setCanPreorderDefaultTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)preorderedDefaultTitle
{
  return self->_preorderedDefaultTitle;
}

- (void)setPreorderedDefaultTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)readDefaultTitle
{
  return self->_readDefaultTitle;
}

- (void)setReadDefaultTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)listenDefaultTitle
{
  return self->_listenDefaultTitle;
}

- (void)setListenDefaultTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)isSingleState
{
  return self->_isSingleState;
}

- (void)setIsSingleState:(BOOL)a3
{
  self->_isSingleState = a3;
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (void)setNormalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void)setHighlightBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightBackgroundColor, a3);
}

- (UITouch)lastTouch
{
  return self->_lastTouch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_listenDefaultTitle, 0);
  objc_storeStrong((id *)&self->_readDefaultTitle, 0);
  objc_storeStrong((id *)&self->_preorderedDefaultTitle, 0);
  objc_storeStrong((id *)&self->_canPreorderDefaultTitle, 0);
  objc_storeStrong((id *)&self->_buyDefaultTitle, 0);
  objc_storeStrong((id *)&self->_buyStateFrameColor, 0);
  objc_storeStrong((id *)&self->_buyStateBackgroundFillColor, 0);
  objc_storeStrong((id *)&self->_buyStateTextColor, 0);
  objc_storeStrong((id *)&self->_frameColor, 0);
  objc_storeStrong((id *)&self->_backgroundFillHighlightColor, 0);
  objc_storeStrong((id *)&self->_textHilightColor, 0);
  objc_storeStrong((id *)&self->_disabledBackgroundFillColor, 0);
  objc_storeStrong((id *)&self->_backgroundFillColor, 0);
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_priceString, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_productProfile, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
