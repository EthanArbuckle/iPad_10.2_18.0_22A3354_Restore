@implementation CALayer

- (void)fr_accessibilityUndoInvertColorsIfNecessary
{
  _BOOL4 IsInvertColorsEnabled;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;

  IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer _fr_undoInvertColorsFilter](self, "_fr_undoInvertColorsFilter"));
  if (IsInvertColorsEnabled)
  {
    if (!v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorInvert));
      objc_msgSend(v8, "setName:", CFSTR("kFRAXUndoInvertColorsFilter"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters"));
      v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");

      if (!v6)
        v6 = objc_opt_new(NSMutableArray);
      -[NSMutableArray addObject:](v6, "addObject:", v8);
      goto LABEL_8;
    }
  }
  else if (v4)
  {
    v8 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters"));
    v6 = (NSMutableArray *)objc_msgSend(v7, "mutableCopy");

    -[NSMutableArray removeObject:](v6, "removeObject:", v8);
LABEL_8:
    -[CALayer setFilters:](self, "setFilters:", v6);

    v4 = v8;
  }

}

- (id)_fr_undoInvertColorsFilter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer filters](self, "filters"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fc_firstObjectPassingTest:", &stru_1000DA448));

  return v3;
}

@end
