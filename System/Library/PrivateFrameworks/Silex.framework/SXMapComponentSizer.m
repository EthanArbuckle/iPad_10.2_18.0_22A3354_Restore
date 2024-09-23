@implementation SXMapComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SXComponentSizer layoutOptions](self, "layoutOptions", a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "columnLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constrainedViewportSize");
  v7 = v6;
  v9 = v8;

  v10 = 0.5;
  if (v7 > v9)
    v10 = 0.75;
  return v9 * v10;
}

+ ($E660A970F15D2F953EA027EB4C298F67)regionFromRegion:(SEL)a3 coordinates:(id *)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $E660A970F15D2F953EA027EB4C298F67 *v14;
  int v15;
  int v16;
  uint64_t v17;
  $E660A970F15D2F953EA027EB4C298F67 *result;

  v9 = v8;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  v14 = a4;
  v15 = objc_msgSend(a2, "isSpanSetOnRegion:", v12, v11, v10, v9);
  v16 = objc_msgSend(a2, "isCenterSetOnRegion:", v12, v11, v10, v9);
  v17 = -[$E660A970F15D2F953EA027EB4C298F67 count](v14, "count");
  if ((v15 | v16) == 1 && v17)
    objc_msgSend(a2, "regionForCoordinates:", v14);

  return result;
}

+ (BOOL)isSpanSetOnRegion:(id *)a3
{
  double v3;
  double v4;

  return v4 == 0.0 && v3 == 0.0;
}

+ (BOOL)isCenterSetOnRegion:(id *)a3
{
  double v3;
  double v4;

  return v4 == 0.0 && v3 == 0.0;
}

+ ($E660A970F15D2F953EA027EB4C298F67)regionForCoordinates:(SEL)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $E660A970F15D2F953EA027EB4C298F67 *result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  if (objc_msgSend(v4, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      v9 = 1.79769313e308;
      v10 = -1.79769313e308;
      v11 = -1.79769313e308;
      v12 = 1.79769313e308;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "MKCoordinateValue", (_QWORD)v21);
          v16 = fmin(v12, 1.79769313e308);
          if (v16 >= v15)
            v12 = v15;
          else
            v12 = v16;
          if (v11 >= -1.79769313e308)
            v17 = v11;
          else
            v17 = -1.79769313e308;
          if (v17 >= v15)
            v11 = v17;
          else
            v11 = v15;
          v18 = fmin(v9, 1.79769313e308);
          if (v18 >= v14)
            v9 = v14;
          else
            v9 = v18;
          if (v10 >= -1.79769313e308)
            v19 = v10;
          else
            v19 = -1.79769313e308;
          if (v19 >= v14)
            v10 = v19;
          else
            v10 = v14;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 1.79769313e308;
      v10 = -1.79769313e308;
      v11 = -1.79769313e308;
      v12 = 1.79769313e308;
    }

    CLLocationCoordinate2DMake(v9 + (v10 - v9) * 0.5, v12 + (v11 - v12) * 0.5);
  }

  return result;
}

+ ($492624663365B345F6CF51E8DFCF0145)mapRectForRegion:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  MKMapPoint v11;
  MKMapPoint v12;
  double x;
  double y;
  double v15;
  double v16;
  double v17;
  double v18;
  CLLocationCoordinate2D v19;
  CLLocationCoordinate2D v20;
  $492624663365B345F6CF51E8DFCF0145 result;

  v7 = v4;
  v8 = v3;
  v9 = v5 * 0.5;
  v10 = v6 * 0.5;
  v19 = CLLocationCoordinate2DMake(v3 + v5 * 0.5, v4 - v6 * 0.5);
  v11 = MKMapPointForCoordinate(v19);
  v20 = CLLocationCoordinate2DMake(v8 - v9, v7 + v10);
  v12 = MKMapPointForCoordinate(v20);
  if (v11.x >= v12.x)
    x = v12.x;
  else
    x = v11.x;
  if (v11.y >= v12.y)
    y = v12.y;
  else
    y = v11.y;
  v15 = -(v11.x - v12.x);
  if (v11.x - v12.x >= 0.0)
    v15 = v11.x - v12.x;
  if (v11.y - v12.y >= 0.0)
    v16 = v11.y - v12.y;
  else
    v16 = -(v11.y - v12.y);
  v17 = x;
  v18 = y;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v18;
  result.var0.var0 = v17;
  return result;
}

@end
