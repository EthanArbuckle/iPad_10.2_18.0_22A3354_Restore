@implementation ACTDoubleKeyTap

- (ACTDoubleKeyTap)initWithFirstTap:(id)a3 secondTap:(id)a4
{
  id v7;
  id v8;
  ACTDoubleKeyTap *v9;
  ACTDoubleKeyTap *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACTDoubleKeyTap;
  v9 = -[ACTDoubleKeyTap init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstTap, a3);
    objc_storeStrong((id *)&v10->_secondTap, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTDoubleKeyTap firstTap](self, "firstTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTDoubleKeyTap secondTap](self, "secondTap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: firstTap=%@, secondTap=%@>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[ACTDoubleKeyTap firstTap](self, "firstTap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyWithTyper:log:", v7, v6);

  -[ACTDoubleKeyTap secondTap](self, "secondTap");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applyWithTyper:log:", v7, v6);

}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ACTUserAction twoKeyTapShortDescription](self, "twoKeyTapShortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("DoubleTap first/second: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ACTUserAction)firstTap
{
  return self->_firstTap;
}

- (ACTUserAction)secondTap
{
  return self->_secondTap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondTap, 0);
  objc_storeStrong((id *)&self->_firstTap, 0);
}

@end
