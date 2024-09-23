@implementation WBListLevelOverride

+ (void)readFrom:(id)a3 listLevelOverride:(id)a4 formatOverride:(WrdListLevelFormatOverride *)a5 document:(id)a6
{
  id v9;
  id v10;
  __int16 v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a6;
  v11 = *(_WORD *)((char *)a5 + 21);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v9, "setStartNumber:", a5->var2);
    v11 = *(_WORD *)((char *)a5 + 21);
  }
  if ((v11 & 2) != 0)
  {
    objc_msgSend(v9, "mutableListLevel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBListLevel readFrom:listLevel:format:document:](WBListLevel, "readFrom:listLevel:format:document:", v13, v12, EshDataModelVisitor::getClientVisitor((EshDataModelVisitor *)a5), v10);

  }
}

+ (void)write:(id)a3 listLevelOverride:(id)a4 wrdFormatOverride:(WrdListLevelFormatOverride *)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isStartNumberOverridden"))
  {
    *(_WORD *)((char *)a5 + 21) |= 1u;
    a5->var2 = objc_msgSend(v7, "startNumber");
  }
  a5->var3 = objc_msgSend(v7, "level");
  if (objc_msgSend(v7, "isListLevelOverridden"))
  {
    WrdListLevelFormatOverride::setFormatting(a5, 1);
    objc_msgSend(v7, "listLevel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBListLevel write:listLevel:format:](WBListLevel, "write:listLevel:format:", v9, v8, EshDataModelVisitor::getClientVisitor((EshDataModelVisitor *)a5));

  }
}

@end
