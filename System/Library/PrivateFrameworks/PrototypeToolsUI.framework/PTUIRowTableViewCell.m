@implementation PTUIRowTableViewCell

+ (double)cellHeightForRow:(id)a3
{
  return 44.0;
}

+ (int64_t)cellStyleForRow:(id)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[PTRow removeObserver:](self->_row, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PTUIRowTableViewCell;
  -[PTUIRowTableViewCell dealloc](&v3, sel_dealloc);
}

- (void)prepareForReuse
{
  objc_super v3;

  -[PTUIRowTableViewCell setRow:](self, "setRow:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PTUIRowTableViewCell;
  -[PTUIRowTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setRow:(id)a3
{
  PTRow *v4;
  PTRow *row;
  PTRow *v6;

  v4 = (PTRow *)a3;
  -[PTRow removeObserver:](self->_row, "removeObserver:", self);
  row = self->_row;
  self->_row = v4;
  v6 = v4;

  -[PTRow addObserver:](self->_row, "addObserver:", self);
  -[PTUIRowTableViewCell updateCellCharacteristics](self, "updateCellCharacteristics");
  -[PTUIRowTableViewCell updateDisplayedContent](self, "updateDisplayedContent");
  -[PTUIRowTableViewCell updateDisplayedValue](self, "updateDisplayedValue");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTUIRowTableViewCell;
  -[PTUIRowTableViewCell setEditing:animated:](&v5, sel_setEditing_animated_, a3, a4);
  -[PTUIRowTableViewCell updateCellCharacteristics](self, "updateCellCharacteristics");
}

- (void)updateDisplayedContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PTUIRowTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUIRowTableViewCell row](self, "row");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  -[PTUIRowTableViewCell imageView](self, "imageView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PTUIRowTableViewCell row](self, "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

- (void)updateCellCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[PTUIRowTableViewCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[PTUIRowTableViewCell row](self, "row");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_msgSend(v7, "defaultUIAction"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = -[PTUIRowTableViewCell isEditing](self, "isEditing") ^ 1;

  }
  else
  {
    v6 = 0;
  }
  -[PTUIRowTableViewCell setSelectionStyle:](self, "setSelectionStyle:", v6);

}

- (void)rowDidReload:(id)a3
{
  -[PTUIRowTableViewCell updateDisplayedValue](self, "updateDisplayedValue", a3);
  -[PTUIRowTableViewCell updateDisplayedContent](self, "updateDisplayedContent");
}

- (PTRow)row
{
  return self->_row;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);
}

@end
