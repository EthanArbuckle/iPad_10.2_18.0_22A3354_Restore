@implementation MusicMonogramArtworkToken

- (MusicMonogramArtworkToken)initWithFullName:(id)a3 rightToLeft:(BOOL)a4
{
  id v6;
  void *v7;
  MusicMonogramArtworkToken *v8;
  NSString *v9;
  NSString *fullName;
  MusicMonogramArtworkToken *v11;
  objc_super v13;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v13.receiver = self;
    v13.super_class = (Class)MusicMonogramArtworkToken;
    v8 = -[MusicMonogramArtworkToken init](&v13, "init");
    if (v8)
    {
      v9 = (NSString *)objc_msgSend(v7, "copy");
      fullName = v8->_fullName;
      v8->_fullName = v9;

      v8->_rightToLeft = a4;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_fullName, "hash") ^ self->_rightToLeft;
}

- (BOOL)isEqual:(id)a3
{
  MusicMonogramArtworkToken *v4;
  uint64_t v5;
  MusicMonogramArtworkToken *v6;
  NSString *fullName;
  BOOL v8;

  v4 = (MusicMonogramArtworkToken *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class(MusicMonogramArtworkToken);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      fullName = self->_fullName;
      v8 = (fullName == v6->_fullName || -[NSString isEqualToString:](fullName, "isEqualToString:"))
        && self->_rightToLeft == v6->_rightToLeft;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc((Class)objc_opt_class(self, a2));
  return _objc_msgSend(v4, "initWithFullName:rightToLeft:", self->_fullName, self->_rightToLeft);
}

- (id)stringRepresentation
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lx"), -[MusicMonogramArtworkToken hash](self, "hash"));
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)rightToLeft
{
  return self->_rightToLeft;
}

- (void)setRightToLeft:(BOOL)a3
{
  self->_rightToLeft = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
}

@end
