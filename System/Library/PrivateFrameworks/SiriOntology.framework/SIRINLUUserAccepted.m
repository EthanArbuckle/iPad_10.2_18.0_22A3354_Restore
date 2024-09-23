@implementation SIRINLUUserAccepted

- (SIRINLUUserAccepted)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SIRINLUUserAccepted;
  return -[SIRINLUUserAccepted init](&v3, sel_init);
}

- (SIRINLUUserAccepted)initWithOfferId:(id)a3 reference:(id)a4
{
  id v7;
  id v8;
  SIRINLUUserAccepted *v9;
  SIRINLUUserAccepted *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SIRINLUUserAccepted;
  v9 = -[SIRINLUUserAccepted init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_offerId, a3);
    objc_storeStrong((id *)&v10->_reference, a4);
  }

  return v10;
}

- (SIRINLUUserAccepted)initWithCoder:(id)a3
{
  id v4;
  SIRINLUUserAccepted *v5;
  uint64_t v6;
  NSUUID *offerId;
  uint64_t v8;
  USOSerializedGraph *reference;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUUserAccepted;
  v5 = -[SIRINLUUserAccepted init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("offerId"));
    v6 = objc_claimAutoreleasedReturnValue();
    offerId = v5->_offerId;
    v5->_offerId = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reference"));
    v8 = objc_claimAutoreleasedReturnValue();
    reference = v5->_reference;
    v5->_reference = (USOSerializedGraph *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SIRINLUUserAccepted offerId](self, "offerId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("offerId"));

  -[SIRINLUUserAccepted reference](self, "reference");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("reference"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SIRINLUUserAccepted reference](self, "reference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printedForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SIRINLUPrintUtils indentLines:numSpaces:](SIRINLUPrintUtils, "indentLines:numSpaces:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[SIRINLUUserAccepted offerId](self, "offerId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("{UserAccepted\n  offerId: %@\n  reference:\n%@\n}"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_offerId, a3);
}

- (USOSerializedGraph)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_offerId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
