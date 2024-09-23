@implementation EBFontTable

+ (void)readWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  void *v9;
  void (**v10)(XlFontTable *__hidden);
  OcText v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  XlFontTable::XlFontTable((XlFontTable *)&v10);
  v6 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, void (***)(XlFontTable *__hidden)))(*(_QWORD *)v6 + 168))(v6, &v10);
  v7 = XlFontTable::size((XlFontTable *)&v10);
  if (v7)
  {
    v8 = 0;
    do
    {
      if (v8 != 4)
      {
        +[EBFont edFontFromXlFont:edResources:](EBFont, "edFontFromXlFont:edResources:", XlFontTable::at((XlFontTable *)&v10, v8), v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

      }
      ++v8;
    }
    while (v7 != v8);
  }
  v10 = &off_24F3A7BC8;
  CsSimpleHeapVector<XlFont>::~CsSimpleHeapVector(&v12);
  OcText::~OcText(&v11);

}

+ (unint64_t)edFontIndexFromXlFontIndex:(unsigned int)a3
{
  return a3 - (a3 > 3);
}

+ (unsigned)xlFontIndexFromEDFontIndex:(unint64_t)a3
{
  if (a3 <= 3)
    return a3;
  else
    return a3 + 1;
}

@end
