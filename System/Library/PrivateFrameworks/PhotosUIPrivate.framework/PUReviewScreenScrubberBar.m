@implementation PUReviewScreenScrubberBar

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUReviewScreenScrubberBar;
  -[PUReviewScreenScrubberBar layoutSubviews](&v12, sel_layoutSubviews);
  -[PUReviewScreenScrubberBar scrubber](self, "scrubber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewScreenScrubberBar bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  -[PUReviewScreenScrubberBar safeAreaInsets](self, "safeAreaInsets");
  v9 = v8;
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topOutset");
  objc_msgSend(v3, "setFrame:", 0.0, -v11, v5, v7 + v11 - v9);

}

- (void)setScrubber:(id)a3
{
  PUScrubberView *v5;
  PUScrubberView **p_scrubber;
  PUScrubberView *scrubber;
  PUReviewScreenScrubberBar *v8;
  PUScrubberView *v9;

  v5 = (PUScrubberView *)a3;
  p_scrubber = &self->_scrubber;
  scrubber = self->_scrubber;
  if (scrubber != v5)
  {
    v9 = v5;
    -[PUScrubberView superview](scrubber, "superview");
    v8 = (PUReviewScreenScrubberBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[PUScrubberView removeFromSuperview](*p_scrubber, "removeFromSuperview");
    objc_storeStrong((id *)&self->_scrubber, a3);
    -[PUReviewScreenScrubberBar addSubview:](self, "addSubview:", *p_scrubber);
    v5 = v9;
  }

}

- (PUScrubberView)scrubber
{
  return self->_scrubber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubber, 0);
}

@end
