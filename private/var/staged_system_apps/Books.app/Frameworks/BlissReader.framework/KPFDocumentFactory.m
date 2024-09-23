@implementation KPFDocumentFactory

+ (id)createDocumentWithKPFBundle:(id)a3 drmContext:(id)a4
{
  id v6;
  id v7;
  NSData *v8;
  id v9;
  KPFDocument *v10;
  KPFDocument *v11;
  uint64_t v12;

  v6 = objc_msgSend(a3, "pathForResource:ofType:", CFSTR("header"), CFSTR("json"));
  v7 = v6;
  if (v6 || (v7 = objc_msgSend(a3, "pathForResource:ofType:", CFSTR("kpf"), CFSTR("json"))) != 0)
  {
    if (a4)
    {
LABEL_4:
      v8 = (NSData *)objc_msgSend(a4, "dataWithContentsOfFile:error:", v7, 0);
      goto LABEL_7;
    }
  }
  else
  {
    v7 = objc_msgSend(a3, "pathForResource:ofType:", &stru_43D7D8, CFSTR("json"));
    if (a4)
      goto LABEL_4;
  }
  v8 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v7);
LABEL_7:
  if (!v8)
  {
    v9 = 0;
    if (v6)
      goto LABEL_9;
LABEL_11:
    v10 = -[KPFDocument initWithKPFBundle:kpfDictionary:drmContext:]([KPFDocument alloc], "initWithKPFBundle:kpfDictionary:drmContext:", a3, v9, a4);
    v11 = v10;
    v12 = 1;
    goto LABEL_12;
  }
  v9 = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 0, 0);
  if (!v6)
    goto LABEL_11;
LABEL_9:
  v10 = -[KPFGingerDocument initWithKPFBundle:kpfDictionary:drmContext:]([KPFGingerDocument alloc], "initWithKPFBundle:kpfDictionary:drmContext:", a3, v9, a4);
  v11 = v10;
  v12 = 0;
LABEL_12:
  -[KPFDocument setIsLegacy:](v10, "setIsLegacy:", v12);
  return v11;
}

@end
