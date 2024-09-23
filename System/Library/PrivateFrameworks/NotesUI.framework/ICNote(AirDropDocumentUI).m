@implementation ICNote(AirDropDocumentUI)

+ (void)createNoteForAirDropDocument:()AirDropDocumentUI legacyContext:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ICNote_AirDropDocumentUI__createNoteForAirDropDocument_legacyContext_completion___block_invoke;
  v12[3] = &unk_1E5C20AA8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "createNoteForAirDropDocument:legacyContext:processAttributedString:completion:", a3, v11, v12, v10);

}

@end
