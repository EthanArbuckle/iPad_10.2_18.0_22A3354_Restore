@implementation PXComposeRecipientAddRecipientTableViewCell

- (PXComposeRecipientAddRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXComposeRecipientAddRecipientTableViewCell *v4;
  PXComposeRecipientAddButton *v5;
  PXComposeRecipientAddButton *addRecipientButton;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXComposeRecipientAddRecipientTableViewCell;
  v4 = -[PXComposeRecipientAddRecipientTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PXComposeRecipientAddButton);
    addRecipientButton = v4->_addRecipientButton;
    v4->_addRecipientButton = v5;

    +[PXComposeRecipientTableCellModel imageDiameter](PXComposeRecipientTableCellModel, "imageDiameter");
    -[PXComposeRecipientAddButton setImageSizeToAlignWith:](v4->_addRecipientButton, "setImageSizeToAlignWith:", v7, v7);
    +[PXComposeRecipientTableCellModel imageInset](PXComposeRecipientTableCellModel, "imageInset");
    -[PXComposeRecipientAddButton setInset:](v4->_addRecipientButton, "setInset:");
    -[PXComposeRecipientAddRecipientTableViewCell addSubview:](v4, "addSubview:", v4->_addRecipientButton);
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientAddRecipientTableViewCell;
  -[PXComposeRecipientAddRecipientTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PXComposeRecipientAddRecipientTableViewCell bounds](self, "bounds");
  -[PXComposeRecipientAddButton setFrame:](self->_addRecipientButton, "setFrame:");
}

- (PXComposeRecipientAddButton)addRecipientButton
{
  return self->_addRecipientButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addRecipientButton, 0);
}

@end
