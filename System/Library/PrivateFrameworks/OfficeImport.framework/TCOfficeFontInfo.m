@implementation TCOfficeFontInfo

- (TCOfficeFontInfo)initWithFullName:(id)a3 isBold:(BOOL)a4 isItalic:(BOOL)a5
{
  id v8;
  TCOfficeFontInfo *v9;
  uint64_t v10;
  NSString *fullName;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TCOfficeFontInfo;
  v9 = -[TCOfficeFontInfo init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    fullName = v9->_fullName;
    v9->_fullName = (NSString *)v10;

    v9->_isBold = a4;
    v9->_isItalic = a5;
  }

  return v9;
}

+ (id)officeFontInfoWithFullName:(id)a3 isBold:(BOOL)a4 isItalic:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFullName:isBold:isItalic:", v8, v6, v5);

  return v9;
}

- (id)officeName
{
  NSUInteger v3;
  NSString *fullName;
  NSString *v5;

  v3 = -[NSString length](self->_fullName, "length");
  fullName = self->_fullName;
  if (v3 > 0x1F)
  {
    -[NSString substringToIndex:](fullName, "substringToIndex:", 31);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = fullName;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TCOfficeFontInfo fullName](self, "fullName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("office_font={\"%@\" B:%d I:%d}"), v4, -[TCOfficeFontInfo isBold](self, "isBold"), -[TCOfficeFontInfo isItalic](self, "isItalic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (BOOL)isItalic
{
  return self->_isItalic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
