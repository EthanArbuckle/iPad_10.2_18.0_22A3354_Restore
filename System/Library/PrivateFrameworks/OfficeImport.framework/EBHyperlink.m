@implementation EBHyperlink

+ (id)edHyperlinkFromXlHLink:(XlHLink *)a3 edResources:(id)a4
{
  id v6;
  EDHyperlink *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  if (a3)
  {
    v7 = objc_alloc_init(EDHyperlink);
    -[EDHyperlink setType:](v7, "setType:", objc_msgSend(a1, "edTypeFromXlHyperlinkType:", a3->var3));
    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHyperlink setDescriptionText:](v7, "setDescriptionText:", v8);

    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var9, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHyperlink setPath:](v7, "setPath:", v9);

    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var10, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHyperlink setDosPath:](v7, "setDosPath:", v10);

    +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var6, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHyperlink setTextMark:](v7, "setTextMark:", v11);

    +[EBReference edReferenceFromXlRef:](EBReference, "edReferenceFromXlRef:", a3->var2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDHyperlink setReference:](v7, "setReference:", v12);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)edTypeFromXlHyperlinkType:(int)a3
{
  if ((a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (void)addToolTip:(XlHLinkToolTip *)a3 toEdHyperLink:(id)a4 edResources:(id)a5
{
  void *v7;
  id v8;

  v8 = a4;
  +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", a3->var3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToolTip:", v7);

}

+ (int)xlTypeFromEDHyperlinkType:(int)a3
{
  if (a3 >= 3)
    return 3;
  else
    return a3;
}

@end
