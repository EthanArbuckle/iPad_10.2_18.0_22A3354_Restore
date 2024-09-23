@implementation SIRINLURewriteMessage

- (SIRINLURewriteMessage)initWithType:(int)a3 utterance:(id)a4
{
  id v7;
  SIRINLURewriteMessage *v8;
  SIRINLURewriteMessage *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLURewriteMessage;
  v8 = -[SIRINLURewriteMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_rewriteType = a3;
    objc_storeStrong((id *)&v8->_rewrittenUtterance, a4);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t rewriteType;
  id v5;

  rewriteType = self->_rewriteType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", rewriteType, CFSTR("rewriteType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewrittenUtterance, CFSTR("rewrittenUtterance"));

}

- (SIRINLURewriteMessage)initWithCoder:(id)a3
{
  id v4;
  SIRINLURewriteMessage *v5;
  uint64_t v6;
  NSString *rewrittenUtterance;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLURewriteMessage;
  v5 = -[SIRINLURewriteMessage init](&v9, sel_init);
  if (v5)
  {
    v5->_rewriteType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rewriteType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewrittenUtterance"));
    v6 = objc_claimAutoreleasedReturnValue();
    rewrittenUtterance = v5->_rewrittenUtterance;
    v5->_rewrittenUtterance = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{RewriteMessage:\n  rewriteType: %d\n  rewrittenUtterance: %@\n}"), self->_rewriteType, self->_rewrittenUtterance);
}

- (int)rewriteType
{
  return self->_rewriteType;
}

- (void)setRewriteType:(int)a3
{
  self->_rewriteType = a3;
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewrittenUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenUtterance, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
