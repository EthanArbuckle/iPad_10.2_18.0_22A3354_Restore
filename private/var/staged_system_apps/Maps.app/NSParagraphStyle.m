@implementation NSParagraphStyle

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  return _objc_msgSend(a1, "_maps_paragraphStyleForHandlingExcessiveHeightString:lineHeightMultiplier:withHyphenationFactor:", a3, 1.29999995, v3);
}

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 withHyphenationFactor:(float)a4
{
  double v4;

  *(float *)&v4 = a4;
  return _objc_msgSend(a1, "_maps_paragraphStyleForHandlingExcessiveHeightString:lineHeightMultiplier:withHyphenationFactor:", a3, 1.29999995, v4);
}

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 lineHeightMultiplier:(double)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  return _objc_msgSend(a1, "_maps_paragraphStyleForHandlingExcessiveHeightString:lineHeightMultiplier:withHyphenationFactor:", a3, a4, v4);
}

+ (id)_maps_paragraphStyleForHandlingExcessiveHeightString:(id)a3 lineHeightMultiplier:(double)a4 withHyphenationFactor:(float)a5
{
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableParagraphStyle defaultParagraphStyle](NSMutableParagraphStyle, "defaultParagraphStyle"));
  v9 = objc_msgSend(v8, "mutableCopy");

  LODWORD(v8) = objc_msgSend(v7, "_maps_containsExcessiveHeightCharacters");
  if ((_DWORD)v8)
    objc_msgSend(v9, "setLineHeightMultiple:", a4);
  objc_msgSend(v9, "setLineBreakMode:", 4);
  *(float *)&v10 = a5;
  objc_msgSend(v9, "setHyphenationFactor:", v10);
  v11 = objc_msgSend(v9, "copy");

  return v11;
}

@end
