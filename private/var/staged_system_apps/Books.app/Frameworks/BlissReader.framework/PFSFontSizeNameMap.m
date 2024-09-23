@implementation PFSFontSizeNameMap

+ (id)fontSizeNameMap
{
  id result;

  result = (id)qword_543448;
  if (!qword_543448)
  {
    result = objc_alloc_init((Class)NSMutableDictionary);
    qword_543448 = (uint64_t)result;
  }
  return result;
}

+ (void)addFontSize:(double)a3 forName:(id)a4
{
  id v6;

  v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithDouble:", a3);
  objc_msgSend(objc_msgSend(a1, "fontSizeNameMap"), "setObject:forKey:", v6, objc_msgSend(a4, "lowercaseString"));

}

+ (void)initialize
{
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("xx-small"), 7.0);
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("x-small"), 8.0);
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("small"), 10.0);
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("medium"), 12.0);
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("large"), 14.0);
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("x-large"), 18.0);
  objc_msgSend(a1, "addFontSize:forName:", CFSTR("xx-large"), 24.0);
}

+ (double)floatValueForKey:(id)a3
{
  id v3;
  double result;

  v3 = objc_msgSend(objc_msgSend(a1, "fontSizeNameMap"), "objectForKey:", a3);
  if (!v3)
    return -65536.0;
  objc_msgSend(v3, "doubleValue");
  return result;
}

+ (double)fontSizeForName:(id)a3 parentSize:(double)a4
{
  id v7;
  double result;
  id v9;
  char *v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  char *v15;

  v7 = objc_msgSend(objc_msgSend(a1, "fontSizeNameMap"), "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    return result;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("larger")) & 1) == 0
    && !objc_msgSend(a3, "isEqualToString:", CFSTR("smaller")))
  {
    return -65536.0;
  }
  v9 = objc_msgSend(objc_msgSend(+[PFSFontSizeNameMap fontSizeNameMap](PFSFontSizeNameMap, "fontSizeNameMap"), "allKeys"), "sortedArrayUsingSelector:", "compare:");
  v10 = (char *)(((unint64_t)objc_msgSend(v9, "count") + 1) >> 1);
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    v12 = 10000000.0;
    do
    {
      objc_msgSend(a1, "floatValueForKey:", objc_msgSend(v9, "objectAtIndex:", v11));
      v14 = vabdd_f64(v13, a4);
      if (v14 < v12)
      {
        v12 = v14;
        v10 = (char *)v11;
      }
      ++v11;
    }
    while (v11 < (unint64_t)objc_msgSend(v9, "count"));
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("larger")) & 1) != 0)
  {
    if (v10 < (char *)objc_msgSend(v9, "count") - 1)
    {
      v15 = v10 + 1;
LABEL_16:
      objc_msgSend(a1, "floatValueForKey:", objc_msgSend(v9, "objectAtIndex:", v15));
      return result;
    }
    return a4 * 1.2;
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("smaller")))
    return -65536.0;
  if (v10)
  {
    v15 = v10 - 1;
    goto LABEL_16;
  }
  return a4 / 1.2;
}

@end
