@implementation STKTextInputSessionData

- (STKTextInputSessionData)initWithText:(id)a3 simLabel:(id)a4
{
  STKTextInputSessionData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKTextInputSessionData;
  result = -[STKTextSessionData initWithText:simLabel:](&v5, sel_initWithText_simLabel_, a3, a4);
  if (result)
  {
    result->_minimumInputLength = 0;
    result->_maximumInputLength = -1;
  }
  return result;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKTextInputSessionData;
  v4 = a3;
  -[STKTextSessionData encodeWithXPCDictionary:](&v5, sel_encodeWithXPCDictionary_, v4);
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(v4, "_isSecure", self->_isSecure);
  xpc_dictionary_set_BOOL(v4, "_isDigits", self->_isDigitsOnly);
  xpc_dictionary_set_uint64(v4, "_minLength", self->_minimumInputLength);
  xpc_dictionary_set_uint64(v4, "_maxLength", self->_maximumInputLength);

}

- (STKTextInputSessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  STKTextInputSessionData *v5;
  uint64_t v6;
  NSString *defaultText;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STKTextInputSessionData;
  v5 = -[STKTextSessionData initWithXPCDictionary:](&v9, sel_initWithXPCDictionary_, v4);
  if (v5)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v6 = objc_claimAutoreleasedReturnValue();
    defaultText = v5->_defaultText;
    v5->_defaultText = (NSString *)v6;

    v5->_isSecure = xpc_dictionary_get_BOOL(v4, "_isSecure");
    v5->_isDigitsOnly = xpc_dictionary_get_BOOL(v4, "_isDigits");
    v5->_minimumInputLength = xpc_dictionary_get_uint64(v4, "_minLength");
    v5->_maximumInputLength = xpc_dictionary_get_uint64(v4, "_maxLength");
  }

  return v5;
}

- (NSString)defaultText
{
  return self->_defaultText;
}

- (BOOL)isSecure
{
  return self->_isSecure;
}

- (BOOL)isDigitsOnly
{
  return self->_isDigitsOnly;
}

- (unint64_t)minimumInputLength
{
  return self->_minimumInputLength;
}

- (unint64_t)maximumInputLength
{
  return self->_maximumInputLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultText, 0);
}

@end
