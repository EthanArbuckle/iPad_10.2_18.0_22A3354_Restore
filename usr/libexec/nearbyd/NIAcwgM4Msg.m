@implementation NIAcwgM4Msg

- (NIAcwgM4Msg)initWithStsIndex0:(unsigned int)a3 uwbTime0:(unint64_t)a4 hopKey:(unsigned int)a5 selectedSyncCodeIndex:(unsigned __int8)a6
{
  NIAcwgM4Msg *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NIAcwgM4Msg;
  result = -[NIAcwgM4Msg init](&v11, "init");
  if (result)
  {
    result->_uwbTime0 = a4;
    result->_stsIndex0 = a3;
    result->_hopKey = a5;
    result->_selectedSyncCodeIndex = a6;
  }
  return result;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:\n"), v5));

  objc_msgSend(v6, "appendFormat:", CFSTR("stsIndex0:%u\n"), self->_stsIndex0);
  objc_msgSend(v6, "appendFormat:", CFSTR("uwbTime0:%llu\n"), self->_uwbTime0);
  objc_msgSend(v6, "appendFormat:", CFSTR("hopKey:%u\n"), self->_hopKey);
  objc_msgSend(v6, "appendFormat:", CFSTR("selectedSyncCodeIndex:%u>"), self->_selectedSyncCodeIndex);
  return v6;
}

- (AcwgM4MsgStruct)toStruct
{
  unint64_t v3;
  unsigned int var2;
  unsigned __int8 var1;

  v3 = *(_QWORD *)&self[1].var0;
  var2 = self->var2;
  var1 = self->var1;
  retstr->var0 = HIDWORD(self->var1);
  retstr->var1 = v3;
  retstr->var2 = var2;
  retstr->var3 = var1;
  return self;
}

+ (id)fromStruct:(AcwgM4MsgStruct *)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithStsIndex0:uwbTime0:hopKey:selectedSyncCodeIndex:", a3->var0, a3->var1, a3->var2, a3->var3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithStsIndex0:uwbTime0:hopKey:selectedSyncCodeIndex:", self->_stsIndex0, self->_uwbTime0, self->_hopKey, self->_selectedSyncCodeIndex);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_stsIndex0, CFSTR("stsIndex0"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_uwbTime0, CFSTR("uwbTime0"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_hopKey, CFSTR("hopKey"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_selectedSyncCodeIndex, CFSTR("selectedSyncCodeIndex"));

}

- (NIAcwgM4Msg)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_stsIndex0 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("stsIndex0"));
    self->_uwbTime0 = (unint64_t)objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("uwbTime0"));
    self->_hopKey = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("hopKey"));
    self->_selectedSyncCodeIndex = objc_msgSend(v5, "decodeIntForKey:", CFSTR("selectedSyncCodeIndex"));
  }

  return self;
}

- (unsigned)stsIndex0
{
  return self->_stsIndex0;
}

- (unint64_t)uwbTime0
{
  return self->_uwbTime0;
}

- (unsigned)hopKey
{
  return self->_hopKey;
}

- (unsigned)selectedSyncCodeIndex
{
  return self->_selectedSyncCodeIndex;
}

@end
