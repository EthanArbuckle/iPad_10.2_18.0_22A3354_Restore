@implementation UIFloatingTabBarGroupCell

void __46___UIFloatingTabBarGroupCell__reloadItemsView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  _UIFloatingTabBarGroupItemView *v6;
  void *v7;
  void *v8;
  void *v9;
  _UIFloatingTabBarGroupItemView *v10;

  v5 = a2;
  v6 = [_UIFloatingTabBarGroupItemView alloc];
  objc_msgSend(v5, "contentTab");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIFloatingTabBarGroupItemView initWithImage:needsPunchOut:](v6, "initWithImage:needsPunchOut:", v8, a3 != 0);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

@end
