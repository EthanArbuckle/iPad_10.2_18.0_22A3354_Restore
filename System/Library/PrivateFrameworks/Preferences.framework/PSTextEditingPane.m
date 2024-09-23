@implementation PSTextEditingPane

- (PSTextEditingPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PSTextEditingPane *v7;
  PSTextEditingPane *v8;
  uint64_t v9;
  UITableView *table;
  PSTextEditingCell *v11;
  PSTextEditingCell *cell;
  uint64_t v13;
  UITextField *textField;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PSTextEditingPane;
  v7 = -[PSEditingPane initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    *((_BYTE *)&v7->super + 432) |= 1u;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 1, x, y, width, height);
    table = v8->_table;
    v8->_table = (UITableView *)v9;

    -[UITableView setDataSource:](v8->_table, "setDataSource:", v8);
    -[UITableView setScrollEnabled:](v8->_table, "setScrollEnabled:", 0);
    -[UITableView setAllowsSelection:](v8->_table, "setAllowsSelection:", 0);
    -[UITableView reloadData](v8->_table, "reloadData");
    -[PSTextEditingPane addSubview:](v8, "addSubview:", v8->_table);
    v11 = -[PSTextEditingCell initWithStyle:reuseIdentifier:]([PSTextEditingCell alloc], "initWithStyle:reuseIdentifier:", 1000, &stru_1E4A69238);
    cell = v8->_cell;
    v8->_cell = v11;

    -[PSTextEditingCell setOpaque:](v8->_cell, "setOpaque:", 0);
    -[PSTextEditingCell editableTextField](v8->_cell, "editableTextField");
    v13 = objc_claimAutoreleasedReturnValue();
    textField = v8->_textField;
    v8->_textField = (UITextField *)v13;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[UITableView setDataSource:](self->_table, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSTextEditingPane;
  -[PSTextEditingPane dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[PSTextEditingPane frame](self, "frame");
  -[UITableView setFrame:](self->_table, "setFrame:");
  -[UITableView frame](self->_table, "frame");
  v4 = v3;
  -[UITableView rectForSection:](self->_table, "rectForSection:", 0);
  v6 = v4 - v5;
  objc_msgSend(MEMORY[0x1E0CEA6C8], "defaultSize");
  -[UITableView setContentInset:](self->_table, "setContentInset:", floor((v6 - v7) * 0.5), 0.0, 0.0, 0.0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_cell;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)setPreferenceValue:(id)a3
{
  -[UITextField setText:](self->_textField, "setText:", a3);
}

- (id)preferenceValue
{
  return -[UITextField text](self->_textField, "text");
}

- (void)setPreferenceSpecifier:(id)a3
{
  _QWORD *v4;
  UITextField *textField;
  UITextField *v6;
  uint64_t v7;
  void *v8;
  int v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSTextEditingPane;
  -[PSEditingPane setPreferenceSpecifier:](&v10, sel_setPreferenceSpecifier_, v4);
  -[UITextField setClearButtonStyle:](self->_textField, "setClearButtonStyle:", 2);
  -[UITextField setClearButtonOffset:](self->_textField, "setClearButtonOffset:", 0.0, -1.0);
  textField = self->_textField;
  if (v4[12])
  {
    -[UITextField setAutocorrectionType:](textField, "setAutocorrectionType:", 1);
    -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 0);
    switch(v4[12])
    {
      case 1:
        v6 = self->_textField;
        v7 = 3;
        goto LABEL_14;
      case 2:
        v6 = self->_textField;
        v7 = 11;
        goto LABEL_14;
      case 3:
        v6 = self->_textField;
        v7 = 2;
        goto LABEL_14;
      case 4:
      case 5:
        v6 = self->_textField;
        v7 = 7;
        goto LABEL_14;
      case 6:
        v6 = self->_textField;
        v7 = 8;
LABEL_14:
        -[UITextField setKeyboardType:](v6, "setKeyboardType:", v7);
        break;
      default:
        break;
    }
  }
  else
  {
    if (-[UITextField autocapitalizationType](textField, "autocapitalizationType") != v4[10])
      -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:");
    if (-[UITextField keyboardType](self->_textField, "keyboardType") != v4[9])
      -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:");
    if (-[UITextField autocorrectionType](self->_textField, "autocorrectionType") != v4[11])
      -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:");
  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("noAutoCorrect"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", 1);
    -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
