@implementation UIFont(UserNotificationsUIKitAdditions)

+ (id)unui_excessiveLineHeightChars
{
  if (unui_excessiveLineHeightChars_onceToken != -1)
    dispatch_once(&unui_excessiveLineHeightChars_onceToken, &__block_literal_global_24);
  return (id)unui_excessiveLineHeightChars___excessiveLineHeightChars;
}

- (uint64_t)unui_hasExuberatedLineHeightForText:()UserNotificationsUIKitAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(a1, "unui_hasExuberatedLineHeight"))
    v5 = objc_msgSend(v4, "unui_containsExcessiveLineHeightCharacters");
  else
    v5 = 0;

  return v5;
}

- (uint64_t)unui_hasExuberatedLineHeightForAttributedText:()UserNotificationsUIKitAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (objc_msgSend(v4, "length") && objc_msgSend(a1, "unui_hasExuberatedLineHeight"))
    v5 = objc_msgSend(v4, "unui_containsExcessiveLineHeightCharacters");
  else
    v5 = 0;

  return v5;
}

- (uint64_t)unui_effectiveScaledValueForValue:()UserNotificationsUIKitAdditions hasExuberatedLineHeight:
{
  void *v6;

  if (!a4)
    return objc_msgSend(a1, "_scaledValueForValue:", a2);
  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "_scaledValueForValue:", a2);
  return objc_msgSend(v6, "unui_exuberatedValueForValue:");
}

- (uint64_t)unui_effectiveLineHeightForText:()UserNotificationsUIKitAdditions
{
  void *v2;

  if (!objc_msgSend(a1, "unui_hasExuberatedLineHeightForText:"))
    return objc_msgSend(a1, "lineHeight");
  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "lineHeight");
  return objc_msgSend(v2, "unui_exuberatedValueForValue:");
}

- (unint64_t)unui_numberOfLinesForText:()UserNotificationsUIKitAdditions inFrame:maximum:drawingContext:
{
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = a9;
  if (objc_msgSend(v14, "length"))
  {
    if (a8 != 1)
    {
      if (!v15)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
        objc_msgSend(v15, "setWantsNumberOfLineFragments:", 1);
      }
      v19 = *MEMORY[0x1E0DC1138];
      v20[0] = a1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, v15, a4, a5);

      if (!a8)
        a8 = -1;
      v17 = objc_msgSend(v15, "numberOfLineFragments");
      if (a8 >= v17)
        a8 = v17;
    }
  }
  else
  {
    a8 = 0;
  }

  return a8;
}

- (double)unui_measuringHeightForText:()UserNotificationsUIKitAdditions withNumberOfLines:
{
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;

  v6 = (double)a4;
  objc_msgSend(a1, "unui_effectiveLineHeightForText:");
  v8 = v7;
  v9 = a4 - 1;
  if (!a4)
    v9 = 0;
  v10 = (double)v9;
  objc_msgSend(a1, "leading");
  return v11 * v10 + v6 * v8;
}

- (double)unui_drawingHeightForText:()UserNotificationsUIKitAdditions withNumberOfLines:additionalPadding:
{
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v8 = objc_msgSend(a1, "unui_hasExuberatedLineHeightForText:");
  if ((_DWORD)v8)
  {
    v9 = (void *)objc_opt_class();
    objc_msgSend(a1, "lineHeight");
    objc_msgSend(v9, "unui_exuberatedValueForValue:");
  }
  else
  {
    objc_msgSend(a1, "lineHeight");
  }
  v11 = v10;
  objc_msgSend(a1, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", v8, a2);
  v13 = v12;
  objc_msgSend(a1, "leading");
  return (v13 + v11 + v14) * (double)a5;
}

@end
