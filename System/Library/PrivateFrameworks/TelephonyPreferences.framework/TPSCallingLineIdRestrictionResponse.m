@implementation TPSCallingLineIdRestrictionResponse

- (TPSCallingLineIdRestrictionResponse)initWithSubscriptionContext:(id)a3 error:(id)a4
{
  -[TPSCallingLineIdRestrictionResponse doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (TPSCallingLineIdRestrictionResponse)initWithsubscriptionContext:(id)a3 editable:(BOOL)a4 state:(int64_t)a5 error:(id)a6
{
  TPSCallingLineIdRestrictionResponse *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  result = -[TPSResponse initWithSubscriptionContext:error:](&v9, sel_initWithSubscriptionContext_error_, a3, a6);
  if (result)
  {
    result->_editable = a4;
    result->_state = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  result = -[TPSResponse copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_BYTE *)result + 24) = self->_editable;
  *((_QWORD *)result + 4) = self->_state;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 editable;
  void *v6;
  int64_t state;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  v4 = a3;
  -[TPSResponse encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  editable = self->_editable;
  NSStringFromSelector(sel_editable);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", editable, v6, v9.receiver, v9.super_class);

  state = self->_state;
  NSStringFromSelector(sel_state);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", state, v8);

}

- (TPSCallingLineIdRestrictionResponse)initWithCoder:(id)a3
{
  id v4;
  TPSCallingLineIdRestrictionResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  v5 = -[TPSResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    NSStringFromSelector(sel_editable);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_editable = objc_msgSend(v4, "decodeBoolForKey:", v6);

    NSStringFromSelector(sel_state);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_subscriptionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSResponse subscriptionContext](self, "subscriptionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSResponse error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v6, v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_editable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TPSCallingLineIdRestrictionResponse isEditable](self, "isEditable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v8, v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  NSStringFromSelector(sel_state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "tps_stringWithTPSCallingLineIdRestrictionState:", -[TPSCallingLineIdRestrictionResponse state](self, "state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v10, v11);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  v3 = -[TPSResponse hash](&v6, sel_hash);
  v4 = -[TPSCallingLineIdRestrictionResponse isEditable](self, "isEditable");
  return v3 ^ v4 ^ -[TPSCallingLineIdRestrictionResponse state](self, "state");
}

- (BOOL)isEqual:(id)a3
{
  TPSCallingLineIdRestrictionResponse *v4;
  BOOL v5;

  v4 = (TPSCallingLineIdRestrictionResponse *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPSCallingLineIdRestrictionResponse isEqualToResponse:](self, "isEqualToResponse:", v4);
  }

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCallingLineIdRestrictionResponse;
  if (-[TPSResponse isEqualToResponse:](&v9, sel_isEqualToResponse_, v4)
    && (v5 = -[TPSCallingLineIdRestrictionResponse isEditable](self, "isEditable"),
        v5 == objc_msgSend(v4, "isEditable")))
  {
    v7 = -[TPSCallingLineIdRestrictionResponse state](self, "state");
    v6 = v7 == objc_msgSend(v4, "state");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___TPSCallingLineIdRestrictionResponse;
  objc_msgSendSuper2(&v9, sel_unarchivedObjectClasses);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  v10[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (int64_t)state
{
  return self->_state;
}

@end
