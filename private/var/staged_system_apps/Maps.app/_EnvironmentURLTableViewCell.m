@implementation _EnvironmentURLTableViewCell

- (_EnvironmentURLTableViewCell)initWithReuseIdentifier:(id)a3
{
  _EnvironmentURLTableViewCell *v3;
  _EnvironmentURLTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _EnvironmentURLTableViewCell *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_EnvironmentURLTableViewCell;
  v3 = -[_EnvironmentURLTableViewCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", 1000, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v3, "editableTextField"));
    objc_msgSend(v5, "setReturnKeyType:", 9);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v4, "editableTextField"));
    objc_msgSend(v6, "setClearButtonMode:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v4, "editableTextField"));
    objc_msgSend(v7, "setKeyboardType:", 3);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v4, "editableTextField"));
    objc_msgSend(v8, "setAutocorrectionType:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v4, "editableTextField"));
    objc_msgSend(v9, "setAutocapitalizationType:", 0);

    -[_EnvironmentURLTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[_EnvironmentURLTableViewCell setTextFieldOffset:](v4, "setTextFieldOffset:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_EnvironmentURLTableViewCell editableTextField](v4, "editableTextField"));
    objc_msgSend(v10, "setDelegate:", v4);

    v11 = v4;
  }

  return v4;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  self->_editing = 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  _EnvironmentURLTableViewCellDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  self->_editing = 0;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

  objc_msgSend(WeakRetained, "urlCell:didChangeURLString:", self, v6);
}

- (unint64_t)urlType
{
  return self->_urlType;
}

- (void)setUrlType:(unint64_t)a3
{
  self->_urlType = a3;
}

- (_EnvironmentURLTableViewCellDelegate)delegate
{
  return (_EnvironmentURLTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
