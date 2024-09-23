@implementation DYGTMTLCommandQueueInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLCommandQueueInfo)initWithCoder:(id)a3
{
  id v4;
  DYGTMTLCommandQueueInfo *v5;
  id v6;
  uint64_t v7;
  NSString *label;
  unsigned __int8 v9;
  DYGTMTLCommandQueueInfo *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DYGTMTLCommandQueueInfo;
  v5 = -[DYGTMTLCommandQueueInfo init](&v12, "init");
  if (v5)
  {
    v5->_streamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_deviceStreamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceStreamRef"));
    v5->_deviceAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("deviceAddress"));
    v5->_toolsDeviceAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("toolsDeviceAddress"));
    v5->_queueAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("queueAddress"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("label"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    label = v5->_label;
    v5->_label = (NSString *)v7;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("canBeCaptured")))
      v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeCaptured"));
    else
      v9 = 1;
    v5->_canBeCaptured = v9;
    v5->_isOpenGLQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOpenGLQueue"));
    v5->_isInternalQueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInternalQueue"));
    v5->_toolsQueueAddress = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("toolsQueueAddress"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t streamRef;
  id v5;

  streamRef = self->_streamRef;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", streamRef, CFSTR("streamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_deviceAddress, CFSTR("deviceAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_deviceStreamRef, CFSTR("deviceStreamRef"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_toolsDeviceAddress, CFSTR("toolsDeviceAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_queueAddress, CFSTR("queueAddress"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_toolsQueueAddress, CFSTR("toolsQueueAddress"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canBeCaptured, CFSTR("canBeCaptured"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isOpenGLQueue, CFSTR("isOpenGLQueue"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInternalQueue, CFSTR("isInternalQueue"));

}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx -> %@"), self->_queueAddress, self->_label);
}

- (unint64_t)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (unint64_t)toolsDeviceAddress
{
  return self->_toolsDeviceAddress;
}

- (void)setToolsDeviceAddress:(unint64_t)a3
{
  self->_toolsDeviceAddress = a3;
}

- (unint64_t)queueAddress
{
  return self->_queueAddress;
}

- (void)setQueueAddress:(unint64_t)a3
{
  self->_queueAddress = a3;
}

- (unint64_t)toolsQueueAddress
{
  return self->_toolsQueueAddress;
}

- (void)setToolsQueueAddress:(unint64_t)a3
{
  self->_toolsQueueAddress = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)canBeCaptured
{
  return self->_canBeCaptured;
}

- (void)setCanBeCaptured:(BOOL)a3
{
  self->_canBeCaptured = a3;
}

- (BOOL)isOpenGLQueue
{
  return self->_isOpenGLQueue;
}

- (void)setIsOpenGLQueue:(BOOL)a3
{
  self->_isOpenGLQueue = a3;
}

- (BOOL)isInternalQueue
{
  return self->_isInternalQueue;
}

- (void)setIsInternalQueue:(BOOL)a3
{
  self->_isInternalQueue = a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (unint64_t)deviceStreamRef
{
  return self->_deviceStreamRef;
}

- (void)setDeviceStreamRef:(unint64_t)a3
{
  self->_deviceStreamRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
