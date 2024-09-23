@implementation NSAttributedString(PKUIUtilities)

+ (id)pkui_attriutedStringWithString:()PKUIUtilities font:paragraphStyle:
{
  __CFString *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0DC1138]);
  if (v9)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC1178]);
  if (!v7)
    v7 = &stru_1E3E7D690;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v11);

  return v12;
}

- (uint64_t)pkui_sizeThatFits:()PKUIUtilities
{
  return objc_msgSend(a1, "pkui_sizeThatFits:withNumberOfLines:", 0);
}

- (uint64_t)pkui_sizeThatFits:()PKUIUtilities withNumberOfLines:
{
  return objc_msgSend(a1, "pkui_sizeThatFits:withNumberOfLines:forceWordWrap:", a3, 0);
}

- (double)pkui_sizeThatFits:()PKUIUtilities withNumberOfLines:forceWordWrap:
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  _QWORD v18[4];
  id v19;

  if (a6)
  {
    v10 = (void *)objc_msgSend(a1, "mutableCopy");
    v11 = objc_msgSend(a1, "length");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __87__NSAttributedString_PKUIUtilities__pkui_sizeThatFits_withNumberOfLines_forceWordWrap___block_invoke;
    v18[3] = &unk_1E3E66260;
    v12 = v10;
    v19 = v12;
    objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v18);

  }
  else
  {
    v12 = 0;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
  objc_msgSend(v13, "setMaximumNumberOfLines:", a5);
  if (v12)
    v14 = v12;
  else
    v14 = a1;
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 33, v13, a2, a3);
  PKFloatCeilToPixel();
  v16 = fmin(v15, a2);
  PKFloatCeilToPixel();

  return v16;
}

@end
