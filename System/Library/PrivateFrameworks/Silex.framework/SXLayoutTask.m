@implementation SXLayoutTask

- (SXLayoutTask)initWithOptions:(id)a3 instructions:(id)a4
{
  id v7;
  id v8;
  SXLayoutTask *v9;
  SXLayoutTask *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SXLayoutTask;
  v9 = -[SXLayoutTask init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v10->_options, a3);
    objc_storeStrong((id *)&v10->_instructions, a4);
    v10->_startTime = CACurrentMediaTime();
  }

  return v10;
}

- (SXLayoutTask)initWithOptions:(id)a3 instructions:(id)a4 blueprint:(id)a5 DOM:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXLayoutTask *v15;
  SXLayoutTask *v16;
  void *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  SXLayoutBlueprint *blueprint;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SXLayoutTask;
  v15 = -[SXLayoutTask init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_type = 1;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v18;

    objc_storeStrong((id *)&v16->_options, a3);
    objc_storeStrong((id *)&v16->_instructions, a4);
    v20 = objc_msgSend(v13, "copy");
    blueprint = v16->_blueprint;
    v16->_blueprint = (SXLayoutBlueprint *)v20;

    objc_storeStrong((id *)&v16->_DOM, a6);
    v16->_startTime = CACurrentMediaTime();
  }

  return v16;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[SXLayoutTask type](self, "type");
  v4 = CFSTR("update");
  if (v3 != 1)
    v4 = 0;
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("new");
  v6 = (void *)MEMORY[0x24BDD16A8];
  v7 = objc_opt_class();
  -[SXLayoutTask identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p; type: %@; identifier: %@"), v7, self, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXLayoutTask options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\noptions: \n%@"), v10);

  -[SXLayoutTask instructions](self, "instructions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR("\ninstructions: \n%@"), v11);

  objc_msgSend(v9, "appendFormat:", CFSTR("\n>"));
  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SXLayoutOptions)options
{
  return self->_options;
}

- (SXLayoutInstructions)instructions
{
  return self->_instructions;
}

- (SXLayoutBlueprint)blueprint
{
  return self->_blueprint;
}

- (SXDOM)DOM
{
  return self->_DOM;
}

- (double)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DOM, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
