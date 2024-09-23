@implementation RouteLargeStepLabelListView

+ (id)fontsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = objc_msgSend(a3, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithSize:](UIFont, "_maps_boldSystemFontWithSize:", 35.0));
  objc_msgSend(v7, "addObject:", v8);

  v9 = 2;
  if ((unint64_t)v6 > 2)
    v9 = (uint64_t)v6;
  v10 = v9 - 1;
  do
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithSize:](UIFont, "_maps_systemFontWithSize:", 20.0));
    objc_msgSend(v7, "addObject:", v11);

    --v10;
  }
  while (v10);
  return v7;
}

+ (int64_t)_instructionsContext
{
  return 2;
}

@end
