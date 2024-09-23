@implementation PDSResponse

- (PDSResponse)initWithStatus:(int64_t)a3 statusByUser:(id)a4 ttl:(int64_t)a5
{
  id v10;
  PDSResponse *v11;
  PDSResponse *v12;
  void *v14;
  objc_super v15;

  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSResponse.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statusByUser"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PDSResponse;
  v11 = -[PDSResponse init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_statusByUser, a4);
    v12->_ttl = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[PDSResponse status](self, "status");
  -[PDSResponse statusByUser](self, "statusByUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; status = %d; statusByUser = \"%@\">"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDictionary)statusByUser
{
  return self->_statusByUser;
}

- (int64_t)ttl
{
  return self->_ttl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusByUser, 0);
}

@end
