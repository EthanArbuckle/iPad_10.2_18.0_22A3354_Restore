@implementation SUNowPlayingCell

- (void)layoutSubviews
{
  SUItemOfferButton *itemOfferButton;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUNowPlayingCell;
  -[SUTableCell layoutSubviews](&v4, sel_layoutSubviews);
  if ((SUNowPlayingCell *)-[SUItemOfferButton superview](self->super._itemOfferButton, "superview") == self)
  {
    itemOfferButton = self->super._itemOfferButton;
    if (itemOfferButton != (SUItemOfferButton *)-[SUNowPlayingCell accessoryView](self, "accessoryView"))
    {
      -[SUItemOfferButton frame](self->super._itemOfferButton, "frame");
      -[SUItemOfferButton setFrame:](self->super._itemOfferButton, "setFrame:", 112.0, 72.0);
    }
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNowPlayingCell;
  -[SUNowPlayingCell setAccessoryType:](&v3, sel_setAccessoryType_, 1);
}

- (void)setAccessoryView:(id)a3
{
  SUItemOfferButton *itemOfferButton;
  objc_super v6;
  objc_super v7;

  itemOfferButton = self->super._itemOfferButton;
  if (itemOfferButton == a3)
  {
    objc_msgSend(a3, "setAnimationHorizontalAlignment:", 1);
    v6.receiver = self;
    v6.super_class = (Class)SUNowPlayingCell;
    -[SUNowPlayingCell setAccessoryView:](&v6, sel_setAccessoryView_, 0);
    -[SUNowPlayingCell addSubview:](self, "addSubview:", a3);
  }
  else
  {
    -[SUItemOfferButton removeFromSuperview](itemOfferButton, "removeFromSuperview");
    v7.receiver = self;
    v7.super_class = (Class)SUNowPlayingCell;
    -[SUNowPlayingCell setAccessoryView:](&v7, sel_setAccessoryView_, a3);
  }
}

- (void)setHighlightsOnlyContentView:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUNowPlayingCell;
  -[SUTableCell setHighlightsOnlyContentView:](&v3, sel_setHighlightsOnlyContentView_, 0);
}

@end
