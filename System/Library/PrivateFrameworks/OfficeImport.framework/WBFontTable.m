@implementation WBFontTable

+ (void)readFrom:(id)a3 fontTable:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _BYTE v9[32];

  v6 = a3;
  v7 = a4;
  WrdFontFamilyNameTable::WrdFontFamilyNameTable((WrdFontFamilyNameTable *)v9);
  v8 = objc_msgSend(v6, "wrdReader");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 232))(v8, v9);
  objc_msgSend(a1, "readFromFontTable:wrdFontTable:fontTable:", v6, v9, v7);
  WrdFontFamilyNameTable::~WrdFontFamilyNameTable((WrdFontFamilyNameTable *)v9);

}

+ (void)readFromFontTable:(id)a3 wrdFontTable:(void *)a4 fontTable:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  objc_msgSend(v7, "clear");
  v8 = (*((_QWORD *)a4 + 2) - *((_QWORD *)a4 + 1)) >> 3;
  if ((int)v8 >= 1)
  {
    v9 = 0;
    do
    {
      +[WBFont readFrom:withFontTable:](WBFont, "readFrom:withFontTable:", WrdEmbeddedTTFRecordTable::getEmbeddedFontReference((WrdEmbeddedTTFRecordTable *)a4, v9), v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v11, "addFont:index:", v10, v9);

      v9 = (v9 + 1);
    }
    while ((_DWORD)v8 != (_DWORD)v9);
  }

}

@end
