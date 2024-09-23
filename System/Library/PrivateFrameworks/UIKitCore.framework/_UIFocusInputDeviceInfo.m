@implementation _UIFocusInputDeviceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)infoWithSenderID:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithSenderID:", a3);
}

- (id)_initWithSenderID:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusInputDeviceInfo;
  result = -[_UIFocusInputDeviceInfo init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  xpc_dictionary_set_uint64(xdict, (const char *)objc_msgSend(CFSTR("FocusInputDeviceInfoSenderIDKey"), "UTF8String"), -[_UIFocusInputDeviceInfo senderID](self, "senderID"));

}

- (_UIFocusInputDeviceInfo)initWithXPCDictionary:(id)a3
{
  id v4;
  _UIFocusInputDeviceInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusInputDeviceInfo;
  v5 = -[_UIFocusInputDeviceInfo init](&v7, sel_init);
  if (v5)
    v5->_senderID = xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("FocusInputDeviceInfoSenderIDKey"), "UTF8String"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithSenderID:", self->_senderID);
}

- (_UIFocusInputDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  _UIFocusInputDeviceInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusInputDeviceInfo;
  v5 = -[_UIFocusInputDeviceInfo init](&v7, sel_init);
  if (v5)
    v5->_senderID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FocusInputDeviceInfoSenderIDKey"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_UIFocusInputDeviceInfo senderID](self, "senderID"), CFSTR("FocusInputDeviceInfoSenderIDKey"));

}

- (unint64_t)senderID
{
  return self->_senderID;
}

@end
