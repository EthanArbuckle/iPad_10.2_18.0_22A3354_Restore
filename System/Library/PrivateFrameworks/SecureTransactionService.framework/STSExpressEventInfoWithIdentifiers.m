@implementation STSExpressEventInfoWithIdentifiers

- (STSExpressEventInfoWithIdentifiers)initWithState:(unsigned int)a3 appletIdentifier:(id)a4 keyIdentifier:(id)a5
{
  uint64_t v7;
  id v9;
  id v10;
  STSExpressEventInfoWithIdentifiers *v11;
  STSExpressEventInfoWithIdentifiers *v12;
  objc_super v14;

  v7 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STSExpressEventInfoWithIdentifiers;
  v11 = -[STSExpressEventInfo initWithState:](&v14, sel_initWithState_, v7);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appletIdentifier, a4);
    objc_storeStrong((id *)&v12->_keyIdentifier, a5);
  }

  return v12;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
