@implementation PSGSelfSizingTableView

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[PSGSelfSizingTableView contentSize](self, "contentSize");
  if (width != v7 || height != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PSGSelfSizingTableView;
    -[PSGSelfSizingTableView setContentSize:](&v9, sel_setContentSize_, width, height);
    -[PSGSelfSizingTableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PSGSelfSizingTableView layoutIfNeeded](self, "layoutIfNeeded");
  v3 = *MEMORY[0x24BEBE9C8];
  -[PSGSelfSizingTableView contentSize](self, "contentSize");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

@end
