@implementation CSVTop

+ (CGSize)_improveSize:(CGSize)result
{
  if (result.height / result.width <= 10.0)
  {
    if (result.height / result.width < 0.1)
      result.width = result.height * 10.0;
  }
  else
  {
    result.height = result.width * 10.0;
  }
  if (result.height > 2000.0)
    result.height = 2000.0;
  if (result.width > 2000.0)
    result.width = 2000.0;
  return result;
}

+ (void)fillHTMLArchiveForCSVString:(id)a3 fileName:(id)a4 archiver:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  CMState *v13;
  CSVMapper *v14;
  CSVMapper *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x22E2DDB58]();
  v22 = 0;
  v11 = (void *)objc_msgSend(a3, "copyCsvRows:", &v22);
  v12 = +[CMXmlUtils copyXhtmlDocument](CMXmlUtils, "copyXhtmlDocument");
  v13 = objc_alloc_init(CMState);
  -[CMState setSourceFormat:](v13, "setSourceFormat:", 7);
  -[CMState setIsThumbnail:](v13, "setIsThumbnail:", objc_msgSend(v9, "isThumbnail"));
  v14 = [CSVMapper alloc];
  v15 = -[CSVMapper initWithRows:fileName:columnCount:archiver:](v14, "initWithRows:fileName:columnCount:archiver:", v11, v8, v22, v9);
  objc_msgSend(v12, "rootElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVMapper mapAt:withState:](v15, "mapAt:withState:", v16, v13);

  -[CSVMapper pageSize](v15, "pageSize");
  objc_msgSend(a1, "_improveSize:");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v12, "XMLString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTMLWidth:", (int)v18);
  objc_msgSend(v9, "setHTMLHeight:", (int)v20);
  objc_msgSend(v9, "pushText:toPath:", v21, 0);
  objc_msgSend(v9, "commitDataAtPath:", 0);
  objc_msgSend(v9, "closeResourceAtPath:", 0);

  objc_autoreleasePoolPop(v10);
}

+ (void)fillHTMLArchiveForOfficeFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 dataFormat:(unint64_t)a6 archiver:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  if (v16 && !v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v16, 1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v11)
  {
    v14 = v16;
    if (!v16)
      v14 = v12;
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fillHTMLArchiveForCSVData:fileName:archiver:", v11, v15, v13);

  }
}

+ (void)fillHTMLArchiveForCSVData:(id)a3 fileName:(id)a4 archiver:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  CFStringEncoding v12;
  CFStringEncoding v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "isThumbnail") && (unint64_t)objc_msgSend(v16, "length") > 0x4000)
  {
    objc_msgSend(v16, "subdataWithRange:", 0, 0x4000);
    v10 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v10;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, 4);
  if (!v11)
  {
    v12 = QLGuessEncodingForTextFileFromData();
    if (v12 == -1)
      v13 = 513;
    else
      v13 = v12;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, CFStringConvertEncodingToNSStringEncoding(v13));
    v11 = (void *)v14;
    if (v13 != 513 && !v14)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v16, 5);
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDD0B70], 0, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v15);
    }
  }
  objc_msgSend(a1, "fillHTMLArchiveForCSVString:fileName:archiver:", v11, v8, v9);

}

@end
