@implementation PKPassFooterViewConfiguration

- (PKPassFooterViewConfiguration)init
{

  return 0;
}

- (PKPassFooterViewConfiguration)initWithPassView:(id)a3 state:(int64_t)a4
{
  id v6;
  PKPassFooterViewConfiguration *v7;
  PKPassFooterViewConfiguration *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassFooterViewConfiguration;
  v7 = -[PKPassFooterViewConfiguration init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_state = a4;
    if (a4 == 3)
      v9 = 0;
    else
      v9 = v6;
    objc_storeStrong((id *)&v7->_passView, v9);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && (PKPassView *)v4[1] == self->_passView && v4[2] == self->_state;

  return v5;
}

- (unint64_t)hash
{
  return self->_state;
}

- (PKPass)pass
{
  return -[PKPassView pass](self->_passView, "pass");
}

- (PKPassView)passView
{
  return self->_passView;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
