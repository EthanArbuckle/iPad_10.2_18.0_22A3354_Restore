@implementation SNTestFailure

- (SNTestFailure)initWithMessage:(id)a3
{
  id v5;
  SNTestFailure *v6;
  SNTestFailure *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNTestFailure;
  v6 = -[SNTestFailure init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (SNTestFailure)initWithMissingClass:(Class)a3
{
  SNTestFailure *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *message;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SNTestFailure;
  v4 = -[SNTestFailure init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed to find expected instance of class '%@'"), v6);
    v7 = objc_claimAutoreleasedReturnValue();
    message = v4->_message;
    v4->_message = (NSString *)v7;

  }
  return v4;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
