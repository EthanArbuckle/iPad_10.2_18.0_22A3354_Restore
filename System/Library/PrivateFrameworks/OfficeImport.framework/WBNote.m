@implementation WBNote

+ (int)readFrom:(id)a3 at:(int)a4 paragraph:(id)a5 note:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  WrdNoteTable *v14;
  uint64_t NoteAtMainTextCP;
  int v16;
  void *v17;
  uint64_t v18;
  unsigned int var3;
  void *v20;
  WrdCharacterTextRun v22;
  _BYTE v23[16];
  int v24;
  unsigned int v25;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v25 = 0;
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "textType");

  if (v13 == 1)
    v14 = (WrdNoteTable *)objc_msgSend(v9, "footnoteTable");
  else
    v14 = (WrdNoteTable *)objc_msgSend(v9, "endnoteTable");
  NoteAtMainTextCP = WrdNoteTable::getNoteAtMainTextCP(v14, a4, &v25);
  objc_msgSend(v11, "setAutomaticNumbering:", *(_WORD *)(NoteAtMainTextCP + 20) != 0);
  if (v13 == 1)
    v16 = 1;
  else
    v16 = 5;
  WrdTextRun::WrdTextRun((uint64_t)v23, v16, *(_DWORD *)(NoteAtMainTextCP + 12));
  v24 = *(_DWORD *)(NoteAtMainTextCP + 16);
  objc_msgSend(v11, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v9, v17, v23);

  WrdCharacterTextRun::WrdCharacterTextRun(&v22);
  v22.var1 = 0;
  v22.var2 = *(_DWORD *)(NoteAtMainTextCP + 8);
  v18 = objc_msgSend(v9, "wrdReader");
  (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(_QWORD *)v18 + 192))(v18, &v22);
  var3 = v22.var3;
  objc_msgSend(v11, "reference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterRun readFrom:wrdTextRun:run:paragraph:](WBCharacterRun, "readFrom:wrdTextRun:run:paragraph:", v9, &v22, v20, v10);

  WrdCharacterTextRun::~WrdCharacterTextRun(&v22);
  return var3;
}

@end
