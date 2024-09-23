@implementation UISegmentedControl

- (void)_maps_setItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  -[UISegmentedControl removeAllSegments](self, "removeAllSegments");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self, "insertSegmentWithTitle:atIndex:animated:", v10, -[UISegmentedControl numberOfSegments](self, "numberOfSegments"), 0);
        }
        else
        {
          v12 = objc_opt_class(UIImage);
          if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
            -[UISegmentedControl insertSegmentWithImage:atIndex:animated:](self, "insertSegmentWithImage:atIndex:animated:", v10, -[UISegmentedControl numberOfSegments](self, "numberOfSegments", (_QWORD)v13), 0);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)_maps_testFitSegmentTitlesToWidth:(double)a3
{
  double v4;

  -[UISegmentedControl intrinsicContentSize](self, "intrinsicContentSize");
  return v4 <= a3;
}

@end
