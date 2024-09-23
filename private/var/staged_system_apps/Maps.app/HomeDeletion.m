@implementation HomeDeletion

- (HomeDeletion)initWithObject:(id)a3 indexPath:(id)a4 identifierPath:(id)a5 contextualActionCompletionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HomeDeletion *v15;
  HomeDeletion *v16;
  id v17;
  id contextualActionCompletionHandler;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HomeDeletion;
  v15 = -[HomeDeletion init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_object, a3);
    objc_storeStrong((id *)&v16->_indexPath, a4);
    objc_storeStrong((id *)&v16->_identifierPath, a5);
    v17 = objc_retainBlock(v14);
    contextualActionCompletionHandler = v16->_contextualActionCompletionHandler;
    v16->_contextualActionCompletionHandler = v17;

  }
  return v16;
}

- (void)markAsTentativelyDeleted
{
  if (!self->_tentativelyDeleted && !self->_completed)
    self->_tentativelyDeleted = 1;
}

- (void)markAsCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  if (!self->_completed)
  {
    self->_completed = 1;
    self->_success = a3;
    if (!a3)
    {
      v8 = v7;
      objc_storeStrong((id *)&self->_error, a4);
      v7 = v8;
    }
  }

}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  IdentifierPath *identifierPath;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __int128 v18;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (objc_class *)objc_opt_class(self->_object);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18 = *(_OWORD *)&self->_object;
  identifierPath = self->_identifierPath;
  v10 = sub_10039E4FC(self->_tentativelyDeleted);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_10039E4FC(self->_completed);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = sub_10039E4FC(self->_success);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; object = <%@: %p>, indexPath = %@, identifierPath = %@, tentativelyDeleted = %@, completed = %@, success = %@, error = %@>"),
                    v5,
                    self,
                    v8,
                    v18,
                    identifierPath,
                    v11,
                    v13,
                    v15,
                    self->_error));

  return v16;
}

- (id)object
{
  return self->_object;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (IdentifierPath)identifierPath
{
  return self->_identifierPath;
}

- (id)contextualActionCompletionHandler
{
  return self->_contextualActionCompletionHandler;
}

- (BOOL)tentativelyDeleted
{
  return self->_tentativelyDeleted;
}

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_contextualActionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_identifierPath, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
