@implementation WFTreeHTMLStripper

+ (id)treeStripperWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", a3);
}

+ (id)treeStripperWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithString:", a3);
}

- (WFTreeHTMLStripper)initWithData:(id)a3
{
  const char *v5;
  int v6;
  unint64_t v7;
  CFStringEncoding v8;
  const __CFString *v9;
  char *v10;
  htmlDocPtr Memory;
  NSObject *v12;
  objc_super v14;
  char buffer[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = (const char *)objc_msgSend(a3, "bytes");
    v6 = objc_msgSend(a3, "length");
    v7 = _NSHTMLEncoding((char *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
    if (v7)
    {
      v8 = CFStringConvertNSStringEncodingToEncoding(v7);
      v9 = CFStringConvertEncodingToIANACharSetName(v8);
      if (CFStringGetCString(v9, buffer, 32, 0x600u))
        v10 = buffer;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    Memory = htmlReadMemory(v5, v6, 0, v10, 97);
    if (!Memory)
    {
      v12 = __WFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WFTreeHTMLStripper initWithData:].cold.1(v12);
    }
  }
  else
  {
    Memory = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)WFTreeHTMLStripper;
  return -[WFTreeXMLDocumentStripper initWithXMLDocument:](&v14, sel_initWithXMLDocument_, Memory);
}

- (WFTreeHTMLStripper)initWithString:(id)a3
{
  return -[WFTreeHTMLStripper initWithData:](self, "initWithData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFTreeHTMLStripper;
  -[WFTreeXMLDocumentStripper dealloc](&v2, sel_dealloc);
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136446210;
  v2 = "-[WFTreeHTMLStripper initWithData:]";
  _os_log_error_impl(&dword_20CD6C000, log, OS_LOG_TYPE_ERROR, "**** %{public}s, error reading html data", (uint8_t *)&v1, 0xCu);
}

@end
