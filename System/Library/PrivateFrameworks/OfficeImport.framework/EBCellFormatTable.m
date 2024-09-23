@implementation EBCellFormatTable

+ (void)readWithState:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int isStyle;
  EDNamedStyle *v8;
  void *v9;
  EDStyle *v10;
  EDStyle *v11;
  int ParentCellFormat;
  int v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  id v26;
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[26];
  void *v35[64];
  void (**v36)(XlCellFormatTable *__hidden);
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;

  v26 = a3;
  objc_msgSend(v26, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styles");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = &off_24F3A7A80;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v4 = objc_msgSend(v26, "xlReader");
  (*(void (**)(uint64_t, void (***)(XlCellFormatTable *__hidden)))(*(_QWORD *)v4 + 184))(v4, &v36);
  XlStyleTable::XlStyleTable((XlStyleTable *)v35);
  v5 = objc_msgSend(v26, "xlReader");
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v5 + 240))(v5, v35);
  objc_msgSend(v29, "setDefaultWorkbookStyleIndex:", 0);
  if (((v38 - (_QWORD)v37) & 0x7FFFFFFF8) != 0)
  {
    v6 = 0;
    v28 = ((unint64_t)(v38 - (_QWORD)v37) >> 3);
    do
    {
      isStyle = XlCellFormatTable::isStyle((XlCellFormatTable *)&v36, v6);
      if (isStyle)
      {
        v8 = -[EDStyle initWithResources:]([EDNamedStyle alloc], "initWithResources:", v3);
        objc_msgSend(a1, "getStyleNameForCellFormatIndex:xlStyleTable:edResources:", v6, v35, v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDNamedStyle setName:](v8, "setName:", v9);

        v10 = v8;
        v11 = v10;
      }
      else
      {
        v11 = 0;
        v10 = -[EDStyle initWithResources:]([EDStyle alloc], "initWithResources:", v3);
      }
      ParentCellFormat = XlCellFormatTable::getParentCellFormat((XlCellFormatTable *)&v36, v6);
      if (ParentCellFormat == 4095)
        v13 = -1;
      else
        v13 = ParentCellFormat;
      if (v13)
        v14 = 0;
      else
        v14 = isStyle;
      if ((v14 & 1) == 0
        || (-[EDStyle name](v11, "name"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("Normal")),
            v15,
            v16))
      {
        -[EDStyle setParentIndex:](v10, "setParentIndex:", v13);
      }
      if (v6 >= ((unint64_t)(v38 - (_QWORD)v37) >> 3))
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v17 = v37[v6];
      XlRecord::XlRecord((uint64_t)v30, (const XlHeader *)v17);
      v30[0] = &off_24F3AEDF0;
      v31 = *(_OWORD *)(v17 + 16);
      v19 = *(_OWORD *)(v17 + 48);
      v18 = *(_OWORD *)(v17 + 64);
      v20 = *(_OWORD *)(v17 + 32);
      *(_OWORD *)&v34[10] = *(_OWORD *)(v17 + 74);
      v33 = v19;
      *(_OWORD *)v34 = v18;
      v32 = v20;
      -[EDStyle setFontIndex:](v10, "setFontIndex:", +[EBFontTable edFontIndexFromXlFontIndex:](EBFontTable, "edFontIndexFromXlFontIndex:", (__int16)v31));
      +[EBAlignmentInfo edAlignmentInfoFromXlXf:](EBAlignmentInfo, "edAlignmentInfoFromXlXf:", v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDStyle setAlignmentInfo:](v10, "setAlignmentInfo:", v21);

      +[EBBorders edBordersFromXlXf:edResources:](EBBorders, "edBordersFromXlXf:edResources:", v30, v3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDStyle setBorders:](v10, "setBorders:", v22);

      +[EBFill edFillFromXlXf:edResources:](EBFill, "edFillFromXlXf:edResources:", v30, v3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDStyle setFill:](v10, "setFill:", v23);

      +[EBProtection edProtectionFromXlXf:](EBProtection, "edProtectionFromXlXf:", v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDStyle setProtection:](v10, "setProtection:", v24);

      -[EDStyle setContentFormatId:](v10, "setContentFormatId:", SWORD1(v31));
      if (isStyle)
      {
        -[EDStyle setFontOverridden:](v10, "setFontOverridden:", v34[20] == 0);
        -[EDStyle setAlignmentInfoOverridden:](v10, "setAlignmentInfoOverridden:", v34[21] == 0);
        -[EDStyle setBordersOverridden:](v10, "setBordersOverridden:", v34[22] == 0);
        -[EDStyle setFillOverridden:](v10, "setFillOverridden:", v34[23] == 0);
        -[EDStyle setProtectionOverridden:](v10, "setProtectionOverridden:", v34[24] == 0);
        v25 = v34[19] == 0;
      }
      else
      {
        -[EDStyle setFontOverridden:](v10, "setFontOverridden:", v34[20] != 0);
        -[EDStyle setAlignmentInfoOverridden:](v10, "setAlignmentInfoOverridden:", v34[21]);
        -[EDStyle setBordersOverridden:](v10, "setBordersOverridden:", v34[22]);
        -[EDStyle setFillOverridden:](v10, "setFillOverridden:", v34[23]);
        -[EDStyle setProtectionOverridden:](v10, "setProtectionOverridden:", v34[24]);
        v25 = v34[19] != 0;
      }
      -[EDStyle setContentFormatOverridden:](v10, "setContentFormatOverridden:", v25);
      objc_msgSend(v29, "addObject:", v10);

      ++v6;
    }
    while (v28 != v6);
  }
  XlStyleTable::~XlStyleTable(v35);
  v36 = &off_24F3A7A80;
  CsSimpleHeapVector<XlXf>::~CsSimpleHeapVector((void **)&v37);

}

+ (id)getStyleNameForCellFormatIndex:(unsigned int)a3 xlStyleTable:(const void *)a4 edResources:(id)a5
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t Name;

  v7 = a5;
  v8 = *((_QWORD *)a4 + 1);
  v9 = *((_QWORD *)a4 + 2) - v8;
  if ((v9 & 0x7FFFFFFF8) != 0)
  {
    v10 = 0;
    v11 = (v9 >> 3);
    while (1)
    {
      if (v11 == v10)
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v12 = *(_QWORD *)(v8 + 8 * v10);
      if (*(__int16 *)(v12 + 24) == a3)
        break;
      if (v11 == ++v10)
        goto LABEL_6;
    }
    v14 = (void *)MEMORY[0x24BDD17C8];
    if (*(_BYTE *)(v12 + 33))
      Name = XlStyleTable::getName((XlStyleTable *)a4, v10);
    else
      Name = *(_QWORD *)(v12 + 16) + 8;
    objc_msgSend(v14, "stringWithOcText:", Name);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

@end
