@implementation ResourceHintWithProperties

- (ResourceHintWithProperties)initWithResourceHint:(id)a3 andPid:(id)a4
{
  id v6;
  id v7;
  ResourceHintWithProperties *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(ResourceHintWithProperties);
  -[ResourceHintWithProperties setState:](v8, "setState:", objc_msgSend(v7, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  -[ResourceHintWithProperties setUuid:](v8, "setUuid:", v9);

  v10 = objc_msgSend(v7, "resourceType");
  -[ResourceHintWithProperties setResourceType:](v8, "setResourceType:", v10);
  -[ResourceHintWithProperties setPid:](v8, "setPid:", v6);

  return v8;
}

- (ResourceHintWithProperties)initWithProperties:(id)a3
{
  id v4;
  ResourceHintWithProperties *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  ResourceHintWithProperties *v12;

  v4 = a3;
  v5 = objc_alloc_init(ResourceHintWithProperties);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuid")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pid")));
    v10 = v9;
    if (!v6 || !v7 || !v8 || !v9)
    {

      v12 = 0;
      goto LABEL_9;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v6);
    -[ResourceHintWithProperties setUuid:](v5, "setUuid:", v11);

    -[ResourceHintWithProperties setResourceType:](v5, "setResourceType:", objc_msgSend(v7, "unsignedIntValue"));
    -[ResourceHintWithProperties setPid:](v5, "setPid:", v10);
    -[ResourceHintWithProperties setState:](v5, "setState:", objc_msgSend(v8, "unsignedIntValue"));

  }
  v12 = v5;
LABEL_9:

  return v12;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (void)setPid:(id)a3
{
  objc_storeStrong((id *)&self->_pid, a3);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
}

@end
