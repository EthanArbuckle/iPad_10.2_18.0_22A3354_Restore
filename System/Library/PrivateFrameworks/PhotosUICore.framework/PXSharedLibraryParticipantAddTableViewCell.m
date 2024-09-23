@implementation PXSharedLibraryParticipantAddTableViewCell

- (PXSharedLibraryParticipantAddTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PXSharedLibraryParticipantAddTableViewCell *v4;
  PXSharedLibraryParticipantAddButton *v5;
  PXSharedLibraryParticipantAddButton *addButton;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryParticipantAddTableViewCell;
  v4 = -[PXSharedLibraryParticipantAddTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(PXSharedLibraryParticipantAddButton);
    addButton = v4->_addButton;
    v4->_addButton = v5;

    +[PXSharedLibraryParticipantTableCellModel imageDiameter](PXSharedLibraryParticipantTableCellModel, "imageDiameter");
    -[PXSharedLibraryParticipantAddButton setImageSizeToAlignWith:](v4->_addButton, "setImageSizeToAlignWith:", v7, v7);
    +[PXSharedLibraryParticipantTableCellModel imageInset](PXSharedLibraryParticipantTableCellModel, "imageInset");
    -[PXSharedLibraryParticipantAddButton setInset:](v4->_addButton, "setInset:");
    -[PXSharedLibraryParticipantAddTableViewCell addSubview:](v4, "addSubview:", v4->_addButton);
  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantAddTableViewCell;
  -[PXSharedLibraryParticipantAddTableViewCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PXSharedLibraryParticipantAddTableViewCell bounds](self, "bounds");
  -[PXSharedLibraryParticipantAddButton setFrame:](self->_addButton, "setFrame:");
}

- (PXSharedLibraryParticipantAddButton)addButton
{
  return self->_addButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addButton, 0);
}

@end
