@implementation _UITableViewContainerView

- (_UITableViewContainerView)init
{
  _UITableViewContainerView *v2;
  _UITableViewContainerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITableViewContainerView;
  v2 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[UIView setAutoresizesSubviews:](v2, "setAutoresizesSubviews:", 0);
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](v3, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    -[UIView setLayoutMargins:](v3, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  }
  return v3;
}

@end
