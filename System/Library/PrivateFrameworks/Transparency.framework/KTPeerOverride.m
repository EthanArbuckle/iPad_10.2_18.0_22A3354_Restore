@implementation KTPeerOverride

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[KTPeerOverride uiStatus](self, "uiStatus"), CFSTR("uiStatus"));

}

- (KTPeerOverride)initWithCoder:(id)a3
{
  id v4;
  KTPeerOverride *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KTPeerOverride;
  v5 = -[KTPeerOverride init](&v7, sel_init);
  if (v5)
    -[KTPeerOverride setUiStatus:](v5, "setUiStatus:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("uiStatus")));

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<KTPeerOverride: (uiStatus: %lu)>"), -[KTPeerOverride uiStatus](self, "uiStatus"));
}

- (unint64_t)uiStatus
{
  return self->_uiStatus;
}

- (void)setUiStatus:(unint64_t)a3
{
  self->_uiStatus = a3;
}

@end
