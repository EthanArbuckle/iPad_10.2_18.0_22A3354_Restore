@implementation _UIEditMenuProvider

+ (id)menuElementsFromResponderChain:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 includeMenuControllerItems:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v10 = a5;
  v11 = a3;
  +[UIMenuSystem contextSystem](UIMenuSystem, "contextSystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "_newBuilderFromResponderChain:atLocation:inCoordinateSpace:", v11, v10, x, y);

  objc_msgSend(v13, "menuForIdentifier:", CFSTR("com.apple.menu.root"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _UIMenuForUIMenuControllerMenuItems();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v15, "arrayByAddingObject:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }

  }
  return v15;
}

@end
