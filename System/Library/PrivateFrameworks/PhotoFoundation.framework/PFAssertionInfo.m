@implementation PFAssertionInfo

- (id)prettyMethodName
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[PFAssertionInfo functionName](self, "functionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PFAssertionInfo functionName](self, "functionName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[PFAssertionInfo isClassMethod](self, "isClassMethod");
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(-[PFAssertionInfo objectClass](self, "objectClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(-[PFAssertionInfo selector](self, "selector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 45;
    if (v5)
      v9 = 43;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%c[%@ %@]"), v9, v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssertionInfo prettyMethodName](self, "prettyMethodName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssertionInfo message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> failure in %@: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isWarning
{
  return !-[PFAssertionInfo isFatal](self, "isFatal");
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (Class)objectClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (void)setObjectClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isClassMethod
{
  return self->_isClassMethod;
}

- (void)setIsClassMethod:(BOOL)a3
{
  self->_isClassMethod = a3;
}

- (NSString)functionName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFileName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)lineNumber
{
  return self->_lineNumber;
}

- (void)setLineNumber:(unint64_t)a3
{
  self->_lineNumber = a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)backtrace
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBacktrace:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isFatal
{
  return self->_isFatal;
}

- (void)setIsFatal:(BOOL)a3
{
  self->_isFatal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backtrace, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_objectClass, 0);
}

@end
