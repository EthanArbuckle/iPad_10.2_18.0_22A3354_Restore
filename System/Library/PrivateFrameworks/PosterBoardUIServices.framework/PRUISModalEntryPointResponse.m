@implementation PRUISModalEntryPointResponse

+ (id)cancel
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEntryPointResult:", 0);
}

+ (id)done
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEntryPointResult:", 1);
}

- (PRUISModalEntryPointResponse)initWithEntryPointResult:(int64_t)a3
{
  PRUISModalEntryPointResponse *v4;
  PRUISModalEntryPointResponse *v5;
  PRUISModalEntryPointResponse *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRUISModalEntryPointResponse;
  v4 = -[PRUISModalEntryPointResponse init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_result = a3 == 1;
    v4->_entryPointResult = a3;
    v6 = v4;
  }

  return v5;
}

- (PRUISModalEntryPointResponse)initWithResult:(int64_t)a3
{
  return -[PRUISModalEntryPointResponse initWithEntryPointResult:](self, "initWithEntryPointResult:", a3 == 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntryPointResult:", self->_entryPointResult);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointResponse)initWithBSXPCCoder:(id)a3
{
  return -[PRUISModalEntryPointResponse initWithResult:](self, "initWithResult:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("result")));
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_result, CFSTR("result"));
}

- (int64_t)result
{
  return self->_result;
}

- (int64_t)entryPointResult
{
  return self->_entryPointResult;
}

@end
