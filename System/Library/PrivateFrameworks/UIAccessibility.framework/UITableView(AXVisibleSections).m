@implementation UITableView(AXVisibleSections)

- (id)_accessibilityIndicesOfVisibleHeadersAndFooters
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  CGRect v21;
  CGRect v22;

  v2 = objc_msgSend(a1, "numberOfSections");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      if (objc_msgSend(a1, "style"))
        objc_msgSend(a1, "rectForHeaderInSection:", i);
      else
        objc_msgSend(a1, "rectForSection:", i);
      v9 = v5;
      v10 = v6;
      v11 = v7;
      v12 = v8;
      objc_msgSend(a1, "contentOffset");
      v14 = v13;
      objc_msgSend(a1, "contentOffset");
      v16 = v15;
      objc_msgSend(a1, "bounds");
      v18 = v17;
      objc_msgSend(a1, "bounds");
      v21.origin.x = v14;
      v21.origin.y = v16;
      v21.size.width = v18;
      v22.origin.x = v9;
      v22.origin.y = v10;
      v22.size.width = v11;
      v22.size.height = v12;
      if (CGRectIntersectsRect(v21, v22))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v19);

      }
    }
  }
  return v3;
}

@end
