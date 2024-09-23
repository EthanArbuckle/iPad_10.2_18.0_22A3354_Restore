@implementation EBPageProperties

+ (void)readWithState:(id)a3
{
  id v4;
  uint64_t v5;
  EDHeaderFooter *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  unsigned __int8 v29;
  unsigned int v30;
  char v31;
  unsigned __int8 v32;
  double v33;
  double v34;

  v4 = a3;
  XlPageProperties::XlPageProperties((XlPageProperties *)&v20);
  v5 = objc_msgSend(v4, "xlReader");
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v5 + 512))(v5, &v20);
  v6 = objc_alloc_init(EDHeaderFooter);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", XlPageProperties::getHeaderString((XlPageProperties *)&v20));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
    -[EDHeaderFooter setHeaderString:](v6, "setHeaderString:", v8);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", XlPageProperties::getFooterString((XlPageProperties *)&v20));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
    -[EDHeaderFooter setFooterString:](v6, "setFooterString:", v10);
  objc_msgSend(v4, "edSheet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHeaderFooter:", v6);

  +[EDPageSetup pageSetup](EDPageSetup, "pageSetup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOrientation:", objc_msgSend(a1, "convertXlPageOrientationEnumToED:", v30));
  objc_msgSend(v12, "setOrder:", v29);
  objc_msgSend(v12, "setFirstPageNumber:", v26);
  objc_msgSend(v12, "setCustomFirstPageNumber:", v32);
  objc_msgSend(v12, "setFitToHeight:", v28);
  objc_msgSend(v12, "setFitToWidth:", v27);
  HIDWORD(v13) = HIDWORD(v23);
  *(float *)&v13 = v23;
  objc_msgSend(v12, "setLeftMargin:", v13);
  HIDWORD(v14) = HIDWORD(v24);
  *(float *)&v14 = v24;
  objc_msgSend(v12, "setRightMargin:", v14);
  HIDWORD(v15) = HIDWORD(v22);
  *(float *)&v15 = v22;
  objc_msgSend(v12, "setTopMargin:", v15);
  HIDWORD(v16) = HIDWORD(v21);
  *(float *)&v16 = v21;
  objc_msgSend(v12, "setBottomMargin:", v16);
  HIDWORD(v17) = HIDWORD(v33);
  *(float *)&v17 = v33;
  objc_msgSend(v12, "setHeaderMargin:", v17);
  HIDWORD(v18) = HIDWORD(v34);
  *(float *)&v18 = v34;
  objc_msgSend(v12, "setFooterMargin:", v18);
  if (!v31 && v25)
    objc_msgSend(v12, "setScale:");
  objc_msgSend(v4, "edSheet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPageSetup:", v12);

  XlPageProperties::~XlPageProperties((XlPageProperties *)&v20);
}

+ (int)convertXlPageOrientationEnumToED:(int)a3
{
  return a3 == 1;
}

+ (int)convertEDPageOrientationEnumToXl:(int)a3
{
  return a3 == 1;
}

@end
