@implementation PPSiriQueryResult

- (PPSiriQueryResult)initWithQid:(id)a3 domain:(id)a4 confidence:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PPSiriQueryResult *v14;
  PPSiriQueryResult *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSiriQueryResult.m"), 11, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSiriQueryResult.m"), 12, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("confidence != nil"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PPSiriQueryResult;
  v14 = -[PPSiriQueryResult init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_qid, a3);
    objc_storeStrong((id *)&v15->_domain, a4);
    objc_storeStrong((id *)&v15->_confidence, a5);
  }

  return v15;
}

- (BOOL)isEqualToSiriQueryResult:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *qid;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *domain;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSNumber *confidence;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_qid != 0;
  objc_msgSend(v4, "qid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  qid = self->_qid;
  if (qid)
  {
    objc_msgSend(v5, "qid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString isEqual:](qid, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_domain != 0;
  objc_msgSend(v5, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  domain = self->_domain;
  if (domain)
  {
    objc_msgSend(v5, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](domain, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_confidence != 0;
  objc_msgSend(v5, "confidence");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    confidence = self->_confidence;
    if (confidence)
    {
      objc_msgSend(v5, "confidence");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSNumber isEqual:](confidence, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  PPSiriQueryResult *v4;
  PPSiriQueryResult *v5;
  BOOL v6;

  v4 = (PPSiriQueryResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPSiriQueryResult isEqualToSiriQueryResult:](self, "isEqualToSiriQueryResult:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_qid, "hash");
  v4 = -[NSString hash](self->_domain, "hash") - v3 + 32 * v3;
  return -[NSNumber hash](self->_confidence, "hash") - v4 + 32 * v4;
}

- (NSString)qid
{
  return self->_qid;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSNumber)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_qid, 0);
}

+ (id)siriQueryResultWithQid:(id)a3 domain:(id)a4 confidence:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithQid:domain:confidence:", v10, v9, v8);

  return v11;
}

@end
