@implementation UINavigationBarTitleViewWrapper

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (_UINavigationBarTitleView)navBarTitleView
{
  return self->_navBarTitleView;
}

- (void)setNavBarTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_navBarTitleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarTitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
