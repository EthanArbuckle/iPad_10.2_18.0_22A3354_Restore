@implementation SKUISearchBarController__MAKE_IT_RAIN__

- (SKUISearchBarController__MAKE_IT_RAIN__)initWithSearchBarViewElement:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUISearchBarController__MAKE_IT_RAIN__;
  return -[SKUISearchBarController__MAKE_IT_RAIN__ init](&v4, sel_init, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
