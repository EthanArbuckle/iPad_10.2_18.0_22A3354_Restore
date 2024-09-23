@implementation PSMultilineSubtitleSwitchTableViewCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[PSMultilineSubtitleSwitchTableViewCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  v6.receiver = self;
  v6.super_class = (Class)PSMultilineSubtitleSwitchTableViewCell;
  -[PSSubtitleSwitchTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);

  -[PSMultilineSubtitleSwitchTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

@end
