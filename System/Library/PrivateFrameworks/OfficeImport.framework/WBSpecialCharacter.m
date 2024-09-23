@implementation WBSpecialCharacter

+ (void)readFrom:(id)a3 at:(int)a4 textRun:(WrdCharacterTextRun *)a5 paragraph:(id)a6 specialCharacter:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  WrdCharacterProperties *var4;
  WrdCharacterProperties *var5;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = *(_QWORD *)&a4;
  v18 = a3;
  v11 = a6;
  v12 = a7;
  var4 = a5->var4;
  var5 = a5->var5;
  objc_msgSend(v11, "document");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v18, var4, var5, v15, v16);

  objc_msgSend(v18, "readCharactersFrom:to:textType:", v10, (v10 + 1), objc_msgSend(v11, "textType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCharacterType:", objc_msgSend(v17, "characterAtIndex:", 0));

}

@end
