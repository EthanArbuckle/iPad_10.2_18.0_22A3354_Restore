@implementation WTSession

- (WTSession)initWithType:(int64_t)a3 textViewDelegate:(id)a4
{
  id v6;
  WTSession *v7;
  uint64_t v8;
  NSUUID *uuid;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WTSession;
  v7 = -[WTSession init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_type = a3;
    objc_storeWeak((id *)&v7->_textViewDelegate, v6);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WTSession *v4;
  WTSession *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WTSession *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WTSession uuid](self, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSession uuid](v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)requestedTool
{
  int64_t result;
  int64_t v4;

  result = -[WTSession type](self, "type");
  if (result != 1)
  {
    v4 = -[WTSession compositionSessionType](self, "compositionSessionType");
    if ((unint64_t)(v4 - 1) > 0xB)
      return 0;
    else
      return qword_24A7C98E8[v4 - 1];
  }
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithGeneralCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WTSession uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("WTSessionCodingKeyUUID"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[WTSession type](self, "type"), CFSTR("WTSessionCodingKeyType"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[WTSession compositionSessionType](self, "compositionSessionType"), CFSTR("WTSessionCodingKeyCompositionType"));

}

- (WTSession)initWithGeneralCoder:(id)a3
{
  id v4;
  WTSession *v5;
  uint64_t v6;
  NSUUID *uuid;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WTSession;
  v5 = -[WTSession init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WTSessionCodingKeyUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("WTSessionCodingKeyType"));
    v5->_compositionSessionType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("WTSessionCodingKeyCompositionType"));
  }

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)type
{
  return self->_type;
}

- (WTTextViewDelegate_Proposed_v1)textViewDelegate
{
  return (WTTextViewDelegate_Proposed_v1 *)objc_loadWeakRetained((id *)&self->_textViewDelegate);
}

- (void)setTextViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textViewDelegate, a3);
}

- (int64_t)compositionSessionType
{
  return self->_compositionSessionType;
}

- (void)setCompositionSessionType:(int64_t)a3
{
  self->_compositionSessionType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textViewDelegate);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
