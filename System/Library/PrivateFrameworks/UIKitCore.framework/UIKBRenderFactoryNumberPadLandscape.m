@implementation UIKBRenderFactoryNumberPadLandscape

- (double)numberFontSize
{
  return 27.0;
}

- (double)letterFontSize
{
  return 10.0;
}

- (CGPoint)deleteGlyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 1.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationGlyphOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnNumberOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)leftColumnLetterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 16.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnNumberOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)centerColumnLetterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 16.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnNumberOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)rightColumnLetterOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 16.0;
  v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)loneZeroOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)specialSymbolOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 0.0;
  v3 = 5.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_customizeSymbolStyle:(id)a3 secondaryStyle:(id)a4 forKey:(id)a5 contents:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  int v16;
  objc_super v17;

  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UIKBRenderFactoryNumberPadLandscape;
  -[UIKBRenderFactoryNumberPad _customizeSymbolStyle:secondaryStyle:forKey:contents:](&v17, sel__customizeSymbolStyle_secondaryStyle_forKey_contents_, a3, v10, v11, a6);
  if (-[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v11))
  {
    objc_msgSend(v10, "textOffset");
    v13 = -v12;
    objc_msgSend(v10, "textOffset");
    objc_msgSend(v10, "setTextOffset:", v13);
    v14 = 2;
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v10, "setAlignment:", v14);
  objc_msgSend(v11, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsString:", CFSTR("-Arabic-Digit-"));

  if (v16)
    objc_msgSend(v10, "setKerning:", -1.0);

}

@end
