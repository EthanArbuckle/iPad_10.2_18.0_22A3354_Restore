@implementation MTEpisodeCell

+ (unint64_t)styleForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  return +[MTEpisodeLockup styleForWidth:showsArtwork:](MTEpisodeLockup, "styleForWidth:showsArtwork:", a4, a3);
}

+ (double)estimatedHeightForWidth:(double)a3 showsArtwork:(BOOL)a4
{
  double result;

  _objc_msgSend(a1, "estimatedHeightForWidth:style:", objc_msgSend(a1, "styleForWidth:showsArtwork:", a4), a3);
  return result;
}

+ (double)estimatedHeightForWidth:(double)a3 style:(unint64_t)a4
{
  double result;

  +[MTEpisodeLockup estimatedHeightForWidth:style:](MTEpisodeLockup, "estimatedHeightForWidth:style:", a4, a3);
  return result;
}

+ (CGSize)artworkSizeForStyle:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  +[MTEpisodeLockup artworkSizeForStyle:](MTEpisodeLockup, "artworkSizeForStyle:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)maximumContentWidthForStyle:(unint64_t)a3
{
  double result;

  +[MTEpisodeLockup maximumContentWidthForStyle:](MTEpisodeLockup, "maximumContentWidthForStyle:", a3);
  return result;
}

- (MTEpisodeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTEpisodeCell *v4;
  MTEpisodeCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTEpisodeCell;
  v4 = -[MTEpisodeCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[MTEpisodeCell setupCell](v4, "setupCell");
  return v5;
}

- (void)setupCell
{
  void *v3;
  id v4;

  -[MTEpisodeCell setClipsToBounds:](self, "setClipsToBounds:", 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell contentView](self, "contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v4, "addSubview:", v3);

}

- (MTEpisodeLockup)episodeLockup
{
  MTEpisodeLockup *episodeLockup;
  MTEpisodeLockup *v4;
  MTEpisodeLockup *v5;

  episodeLockup = self->_episodeLockup;
  if (!episodeLockup)
  {
    v4 = objc_opt_new(MTEpisodeLockup);
    v5 = self->_episodeLockup;
    self->_episodeLockup = v4;

    -[MTEpisodeLockup setDelegate:](self->_episodeLockup, "setDelegate:", self);
    episodeLockup = self->_episodeLockup;
  }
  return episodeLockup;
}

- (void)setStyle:(unint64_t)a3
{
  void *v5;

  if (-[MTEpisodeCell style](self, "style") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
    objc_msgSend(v5, "setStyle:", a3);

    -[MTEpisodeCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (unint64_t)style
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = objc_msgSend(v2, "style");

  return (unint64_t)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  if (-[MTEpisodeCell isEditing](self, "isEditing") != a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
    objc_msgSend(v7, "setEditing:", v5);

    v8.receiver = self;
    v8.super_class = (Class)MTEpisodeCell;
    -[MTEpisodeCell setEditing:animated:](&v8, "setEditing:animated:", v5, v4);
    -[MTEpisodeCell updateOverlayForIsNew](self, "updateOverlayForIsNew");
  }
}

- (void)updateCurrentRowHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  void *v11;
  void *v12;
  id v13;

  -[MTEpisodeCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[MTEpisodeCell sizeThatFits:](self, "sizeThatFits:", v3, 1.79769313e308);
  if (v4 != v8 || v6 != v7)
  {
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell _tableView](self, "_tableView"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathForCell:", self));

    if (v13)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell _tableView](self, "_tableView"));
      objc_msgSend(v12, "_setHeight:forRowAtIndexPath:", v13, v10);

    }
    -[MTEpisodeCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setEpisode:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v5, "setEpisode:", v4);

  -[MTEpisodeCell updateOverlayForIsNew](self, "updateOverlayForIsNew");
}

- (MTEpisode)episode
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "episode"));

  return (MTEpisode *)v3;
}

- (void)setColorTheme:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  UIView *v10;
  id v11;

  v11 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell colorTheme](self, "colorTheme"));
  v5 = v11;
  if (v4 == v11)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell colorTheme](self, "colorTheme"));
  v7 = objc_msgSend(v6, "isEqual:", v11);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
    objc_msgSend(v8, "setColorTheme:", v11);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor backgroundColorForTheme:](UIColor, "backgroundColorForTheme:", v11));
    -[MTEpisodeCell setBackgroundColor:](self, "setBackgroundColor:", v9);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor selectedBackgroundColorForTheme:](UIColor, "selectedBackgroundColorForTheme:", v11));
    v10 = objc_opt_new(UIView);
    -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v5);
    -[MTEpisodeCell setMultipleSelectionBackgroundView:](self, "setMultipleSelectionBackgroundView:", v10);
    -[MTEpisodeCell setSelectionTintColor:](self, "setSelectionTintColor:", v5);

LABEL_4:
  }

}

- (MTColorTheme)colorTheme
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorTheme"));

  return (MTColorTheme *)v3;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v5, "setExpanded:", v3);

  -[MTEpisodeCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isExpanded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v4, "setCurrentPlayerItem:", v3);

}

- (BOOL)isCurrentPlayerItem
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = objc_msgSend(v2, "isCurrentPlayerItem");

  return v3;
}

- (BOOL)shouldShowNowPlaying
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = objc_msgSend(v2, "shouldShowNowPlaying");

  return v3;
}

- (void)setShouldShowNowPlaying:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v4, "setShouldShowNowPlaying:", v3);

}

- (MTEpisodeActionController)actionController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionController"));

  return (MTEpisodeActionController *)v3;
}

- (void)dismissActionSheetsAndPopovers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v2, "dismissActionSheetsAndPopovers");

}

- (void)updateActionSheetsAndPopovers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v2, "updateActionSheetsAndPopovers");

}

- (void)fixEmptyTextContainers
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v2, "fixEmptyTextContainers");

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTEpisodeCell;
  -[MTEpisodeCell prepareForReuse](&v5, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v3, "prepareForReuse");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTEpisodeCell;
  -[MTEpisodeCell layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell layoutManager](self, "layoutManager", a3.width, a3.height));
  objc_msgSend(v5, "contentRectForCell:forState:rowWidth:", self, -[MTEpisodeCell currentStateMask](self, "currentStateMask"), width);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell episodeLockup](self, "episodeLockup"));
  objc_msgSend(v8, "sizeThatFits:", v7, 1.79769313e308);
  v10 = v9;

  v11 = v10 + kMTCollectionViewInterLineSpacing;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (BOOL)swipeActionsExposed
{
  return ((unint64_t)-[MTEpisodeCell currentStateMask](self, "currentStateMask") >> 1) & 1;
}

- (void)lockup:(id)a3 moreButtonTapped:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell delegate](self, "delegate"));
  objc_msgSend(v6, "cell:moreButtonTapped:", self, v5);

}

- (void)lockupDidChangeSize:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "cellDidChangeSize:", self);

}

- (MTEpisodeCellDelegate)delegate
{
  return (MTEpisodeCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)explicitTreatment
{
  return self->_explicitTreatment;
}

- (void)setExplicitTreatment:(unint64_t)a3
{
  self->_explicitTreatment = a3;
}

- (void)setEpisodeLockup:(id)a3
{
  objc_storeStrong((id *)&self->_episodeLockup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeLockup, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
