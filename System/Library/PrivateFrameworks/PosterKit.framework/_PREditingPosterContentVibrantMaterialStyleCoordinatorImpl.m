@implementation _PREditingPosterContentVibrantMaterialStyleCoordinatorImpl

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
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("material"), v4, 0);
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
