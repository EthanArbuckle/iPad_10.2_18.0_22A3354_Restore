@implementation MCDShuffleActionCell

- (void)layoutSubviews
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MCDShuffleActionCell;
  -[MCDShuffleActionCell layoutSubviews](&v15, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Shuffle"), &stru_101122068, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDShuffleActionCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDShuffleActionCell textLabel](self, "textLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDShuffleActionCell textLabel](self, "textLabel"));
  objc_msgSend(v9, "setHighlightedTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("shuffle")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
  +[MCDTableViewController setPlaceholderImage:tintColor:highlightedTintColor:toCell:](MCDTableViewController, "setPlaceholderImage:tintColor:highlightedTintColor:toCell:", v10, v11, v12, self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell artworkImageView](self, "artworkImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 16.0));
  objc_msgSend(v13, "setPreferredSymbolConfiguration:", v14);

}

- (void)setSizeForArtwork:(CGSize)a3
{
  if (self->_artworkSize.width != a3.width || self->_artworkSize.height != a3.height)
  {
    self->_artworkSize = a3;
    -[MCDShuffleActionCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeForArtwork
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
