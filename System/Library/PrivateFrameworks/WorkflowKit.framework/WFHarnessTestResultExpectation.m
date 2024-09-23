@implementation WFHarnessTestResultExpectation

- (WFHarnessTestResultExpectation)initWithBlock:(id)a3 filePath:(id)a4 lineNumber:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  WFHarnessTestResultExpectation *v12;
  void *v13;
  id block;
  WFHarnessTestResultExpectation *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestResultExpectation.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFHarnessTestResultExpectation.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filePath"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFHarnessTestResultExpectation;
  v12 = -[WFHarnessTestResultExpectation init](&v19, sel_init);
  if (v12)
  {
    v13 = _Block_copy(v9);
    block = v12->_block;
    v12->_block = v13;

    objc_storeStrong((id *)&v12->_filePath, a4);
    v12->_lineNumber = a5;
    v15 = v12;
  }

  return v12;
}

- (void)testWithResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(id, id, id);

  v6 = a4;
  v7 = a3;
  -[WFHarnessTestResultExpectation block](self, "block");
  v8 = (void (**)(id, id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v7, v6);

}

- (NSString)filePath
{
  return self->_filePath;
}

- (int64_t)lineNumber
{
  return self->_lineNumber;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
