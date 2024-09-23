@implementation SPQueryResponse

- (NSArray)resultSections
{
  return self->_resultSections;
}

- (unint64_t)state
{
  return self->_state;
}

- (SPQueryTask)task
{
  return self->_task;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEntityString, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_resultSections, 0);
}

- (void)setResultSections:(id)a3
{
  objc_storeStrong((id *)&self->_resultSections, a3);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setSessionEntityString:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEntityString, a3);
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (NSString)sessionEntityString
{
  return self->_sessionEntityString;
}

- (SPQueryResponse)initWithTask:(id)a3
{
  id v4;
  SPQueryResponse *v5;
  SPQueryResponse *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SPQueryResponse;
  v5 = -[SPQueryResponse init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SPQueryResponse setTask:](v5, "setTask:", v4);

  return v6;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (SPQueryResponse)init
{
  return -[SPQueryResponse initWithTask:](self, "initWithTask:", 0);
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SPQueryResponse kind](self, "kind");
  v5 = -[SPQueryResponse state](self, "state");
  -[SPQueryResponse task](self, "task");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryResponse resultSections](self, "resultSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("kind:%lu state:%luu task:%@ sections:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copy
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  -[SPQueryResponse task](self, "task");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTask:", v4);

  -[SPQueryResponse resultSections](self, "resultSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResultSections:", v6);

  -[SPQueryResponse sessionEntityString](self, "sessionEntityString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionEntityString:", v7);

  objc_msgSend(v5, "setState:", -[SPQueryResponse state](self, "state"));
  objc_msgSend(v5, "setKind:", -[SPQueryResponse kind](self, "kind"));
  return v5;
}

@end
