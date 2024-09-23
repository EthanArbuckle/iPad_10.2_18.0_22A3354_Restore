@implementation TSWPStorageItemProvider

- (TSWPStorageItemProvider)initWithString:(id)a3
{
  TSWPStorageItemProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPStorageItemProvider;
  v4 = -[TSWPStorageItemProvider init](&v6, sel_init);
  if (v4)
    v4->_string = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPStorageItemProvider;
  -[TSWPStorageItemProvider dealloc](&v3, sel_dealloc);
}

+ (id)storageItemProviderWithString:(id)a3
{
  return -[TSWPStorageItemProvider initWithString:]([TSWPStorageItemProvider alloc], "initWithString:", a3);
}

- (void)_loadPlainTextData:(id)a3
{
  (*((void (**)(id, NSData *, _QWORD))a3 + 2))(a3, -[NSString dataUsingEncoding:](self->_string, "dataUsingEncoding:", 4), 0);
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier");
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier"), "isEqualToString:", a3))
  {
    -[TSWPStorageItemProvider _loadPlainTextData:](self, "_loadPlainTextData:", a4);
  }
  else
  {
    if (a3)
    {
      v9 = CFSTR("typeIdentifier");
      v10[0] = a3;
      v7 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    }
    else
    {
      v7 = 0;
    }
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, v7));
  }
  return 0;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
