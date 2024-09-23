@implementation WBFieldMarker

+ (void)readFrom:(id)a3 position:(const WrdFieldPosition *)a4 paragraph:(id)a5 fieldMarker:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  unsigned int var1;
  uint64_t v14;
  WrdCharacterProperties *var4;
  WrdCharacterProperties *var5;
  void *v17;
  void *v18;
  WrdFieldDescriptor *var2;
  WrdCharacterTextRun v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  WrdCharacterTextRun::WrdCharacterTextRun(&v20);
  v12 = objc_msgSend(v10, "textType");
  var1 = a4->var1;
  v20.var1 = v12;
  v20.var2 = var1;
  v14 = objc_msgSend(v9, "wrdReader");
  (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(_QWORD *)v14 + 192))(v14, &v20);
  var4 = v20.var4;
  var5 = v20.var5;
  objc_msgSend(v10, "document");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v9, var4, var5, v17, v18);

  objc_msgSend(v11, "setFieldPosition:", a4->var1);
  var2 = a4->var2;
  LODWORD(v17) = *((_DWORD *)var2 + 2);
  objc_msgSend(v11, "setFieldMarkerType:", v17);
  if ((_DWORD)v17 != 21)
    objc_msgSend(v11, "setFieldType:", EshRecord::getDataLength((EshRecord *)var2));
  WrdCharacterTextRun::~WrdCharacterTextRun(&v20);

}

@end
