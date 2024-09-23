@implementation OpenFavoritesActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_opt_class(OpenFavoritesAction);
  if ((objc_opt_isKindOfClass(v10, v6) & 1) != 0)
  {
    v7 = v10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "coordinator"));
    v9 = objc_msgSend(v7, "favoritesType");

    objc_msgSend(v8, "viewController:showFavoritesType:", 0, v9);
  }

}

@end
