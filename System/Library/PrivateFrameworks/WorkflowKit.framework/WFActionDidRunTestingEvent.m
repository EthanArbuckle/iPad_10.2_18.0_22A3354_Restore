@implementation WFActionDidRunTestingEvent

- (WFActionDidRunTestingEvent)initWithAction:(id)a3 output:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  WFActionDidRunTestingEvent *v11;
  WFActionDidRunTestingEvent *v12;
  WFActionDidRunTestingEvent *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFActionDidRunTestingEvent;
  v11 = -[WFActionTestingEvent initWithAction:](&v15, sel_initWithAction_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_output, a4);
    objc_storeStrong((id *)&v12->_error, a5);
    v13 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[WFContentCollection description](self->_output, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x33)
  {
    objc_msgSend(v3, "substringToIndex:", 50);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("…"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p, output: %@, error: %@>"), v8, self, v3, self->_error);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (WFContentCollection)output
{
  return self->_output;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

@end
