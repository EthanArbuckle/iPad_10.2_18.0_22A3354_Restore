@implementation PFXBorderStyle

+ (void)initialize
{
  const char *v2;

  if ((id)objc_opt_class(5402624) == a1)
  {
    objc_opt_class(PFXConstants);
    v2 = "border-left-width";
    sub_1D0314(qword_543450, &v2);
    v2 = "border-left";
    sub_1D0314(qword_543450, &v2);
    v2 = "border-width";
    sub_1D0314(qword_543450, &v2);
    v2 = "border";
    sub_1D0314(qword_543450, &v2);
    v2 = "border-right-width";
    sub_1D0314(qword_543480, &v2);
    v2 = "border-right";
    sub_1D0314(qword_543480, &v2);
    v2 = "border-width";
    sub_1D0314(qword_543480, &v2);
    v2 = "border";
    sub_1D0314(qword_543480, &v2);
    v2 = "border-top-width";
    sub_1D0314(qword_5434B0, &v2);
    v2 = "border-top";
    sub_1D0314(qword_5434B0, &v2);
    v2 = "border-width";
    sub_1D0314(qword_5434B0, &v2);
    v2 = "border";
    sub_1D0314(qword_5434B0, &v2);
    v2 = "border-bottom-width";
    sub_1D0314(qword_5434E0, &v2);
    v2 = "border-bottom";
    sub_1D0314(qword_5434E0, &v2);
    v2 = "border-width";
    sub_1D0314(qword_5434E0, &v2);
    v2 = "border";
    sub_1D0314(qword_5434E0, &v2);
    v2 = "border-left-style";
    sub_1D0314(qword_543510, &v2);
    v2 = "border-left";
    sub_1D0314(qword_543510, &v2);
    sub_1D0314(qword_543510, PFXPropNmBorderStyle);
    sub_1D0314(qword_543510, PFXPropNmBorder);
    v2 = "border-right-style";
    sub_1D0314(qword_543540, &v2);
    v2 = "border-right";
    sub_1D0314(qword_543540, &v2);
    sub_1D0314(qword_543540, PFXPropNmBorderStyle);
    sub_1D0314(qword_543540, PFXPropNmBorder);
    v2 = "border-top-style";
    sub_1D0314(qword_543570, &v2);
    v2 = "border-top";
    sub_1D0314(qword_543570, &v2);
    sub_1D0314(qword_543570, PFXPropNmBorderStyle);
    sub_1D0314(qword_543570, PFXPropNmBorder);
    v2 = "border-bottom-style";
    sub_1D0314(qword_5435A0, &v2);
    v2 = "border-bottom";
    sub_1D0314(qword_5435A0, &v2);
    sub_1D0314(qword_5435A0, PFXPropNmBorderStyle);
    sub_1D0314(qword_5435A0, PFXPropNmBorder);
    v2 = "border-left-color";
    sub_1D0314(qword_5435D0, &v2);
    v2 = "border-left";
    sub_1D0314(qword_5435D0, &v2);
    sub_1D0314(qword_5435D0, PFXPropNmBorderColor);
    sub_1D0314(qword_5435D0, PFXPropNmBorder);
    v2 = "border-right-color";
    sub_1D0314(qword_543600, &v2);
    v2 = "border-right";
    sub_1D0314(qword_543600, &v2);
    sub_1D0314(qword_543600, PFXPropNmBorderColor);
    sub_1D0314(qword_543600, PFXPropNmBorder);
    v2 = "border-top-color";
    sub_1D0314(qword_543630, &v2);
    v2 = "border-top";
    sub_1D0314(qword_543630, &v2);
    sub_1D0314(qword_543630, PFXPropNmBorderColor);
    sub_1D0314(qword_543630, PFXPropNmBorder);
    v2 = "border-bottom-color";
    sub_1D0314(qword_543660, &v2);
    v2 = "border-bottom";
    sub_1D0314(qword_543660, &v2);
    sub_1D0314(qword_543660, PFXPropNmBorderColor);
    sub_1D0314(qword_543660, PFXPropNmBorder);
  }
}

+ (double)mapStrokeWidth:(id)a3 withCandidatePropertiesName:(void *)a4 stackEntry:(id)a5
{
  id v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;

  v6 = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", a4, 0);
  v7 = 0.0;
  if (v6)
  {
    v8 = v6;
    objc_msgSend(objc_msgSend(a5, "currentEntryMediaState"), "parentFontSize");
    v10 = v9;
    if (objc_msgSend(v8, "count"))
    {
      v11 = 0;
      while (1)
      {
        +[PFSUtilities htmlValueToBorderWidth:parentFontSize:](PFSUtilities, "htmlValueToBorderWidth:parentFontSize:", objc_msgSend(v8, "objectAtIndex:", v11), v10);
        if (v12 != -65536.0)
          break;
        if (++v11 >= (unint64_t)objc_msgSend(v8, "count"))
          return v7;
      }
      return v12;
    }
  }
  return v7;
}

+ (id)mapStrokePattern:(id)a3 withCandidatePropertiesName:(void *)a4
{
  id result;
  id v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;

  result = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", a4, 0);
  if (result)
  {
    v5 = result;
    result = objc_msgSend(result, "count");
    if (result)
    {
      v6 = 0;
      v8 = CFSTR("none");
      while (1)
      {
        v7 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "objectAtIndex:", v6, v8), "value"), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("solid")) & 1) != 0
          || (objc_msgSend(v7, "isEqualToString:", CFSTR("double")) & 1) != 0
          || (objc_msgSend(v7, "isEqualToString:", CFSTR("groove")) & 1) != 0
          || (objc_msgSend(v7, "isEqualToString:", CFSTR("inset")) & 1) != 0
          || (objc_msgSend(v7, "isEqualToString:", CFSTR("outset")) & 1) != 0
          || objc_msgSend(v7, "isEqualToString:", CFSTR("ridge")))
        {
          result = +[TSDStrokePattern solidPattern](TSDStrokePattern, "solidPattern");
          goto LABEL_11;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("dotted")))
        {
          result = +[TSDStrokePattern roundDashPattern](TSDStrokePattern, "roundDashPattern");
          goto LABEL_11;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("dashed")))
          break;
        if (objc_msgSend(v7, "isEqualToString:", v8))
        {
          result = +[TSDStrokePattern emptyPattern](TSDStrokePattern, "emptyPattern");
LABEL_11:
          if (result)
            return result;
        }
        if (++v6 >= (unint64_t)objc_msgSend(v5, "count"))
          return 0;
      }
      result = +[TSDStrokePattern shortDashPattern](TSDStrokePattern, "shortDashPattern");
      goto LABEL_11;
    }
  }
  return result;
}

+ (id)mapStrokeColor:(id)a3 withCandidatePropertiesName:(void *)a4
{
  id result;

  result = objc_msgSend(a3, "firstValueFromCandidatePropertyNames:selectedIndex:", a4, 0);
  if (result)
    return +[PFXStyleUtilities colorInArray:](PFXStyleUtilities, "colorInArray:", result);
  return result;
}

+ (id)mapStroke:(id)a3 paragraphBorderType:(int64_t *)a4 stackEntry:(id)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  uint64_t v18;
  double v19;
  _QWORD *v20;
  int64_t v21;
  _QWORD *v22;
  double v23;
  id v24;
  _QWORD *v25;
  id v26;

  if (!a4)
    return 0;
  *a4 = 0;
  objc_msgSend(a1, "mapStrokeWidth:withCandidatePropertiesName:stackEntry:", a3, qword_5434B0);
  v10 = v9;
  objc_msgSend(a1, "mapStrokeWidth:withCandidatePropertiesName:stackEntry:", a3, qword_5434E0, a5);
  v12 = v11;
  if (v11 == 0.0 && v10 == 0.0)
    return 0;
  objc_msgSend(a1, "mapStrokeWidth:withCandidatePropertiesName:stackEntry:", a3, qword_543450, a5);
  v15 = v14;
  objc_msgSend(a1, "mapStrokeWidth:withCandidatePropertiesName:stackEntry:", a3, qword_543480, a5);
  v17 = v16 > 0.0;
  v18 = 3;
  if (v12 == 0.0)
  {
    v18 = 1;
    v19 = v10;
  }
  else
  {
    v19 = v12;
  }
  if (v10 == 0.0)
    v18 = 2;
  v20 = qword_543660;
  if (v10 == 0.0)
    v19 = v12;
  else
    v20 = qword_543630;
  v21 = 4;
  if (v15 > 0.0 && v17)
  {
    v22 = qword_543630;
  }
  else
  {
    v21 = v18;
    v22 = v20;
  }
  if (v15 > 0.0 && v17)
    v23 = v15;
  else
    v23 = v19;
  *a4 = v21;
  v24 = objc_msgSend(a1, "mapStrokeColor:withCandidatePropertiesName:", a3, v22, v19);
  if (!v24)
    v24 = +[TSUColor blackColor](TSUColor, "blackColor");
  if (*a4 == 2)
    v25 = qword_5435A0;
  else
    v25 = qword_543570;
  v26 = objc_msgSend(a1, "mapStrokePattern:withCandidatePropertiesName:", a3, v25);
  if (!v26)
    v26 = +[TSDStrokePattern emptyPattern](TSDStrokePattern, "emptyPattern");
  return +[TSDStroke strokeWithColor:width:cap:join:pattern:](TSDStroke, "strokeWithColor:width:cap:join:pattern:", v24, 0, 0, v26, v23);
}

@end
