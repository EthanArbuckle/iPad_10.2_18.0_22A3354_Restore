@implementation EBConditionalFormatTable

+ (void)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  EDConditionalFormatting *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v4 = objc_msgSend(v3, "xlReader", &off_24F3AF040);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 464))(v4, &v10);
  v5 = (unint64_t)(v12 - v11) >> 3;
  if ((_DWORD)v5)
  {
    objc_msgSend(v3, "edSheet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conditionalFormattings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    do
    {
      v9 = objc_alloc_init(EDConditionalFormatting);
      +[EBConditionalFormat readXlConditionalFormat:toEDConditionalFormatting:state:](EBConditionalFormat, "readXlConditionalFormat:toEDConditionalFormatting:state:", XlConditionalFormatTable::at((XlConditionalFormatTable *)&v10, v8), v9, v3);
      objc_msgSend(v7, "addObject:", v9);

      ++v8;
    }
    while ((_DWORD)v5 != v8);

  }
  XlConditionalFormatTable::~XlConditionalFormatTable((XlConditionalFormatTable *)&v10);

}

@end
