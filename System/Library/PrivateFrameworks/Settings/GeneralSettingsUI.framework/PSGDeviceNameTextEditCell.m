@implementation PSGDeviceNameTextEditCell

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGDeviceNameTextEditCell;
  -[PSEditableTableCell textFieldDidBeginEditing:](&v5, sel_textFieldDidBeginEditing_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE000], 0);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGDeviceNameTextEditCell;
  -[PSEditableTableCell layoutSubviews](&v5, sel_layoutSubviews);
  -[PSGDeviceNameTextEditCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    objc_msgSend(v4, "setFrame:");
  }

}

@end
