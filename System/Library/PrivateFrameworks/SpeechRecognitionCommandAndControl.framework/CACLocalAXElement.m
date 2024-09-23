@implementation CACLocalAXElement

- (id)description
{
  void *v2;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACLocalAXElement localElement](self, "localElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CACLocalAXElement localElement](self, "localElement");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("none");
  }
  -[CACLocalAXElement localElement](self, "localElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> - <%@: %p>"), v6, self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {

  }
  return v11;
}

- (id)localElement
{
  return self->_localElement;
}

- (void)setLocalElement:(id)a3
{
  objc_storeStrong(&self->_localElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_localElement, 0);
}

@end
