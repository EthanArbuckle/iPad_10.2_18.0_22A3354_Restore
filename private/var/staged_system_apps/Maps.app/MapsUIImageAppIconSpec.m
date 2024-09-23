@implementation MapsUIImageAppIconSpec

- (MapsUIImageAppIconSpec)initWithBundleIdentifier:(id)a3 format:(int)a4
{
  id v6;
  MapsUIImageAppIconSpec *v7;
  id v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsUIImageAppIconSpec;
  v7 = -[MapsUIImageAppIconSpec init](&v11, "init");
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = *(void **)&v7->_format;
    *(_QWORD *)&v7->_format = v8;

    *(_DWORD *)(&v7->super._isRTL + 3) = a4;
  }

  return v7;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageAppIconSpec bundleIdentifier](self, "bundleIdentifier", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, -[MapsUIImageAppIconSpec format](self, "format"), a3));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsUIImageAppIconSpec *v4;
  void *v5;

  v4 = objc_opt_new(MapsUIImageAppIconSpec);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageAppIconSpec bundleIdentifier](self, "bundleIdentifier"));
  -[MapsUIImageAppIconSpec setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

  -[MapsUIImageAppIconSpec setFormat:](v4, "setFormat:", -[MapsUIImageAppIconSpec format](self, "format"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = -[MapsUIImageAppIconSpec format](self, "format");
    if (v7 == objc_msgSend(v6, "format"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageAppIconSpec bundleIdentifier](self, "bundleIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageAppIconSpec bundleIdentifier](self, "bundleIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = v4 ^ -[MapsUIImageAppIconSpec format](self, "format");

  return v5;
}

- (NSString)bundleIdentifier
{
  return *(NSString **)&self->_format;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)format
{
  return *(_DWORD *)(&self->super._isRTL + 3);
}

- (void)setFormat:(int)a3
{
  *(_DWORD *)(&self->super._isRTL + 3) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
}

@end
