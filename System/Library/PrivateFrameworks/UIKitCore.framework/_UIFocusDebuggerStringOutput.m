@implementation _UIFocusDebuggerStringOutput

+ (id)outputWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:", v4);

  return v5;
}

- (_UIFocusDebuggerStringOutput)init
{
  return -[_UIFocusDebuggerStringOutput initWithString:](self, "initWithString:", &stru_1E16EDF20);
}

- (_UIFocusDebuggerStringOutput)initWithString:(id)a3
{
  id v5;
  _UIFocusDebuggerStringOutput *v6;
  uint64_t v7;
  NSString *outputString;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIFocusDebugger.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputString"));

  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusDebuggerStringOutput;
  v6 = -[_UIFocusDebuggerStringOutput init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    outputString = v6->_outputString;
    v6->_outputString = (NSString *)v7;

  }
  return v6;
}

- (NSString)description
{
  if (self->_outputString)
    return self->_outputString;
  else
    return (NSString *)&stru_1E16EDF20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputString, 0);
}

@end
