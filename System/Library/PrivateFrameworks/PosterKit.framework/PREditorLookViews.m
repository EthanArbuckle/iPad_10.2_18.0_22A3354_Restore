@implementation PREditorLookViews

- (PREditorLookViews)init
{
  PREditorLookViews *v2;
  UIView *v3;
  UIView *backgroundView;
  UIView *v5;
  UIView *foregroundView;
  UIView *v7;
  UIView *floatingView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PREditorLookViews;
  v2 = -[PREditorLookViews init](&v10, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v3;

    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    foregroundView = v2->_foregroundView;
    v2->_foregroundView = v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    floatingView = v2->_floatingView;
    v2->_floatingView = v7;

  }
  return v2;
}

- (void)enumerateViewsUsingBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, UIView *, uint64_t))a3 + 2))(v6, self->_foregroundView, 1);
  (*((void (**)(id, UIView *, uint64_t))a3 + 2))(v6, self->_floatingView, 2);

}

- (NSArray)contentViews
{
  __int128 v3;
  UIView *floatingView;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_backgroundView;
  floatingView = self->_floatingView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
