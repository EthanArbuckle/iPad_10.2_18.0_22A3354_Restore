@implementation PSIReusableObject

- (PSIReusableObject)init
{
  PSIReusableObject *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSIReusableObject;
  result = -[PSIReusableObject init](&v3, sel_init);
  if (result)
    result->_isPreparedForReuse = 1;
  return result;
}

- (void)prepareForReuse
{
  *(_WORD *)&self->_isPreparedForReuse = 1;
  self->_isPreparedFromStatement = 0;
}

- (void)prepareFromStatement:(sqlite3_stmt *)a3
{
  void *v5;
  void *v6;

  if (!self->_isPreparedForReuse)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIReusableObject.m"), 34, 0);

  }
  if (self->_isPreparedFromStatement)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIReusableObject.m"), 35, 0);

  }
  self->_isPreparedForReuse = 0;
}

- (void)didPrepareFromStatement:(sqlite3_stmt *)a3
{
  void *v5;

  if (self->_isPreparingFromStatement)
  {
    if (self->_isPreparedFromStatement)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSIReusableObject.m"), 41, 0);

    }
    *(_WORD *)&self->_isPreparingFromStatement = 256;
  }
}

- (unint64_t)objectType
{
  PSIReusableObject *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)isPreparedFromStatement
{
  return self->_isPreparedFromStatement;
}

@end
