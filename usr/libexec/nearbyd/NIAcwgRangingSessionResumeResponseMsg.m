@implementation NIAcwgRangingSessionResumeResponseMsg

- (NIAcwgRangingSessionResumeResponseMsg)initWithStsIndex0:(unsigned int)a3 uwbTime0:(unint64_t)a4
{
  NIAcwgRangingSessionResumeResponseMsg *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NIAcwgRangingSessionResumeResponseMsg;
  result = -[NIAcwgRangingSessionResumeResponseMsg init](&v7, "init");
  if (result)
  {
    result->_stsIndex0 = a3;
    result->_uwbTime0 = a4;
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
  objc_msgSend(v6, "appendFormat:", CFSTR("uwbTime0:%llu>"), self->_uwbTime0);
  return v6;
}

+ (id)fromStruct:(AcwgRangingSessionResumeResponseMsgStruct)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithStsIndex0:uwbTime0:", *(_QWORD *)&a3.var0, a3.var1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithStsIndex0:uwbTime0:", self->_stsIndex0, self->_uwbTime0);
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

}

- (NIAcwgRangingSessionResumeResponseMsg)initWithCoder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_stsIndex0 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("stsIndex0"));
    self->_uwbTime0 = (unint64_t)objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("uwbTime0"));
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

@end
