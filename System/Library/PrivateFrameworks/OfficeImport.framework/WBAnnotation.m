@implementation WBAnnotation

+ (void)readFrom:(id)a3 at:(int)a4 paragraph:(id)a5
{
  id v8;
  id v9;
  uint64_t AnnotationAtMainTextCP;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  WrdCharacterTextRun v19;
  _BYTE v20[16];
  int v21;
  unsigned int v22;

  v8 = a3;
  v9 = a5;
  v22 = 0;
  AnnotationAtMainTextCP = WrdAnnotationTable::getAnnotationAtMainTextCP((WrdAnnotationTable *)objc_msgSend(v8, "annotationTable"), a4, &v22);
  v11 = *(_QWORD *)(AnnotationAtMainTextCP + 24);
  if (*(_DWORD *)(v11 + 32) == -1)
  {
    objc_msgSend(v9, "addAnnotation:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "findStartFrom:annotation:", v8, AnnotationAtMainTextCP);
    WrdTextRun::WrdTextRun((uint64_t)v20, 4, *(_DWORD *)(AnnotationAtMainTextCP + 12) + v13);
    v21 = *(_DWORD *)(AnnotationAtMainTextCP + 16) - v13;
    objc_msgSend(v12, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v8, v14, v20);

    WrdCharacterTextRun::WrdCharacterTextRun(&v19);
    v19.var1 = 0;
    v19.var2 = *(_DWORD *)(AnnotationAtMainTextCP + 8);
    v15 = objc_msgSend(v8, "wrdReader");
    (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(_QWORD *)v15 + 192))(v15, &v19);
    v19.var3 = 1;
    objc_msgSend(v12, "reference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBCharacterRun readFrom:wrdTextRun:run:paragraph:](WBCharacterRun, "readFrom:wrdTextRun:run:paragraph:", v8, &v19, v16, v9);

    objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", *(_QWORD *)(AnnotationAtMainTextCP + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDate:", v17);

    objc_msgSend(v8, "annotationOwner:", *(unsigned __int16 *)(v11 + 36));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOwner:", v18);

    WrdCharacterTextRun::~WrdCharacterTextRun(&v19);
  }

}

+ (unint64_t)findStartFrom:(id)a3 annotation:(const WrdAnnotation *)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(a3, "readCharactersFrom:to:textType:", a4->var2, (a4->var3 + a4->var2), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("\x05"));
  if (v6 == 1)
    v7 = v5 + 1;
  else
    v7 = 0;

  return v7;
}

+ (id)readRangedFrom:(id)a3 index:(unsigned int)a4 type:(int)a5 paragraph:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  WrdBookmarkTable *v12;
  uint64_t Bookmark;
  WrdAnnotationTable *v14;
  int SInt32;
  uint64_t AnnotationForBookmark;
  uint64_t v17;
  int v18;
  void *v19;
  WrdDateTime *v20;
  void *v21;
  void *v22;
  id v23;
  _DWORD v25[7];
  unsigned int v26;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  objc_msgSend(a6, "addAnnotation:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v7 == 1)
  {
    objc_msgSend(v10, "setAnnotationRangeStart:", 0);
  }
  else if (!(_DWORD)v7)
  {
    v12 = (WrdBookmarkTable *)objc_msgSend(v10, "annotationBookmarkTable");
    if (a4 < (unsigned __int16)((*((_DWORD *)v12 + 6) - *((_DWORD *)v12 + 4)) >> 3))
    {
      Bookmark = WrdBookmarkTable::getBookmark(v12, a4);
      if (*(unsigned __int16 *)(Bookmark + 40) < 6u
        || (v14 = (WrdAnnotationTable *)objc_msgSend(v10, "annotationTable"),
            v26 = 0,
            SInt32 = CsLeReadSInt32((unsigned int *)(*(_QWORD *)(Bookmark + 32) + 2)),
            AnnotationForBookmark = WrdAnnotationTable::getAnnotationForBookmark(v14, SInt32, &v26),
            (v17 = AnnotationForBookmark) == 0)
        || (*(_DWORD *)(AnnotationForBookmark + 16) & 0x80000000) != 0)
      {
        v23 = 0;
        goto LABEL_12;
      }
      v18 = objc_msgSend(a1, "findStartFrom:annotation:", v10, AnnotationForBookmark);
      WrdTextRun::WrdTextRun((uint64_t)v25, 4, *(_DWORD *)(v17 + 12) + v18);
      v25[4] = *(_DWORD *)(v17 + 16) - v18;
      objc_msgSend(v11, "text");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v10, v19, v25);

      v20 = *(WrdDateTime **)(v17 + 32);
      if (!WrdDateTime::isDefault(v20))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "tc_dateWithWordDate:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDate:", v21);

      }
      objc_msgSend(v10, "annotationOwner:", *(unsigned __int16 *)(*(_QWORD *)(v17 + 24) + 36));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setOwner:", v22);

      objc_msgSend(v10, "setAnnotationRangeStart:", v11);
    }
  }
  v23 = v11;
LABEL_12:

  return v23;
}

@end
