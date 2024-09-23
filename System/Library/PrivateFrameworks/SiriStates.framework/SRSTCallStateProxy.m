@implementation SRSTCallStateProxy

- (SRSTCallStateProxy)initWithState:(id)a3
{
  id v3;
  SRSTCallStateProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRSTCallStateProxy;
  v3 = a3;
  v4 = -[SRSTCallStateProxy init](&v6, sel_init);
  -[SRSTCallStateProxy setState:](v4, "setState:", v3, v6.receiver, v6.super_class);

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
