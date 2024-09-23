@implementation OADFontScheme

- (OADFontScheme)init
{
  OADFontScheme *v2;
  uint64_t v3;
  OADFontCollection *majorFont;
  uint64_t v5;
  OADFontCollection *minorFont;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADFontScheme;
  v2 = -[OADFontScheme init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    majorFont = v2->_majorFont;
    v2->_majorFont = (OADFontCollection *)v3;

    v5 = objc_opt_new();
    minorFont = v2->_minorFont;
    v2->_minorFont = (OADFontCollection *)v5;

  }
  return v2;
}

- (OADFontCollection)majorFont
{
  return self->_majorFont;
}

- (OADFontCollection)minorFont
{
  return self->_minorFont;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    if (-[OADFontCollection isEqualToFontCollection:](self->_majorFont, "isEqualToFontCollection:", v7[2]))
      v6 = -[OADFontCollection isEqualToFontCollection:](self->_minorFont, "isEqualToFontCollection:", v7[3]);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_name, "hash");
  -[OADBaseFontCollection latinFont](self->_majorFont, "latinFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[OADBaseFontCollection latinFont](self->_minorFont, "latinFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 << 8) + (v3 << 16) + objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEmpty
{
  _BOOL4 v3;

  v3 = -[OADFontCollection isEmpty](self->_majorFont, "isEmpty");
  if (v3)
    LOBYTE(v3) = -[OADFontCollection isEmpty](self->_minorFont, "isEmpty");
  return v3;
}

- (id)fontForId:(int)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[OADFontScheme minorFont](self, "minorFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[OADFontScheme majorFont](self, "majorFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)validateFontScheme
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (!self->_name)
  {
    self->_name = (NSString *)CFSTR("Office");

  }
  -[OADBaseFontCollection latinFont](self->_majorFont, "latinFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    -[OADBaseFontCollection setLatinFont:](self->_majorFont, "setLatinFont:", CFSTR("Calibri"));
  -[OADBaseFontCollection latinFont](self->_minorFont, "latinFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    -[OADBaseFontCollection setLatinFont:](self->_minorFont, "setLatinFont:", CFSTR("Cambria"));
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
