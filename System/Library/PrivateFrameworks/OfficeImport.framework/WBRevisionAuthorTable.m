@implementation WBRevisionAuthorTable

+ (void)readFrom:(id)a3 revisionAuthorTable:(id)a4
{
  id v5;
  WrdObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  v6 = +[WBObjectFactory create:](WBObjectFactory, "create:", 55);
  if (v6)
  else
    v7 = 0;
  *((_DWORD *)v7 + 2) = 51;
  v8 = objc_msgSend(v14, "wrdReader");
  (*(void (**)(uint64_t, void *))(*(_QWORD *)v8 + 312))(v8, v7);
  objc_msgSend(v5, "authors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *((_QWORD *)v7 + 2);
  v11 = *(unsigned __int16 *)(v10 + 8);
  if (*(_WORD *)(v10 + 8))
  {
    v12 = 0;
    do
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", WrdStringWithDataTable::getStringDataReference(*((WrdStringWithDataTable **)v7 + 2), (unsigned __int16)v12)+ 8);
      objc_msgSend(v9, "addObject:", v13);

      ++v12;
    }
    while (v11 != v12);
  }
  (*(void (**)(void *))(*(_QWORD *)v7 + 8))(v7);

}

@end
