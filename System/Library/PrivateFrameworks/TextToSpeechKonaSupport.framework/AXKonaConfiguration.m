@implementation AXKonaConfiguration

- (AXKonaConfiguration)initWithDylib:(id)a3 dialectCode:(id)a4 dialect:(int)a5
{
  return -[AXKonaConfiguration initWithDylib:romanizerDylib:encoding:dialectCode:dialect:](self, "initWithDylib:romanizerDylib:encoding:dialectCode:dialect:", a3, 0, 12, a4, *(_QWORD *)&a5);
}

- (AXKonaConfiguration)initWithDylib:(id)a3 romanizerDylib:(id)a4 encoding:(unint64_t)a5 dialectCode:(id)a6 dialect:(int)a7
{
  id v13;
  id v14;
  id v15;
  AXKonaConfiguration *v16;
  AXKonaConfiguration *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AXKonaConfiguration;
  v16 = -[AXKonaConfiguration init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dylib, a3);
    objc_storeStrong((id *)&v17->_dialectCode, a6);
    v17->_eciDialect = a7;
    objc_storeStrong((id *)&v17->_romanizerDylib, a4);
    v17->_encoding = a5;
  }

  return v17;
}

- (NSString)iniString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXKonaConfiguration romanizerDylib](self, "romanizerDylib");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[AXKonaConfiguration dialectCode](self, "dialectCode");
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXKonaConfiguration dylib](self, "dylib");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXKonaConfiguration romanizerDylib](self, "romanizerDylib");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]\nPath=%@%@/%@.dylib\nPath_Rom=%@%@/%@.dylib\nVersion=5.0\nVoice1=0 50 65 30 0 0 50 92\nPhoneme0=0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n\n"), v7, v4, CFSTR("/Frameworks"), v8, v4, CFSTR("/Frameworks"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXKonaConfiguration dylib](self, "dylib");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]\nPath=%@%@/%@.dylib\nVersion=5.0\nVoice1=0 50 65 30 0 0 50 92\nPhoneme0=0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n\n"), v7, v4, CFSTR("/Frameworks"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v10;
}

- (NSString)dylib
{
  return self->_dylib;
}

- (NSString)romanizerDylib
{
  return self->_romanizerDylib;
}

- (NSString)dialectCode
{
  return self->_dialectCode;
}

- (int)eciDialect
{
  return self->_eciDialect;
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialectCode, 0);
  objc_storeStrong((id *)&self->_romanizerDylib, 0);
  objc_storeStrong((id *)&self->_dylib, 0);
}

@end
