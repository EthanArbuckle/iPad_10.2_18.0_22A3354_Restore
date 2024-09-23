@implementation UIViewController

- (id)recursiveDescription
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", &stru_10758));
  -[UIViewController addDescriptionToString:indentLevel:](self, "addDescriptionToString:indentLevel:", v3, 0);
  return v3;
}

- (void)addDescriptionToString:(id)a3 indentLevel:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGRect v24;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_10758, "stringByPaddingToLength:withString:startingAtIndex:", a4, CFSTR(" "), 0));
  objc_msgSend(v6, "appendString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController debugDescription](self, "debugDescription"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](self, "view"));
  objc_msgSend(v9, "frame");
  v10 = NSStringFromCGRect(v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v6, "appendFormat:", CFSTR("%@, %@"), v8, v11);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](self, "childViewControllers"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    v16 = a4 + 1;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17);
        objc_msgSend(v6, "appendFormat:", CFSTR("\n%@>"), v7);
        objc_msgSend(v18, "addDescriptionToString:indentLevel:", v6, v16);
        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

}

@end
