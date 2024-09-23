@implementation ResourceHint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ResourceHint)initWithResourceType:(unint64_t)a3 andState:(unint64_t)a4
{
  ResourceHint *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  ResourceHint *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)ResourceHint;
  v6 = -[ResourceHint init](&v30, sel_init);
  v6->_resourceType = a3;
  v6->_state = a4;
  +[ResourceConnection sharedInstance](ResourceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v14 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[ResourceHint initWithResourceType:andState:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_10;
  }
  v9 = objc_msgSend(v7, "createResourceHint:", v6);
  v10 = _log;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[ResourceHint initWithResourceType:andState:].cold.2(v10, v22, v23, v24, v25, v26, v27, v28);
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    -[ResourceHint uuid](v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_2446D7000, v11, OS_LOG_TYPE_INFO, "Resource init uuid: %@", buf, 0xCu);

  }
  v13 = v6;
LABEL_11:

  return v13;
}

- (BOOL)updateState:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  -[ResourceHint setState:](self, "setState:", a3);
  +[ResourceConnection sharedInstance](ResourceConnection, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "updateResourceHint:", self);
  }
  else
  {
    v7 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      -[ResourceHint initWithResourceType:andState:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  unint64_t v2;

  v2 = -[ResourceHint resourceType](self, "resourceType");
  if (v2 > 9)
    return CFSTR("Unknown");
  else
    return off_25156B320[v2];
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  NSUUID *uuid;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_resourceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("resourceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("state"));

  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v7, "encodeObject:forKey:", uuid, CFSTR("uuid"));

}

- (ResourceHint)initWithCoder:(id)a3
{
  id v4;
  ResourceHint *v5;
  void *v6;
  void *v7;
  void *v8;
  ResourceHint *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ResourceHint;
  v5 = -[ResourceHint init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resourceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_resourceType = objc_msgSend(v6, "unsignedIntValue");
    v5->_state = objc_msgSend(v7, "unsignedIntValue");
    if (v8)
      objc_storeStrong((id *)&v5->_uuid, v8);
    v9 = v5;

  }
  return v5;
}

- (unint64_t)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(unint64_t)a3
{
  self->_resourceType = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithResourceType:(uint64_t)a3 andState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2446D7000, a1, a3, "Failed to initiate ResourceConnection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithResourceType:(uint64_t)a3 andState:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2446D7000, a1, a3, "Error creating resource hint", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
