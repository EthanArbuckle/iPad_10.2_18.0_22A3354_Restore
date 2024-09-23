@implementation TSWPObfuscatedFontDataProvider

- (TSWPObfuscatedFontDataProvider)initWithPath:(id)a3 groupUID:(id)a4
{
  TSWPObfuscatedFontDataProvider *v6;
  NSInputStream *v7;
  const char *v8;
  CC_LONG v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPObfuscatedFontDataProvider;
  v6 = -[TSWPObfuscatedFontDataProvider init](&v11, sel_init);
  if (v6)
  {
    v7 = (NSInputStream *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithFileAtPath:", a3);
    v6->_stream = v7;
    -[NSInputStream open](v7, "open");
    v8 = (const char *)objc_msgSend(a4, "UTF8String");
    v9 = strlen(v8);
    CC_SHA1(v8, v9, v6->_xorMask);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSInputStream close](self->_stream, "close");

  v3.receiver = self;
  v3.super_class = (Class)TSWPObfuscatedFontDataProvider;
  -[TSWPObfuscatedFontDataProvider dealloc](&v3, sel_dealloc);
}

- (int64_t)p_currentOffset
{
  return objc_msgSend((id)-[NSInputStream propertyForKey:](self->_stream, "propertyForKey:", *MEMORY[0x24BDBCB90]), "longLongValue");
}

- (unint64_t)readBytes:(char *)a3 count:(unint64_t)a4
{
  int64_t v7;
  unint64_t result;
  uint64_t v9;

  v7 = -[TSWPObfuscatedFontDataProvider p_currentOffset](self, "p_currentOffset");
  result = -[NSInputStream read:maxLength:](self->_stream, "read:maxLength:", a3, a4);
  v9 = result + v7;
  if (result + v7 >= 0x410)
    v9 = 1040;
  if (v7 < v9)
  {
    do
    {
      *a3++ ^= self->_xorMask[v7 % 20];
      ++v7;
    }
    while (v9 != v7);
  }
  return result;
}

- (int64_t)skipForwardBy:(int64_t)a3
{
  int64_t v5;
  NSInputStream *stream;
  uint64_t v7;

  v5 = -[TSWPObfuscatedFontDataProvider p_currentOffset](self, "p_currentOffset");
  stream = self->_stream;
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5 + a3);
  -[NSInputStream setProperty:forKey:](stream, "setProperty:forKey:", v7, *MEMORY[0x24BDBCB90]);
  return -[TSWPObfuscatedFontDataProvider p_currentOffset](self, "p_currentOffset") - v5;
}

- (void)rewind
{
  NSInputStream *stream;
  uint64_t v3;

  stream = self->_stream;
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 0);
  -[NSInputStream setProperty:forKey:](stream, "setProperty:forKey:", v3, *MEMORY[0x24BDBCB90]);
}

@end
