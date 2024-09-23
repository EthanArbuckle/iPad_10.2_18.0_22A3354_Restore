@implementation VCUIBadgedTextOverlayController

- (VCUIBadgedTextOverlayController)init
{
  VCUIBadgedTextOverlayController *v2;
  uint64_t v3;
  _TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *swiftVC;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCUIBadgedTextOverlayController;
  v2 = -[VCUIBadgedTextOverlayController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    swiftVC = v2->_swiftVC;
    v2->_swiftVC = (_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift *)v3;

  }
  return v2;
}

- (void)viewDidLoad
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[6];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)VCUIBadgedTextOverlayController;
  -[VCUIBadgedTextOverlayController viewDidLoad](&v29, sel_viewDidLoad);
  -[VCUIBadgedTextOverlayController addChildViewController:](self, "addChildViewController:", self->_swiftVC);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIBadgedTextOverlayController_Swift view](self->_swiftVC, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[VCUIBadgedTextOverlayController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIBadgedTextOverlayController_Swift view](self->_swiftVC, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  v19 = (void *)MEMORY[0x24BDD1628];
  -[VCUIBadgedTextOverlayController_Swift view](self->_swiftVC, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIBadgedTextOverlayController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  -[VCUIBadgedTextOverlayController_Swift view](self->_swiftVC, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIBadgedTextOverlayController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v18;
  -[VCUIBadgedTextOverlayController_Swift view](self->_swiftVC, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIBadgedTextOverlayController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v10;
  -[VCUIBadgedTextOverlayController_Swift view](self->_swiftVC, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCUIBadgedTextOverlayController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[VCUIBadgedTextOverlayController_Swift preferredContentSize](self->_swiftVC, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)text
{
  return -[VCUIBadgedTextOverlayController_Swift text](self->_swiftVC, "text");
}

- (void)setText:(id)a3
{
  -[VCUIBadgedTextOverlayController_Swift setText:](self->_swiftVC, "setText:", a3);
}

- (int64_t)startIndex
{
  return -[VCUIBadgedTextOverlayController_Swift startIndex](self->_swiftVC, "startIndex");
}

- (void)setStartIndex:(int64_t)a3
{
  -[VCUIBadgedTextOverlayController_Swift setStartIndex:](self->_swiftVC, "setStartIndex:", a3);
}

- (BOOL)popoverShowing
{
  return -[VCUIBadgedTextOverlayController_Swift popoverShowing](self->_swiftVC, "popoverShowing");
}

- (void)setPopoverShowing:(BOOL)a3
{
  -[VCUIBadgedTextOverlayController_Swift setPopoverShowing:](self->_swiftVC, "setPopoverShowing:", a3);
}

- (int64_t)type
{
  return -[VCUIBadgedTextOverlayController_Swift type](self->_swiftVC, "type");
}

- (void)setType:(int64_t)a3
{
  -[VCUIBadgedTextOverlayController_Swift setType:](self->_swiftVC, "setType:", a3);
}

- (CGRect)focusRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[VCUIBadgedTextOverlayController_Swift focusRect](self->_swiftVC, "focusRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFocusRect:(CGRect)a3
{
  -[VCUIBadgedTextOverlayController_Swift setFocusRect:](self->_swiftVC, "setFocusRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (int64_t)zOrder
{
  return -[VCUIBadgedTextOverlayController_Swift zOrder](self->_swiftVC, "zOrder");
}

- (void)setZOrder:(int64_t)a3
{
  -[VCUIBadgedTextOverlayController_Swift setZOrder:](self->_swiftVC, "setZOrder:", a3);
}

- (BOOL)isOverlay
{
  return -[VCUIBadgedTextOverlayController_Swift isOverlay](self->_swiftVC, "isOverlay");
}

- (void)setIsOverlay:(BOOL)a3
{
  -[VCUIBadgedTextOverlayController_Swift setIsOverlay:](self->_swiftVC, "setIsOverlay:", a3);
}

+ (id)textSegmentModelsForText:(id)a3 type:(int64_t)a4 start:(int64_t)a5
{
  return +[VCUIBadgedTextOverlayController_Swift textSegmentModelsForText:type:start:](_TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift, "textSegmentModelsForText:type:start:", a3, a4, a5);
}

- (id)displayedTextSegmentModels
{
  return -[VCUIBadgedTextOverlayController_Swift displayedTextSegmentModels](self->_swiftVC, "displayedTextSegmentModels");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftVC, 0);
}

@end
