@implementation PSGIgnoreLabelDisableCell

- (void)setCellEnabled:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGIgnoreLabelDisableCell;
  -[PSTableCell setCellEnabled:](&v5, sel_setCellEnabled_, a3);
  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

@end
