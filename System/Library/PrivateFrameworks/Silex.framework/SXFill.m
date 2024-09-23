@implementation SXFill

- (unint64_t)attachmentWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 3)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("fixed"), v4, v5);
  else
    return 0;
}

- (unint64_t)fillModeWithValue:(id)a3 withType:(int)a4
{
  id v4;
  unint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("fit")) & 1) != 0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("cover")) & 1) != 0)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("stretch")))
    v5 = 2;
  else
    v5 = 1;
LABEL_6:

  return v5;
}

- (unint64_t)horizontalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v4;
  unint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("left")) & 1) != 0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("center")) & 1) != 0)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("right")))
    v5 = 2;
  else
    v5 = 1;
LABEL_6:

  return v5;
}

- (unint64_t)verticalAlignmentWithValue:(id)a3 withType:(int)a4
{
  id v4;
  unint64_t v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("top")) & 1) != 0)
  {
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("center")) & 1) != 0)
  {
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bottom")))
    v5 = 2;
  else
    v5 = 1;
LABEL_6:

  return v5;
}

@end
