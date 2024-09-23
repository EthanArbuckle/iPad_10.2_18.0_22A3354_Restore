@implementation TUIPassthroughLayout

- (UIEdgeInsets)groupedContainingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 0;
}

- (unint64_t)groupedContainingContentMode
{
  return 0;
}

- (BOOL)groupedContainingIsGrouped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v3 = objc_msgSend(v2, "grouped");

  return v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "computeIntrinsicWidth");
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "computeIntrinsicHeight");
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "computedWidth");
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  void *v3;
  void *v4;
  $881BB7C90C7D0DFCC1492E3DC022A30F *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)objc_msgSend(v4, "computedHeight");
  return v5;
}

- (void)computeLayout
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout children](self, "children"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  -[TUILayout containingWidth](self, "containingWidth");
  objc_msgSend(v4, "setContainingWidth:");
  -[TUILayout containingHeight](self, "containingHeight");
  objc_msgSend(v4, "setContainingHeight:");
  -[TUILayout flexedWidth](self, "flexedWidth");
  objc_msgSend(v4, "setFlexedWidth:");
  -[TUILayout flexedHeight](self, "flexedHeight");
  objc_msgSend(v4, "setFlexedHeight:");
  objc_msgSend(v4, "validateLayout");
  objc_msgSend(v4, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(v4, "computedTransformedSize");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");

}

@end
