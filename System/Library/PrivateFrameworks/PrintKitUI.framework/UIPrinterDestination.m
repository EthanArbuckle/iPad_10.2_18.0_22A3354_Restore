@implementation UIPrinterDestination

- (UIPrinterDestination)initWithURL:(NSURL *)url
{
  NSURL *v4;
  UIPrinterDestination *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *v9;
  objc_super v11;

  v4 = url;
  v11.receiver = self;
  v11.super_class = (Class)UIPrinterDestination;
  v5 = -[UIPrinterDestination init](&v11, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    -[NSURL absoluteString](v4, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v5->_URL;
    v5->_URL = (NSURL *)v8;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *txtRecord;
  NSString *displayName;

  v3 = (void *)objc_opt_new();
  -[NSURL absoluteString](self->_URL, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("uri"));

  txtRecord = self->_txtRecord;
  if (txtRecord)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", txtRecord, CFSTR("txt"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", displayName, CFSTR("display-name"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPrinterDestination dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("asDict"));

}

- (UIPrinterDestination)initWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIPrinterDestination *v8;
  void *v9;
  void *v10;
  UIPrinterDestination *v11;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("asDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uri"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIPrinterDestination initWithURL:](self, "initWithURL:", v7);

      if (v8)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("display-name"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrinterDestination setDisplayName:](v8, "setDisplayName:", v9);

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("txt"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPrinterDestination setTxtRecord:](v8, "setTxtRecord:", v10);

      }
      self = v8;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURL:(NSURL *)URL
{
  objc_setProperty_atomic_copy(self, a2, URL, 8);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(NSString *)displayName
{
  objc_setProperty_atomic_copy(self, a2, displayName, 16);
}

- (NSData)txtRecord
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTxtRecord:(NSData *)txtRecord
{
  objc_setProperty_atomic_copy(self, a2, txtRecord, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
