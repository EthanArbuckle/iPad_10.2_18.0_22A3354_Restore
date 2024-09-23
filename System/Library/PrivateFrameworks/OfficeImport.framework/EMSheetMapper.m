@implementation EMSheetMapper

- (int)height
{
  return 600;
}

- (CGSize)preprocessSizeWithState:(id)a3
{
  id v4;
  int v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = a3;
  v5 = -[EMSheetMapper preprocessWidthWithState:](self, "preprocessWidthWithState:", v4);
  v6 = -[EMSheetMapper preprocessHeightWithState:](self, "preprocessHeightWithState:", v4);
  if ((double)v5 >= 400.0)
    v7 = (double)v5;
  else
    v7 = 400.0;
  if ((double)v6 >= 300.0)
    v8 = (double)v6;
  else
    v8 = 300.0;

  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int)width
{
  return 980;
}

- (CGSize)adjustedSize
{
  int v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = -[EMSheetMapper width](self, "width");
  v4 = -[EMSheetMapper height](self, "height");
  if (v3 > 0 || v4 >= 1)
  {
    v7 = (double)v4;
    if (v3 <= 0)
    {
      v8 = v7 * 4.0 / 3.0;
    }
    else
    {
      v8 = (double)v3;
      if (v4 <= 0)
        v7 = v8 * 3.0 * 0.25;
    }
    v5 = v8 + 20.0;
    v6 = v7 + 20.0;
  }
  else
  {
    v5 = 980.0;
    v6 = 600.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

@end
