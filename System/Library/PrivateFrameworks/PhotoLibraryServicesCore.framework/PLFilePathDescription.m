@implementation PLFilePathDescription

- (PLFilePathDescription)init
{
  return -[PLFilePathDescription initWithPath:](self, "initWithPath:", 0);
}

- (PLFilePathDescription)initWithPath:(id)a3
{
  id v4;
  PLFilePathDescription *v5;
  uint64_t v6;
  NSString *path;
  PLFilePathDescription *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFilePathDescription;
  v5 = -[PLFilePathDescription init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  return self->_path;
}

- (id)redactedDescription
{
  void *v2;

  if (self->_path)
  {
    +[PLFileUtilities redactedDescriptionForPath:](PLFileUtilities, "redactedDescriptionForPath:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

+ (id)descriptionWithPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);

  return v5;
}

+ (id)descriptionWithFileURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithPath:", v6);
  return v7;
}

@end
