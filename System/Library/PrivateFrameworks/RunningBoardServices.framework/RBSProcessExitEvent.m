@implementation RBSProcessExitEvent

- (id)copyWithZone:(_NSZone *)a3
{
  RBSProcessExitEvent *v4;

  v4 = objc_alloc_init(RBSProcessExitEvent);
  -[RBSProcessExitEvent setProcess:](v4, "setProcess:", self->_process);
  -[RBSProcessExitEvent setContext:](v4, "setContext:", self->_context);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessExitEvent *v4;
  uint64_t v5;
  char v6;
  RBSProcessHandle *process;
  RBSProcessHandle *v8;
  RBSProcessExitContext *context;
  RBSProcessExitContext *v10;

  v4 = (RBSProcessExitEvent *)a3;
  if (self == v4)
    goto LABEL_12;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    v6 = 0;
    goto LABEL_13;
  }
  process = self->_process;
  v8 = v4->_process;
  if (process != v8)
  {
    v6 = 0;
    if (!process || !v8)
      goto LABEL_13;
    if (!-[RBSProcessHandle isEqual:](process, "isEqual:"))
      goto LABEL_3;
  }
  context = self->_context;
  v10 = v4->_context;
  if (context == v10)
  {
LABEL_12:
    v6 = 1;
    goto LABEL_13;
  }
  v6 = 0;
  if (context && v10)
    v6 = -[RBSProcessExitContext isEqual:](context, "isEqual:");
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  return -[RBSProcessHandle hash](self->_process, "hash");
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| process:%@ context:%@>"), v4, self->_process, self->_context);

  return (NSString *)v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  RBSProcessHandle *process;
  id v5;

  process = self->_process;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", process, CFSTR("_process"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_context, CFSTR("_context"));

}

- (RBSProcessExitEvent)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessExitEvent *v5;
  uint64_t v6;
  RBSProcessHandle *process;
  uint64_t v8;
  RBSProcessExitContext *context;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessExitEvent;
  v5 = -[RBSProcessExitEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_process"));
    v6 = objc_claimAutoreleasedReturnValue();
    process = v5->_process;
    v5->_process = (RBSProcessHandle *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_context"));
    v8 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (RBSProcessExitContext *)v8;

  }
  return v5;
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
  objc_storeStrong((id *)&self->_process, a3);
}

- (RBSProcessExitContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end
