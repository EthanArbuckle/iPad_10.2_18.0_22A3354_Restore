@implementation WBListTable

+ (void)readFrom:(id)a3 listTable:(id)a4
{
  id v5;
  WrdObject *v6;
  WrdEmbeddedTTFRecordTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t EmbeddedFontReference;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = +[WBObjectFactory create:](WBObjectFactory, "create:", 33);
  if (v6)
  else
    v7 = 0;
  v8 = objc_msgSend(v13, "wrdReader");
  (*(void (**)(uint64_t, WrdEmbeddedTTFRecordTable *))(*(_QWORD *)v8 + 288))(v8, v7);
  v9 = (*((_QWORD *)v7 + 2) - *((_QWORD *)v7 + 1)) >> 3;
  if ((int)v9 < 1)
    goto LABEL_8;
  LODWORD(v10) = 0;
  do
  {
    EmbeddedFontReference = WrdEmbeddedTTFRecordTable::getEmbeddedFontReference(v7, v10);
    v10 = (v10 + 1);
    objc_msgSend(v5, "addListWithListId:listDefinitionId:", v10, *(unsigned int *)(EmbeddedFontReference + 16));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBList readFrom:list:override:](WBList, "readFrom:list:override:", v13, v12, EmbeddedFontReference);

  }
  while ((_DWORD)v9 != (_DWORD)v10);
  if (v7)
LABEL_8:
    (*(void (**)(WrdEmbeddedTTFRecordTable *))(*(_QWORD *)v7 + 8))(v7);

}

@end
