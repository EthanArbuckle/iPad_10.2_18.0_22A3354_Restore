@implementation WFExecutionMetadata

- (WFExecutionMetadata)initWithUndoContext:(id)a3 didRunOpensIntent:(BOOL)a4
{
  id v7;
  WFExecutionMetadata *v8;
  WFExecutionMetadata *v9;
  WFExecutionMetadata *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFExecutionMetadata;
  v8 = -[WFExecutionMetadata init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_didRunOpensIntent = a4;
    objc_storeStrong((id *)&v8->_undoContext, a3);
    v10 = v9;
  }

  return v9;
}

- (WFExecutionMetadata)initWithCoder:(id)a3
{
  id v4;
  LNUndoContext *v5;
  LNUndoContext *undoContext;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("undoContext"));
  v5 = (LNUndoContext *)objc_claimAutoreleasedReturnValue();
  undoContext = self->_undoContext;
  self->_undoContext = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("didRunOpensIntent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  self->_didRunOpensIntent = objc_msgSend(v7, "BOOLValue");
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFExecutionMetadata undoContext](self, "undoContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("undoContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFExecutionMetadata didRunOpensIntent](self, "didRunOpensIntent"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("didRunOpensIntent"));

}

- (LNUndoContext)undoContext
{
  return self->_undoContext;
}

- (void)setUndoContext:(id)a3
{
  objc_storeStrong((id *)&self->_undoContext, a3);
}

- (BOOL)didRunOpensIntent
{
  return self->_didRunOpensIntent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoContext, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
