@implementation EBReference

+ (id)edReferenceFromXlRef:(const XlRef *)a3
{
  if (!a3)
    return 0;
  +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", a3->var0, a3->var1, a3->var2, a3->var3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (XlRef)xlRefFromEDReference:(id)a3
{
  id v3;
  XlRef *v4;

  v3 = a3;
  v4 = (XlRef *)operator new();
  XlRef::XlRef(v4);
  v4->var0 = objc_msgSend(v3, "firstRow");
  v4->var1 = objc_msgSend(v3, "lastRow");
  v4->var2 = objc_msgSend(v3, "firstColumn");
  v4->var3 = objc_msgSend(v3, "lastColumn");

  return v4;
}

@end
