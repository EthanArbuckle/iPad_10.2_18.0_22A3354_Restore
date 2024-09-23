@implementation WLImportContext

- (WLImportContext)initWithCoder:(id)a3
{
  id v4;
  WLImportContext *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WLImportContext;
  v5 = -[WLImportContext init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("import_count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_importCount = objc_msgSend(v6, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("import_error_count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_importErrorCount = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("size"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_size = objc_msgSend(v8, "unsignedLongLongValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t importCount;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  importCount = self->_importCount;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", importCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("import_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_importErrorCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("import_error_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_size);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("size"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)importCount
{
  return self->_importCount;
}

- (void)setImportCount:(unint64_t)a3
{
  self->_importCount = a3;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (void)setImportErrorCount:(unint64_t)a3
{
  self->_importErrorCount = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end
