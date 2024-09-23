@implementation EBContentFormat

+ (id)edContentFormatFromXlFormat:(XlFormat *)a3 edResources:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  if (a3)
  {
    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var2, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("General"))
      && (objc_msgSend(v7, "isEqualToString:", CFSTR("General")) & 1) == 0)
    {
      objc_msgSend(v6, "setString:", CFSTR("General"));
    }
    +[EDContentFormat contentFormatWithFormatString:formatId:](EDContentFormat, "contentFormatWithFormatString:formatId:", v6, a3->var3);
    a3 = (XlFormat *)objc_claimAutoreleasedReturnValue();

  }
  return a3;
}

+ (id)edContentFormatFromXlDXfUserFmt:(XlDXfUserFmt *)a3 edResources:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if (a3)
  {
    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDContentFormat contentFormatWithFormatString:formatId:](EDContentFormat, "contentFormatWithFormatString:formatId:", v6, a3->var2);
    a3 = (XlDXfUserFmt *)objc_claimAutoreleasedReturnValue();

  }
  return a3;
}

@end
