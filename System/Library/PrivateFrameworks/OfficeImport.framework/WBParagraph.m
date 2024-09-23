@implementation WBParagraph

+ (void)readFrom:(id)a3 textRun:(WrdParagraphTextRun *)a4 paragraph:(id)a5
{
  id v8;
  WrdParagraphProperties *var4;
  WrdParagraphProperties *var5;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  var4 = a4->var4;
  var5 = a4->var5;
  objc_msgSend(v8, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBParagraphProperties readFrom:wrdProperties:tracked:document:properties:](WBParagraphProperties, "readFrom:wrdProperties:tracked:document:properties:", v13, var4, var5, v11, v12);

  objc_msgSend(a1, "readRunsFor:from:textRun:", v8, v13, a4);
}

+ (void)readRunsFor:(id)a3 from:(id)a4 textRun:(WrdParagraphTextRun *)a5
{
  id v8;
  id v9;
  unsigned int var2;
  unsigned int var3;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  signed int v17;
  signed int v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *__p;
  void *v25;
  uint64_t v26;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v25 = 0;
  v26 = 0;
  __p = 0;
  var2 = a5->var2;
  var3 = a5->var3;
  v16 = 0;
  v17 = var2;
  v18 = var3 + var2;
  v19 = -1;
  v23 = -1;
  while (v17 < v18)
  {
    switch(v16)
    {
      case 0:
        objc_msgSend(a1, "readCharacterRunsFor:from:readState:", v8, v9, &v16);
        break;
      case 1:
      case 2:
        objc_msgSend(a1, "readNoteFor:from:readState:", v8, v9, &v16);
        break;
      case 3:
        objc_msgSend(a1, "readFieldMarkerFor:from:readState:", v8, v9, &v16);
        break;
      case 4:
        objc_msgSend(a1, "readBookmarkFor:from:readState:", v8, v9, &v16);
        break;
      case 5:
        objc_msgSend(a1, "readAnnotationFor:from:readState:", v8, v9, &v16);
        break;
      case 6:
        objc_msgSend(a1, "readAnnotationBookmarkFor:from:readState:", v8, v9, &v16);
        break;
      default:
        break;
    }
  }
  v12 = objc_msgSend(v8, "runCount");
  if (v12)
  {
    objc_msgSend(v8, "runAt:", v12 - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "runType"))
    {
      objc_msgSend(v8, "properties");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "properties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCharacterProperties:", v15);

    }
  }
  objc_msgSend(v8, "removeLastCharacter:", 13);
  if (__p)
  {
    v25 = __p;
    operator delete(__p);
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }

}

+ (void)readCharacterRunsFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v8;
  id v9;
  int v10;
  unsigned int v11;
  int i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WrdCharacterTextRun v18;
  int v19;

  v8 = a3;
  v9 = a4;
  v19 = *((_DWORD *)a5 + 2);
  if (!objc_msgSend(v8, "textType"))
  {
    objc_msgSend(a1, "checkForBookmarkFrom:runEnd:readState:", v9, &v19, a5);
    objc_msgSend(a1, "checkForAnnotationBookmarkFrom:runEnd:readState:", v9, &v19, a5);
    objc_msgSend(a1, "checkForAnnotationFrom:runEnd:readState:", v9, &v19, a5);
    objc_msgSend(a1, "checkForNoteFrom:footnote:runEnd:readState:", v9, 1, &v19, a5);
    objc_msgSend(a1, "checkForNoteFrom:footnote:runEnd:readState:", v9, 0, &v19, a5);
  }
  objc_msgSend(a1, "check:forFieldMarkerFrom:runEnd:readState:", v8, v9, &v19, a5);
  WrdCharacterTextRun::WrdCharacterTextRun(&v18);
  v10 = objc_msgSend(v8, "textType");
  v11 = *((_DWORD *)a5 + 1);
  v18.var1 = v10;
  v18.var2 = v11;
  for (i = v19; (int)v18.var2 < v19; i = v19)
  {
    v13 = objc_msgSend(v9, "wrdReader");
    (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(_QWORD *)v13 + 192))(v13, &v18);
    i = v19;
    if (!v18.var3)
      break;
    if ((signed int)(v18.var2 + v18.var3) > v19)
      v18.var3 = v19 - v18.var2;
    if (WrdCharacterTextRun::isSpecialCharacter(&v18))
    {
      objc_msgSend(a1, "readSpecialCharactersFor:from:textRun:", v8, v9, &v18);
    }
    else if ((*((_DWORD *)&v18.var4->var2 + 2) & 0x20) != 0)
    {
      objc_msgSend(a1, "readSymbolsFor:from:textRun:", v8, v9, &v18);
    }
    else
    {
      objc_msgSend(v8, "addCharacterRun");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBCharacterRun readFrom:wrdTextRun:run:paragraph:](WBCharacterRun, "readFrom:wrdTextRun:run:paragraph:", v9, &v18, v14, v8);
      objc_msgSend(v9, "annotationRangeStart");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "referencePropertiesFixed") & 1) == 0)
      {
        objc_msgSend(v16, "reference");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "copyPropertiesFrom:", v14);

        objc_msgSend(v16, "setReferencePropertiesFixed");
      }

    }
    v18.var2 += v18.var3;
  }
  *((_DWORD *)a5 + 1) = i;
  WrdCharacterTextRun::~WrdCharacterTextRun(&v18);

}

+ (void)checkForNoteFrom:(id)a3 footnote:(BOOL)a4 runEnd:(int *)a5 readState:(void *)a6
{
  _BOOL4 v8;
  id v9;
  WrdNoteTable *v10;
  int CPOfNextNote;
  int v12;
  id v13;

  v8 = a4;
  v9 = a3;
  v13 = v9;
  if (v8)
    v10 = (WrdNoteTable *)objc_msgSend(v9, "footnoteTable");
  else
    v10 = (WrdNoteTable *)objc_msgSend(v9, "endnoteTable");
  CPOfNextNote = WrdNoteTable::getCPOfNextNote(v10, *((_DWORD *)a6 + 1) - 1);
  if (CPOfNextNote >= *((_DWORD *)a6 + 1) && CPOfNextNote < *a5)
  {
    *a5 = CPOfNextNote;
    if (v8)
      v12 = 1;
    else
      v12 = 2;
    *(_DWORD *)a6 = v12;
  }

}

+ (void)checkForAnnotationFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5
{
  WrdAnnotationTable *v8;
  uint64_t CPOfNextAnnotation;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  id v14;

  v14 = a3;
  v8 = (WrdAnnotationTable *)objc_msgSend(v14, "annotationTable");
  CPOfNextAnnotation = WrdAnnotationTable::getCPOfNextAnnotation(v8, *((_DWORD *)a5 + 1) - 1);
  v10 = objc_msgSend(v14, "annotationBookmarkTable");
  if ((int)CPOfNextAnnotation >= *((_DWORD *)a5 + 1))
  {
    v11 = v10;
    v12 = 0;
    do
    {
      if ((int)CPOfNextAnnotation >= *a4 || (v12 & 1) != 0)
        break;
      v13 = objc_msgSend(a1, "isCPAnnotationRangeEnd:bookmarkTable:", CPOfNextAnnotation, v11);
      if (v13)
        CPOfNextAnnotation = WrdAnnotationTable::getCPOfNextAnnotation(v8, CPOfNextAnnotation);
      v12 = v13 ^ 1;
    }
    while ((int)CPOfNextAnnotation >= *((_DWORD *)a5 + 1));
    if ((v12 & 1) != 0)
    {
      *a4 = CPOfNextAnnotation;
      *(_DWORD *)a5 = 5;
    }
  }

}

+ (void)checkForAnnotationBookmarkFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5
{
  uint64_t v7;
  WrdBookmarkTable *v8;
  void **v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  _QWORD *v16;
  uint64_t Bookmark;
  int v18;
  int v19;
  BOOL v20;
  unsigned int *v21;
  unsigned int *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  _DWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int v35;
  id v36;

  v36 = a3;
  v7 = objc_msgSend(v36, "annotationBookmarkTable");
  v8 = (WrdBookmarkTable *)v7;
  v9 = (void **)((char *)a5 + 64);
  *((_QWORD *)a5 + 9) = *((_QWORD *)a5 + 8);
  v10 = *((_DWORD *)a5 + 14);
  if (*((_DWORD *)a5 + 1) <= v10 + 1)
    v11 = v10 + 1;
  else
    v11 = *((_DWORD *)a5 + 1);
  v12 = *(_DWORD *)(v7 + 24) - *(_DWORD *)(v7 + 16);
  v13 = (unsigned __int16)(v12 >> 3);
  if (!(unsigned __int16)(v12 >> 3))
    goto LABEL_56;
  v14 = 0;
  v15 = *a4;
  v16 = (char *)a5 + 80;
  do
  {
    Bookmark = WrdBookmarkTable::getBookmark(v8, v14);
    v19 = *(_DWORD *)(Bookmark + 44);
    v18 = *(_DWORD *)(Bookmark + 48);
    v20 = v19 >= v11 && v19 <= v15;
    if (v20 && v19 < *a4)
    {
      if (v19 >= v15)
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 9);
      }
      else
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 8);
        *((_QWORD *)a5 + 9) = v21;
        v15 = v19;
      }
      if ((unint64_t)v21 >= *v16)
      {
        v23 = (unsigned int *)*v9;
        v30 = ((char *)v21 - (_BYTE *)*v9) >> 2;
        v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62)
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        v32 = *v16 - (_QWORD)v23;
        if (v32 >> 1 > v31)
          v31 = v32 >> 1;
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
          v27 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v27 = v31;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 80, v27);
          v23 = (unsigned int *)*((_QWORD *)a5 + 8);
          v21 = (unsigned int *)*((_QWORD *)a5 + 9);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v30];
        *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          v35 = *--v21;
          *--v33 = v35;
        }
        goto LABEL_50;
      }
      goto LABEL_33;
    }
    if (v18 >= v11 && v18 <= v15)
    {
      if (v18 >= v15)
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 9);
      }
      else
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 8);
        *((_QWORD *)a5 + 9) = v21;
        v15 = v18;
      }
      if ((unint64_t)v21 >= *v16)
      {
        v23 = (unsigned int *)*v9;
        v24 = ((char *)v21 - (_BYTE *)*v9) >> 2;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62)
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        v26 = *v16 - (_QWORD)v23;
        if (v26 >> 1 > v25)
          v25 = v26 >> 1;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
          v27 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 80, v27);
          v23 = (unsigned int *)*((_QWORD *)a5 + 8);
          v21 = (unsigned int *)*((_QWORD *)a5 + 9);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v24];
        *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          v34 = *--v21;
          *--v33 = v34;
        }
LABEL_50:
        *((_QWORD *)a5 + 8) = v33;
        *((_QWORD *)a5 + 9) = v29;
        *((_QWORD *)a5 + 10) = &v28[4 * v27];
        if (v23)
          operator delete(v23);
LABEL_52:
        *((_QWORD *)a5 + 9) = v29;
        goto LABEL_53;
      }
LABEL_33:
      *v21 = v14;
      v29 = v21 + 1;
      goto LABEL_52;
    }
LABEL_53:
    ++v14;
  }
  while (v14 != v13);
  if (*((_QWORD *)a5 + 8) != *((_QWORD *)a5 + 9))
  {
    *a4 = v15;
    *((_DWORD *)a5 + 15) = v15;
    *(_DWORD *)a5 = 6;
  }
LABEL_56:

}

+ (void)check:(id)a3 forFieldMarkerFrom:(id)a4 runEnd:(int *)a5 readState:(void *)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  signed int v13;
  uint64_t Bookmark;
  int v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "fieldPositionTableForTextType:", objc_msgSend(v16, "textType"));
  v12 = *(_QWORD *)(v10 + 16);
  v11 = *(_QWORD *)(v10 + 24);
  v13 = WrdFieldPositionTable::lowerBoundOfCP((WrdFieldPositionTable *)v10, *((_DWORD *)a6 + 1));
  if (v13 < (unsigned __int16)((v11 - v12) >> 3))
  {
    Bookmark = WrdBookmarkTable::getBookmark((WrdBookmarkTable *)v10, v13);
    v15 = *(_DWORD *)(Bookmark + 8);
    if (v15 < *a5)
    {
      *a5 = v15;
      *(_DWORD *)a6 = 3;
      *((_QWORD *)a6 + 2) = Bookmark;
    }
  }

}

+ (void)checkForBookmarkFrom:(id)a3 runEnd:(int *)a4 readState:(void *)a5
{
  uint64_t v7;
  WrdBookmarkTable *v8;
  void **v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  _QWORD *v16;
  _DWORD *Bookmark;
  int v18;
  int v19;
  BOOL v20;
  unsigned int *v21;
  unsigned int *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  _DWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int v35;
  id v36;

  v36 = a3;
  v7 = objc_msgSend(v36, "bookmarkTable");
  v8 = (WrdBookmarkTable *)v7;
  v9 = (void **)((char *)a5 + 32);
  *((_QWORD *)a5 + 5) = *((_QWORD *)a5 + 4);
  v10 = *((_DWORD *)a5 + 6);
  if (*((_DWORD *)a5 + 1) <= v10 + 1)
    v11 = v10 + 1;
  else
    v11 = *((_DWORD *)a5 + 1);
  v12 = *(_DWORD *)(v7 + 24) - *(_DWORD *)(v7 + 16);
  v13 = (unsigned __int16)(v12 >> 3);
  if (!(unsigned __int16)(v12 >> 3))
    goto LABEL_57;
  v14 = 0;
  v15 = *a4;
  v16 = (char *)a5 + 48;
  do
  {
    Bookmark = (_DWORD *)WrdBookmarkTable::getBookmark(v8, v14);
    if (Bookmark[13])
      goto LABEL_54;
    v19 = Bookmark[11];
    v18 = Bookmark[12];
    v20 = v19 >= v11 && v19 <= v15;
    if (v20 && v19 < *a4)
    {
      if (v19 >= v15)
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 5);
      }
      else
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 4);
        *((_QWORD *)a5 + 5) = v21;
        v15 = v19;
      }
      if ((unint64_t)v21 >= *v16)
      {
        v23 = (unsigned int *)*v9;
        v30 = ((char *)v21 - (_BYTE *)*v9) >> 2;
        v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62)
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        v32 = *v16 - (_QWORD)v23;
        if (v32 >> 1 > v31)
          v31 = v32 >> 1;
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
          v27 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v27 = v31;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 48, v27);
          v23 = (unsigned int *)*((_QWORD *)a5 + 4);
          v21 = (unsigned int *)*((_QWORD *)a5 + 5);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v30];
        *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          v35 = *--v21;
          *--v33 = v35;
        }
        goto LABEL_51;
      }
      goto LABEL_34;
    }
    if (v18 >= v11 && v18 <= v15)
    {
      if (v18 >= v15)
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 5);
      }
      else
      {
        v21 = (unsigned int *)*((_QWORD *)a5 + 4);
        *((_QWORD *)a5 + 5) = v21;
        v15 = v18;
      }
      if ((unint64_t)v21 >= *v16)
      {
        v23 = (unsigned int *)*v9;
        v24 = ((char *)v21 - (_BYTE *)*v9) >> 2;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62)
          std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
        v26 = *v16 - (_QWORD)v23;
        if (v26 >> 1 > v25)
          v25 = v26 >> 1;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
          v27 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<float>>((uint64_t)a5 + 48, v27);
          v23 = (unsigned int *)*((_QWORD *)a5 + 4);
          v21 = (unsigned int *)*((_QWORD *)a5 + 5);
        }
        else
        {
          v28 = 0;
        }
        v33 = (unsigned int *)&v28[4 * v24];
        *v33 = v14;
        v29 = v33 + 1;
        while (v21 != v23)
        {
          v34 = *--v21;
          *--v33 = v34;
        }
LABEL_51:
        *((_QWORD *)a5 + 4) = v33;
        *((_QWORD *)a5 + 5) = v29;
        *((_QWORD *)a5 + 6) = &v28[4 * v27];
        if (v23)
          operator delete(v23);
LABEL_53:
        *((_QWORD *)a5 + 5) = v29;
        goto LABEL_54;
      }
LABEL_34:
      *v21 = v14;
      v29 = v21 + 1;
      goto LABEL_53;
    }
LABEL_54:
    ++v14;
  }
  while (v14 != v13);
  if (*((_QWORD *)a5 + 4) != *((_QWORD *)a5 + 5))
  {
    *a4 = v15;
    *((_DWORD *)a5 + 7) = v15;
    *(_DWORD *)a5 = 4;
  }
LABEL_57:

}

+ (void)readSpecialCharactersFor:(id)a3 from:(id)a4 textRun:(WrdCharacterTextRun *)a5
{
  id v8;
  void *v9;
  uint64_t var2;
  uint64_t v11;
  uint64_t i;
  int v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v8 = a4;
  objc_msgSend(v8, "readCharactersForTextRun:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  var2 = a5->var2;
  v11 = objc_msgSend(v9, "length");
  if (v11)
  {
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend(v9, "characterAtIndex:", i);
      v14 = var2 + i;
      if (v13 == 1)
      {
        objc_msgSend(a1, "readPictureFor:from:at:textRun:", v15, v8, v14, a5);
      }
      else if (v13 == 8)
      {
        objc_msgSend(a1, "readOfficeArtFor:from:at:textRun:", v15, v8, v14, a5);
      }
      else
      {
        objc_msgSend(a1, "readSpecialCharacterFor:from:at:textRun:", v15, v8, v14, a5);
      }
    }
  }

}

+ (void)readPictureFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  WrdCharacterProperties *var4;
  uint64_t v12;
  WDOleObject *v13;
  WrdCharacterTextRun v14;
  WrdCharacterProperties v15;
  uint64_t v16;

  v7 = *(_QWORD *)&a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  var4 = a6->var4;
  if (WrdCharacterProperties::isPicture(var4) || WrdCharacterProperties::isOle1Object(var4))
  {
    WrdCharacterTextRun::WrdCharacterTextRun(&v14);
    v14.var1 = a6->var1;
    v14.var2 = v7 - 1;
    v12 = objc_msgSend(v10, "wrdReader");
    (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(_QWORD *)v12 + 192))(v12, &v14);
    WrdCharacterProperties::WrdCharacterProperties(&v15, v14.var4);
    if (WrdCharacterProperties::isOle2Object(&v15))
    {
      v13 = -[WDOfficeArt initWithParagraph:]([WDOleObject alloc], "initWithParagraph:", v9);
      +[WBOleObject readFrom:at:oleId:textRun:paragraph:to:](WBOleObject, "readFrom:at:oleId:textRun:paragraph:to:", v10, v7, v15.var59, a6, v9, v13);
      objc_msgSend(v9, "addRun:", v13);
    }
    else
    {
      v13 = -[WDOfficeArt initWithParagraph:]([WDPicture alloc], "initWithParagraph:", v9);
      +[WBPicture readFrom:at:textRun:paragraph:to:](WBPicture, "readFrom:at:textRun:paragraph:to:", v10, v7, a6, v9, v13);
      if (v13 && -[WDPicture hasContent](v13, "hasContent"))
        objc_msgSend(v9, "addRun:", v13);
    }

    WrdCharacterProperties::~WrdCharacterProperties(&v15);
    WrdCharacterTextRun::~WrdCharacterTextRun(&v14);
  }
  else if (!WrdCharacterProperties::isFormFieldData(var4))
  {
    +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", WBMissingImage);
  }

}

+ (void)readFieldMarkerFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(v10, "addFieldMarker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBFieldMarker readFrom:position:paragraph:fieldMarker:](WBFieldMarker, "readFrom:position:paragraph:fieldMarker:", v7, *((_QWORD *)a5 + 2), v10, v8);
  v9 = *(_DWORD *)(*((_QWORD *)a5 + 2) + 8) + 1;
  *(_DWORD *)a5 = 0;
  *((_DWORD *)a5 + 1) = v9;

}

+ (void)readBookmarkFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v7;
  uint64_t v8;
  unsigned int *v9;
  WrdBookmarkTable *v10;
  unsigned int v11;
  uint64_t Bookmark;
  int v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "bookmarkTable");
  v9 = (unsigned int *)*((_QWORD *)a5 + 4);
  if (v9 != *((unsigned int **)a5 + 5))
  {
    v10 = (WrdBookmarkTable *)v8;
    v11 = (unsigned __int16)((*(_DWORD *)(v8 + 24) - *(_DWORD *)(v8 + 16)) >> 3);
    do
    {
      if (*v9 < v11)
      {
        Bookmark = WrdBookmarkTable::getBookmark(v10, *v9);
        v13 = *((_DWORD *)a5 + 7);
        if (*(_DWORD *)(Bookmark + 44) == v13)
        {
          +[WBBookmark readFrom:index:type:paragraph:](WBBookmark, "readFrom:index:type:paragraph:", v7, *v9, 0, v14);
          v13 = *((_DWORD *)a5 + 7);
        }
        if (*(_DWORD *)(Bookmark + 48) == v13)
          +[WBBookmark readFrom:index:type:paragraph:](WBBookmark, "readFrom:index:type:paragraph:", v7, *v9, 1, v14);
      }
      ++v9;
    }
    while (v9 != *((unsigned int **)a5 + 5));
  }
  *((_DWORD *)a5 + 6) = *((_DWORD *)a5 + 7);
  *(_DWORD *)a5 = 0;

}

+ (void)readOfficeArtFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6
{
  uint64_t v7;
  id v9;
  WDOfficeArt *v10;
  id v11;

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v9 = a4;
  v10 = -[WDOfficeArt initWithParagraph:]([WDOfficeArt alloc], "initWithParagraph:", v11);
  +[WBOfficeArt readFrom:at:textRun:paragraph:to:](WBOfficeArt, "readFrom:at:textRun:paragraph:to:", v9, v7, a6, v11, v10);
  if (-[WDOfficeArt isDrawableOverridden](v10, "isDrawableOverridden"))
    objc_msgSend(v11, "addRun:", v10);

}

+ (void)readSpecialCharacterFor:(id)a3 from:(id)a4 at:(int)a5 textRun:(WrdCharacterTextRun *)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  id v11;

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v9 = a4;
  objc_msgSend(v11, "addSpecialCharacter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSpecialCharacter readFrom:at:textRun:paragraph:specialCharacter:](WBSpecialCharacter, "readFrom:at:textRun:paragraph:specialCharacter:", v9, v7, a6, v11, v10);

}

+ (void)readNoteFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v7;
  void *v8;
  int v9;
  int v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (*(_DWORD *)a5 == 1)
    objc_msgSend(v11, "addFootnote");
  else
    objc_msgSend(v11, "addEndnote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[WBNote readFrom:at:paragraph:note:](WBNote, "readFrom:at:paragraph:note:", v7, *((unsigned int *)a5 + 1), v11, v8);
  if (v9 <= 0)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v10 = *((_DWORD *)a5 + 1) + v9;
  *(_DWORD *)a5 = 0;
  *((_DWORD *)a5 + 1) = v10;

}

+ (void)readSymbolsFor:(id)a3 from:(id)a4 textRun:(WrdCharacterTextRun *)a5
{
  id v7;
  unsigned int var2;
  unsigned int var3;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  var2 = a5->var2;
  var3 = a5->var3;
  a5->var3 = 1;
  if (var2 < var3 + var2)
  {
    v10 = var3;
    v11 = var2;
    do
    {
      a5->var2 = v11;
      objc_msgSend(v13, "addSymbol");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBSymbol readFrom:textRun:paragraph:symbol:](WBSymbol, "readFrom:textRun:paragraph:symbol:", v7, a5, v13, v12);

      ++v11;
      --v10;
    }
    while (v10);
  }
  a5->var2 = var2;
  a5->var3 = var3;

}

+ (BOOL)isCPAnnotationRangeEnd:(int)a3 bookmarkTable:(void *)a4
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v9;
  unsigned int v10;
  uint64_t Bookmark;

  v4 = *((_DWORD *)a4 + 6) - *((_DWORD *)a4 + 4);
  v5 = (unsigned __int16)(v4 >> 3);
  if (!(unsigned __int16)(v4 >> 3))
    return 0;
  if (*(_DWORD *)(WrdBookmarkTable::getBookmark((WrdBookmarkTable *)a4, 0) + 48) == a3)
    return 1;
  v9 = 1;
  do
  {
    v10 = v9;
    if (v5 == v9)
      break;
    Bookmark = WrdBookmarkTable::getBookmark((WrdBookmarkTable *)a4, v9);
    v9 = v10 + 1;
  }
  while (*(_DWORD *)(Bookmark + 48) != a3);
  return v10 < v5;
}

+ (void)readAnnotationFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  int v6;

  +[WBAnnotation readFrom:at:paragraph:](WBAnnotation, "readFrom:at:paragraph:", a4, *((unsigned int *)a5 + 1), a3);
  v6 = *((_DWORD *)a5 + 1) + 1;
  *(_DWORD *)a5 = 0;
  *((_DWORD *)a5 + 1) = v6;
}

+ (void)readAnnotationBookmarkFor:(id)a3 from:(id)a4 readState:(void *)a5
{
  id v7;
  uint64_t v8;
  unsigned int *v9;
  WrdBookmarkTable *v10;
  unsigned int v11;
  uint64_t Bookmark;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "annotationBookmarkTable");
  v9 = (unsigned int *)*((_QWORD *)a5 + 8);
  if (v9 != *((unsigned int **)a5 + 9))
  {
    v10 = (WrdBookmarkTable *)v8;
    v11 = (unsigned __int16)((*(_DWORD *)(v8 + 24) - *(_DWORD *)(v8 + 16)) >> 3);
    do
    {
      if (*v9 < v11)
      {
        Bookmark = WrdBookmarkTable::getBookmark(v10, *v9);
        v13 = *((_DWORD *)a5 + 15);
        if (*(_DWORD *)(Bookmark + 44) == v13)
        {
          +[WBAnnotation readRangedFrom:index:type:paragraph:](WBAnnotation, "readRangedFrom:index:type:paragraph:", v7, *v9, 0, v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setAnnotationRangeStart:forBookmarkIndex:", v14, *v9);

          v13 = *((_DWORD *)a5 + 15);
        }
        if (*(_DWORD *)(Bookmark + 48) == v13)
        {
          +[WBAnnotation readRangedFrom:index:type:paragraph:](WBAnnotation, "readRangedFrom:index:type:paragraph:", v7, *v9, 1, v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "annotationRangeStartForBookmarkIndex:", *v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setOtherEndOfRangedAnnotation:", v15);
          objc_msgSend(v15, "setOtherEndOfRangedAnnotation:", v16);
          objc_msgSend(v15, "useDataFromOtherEnd");

        }
      }
      ++v9;
    }
    while (v9 != *((unsigned int **)a5 + 9));
  }
  *((_DWORD *)a5 + 14) = *((_DWORD *)a5 + 15);
  *(_DWORD *)a5 = 0;

}

+ (int)blockType
{
  return 0;
}

@end
