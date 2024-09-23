@implementation WBSymbol

+ (void)readFrom:(id)a3 textRun:(WrdCharacterTextRun *)a4 paragraph:(id)a5 symbol:(id)a6
{
  id v9;
  id v10;
  WrdCharacterProperties *var4;
  WrdCharacterProperties *var5;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a5;
  v10 = a6;
  var4 = a4->var4;
  var5 = a4->var5;
  objc_msgSend(v9, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v16, var4, var5, v13, v14);

  objc_msgSend(v16, "fontAtIndex:", var4->var47);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v15);
  objc_msgSend(v10, "setCharacter:", var4->var50);

}

@end
