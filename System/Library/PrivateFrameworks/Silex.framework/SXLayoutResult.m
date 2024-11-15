@implementation SXLayoutResult

- (SXLayoutResult)initWithLayoutBlueprint:(id)a3 DOM:(id)a4 duration:(double)a5
{
  id v9;
  id v10;
  SXLayoutResult *v11;
  SXLayoutResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXLayoutResult;
  v11 = -[SXLayoutResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_blueprint, a3);
    objc_storeStrong((id *)&v12->_DOM, a4);
    v12->_duration = a5;
  }

  return v12;
}

- (SXLayoutBlueprint)blueprint
{
  return self->_blueprint;
}

- (SXDOM)DOM
{
  return self->_DOM;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOM, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
}

@end
