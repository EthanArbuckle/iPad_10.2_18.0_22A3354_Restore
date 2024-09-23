@implementation _PUIStyleVibrantMaterialCoordinatorImpl

- (id)itemView
{
  UIView *itemView;
  void *v4;
  id v5;
  void *v6;
  UIView *v7;
  UIView *v8;

  itemView = self->_itemView;
  if (!itemView)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("material"), v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIView *)objc_msgSend(v5, "initWithImage:", v6);

    -[UIView setContentMode:](v7, "setContentMode:", 1);
    v8 = self->_itemView;
    self->_itemView = v7;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
