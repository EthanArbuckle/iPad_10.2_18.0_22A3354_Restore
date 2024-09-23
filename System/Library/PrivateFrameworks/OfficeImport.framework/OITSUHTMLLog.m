@implementation OITSUHTMLLog

- (OITSUHTMLLog)initWithPath:(id)a3
{
  OITSUHTMLLog *v4;
  void *v5;
  NSString *v6;
  uint64_t v7;
  NSFileHandle *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OITSUHTMLLog;
  v4 = -[OITSUHTMLLog init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (NSString *)objc_msgSend(a3, "copy");
    v4->_path = v6;
    v7 = -[NSString stringByDeletingLastPathComponent](v6, "stringByDeletingLastPathComponent");
    if (objc_msgSend(v5, "fileExistsAtPath:", v4->_path))
      objc_msgSend(v5, "removeItemAtPath:error:", v4->_path, 0);
    if ((objc_msgSend(v5, "fileExistsAtPath:", v7) & 1) == 0)
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);
    objc_msgSend(v5, "createFileAtPath:contents:attributes:", v4->_path, objc_msgSend(MEMORY[0x24BDBCE50], "data"), 0);
    v8 = (NSFileHandle *)(id)objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v4->_path);
    v4->_handle = v8;
    if (v8)
      NSLog((NSString *)CFSTR("Opened log at path %@"), v4->_path);
    else
      NSLog((NSString *)CFSTR("Failed to open log at path %@"), v4->_path);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUHTMLLog;
  -[OITSUHTMLLog dealloc](&v3, sel_dealloc);
}

- (id)uniqueIdentifierWithPrefix:(id)a3
{
  void *v3;
  unint64_t uniquifier;

  v3 = (void *)MEMORY[0x24BDD17C8];
  uniquifier = self->_uniquifier;
  self->_uniquifier = uniquifier + 1;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%tu"), a3, uniquifier);
}

- (void)_writeMarkupData:(id)a3
{
  const char *v5;

  if (!self->_logStarted)
  {
    self->_logStarted = 1;
    -[OITSUHTMLLog logBegin](self, "logBegin");
  }
  v5 = (const char *)objc_msgSend(a3, "UTF8String");
  -[NSFileHandle writeData:](self->_handle, "writeData:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, strlen(v5)));
  -[NSFileHandle synchronizeFile](self->_handle, "synchronizeFile");
}

- (void)writeMarkup:(id)a3
{
  uint64_t v3;

  -[OITSUHTMLLog _writeMarkupData:](self, "_writeMarkupData:", objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringWithFormat:arguments:", a3, &v3));
}

- (void)writeText:(id)a3
{
  uint64_t v3;

  -[OITSUHTMLLog _writeMarkupData:](self, "_writeMarkupData:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringWithFormat:arguments:", a3, &v3), "tsu_escapeXML"));
}

- (void)close
{
  -[NSFileHandle closeFile](self->_handle, "closeFile");
  NSLog((NSString *)CFSTR("Closed log at path %@"), -[OITSUHTMLLog path](self, "path"));
}

- (void)clear
{
  -[NSFileHandle truncateFileAtOffset:](self->_handle, "truncateFileAtOffset:", 0);
}

- (void)logBegin
{
  self->_logStarted = 1;
  -[OITSUHTMLLog clear](self, "clear");
  -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<html>\n"));
  -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<head>\n"));
  -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<meta charset='UTF-8'/>\n"));
  if (-[OITSUHTMLLog title](self, "title"))
    -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<title>%@</title>"), -[OITSUHTMLLog title](self, "title"));
  if (-[OITSUHTMLLog script](self, "script"))
    -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<script language='javascript'>\n%@\n</script>"), -[OITSUHTMLLog script](self, "script"));
  if (-[OITSUHTMLLog stylesheet](self, "stylesheet"))
    -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<style type='text/css'>\n<!--\n%@\n-->\n</style>"), -[OITSUHTMLLog stylesheet](self, "stylesheet"));
  -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("</head>\n"));
  -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("<body>\n"));
}

- (void)logEnd
{
  -[OITSUHTMLLog writeMarkup:](self, "writeMarkup:", CFSTR("</html>\n"));
}

- (NSString)path
{
  return self->_path;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)stylesheet
{
  return self->_stylesheet;
}

- (void)setStylesheet:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
