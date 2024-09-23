@implementation RPNearFieldValidationPayload

- (RPNearFieldValidationPayload)initWithKnownIdentity:(BOOL)a3 supportsApplicationLabel:(BOOL)a4
{
  _BOOL8 v4;
  RPNearFieldValidationPayload *v6;
  RPNearFieldValidationPayload *v7;
  uint64_t v8;
  NSNumber *supportsApplicationLabel;
  RPNearFieldValidationPayload *v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPNearFieldValidationPayload;
  v6 = -[RPNearFieldMessagePayload initWithType:](&v12, "initWithType:", 2);
  v7 = v6;
  if (v6)
  {
    v6->_isKnownIdentity = a3;
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    supportsApplicationLabel = v7->_supportsApplicationLabel;
    v7->_supportsApplicationLabel = (NSNumber *)v8;

    v10 = v7;
  }

  return v7;
}

- (RPNearFieldValidationPayload)initWithDictionary:(id)a3
{
  id v4;
  RPNearFieldValidationPayload *v5;
  uint64_t NSNumber;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSNumber *supportsApplicationLabel;
  RPNearFieldValidationPayload *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPNearFieldValidationPayload;
  v5 = -[RPNearFieldMessagePayload initWithDictionary:](&v13, "initWithDictionary:", v4);
  if (v5)
  {
    NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("RPKnownIdentityKey"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
    if (v7)
    {
      v8 = NSDictionaryGetNSNumber(v4, CFSTR("RPSupportsApplicationLabelKey"), 0);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      supportsApplicationLabel = v5->_supportsApplicationLabel;
      v5->_supportsApplicationLabel = (NSNumber *)v9;

      v5->_isKnownIdentity = objc_msgSend(v7, "BOOLValue");
      v11 = v5;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v10[0] = CFSTR("RPKnownIdentityKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isKnownIdentity));
  v10[1] = CFSTR("RPSupportsApplicationLabelKey");
  v11[0] = v3;
  v11[1] = self->_supportsApplicationLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  v9.receiver = self;
  v9.super_class = (Class)RPNearFieldValidationPayload;
  v5 = -[RPNearFieldMessagePayload dictionaryRepresentation](&v9, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  objc_msgSend(v7, "addEntriesFromDictionary:", v4);
  return v7;
}

- (id)description
{
  return -[RPNearFieldValidationPayload descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v13;

  v13 = 0;
  v4 = NSStringFromBOOL(-[RPNearFieldValidationPayload isKnownIdentity](self, "isKnownIdentity", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldValidationPayload supportsApplicationLabel](self, "supportsApplicationLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldValidationPayload supportsApplicationLabel](self, "supportsApplicationLabel"));
  v8 = v7;
  if (v6)
  {
    v9 = NSStringFromBOOL(objc_msgSend(v7, "BOOLValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v10 = v7;
  }
  NSAppendPrintF(&v13, ", isKnownIdentity %@, supportsApplicationLabel %@", v5, v10);
  v11 = v13;
  if (v6)

  return v11;
}

- (BOOL)isKnownIdentity
{
  return self->_isKnownIdentity;
}

- (NSNumber)supportsApplicationLabel
{
  return self->_supportsApplicationLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsApplicationLabel, 0);
}

@end
