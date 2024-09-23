@implementation PUBehavioralCurationCheckAssetBrowserDebugPhotosGridCell

- (void)layoutSubviews
{
  id v3;
  UILabel *v4;
  UILabel *scoreLabel;
  void *v6;
  const __CFString *score;
  void *v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugPhotosGridCell;
  -[PUPhotosGridCell layoutSubviews](&v11, sel_layoutSubviews);
  if (!self->_scoreLabel)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    scoreLabel = self->_scoreLabel;
    self->_scoreLabel = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_scoreLabel, "setBackgroundColor:", v6);

    -[UILabel setAutoresizingMask:](self->_scoreLabel, "setAutoresizingMask:", 9);
    if (self->_score)
      score = (const __CFString *)self->_score;
    else
      score = CFSTR("0.00");
    -[UILabel setText:](self->_scoreLabel, "setText:", score);
    -[UILabel setTextAlignment:](self->_scoreLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 8.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_scoreLabel, "setFont:", v8);

    -[PUBehavioralCurationCheckAssetBrowserDebugPhotosGridCell addSubview:](self, "addSubview:", self->_scoreLabel);
  }
  -[PUBehavioralCurationCheckAssetBrowserDebugPhotosGridCell bounds](self, "bounds");
  -[UILabel setFrame:](self->_scoreLabel, "setFrame:", v9 + -60.0, v10 + -20.0, 55.0, 15.0);
}

- (void)setScore:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_score, a3);
  v5 = a3;
  -[UILabel setText:](self->_scoreLabel, "setText:", v5);

}

- (NSString)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_scoreLabel, 0);
}

@end
