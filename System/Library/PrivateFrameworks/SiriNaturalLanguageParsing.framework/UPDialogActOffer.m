@implementation UPDialogActOffer

- (UPDialogActOffer)initWithIntent:(id)a3 entityWithValue:(id)a4
{
  id v6;
  id v7;
  UPDialogActOffer *v8;
  uint64_t v9;
  NSString *intent;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UPDialogActOffer;
  v8 = -[UPDialogActOffer init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    intent = v8->_intent;
    v8->_intent = (NSString *)v9;

    objc_storeStrong((id *)&v8->_entityWithValue, a4);
  }

  return v8;
}

- (UPDialogActOffer)initWithIntent:(id)a3
{
  return -[UPDialogActOffer initWithIntent:entityWithValue:](self, "initWithIntent:entityWithValue:", a3, 0);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDialogActOffer[intent: %@, entityWithValue: %@]"), self->_intent, self->_entityWithValue);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (UPEntityWithValue)entityWithValue
{
  return (UPEntityWithValue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityWithValue, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
