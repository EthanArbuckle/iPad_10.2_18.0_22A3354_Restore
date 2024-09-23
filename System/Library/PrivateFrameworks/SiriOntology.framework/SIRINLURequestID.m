@implementation SIRINLURequestID

- (SIRINLURequestID)initWithIdAsString:(id)a3 connectionID:(id)a4
{
  id v7;
  id v8;
  SIRINLURequestID *v9;
  SIRINLURequestID *v10;
  NSUUID *v11;
  NSUUID *nluRequestId;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SIRINLURequestID;
  v9 = -[SIRINLURequestID init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idAsString, a3);
    objc_storeStrong((id *)&v10->_connectionID, a4);
    v11 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    nluRequestId = v10->_nluRequestId;
    v10->_nluRequestId = v11;

  }
  return v10;
}

- (SIRINLURequestID)initWithIdAsString:(id)a3 nluRequestId:(id)a4 connectionID:(id)a5
{
  id v9;
  id v10;
  id v11;
  SIRINLURequestID *v12;
  SIRINLURequestID *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLURequestID;
  v12 = -[SIRINLURequestID init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idAsString, a3);
    objc_storeStrong((id *)&v13->_nluRequestId, a4);
    objc_storeStrong((id *)&v13->_connectionID, a5);
  }

  return v13;
}

- (SIRINLURequestID)initWithCoder:(id)a3
{
  id v4;
  SIRINLURequestID *v5;
  uint64_t v6;
  NSString *idAsString;
  uint64_t v8;
  NSUUID *nluRequestId;
  uint64_t v10;
  NSString *connectionID;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRINLURequestID;
  v5 = -[SIRINLURequestID init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idAsString"));
    v6 = objc_claimAutoreleasedReturnValue();
    idAsString = v5->_idAsString;
    v5->_idAsString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nluRequestId"));
    v8 = objc_claimAutoreleasedReturnValue();
    nluRequestId = v5->_nluRequestId;
    v5->_nluRequestId = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionID"));
    v10 = objc_claimAutoreleasedReturnValue();
    connectionID = v5->_connectionID;
    v5->_connectionID = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SIRINLURequestID idAsString](self, "idAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("idAsString"));

  -[SIRINLURequestID nluRequestId](self, "nluRequestId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("nluRequestId"));

  -[SIRINLURequestID connectionID](self, "connectionID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("connectionID"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLURequestID idAsString](self, "idAsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLURequestID nluRequestId](self, "nluRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLURequestID connectionID](self, "connectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{RequestID:\n  idAsString: %@\n  nluRequestId: %@\n  connectionID: %@\n}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)idAsString
{
  return self->_idAsString;
}

- (void)setIdAsString:(id)a3
{
  objc_storeStrong((id *)&self->_idAsString, a3);
}

- (NSUUID)nluRequestId
{
  return self->_nluRequestId;
}

- (void)setNluRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_nluRequestId, a3);
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(id)a3
{
  objc_storeStrong((id *)&self->_connectionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionID, 0);
  objc_storeStrong((id *)&self->_nluRequestId, 0);
  objc_storeStrong((id *)&self->_idAsString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
