@implementation _UISearchBarTransitionContext

- (_UISearchBarLayout)toLayout
{
  return self->_toLayout;
}

- (void)setToLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_UISearchBarLayout)fromLayout
{
  return self->_fromLayout;
}

- (void)setFromLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromLayout, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
}

@end
