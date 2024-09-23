@implementation SVXActivationInstrumentation

- (SVXActivationInstrumentation)initWithTurnIdentifier:(id)a3 buttonTimestamp:(unint64_t)a4
{
  id v7;
  SVXActivationInstrumentation *v8;
  SVXActivationInstrumentation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVXActivationInstrumentation;
  v8 = -[SVXActivationInstrumentation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_turnIdentifier, a3);
    v9->_buttonDownTimestamp = a4;
  }

  return v9;
}

- (NSUUID)turnIdentifier
{
  return self->_turnIdentifier;
}

- (unint64_t)buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
}

@end
