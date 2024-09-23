@implementation EXTableFilter

+ (id)edTableFilterFromXmlTableFilterElement:(_xmlNode *)a3 state:(id)a4
{
  EDTableFilter *v6;
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  double v11;
  id v12;

  if (!a3)
    return 0;
  v6 = objc_alloc_init(EDTableFilter);
  v12 = 0;
  v7 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"operator", &v12);
  v8 = v12;
  if (v7)
    v9 = objc_msgSend(a1, "edFilterOperatorFromXmlOperatorString:", v8);
  else
    v9 = 1;
  -[EDTableFilter setOperatorType:](v6, "setOperatorType:", v9);
  v11 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v11))
    -[EDTableFilter setValue:](v6, "setValue:", v11);

  return v6;
}

+ (int)edFilterOperatorFromXmlOperatorString:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_12;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("notEqual")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("greaterThanOrEqual")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("greaterThan")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lessThan")) & 1) != 0)
    {
      v5 = 5;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("lessThanOrEqual")) & 1) != 0)
    {
      v5 = 6;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 1;
    goto LABEL_13;
  }
  v5 = 2;
LABEL_13:

  return v5;
}

@end
