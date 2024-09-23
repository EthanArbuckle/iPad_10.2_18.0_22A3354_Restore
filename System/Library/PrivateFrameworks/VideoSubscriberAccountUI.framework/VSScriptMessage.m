@implementation VSScriptMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)VSScriptMessage;
  -[VSScriptMessage description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptMessage source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptMessage target](self, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSScriptMessage body](self, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ From:%@ To:%@ Body:%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (VSScriptSecurityOrigin)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (VSScriptSecurityOrigin)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
