@implementation PRSModelContext

- (NSString)version
{
  return self->_version;
}

- (PRSModelContext)initWithModel:(id)a3 directivesManager:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  PRSModelContext *v11;
  PRSModelContext *v12;
  uint64_t v13;
  NSString *version;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PRSModelContext;
  v11 = -[PRSModelContext init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_model, a3);
    objc_storeStrong((id *)&v12->_directivesManager, a4);
    v12->_type = a5;
    objc_msgSend(v9, "getVersionString");
    v13 = objc_claimAutoreleasedReturnValue();
    version = v12->_version;
    v12->_version = (NSString *)v13;

  }
  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (SSCoreMLInterface)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (PRSDirectivesManager)directivesManager
{
  return self->_directivesManager;
}

- (void)setDirectivesManager:(id)a3
{
  objc_storeStrong((id *)&self->_directivesManager, a3);
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_directivesManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
