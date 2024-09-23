@implementation WBCharacterRun

+ (void)readFrom:(id)a3 wrdTextRun:(WrdCharacterTextRun *)a4 run:(id)a5 paragraph:(id)a6
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
  objc_msgSend(v10, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v16, var4, var5, v13, v14);

  objc_msgSend(v16, "readCharactersForTextRun:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setString:", v15);

}

- (WrdCharacterProperties)wrdProperties
{
  WrdCharacterProperties *result;

  result = +[WBObjectFactory create:](WBObjectFactory, "create:", 10);
  if (result)
  return result;
}

@end
