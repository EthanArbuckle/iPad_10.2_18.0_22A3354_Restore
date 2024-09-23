@implementation NFReaderSessionConfig

+ (id)sessionConfigWithUIMode:(unint64_t)a3 sessionType:(unint64_t)a4 initialScanText:(id)a5 vasPass:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v9 = a5;
  v10 = a6;
  v11 = objc_opt_new();
  v12 = (_QWORD *)v11;
  if (v11)
  {
    *(_QWORD *)(v11 + 8) = a3;
    *(_QWORD *)(v11 + 16) = a4;
    v13 = objc_msgSend(v9, "copy");
    v14 = (void *)v12[3];
    v12[3] = v13;

    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)v12[4];
    v12[4] = v15;

  }
  return v12;
}

+ (id)sessionTypeString:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("NDEFReader");
  else
    return (id)*((_QWORD *)&off_1E7D7F628 + a3 - 1);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t uiMode;
  id v5;

  uiMode = self->_uiMode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", uiMode, CFSTR("uiMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sessionType, CFSTR("sessionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialScanText, CFSTR("initialScanText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vasPasses, CFSTR("vasPasses"));

}

- (NFReaderSessionConfig)initWithCoder:(id)a3
{
  id v4;
  NFReaderSessionConfig *v5;
  uint64_t v6;
  NSString *initialScanText;
  uint64_t v8;
  NSArray *vasPasses;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFReaderSessionConfig;
  v5 = -[NFReaderSessionConfig init](&v11, sel_init);
  if (v5)
  {
    v5->_uiMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uiMode"));
    v5->_sessionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("initialScanText"));
    v6 = objc_claimAutoreleasedReturnValue();
    initialScanText = v5->_initialScanText;
    v5->_initialScanText = (NSString *)v6;

    +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(), CFSTR("vasPasses"));
    v8 = objc_claimAutoreleasedReturnValue();
    vasPasses = v5->_vasPasses;
    v5->_vasPasses = (NSArray *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_opt_new();
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_QWORD *)(v5 + 8) = self->_uiMode;
    *(_QWORD *)(v5 + 16) = self->_sessionType;
    v7 = -[NSString copyWithZone:](self->_initialScanText, "copyWithZone:", a3);
    v8 = (void *)v6[3];
    v6[3] = v7;

    v9 = -[NSArray copyWithZone:](self->_vasPasses, "copyWithZone:", a3);
    v10 = (void *)v6[4];
    v6[4] = v9;

  }
  return v6;
}

- (unint64_t)uiMode
{
  return self->_uiMode;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (NSString)initialScanText
{
  return self->_initialScanText;
}

- (NSArray)vasPasses
{
  return self->_vasPasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasPasses, 0);
  objc_storeStrong((id *)&self->_initialScanText, 0);
}

@end
