@implementation BKBookParser

+ (BOOL)canParse:(id)a3
{
  ITEpubFolder *v3;
  int v4;
  unint64_t v5;
  BOOL v6;

  v3 = (ITEpubFolder *)a3;
  v4 = BookFormatByFilePath();
  if (v4)
    v6 = (v4 & 0xFFFFFFFD) == 0;
  else
    v6 = ITEpubFolder::isMimeCorrect(v3, 0, 0, v5) != 0;

  return v6;
}

+ (id)parserForBook:(id)a3
{
  id v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  __objc2_class **v10;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "contentType") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "contentType");
    if (v4)
    {
      if (v4 != 2)
      {
        if (v4 != 3)
        {
          v5 = BCIMLog();
          v6 = objc_claimAutoreleasedReturnValue(v5);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            v12 = 136315650;
            v13 = "+[BKBookParser parserForBook:]";
            v14 = 2080;
            v15 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKBookParser.mm";
            v16 = 1024;
            v17 = 56;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v12, 0x1Cu);
          }

          v7 = BCIMLog();
          v8 = objc_claimAutoreleasedReturnValue(v7);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v12 = 138412290;
            v13 = (const char *)v3;
            _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "@\"Unrecognized book content type: %@\", (uint8_t *)&v12, 0xCu);
          }

        }
        goto LABEL_10;
      }
      v10 = off_1BD428;
    }
    else
    {
      v10 = off_1BD408;
    }
    v9 = objc_msgSend(objc_alloc(*v10), "initWithBook:", v3);
    goto LABEL_14;
  }
LABEL_10:
  v9 = 0;
LABEL_14:

  return v9;
}

- (BKBookParser)initWithBook:(id)a3
{
  id v5;
  BKBookParser *v6;
  BKBookParser *v7;

  v5 = a3;
  v6 = -[BKBookParser init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_book, a3);

  return v7;
}

- (int)parse:(BOOL)a3
{
  return -2;
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_book, 0);
}

@end
