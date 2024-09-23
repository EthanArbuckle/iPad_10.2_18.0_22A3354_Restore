@implementation CACLabeledElementsOverlayViewController

- (void)loadView
{
  CACLabeledElementsOverlayView *v3;
  CACLabeledElementsOverlayView *v4;
  id v5;

  v3 = [CACLabeledElementsOverlayView alloc];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v4 = -[CACLabeledElementsOverlayView initWithFrame:](v3, "initWithFrame:");
  -[CACLabeledElementsOverlayViewController setView:](self, "setView:", v4);

}

- (void)setLabeledElements:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CACLabeledElementsOverlayViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLabeledElements");

  -[CACLabeledElementsOverlayViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addLabeledElements:", v4);

}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
