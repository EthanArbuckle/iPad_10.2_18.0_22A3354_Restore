@implementation SiriUICardLogger

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_1);
  return (id)_sharedInstance_sCardLogger;
}

void __35__SiriUICardLogger__sharedInstance__block_invoke()
{
  SiriUICardLogger *v0;
  void *v1;

  v0 = objc_alloc_init(SiriUICardLogger);
  v1 = (void *)_sharedInstance_sCardLogger;
  _sharedInstance_sCardLogger = (uint64_t)v0;

}

+ (id)logCardData:(id)a3
{
  return (id)objc_msgSend(a1, "logCardData:format:", a3, 0);
}

+ (id)logCardData:(id)a3 format:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (objc_class *)MEMORY[0x24BE84D80];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE850A0]), "initWithData:", v7);

  v10 = (void *)objc_msgSend(v8, "initWithProtobuf:", v9);
  objc_msgSend(a1, "logCard:format:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)logCard:(id)a3
{
  return (id)objc_msgSend(a1, "logCard:format:", a3, 0);
}

+ (id)logCard:(id)a3 format:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "backingCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[SiriUICardLogger _sharedInstance](SiriUICardLogger, "_sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_currentFilenameForFormat:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE850A0]), "initWithFacade:", v6);
    objc_msgSend(v9, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    switch(a4)
    {
      case 0uLL:
        if (objc_msgSend(v10, "writeToFile:atomically:", v8, 0))
          goto LABEL_13;
        goto LABEL_4;
      case 1uLL:
        objc_msgSend(v10, "base64EncodedStringWithOptions:", 32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "writeToFile:atomically:encoding:error:", v8, 0, 4, 0);
        goto LABEL_12;
      case 2uLL:
        objc_msgSend(v9, "jsonData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3uLL:
        objc_msgSend(v9, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v13 = v15;
        v14 = objc_msgSend(v15, "writeToFile:atomically:", v8, 0);
LABEL_12:
        v16 = v14;

        if ((v16 & 1) == 0)
          goto LABEL_4;
LABEL_13:
        v17 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136315650;
          v20 = "+[SiriUICardLogger logCard:format:]";
          v21 = 2112;
          v22 = v8;
          v23 = 2112;
          v24 = v5;
          _os_log_impl(&dword_21764F000, v17, OS_LOG_TYPE_DEFAULT, "%s #cards Logged card to file\n    Filename: %@\n    Card: %@", (uint8_t *)&v19, 0x20u);
        }
        v12 = v8;
        break;
      default:
LABEL_4:
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
          +[SiriUICardLogger logCard:format:].cold.1();
        v12 = 0;
        break;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (SiriUICardLogger)init
{
  SiriUICardLogger *v2;
  SiriUICardLogger *v3;
  NSDateFormatter *dateFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUICardLogger;
  v2 = -[SiriUICardLogger init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = 0;

  }
  return v3;
}

- (id)_currentFilenameForFormat:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  if (a3 > 3)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = off_24D7D9310[a3];
    v5 = off_24D7D9330[a3];
  }
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  AFLogDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("CardLogs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v15);
  v11 = v15;

  if ((v10 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    -[SiriUICardLogger _currentFilenameForFormat:].cold.1();

  -[SiriUICardLogger _nowString](self, "_nowString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@/siri-card-%@-%@.%@"), v8, v12, v5, v4);

  return v13;
}

- (id)_dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  void *v7;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    v6 = self->_dateFormatter;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setLocale:](v6, "setLocale:", v7);

    -[NSDateFormatter setDateFormat:](self->_dateFormatter, "setDateFormat:", CFSTR("yyyy_MM_dd-HHmmss"));
    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (id)_nowString
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriUICardLogger _dateFormatter](self, "_dateFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

+ (void)logCard:format:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "+[SiriUICardLogger logCard:format:]";
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21764F000, v0, v1, "%s #cards Failed to log card \n    Filename: %@\n    Card: %@", (_QWORD)v2, DWORD2(v2));
}

- (void)_currentFilenameForFormat:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "_SiriUICardLoggerCardDataDirectory";
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21764F000, v0, v1, "%s #cards Couldn't create card log directory at path %{public}@ %{public}@", (_QWORD)v2, DWORD2(v2));
}

@end
