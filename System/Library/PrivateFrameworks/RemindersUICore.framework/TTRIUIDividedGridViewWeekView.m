@implementation TTRIUIDividedGridViewWeekView

- (TTRIUIDividedGridViewWeekView)init
{
  TTRIUIDividedGridViewWeekView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TTRIUIDividedGridViewWeekView;
  v2 = -[TTRIUIDividedGridViewWeekView init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TTRIUIDividedGridViewWeekView setButtonViews:](v2, "setButtonViews:", v3);

  }
  return v2;
}

- (NSMutableArray)buttonViews
{
  return (NSMutableArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setButtonViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_heightConstraint);
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_heightConstraint);
  objc_storeStrong((id *)&self->_buttonViews, 0);
}

@end
