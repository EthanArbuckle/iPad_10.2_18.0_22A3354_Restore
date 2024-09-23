@implementation SXLayoutParameters

- (SXLayoutParameters)initWithLayoutOptions:(id)a3 layoutType:(unint64_t)a4 expectedDuration:(double)a5
{
  id v9;
  SXLayoutParameters *v10;
  SXLayoutParameters *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXLayoutParameters;
  v10 = -[SXLayoutParameters init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_layoutOptions, a3);
    v11->_layoutType = a4;
    v11->_expectedDuration = a5;
  }

  return v11;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = -[SXLayoutParameters layoutType](self, "layoutType");
  v4 = CFSTR("unknown");
  if (v3 == 2)
    v4 = CFSTR("update");
  if (v3 == 1)
    v5 = CFSTR("new");
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; type: %@;"), objc_opt_class(), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutParameters layoutOptions](self, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\noptions: \n%@"), v7);

  -[SXLayoutParameters expectedDuration](self, "expectedDuration");
  objc_msgSend(v6, "appendFormat:", CFSTR("\nexpectedDuration: \n%@"), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n>"));
  return v6;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
