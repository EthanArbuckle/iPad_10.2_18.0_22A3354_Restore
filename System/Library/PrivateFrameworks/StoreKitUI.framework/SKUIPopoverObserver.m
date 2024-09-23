@implementation SKUIPopoverObserver

- (SKUIPopoverObserver)initWithPopoverController:(id)a3
{
  id v5;
  SKUIPopoverObserver *v6;
  SKUIPopoverObserver *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPopoverObserver initWithPopoverController:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIPopoverObserver;
  v6 = -[SKUIPopoverObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_popoverController, a3);
    -[UIPopoverController setDelegate:](v7->_popoverController, "setDelegate:", v7);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIPopoverObserver;
  -[SKUIPopoverObserver dealloc](&v3, sel_dealloc);
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  -[UIPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", a3);
}

- (void)setTarget:(id)a3 selector:(SEL)a4
{
  id v5;

  self->_selector = a4;
  v5 = a3;
  objc_storeWeak(&self->_target, v5);

}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  id *p_target;
  id WeakRetained;
  SEL selector;
  id v7;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
  {
    selector = self->_selector;

    if (selector)
    {
      v7 = objc_loadWeakRetained(p_target);
      objc_msgSend(v7, "performSelector:withObject:", self->_selector, 0);

    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_popoverController, 0);
}

- (void)initWithPopoverController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPopoverObserver initWithPopoverController:]";
}

@end
