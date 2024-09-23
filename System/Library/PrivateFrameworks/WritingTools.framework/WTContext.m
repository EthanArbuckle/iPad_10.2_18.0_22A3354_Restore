@implementation WTContext

- (WTContext)initWithAttributedText:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  WTContext *v8;
  uint64_t v9;
  NSUUID *uuid;
  uint64_t v11;
  NSAttributedString *attributedText;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WTContext;
  v8 = -[WTContext init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v9;

    v11 = objc_msgSend(v7, "copy");
    attributedText = v8->_attributedText;
    v8->_attributedText = (NSAttributedString *)v11;

    v8->_range.location = location;
    v8->_range.length = length;
  }

  return v8;
}

- (void)setAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedText, a3);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[WTContext uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = 257 * (-[WTContext range](self, "range") + 257 * v4);
  -[WTContext range](self, "range");
  return v5 + v6;
}

- (BOOL)isEqual:(id)a3
{
  WTContext *v4;
  WTContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v13;

  v4 = (WTContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WTContext uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTContext uuid](v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[WTContext range](self, "range");
      v10 = v9;
      v13 = v8 == -[WTContext range](v5, "range") && v10 == v11;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[WTContext uuid](self, "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v5[1];
    v5[1] = v6;

    -[WTContext attributedText](self, "attributedText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copyWithZone:", a3);
    v10 = (void *)v5[2];
    v5[2] = v9;

    v5[4] = -[WTContext range](self, "range");
    v5[5] = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  WTBSCompatibleAttributedString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[WTContext uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("WTContextCodingKeyUUID"));

  v5 = objc_alloc_init(WTBSCompatibleAttributedString);
  -[WTContext attributedText](self, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTBSCompatibleAttributedString setAttributedString:](v5, "setAttributedString:", v6);

  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("WTContextCodingKeyAttributedText"));
  v7 = (void *)MEMORY[0x24BDD1968];
  v8 = -[WTContext range](self, "range");
  objc_msgSend(v7, "valueWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("WTContextCodingKeyRange"));

  -[WTContext smartReplyConfig](self, "smartReplyConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WTContext smartReplyConfig](self, "smartReplyConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("WTContextCodingKeySmartReplyConfiguration"));

  }
}

- (WTContext)initWithCoder:(id)a3
{
  id v4;
  WTContext *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  uint64_t v9;
  NSAttributedString *attributedText;
  void *v11;
  NSUInteger v12;
  uint64_t v13;
  WTSmartReplyConfiguration *smartReplyConfig;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WTContext;
  v5 = -[WTContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTContextCodingKeyUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTContextCodingKeyAttributedText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedString");
    v9 = objc_claimAutoreleasedReturnValue();
    attributedText = v5->_attributedText;
    v5->_attributedText = (NSAttributedString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTContextCodingKeyRange"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_range.location = objc_msgSend(v11, "rangeValue");
    v5->_range.length = v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTContextCodingKeySmartReplyConfiguration"));
    v13 = objc_claimAutoreleasedReturnValue();
    smartReplyConfig = v5->_smartReplyConfig;
    v5->_smartReplyConfig = (WTSmartReplyConfiguration *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(CFSTR("WTContextKey"), "UTF8String");
  BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();

}

- (WTContext)initWithXPCDictionary:(id)a3
{
  id v4;
  WTContext *v5;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(CFSTR("WTContextKey"), "UTF8String");
  BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v5 = (WTContext *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (WTSmartReplyConfiguration)smartReplyConfig
{
  return self->_smartReplyConfig;
}

- (void)setSmartReplyConfig:(id)a3
{
  objc_storeStrong((id *)&self->_smartReplyConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartReplyConfig, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
