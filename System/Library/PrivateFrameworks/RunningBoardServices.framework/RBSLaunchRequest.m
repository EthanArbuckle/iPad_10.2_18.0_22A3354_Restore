@implementation RBSLaunchRequest

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_context, CFSTR("_context"));
}

- (RBSLaunchRequest)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSLaunchRequest *v5;
  uint64_t v6;
  RBSLaunchContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSLaunchRequest;
  v5 = -[RBSRequest _init](&v9, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_context"));
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (RBSLaunchContext *)v6;

  }
  return v5;
}

- (RBSLaunchRequest)initWithContext:(id)a3
{
  id v4;
  RBSLaunchRequest *v5;
  uint64_t v6;
  RBSLaunchContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSLaunchRequest;
  v5 = -[RBSRequest _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    context = v5->_context;
    v5->_context = (RBSLaunchContext *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (RBSLaunchContext)context
{
  return self->_context;
}

- (id)executeRequest
{
  void *v3;
  void *v4;

  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeLaunchRequest:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)execute:(id *)a3 assertion:(id *)a4 error:(id *)a5
{
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[RBSLaunchContext attributes](self->_context, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!a4 && v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSLaunchRequest.m"), 39, CFSTR("Cannot attempt to create an assertion during launch if the client will not retain the assertion"));

  }
  +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "executeLaunchRequest:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "process");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a3)
    *a3 = objc_retainAutorelease(v15);
  objc_msgSend(v14, "assertion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!a4)
  {
    objc_msgSend(v17, "invalidate");
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  *a4 = objc_retainAutorelease(v17);
  if (a5)
  {
LABEL_8:
    objc_msgSend(v14, "error");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v16 != 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[RBSLaunchContext identity](self->_context, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSLaunchContext explanation](self->_context, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@| %@; \"%@\">"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)execute:(id *)a3 error:(id *)a4
{
  return -[RBSLaunchRequest execute:assertion:error:](self, "execute:assertion:error:", a3, 0, a4);
}

- (BOOL)execute:(id *)a3
{
  return -[RBSLaunchRequest execute:assertion:error:](self, "execute:assertion:error:", 0, 0, a3);
}

- (BOOL)isEqual:(id)a3
{
  RBSLaunchRequest *v4;
  uint64_t v5;
  BOOL v6;
  RBSLaunchContext *context;

  v4 = (RBSLaunchRequest *)a3;
  v6 = 1;
  if (self != v4)
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class()
      || (context = self->_context, context != v4->_context) && !-[RBSLaunchContext isEqual:](context, "isEqual:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
