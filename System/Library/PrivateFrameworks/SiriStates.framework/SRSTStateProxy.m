@implementation SRSTStateProxy

- (SRSTStateProxy)initWithState:(id)a3
{
  id v3;
  SRSTStateProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTStateProxy;
  v3 = a3;
  v4 = -[SRSTStateProxy init](&v6, sel_init);
  -[SRSTStateProxy setState:](v4, "setState:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
