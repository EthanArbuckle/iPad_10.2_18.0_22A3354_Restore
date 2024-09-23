@implementation PESCAPReviewPayload

- (PESCAPReviewPayload)initWithActionType:(int64_t)a3 reason:(int64_t)a4 score:(double)a5 adjustmentsDescription:(id)a6
{
  id v11;
  PESCAPReviewPayload *v12;
  PESCAPReviewPayload *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PESCAPReviewPayload;
  v12 = -[PESCAPReviewPayload init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_actionType = a3;
    v12->_reason = a4;
    v12->_score = a5;
    objc_storeStrong((id *)&v12->_adjustmentsDescription, a6);
  }

  return v13;
}

- (id)debugDescription
{
  void *v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[PESCAPReviewPayload actionType](self, "actionType") == 1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = -[PESCAPReviewPayload actionType](self, "actionType");
    v5 = CFSTR("Smart C&P");
    if (!v4)
      v5 = CFSTR("Legacy C&P");
    v6 = v5;
    -[PESCAPReviewPayload score](self, "score");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %f"), v6, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = -[PESCAPReviewPayload reason](self, "reason") - 1;
    if (v9 > 6)
      v8 = CFSTR("Unknown");
    else
      v8 = off_24C618720[v9];
    if (-[PESCAPReviewPayload reason](self, "reason") == 6)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      -[PESCAPReviewPayload score](self, "score");
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ - %f"), v8, v11);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v8;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (double)score
{
  return self->_score;
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)adjustmentsDescription
{
  return self->_adjustmentsDescription;
}

- (void)setAdjustmentsDescription:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentsDescription, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_adjustmentsDescription, 0);
}

+ (id)legacyPayloadWithReason:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithActionType:reason:score:adjustmentsDescription:", 0, a3, 0, -1.0);
}

@end
