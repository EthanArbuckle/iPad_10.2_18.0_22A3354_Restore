@implementation WBBookmark

+ (void)readFrom:(id)a3 index:(unsigned int)a4 type:(int)a5 paragraph:(id)a6
{
  uint64_t v7;
  id v9;
  WrdBookmarkTable *v10;
  void *v11;
  id v12;
  id v13;

  v7 = *(_QWORD *)&a5;
  v13 = a3;
  v9 = a6;
  v10 = (WrdBookmarkTable *)objc_msgSend(v13, "bookmarkTable");
  if (a4 < (unsigned __int16)((*((_DWORD *)v10 + 6) - *((_DWORD *)v10 + 4)) >> 3))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", WrdBookmarkTable::getBookmark(v10, a4) + 8);
    v12 = (id)objc_msgSend(v9, "addBookmark:type:", v11, v7);

  }
}

- (int)runType
{
  return 12;
}

@end
