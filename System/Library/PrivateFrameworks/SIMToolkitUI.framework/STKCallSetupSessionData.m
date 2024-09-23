@implementation STKCallSetupSessionData

- (STKCallSetupSessionData)initWithText:(id)a3 simLabel:(id)a4 phoneNumber:(id)a5
{
  id v9;
  STKCallSetupSessionData *v10;
  STKCallSetupSessionData *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STKCallSetupSessionData;
  v10 = -[STKTextSessionData initWithText:simLabel:](&v13, sel_initWithText_simLabel_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_phoneNumber, a5);

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STKCallSetupSessionData;
  v4 = a3;
  -[STKTextSessionData encodeWithXPCDictionary:](&v5, sel_encodeWithXPCDictionary_, v4);
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(v4, "_callPriority", self->_isHighPriority);

}

- (STKCallSetupSessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  STKCallSetupSessionData *v5;
  uint64_t v6;
  NSString *phoneNumber;
  STKCallSetupSessionData *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STKCallSetupSessionData;
  v5 = -[STKTextSessionData initWithXPCDictionary:](&v10, sel_initWithXPCDictionary_, v4);
  if (v5
    && (v5->_isHighPriority = xpc_dictionary_get_BOOL(v4, "_callPriority"),
        BSDeserializeStringFromXPCDictionaryWithKey(),
        v6 = objc_claimAutoreleasedReturnValue(),
        phoneNumber = v5->_phoneNumber,
        v5->_phoneNumber = (NSString *)v6,
        phoneNumber,
        !v5->_phoneNumber))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
