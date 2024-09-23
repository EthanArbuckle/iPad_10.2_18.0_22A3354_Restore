@implementation RTTUIReplyActionCell

- (RTTUIReplyActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 andDelegate:(id)a5
{
  id v8;
  RTTUIReplyActionCell *v9;
  void *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)RTTUIReplyActionCell;
  v9 = -[RTTUIReplyActionCell initWithStyle:reuseIdentifier:](&v12, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIReplyActionCell setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[RTTUIReplyActionCell setDelegate:](v9, "setDelegate:", v8);
  }

  return v9;
}

- (double)adjustedHeight
{
  return 0.0;
}

- (RTTUIReplyActionCellDelegate)delegate
{
  return (RTTUIReplyActionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
