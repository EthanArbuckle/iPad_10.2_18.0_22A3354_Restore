@implementation CACDictationRecognizerModeOverlayViewController

- (void)loadView
{
  CACDictationRecognizerModeOverlayView *v3;

  v3 = objc_alloc_init(CACDictationRecognizerModeOverlayView);
  -[CACDictationRecognizerModeOverlayViewController setView:](self, "setView:", v3);

}

- (void)setImageRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CACDictationRecognizerModeOverlayViewController view](self, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImageRect:", x, y, width, height);

}

- (void)setDictationRecognizerMode:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[CACDictationRecognizerModeOverlayViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationRecognizerMode:", v3);

}

- (int64_t)zOrder
{
  return 9;
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
