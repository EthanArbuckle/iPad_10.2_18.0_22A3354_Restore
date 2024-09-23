@implementation EBStringTable

+ (void)readWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int DocumentStringCount;
  unsigned int v8;
  uint64_t ExternRef;
  void *v10;
  void *v11;
  _BYTE v12[48];

  v3 = a3;
  objc_msgSend(v3, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  XlStringTable::XlStringTable((XlStringTable *)v12);
  v6 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v6 + 248))(v6, v12);
  DocumentStringCount = XlStringTable::getDocumentStringCount((XlStringTable *)v12);
  if (DocumentStringCount)
  {
    v8 = 0;
    do
    {
      ExternRef = XlExternSheet::getExternRef((XlExternSheet *)v12, v8);
      objc_msgSend(v3, "resources");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[EBString edStringFromXlString:edResources:](EBString, "edStringFromXlString:edResources:", ExternRef, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v11);
      ++v8;
    }
    while (DocumentStringCount != v8);
  }
  XlStringTable::~XlStringTable((XlStringTable *)v12);

}

@end
