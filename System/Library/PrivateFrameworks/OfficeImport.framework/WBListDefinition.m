@implementation WBListDefinition

+ (void)readFrom:(id)a3 listDefinition:(id)a4 listFormat:(void *)a5 document:(id)a6
{
  id v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a6;
  v11 = *((unsigned __int8 *)a5 + 52);
  if (*((_BYTE *)a5 + 52))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v9, "addLevel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBListLevel readFrom:listLevel:format:document:](WBListLevel, "readFrom:listLevel:format:document:", v17, v13, WrdEmbeddedTTFRecordTable::getEmbeddedFontReference((WrdEmbeddedTTFRecordTable *)a5, v12), v10);

      ++v12;
    }
    while (v11 != v12);
  }
  v14 = *((_WORD *)a5 + 25);
  if ((v14 & 0x10) != 0)
    v15 = 2;
  else
    v15 = 1;
  if ((v14 & 1) != 0)
    v16 = 0;
  else
    v16 = v15;
  objc_msgSend(v9, "setType:", v16);

}

@end
