@implementation UIView

- (double)scaledValueForSmallWidth:(double)a3 bigWidth:(double)a4
{
  void *v7;
  double v8;
  double v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "bounds");
  v9 = v8;

  return UIRoundToViewScale(self, a3 + (a4 - a3) / 94.0 * (v9 + -320.0));
}

- (double)valueForSmallWidth:(double)a3 mediumWidth:(double)a4 largeWidth:(double)a5
{
  void *v8;
  double v9;
  double v10;
  double result;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "bounds");
  v10 = v9;

  if (v10 <= 375.0)
    result = a4;
  else
    result = a5;
  if (v10 <= 320.0)
    return a3;
  return result;
}

- (double)centerXForElementAt:(int64_t)a3 width:(double)a4 percent:(double)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIView bounds](self, "bounds");
  v10 = (double)a3 * ((v9 + 5.0 * -2.0) / 7.0) + 5.0 + (v9 + 5.0 * -2.0) / 7.0 * 0.5 - a4 * 0.5;
  if (a5 > 0.01)
  {
    -[UIView scaledValueForSmallWidth:bigWidth:](self, "scaledValueForSmallWidth:bigWidth:", 3.5 + 78.0, 19.0 + 88.0);
    v12 = v11;
    -[UIView scaledValueForSmallWidth:bigWidth:](self, "scaledValueForSmallWidth:bigWidth:", 30.0, 40.0);
    v10 = v10 + (v12 + (v13 + 6.0) * (double)a3 - v10) * a5;
  }
  return UIRoundToViewScale(self, v10);
}

- (void)ch_transformViewsForRightToLeftLanguages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double Width;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGRect v25;
  CGRect v26;

  v3 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "frame");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
        objc_msgSend(v17, "bounds");
        Width = CGRectGetWidth(v25);
        v26.origin.x = v10;
        v26.origin.y = v12;
        v26.size.width = v14;
        v26.size.height = v16;
        v19 = Width - CGRectGetWidth(v26) - v10;

        objc_msgSend(v8, "setFrame:", v19, v12, v14, v16);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

@end
