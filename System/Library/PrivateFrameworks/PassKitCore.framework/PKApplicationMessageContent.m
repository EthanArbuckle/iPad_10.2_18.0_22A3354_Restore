@implementation PKApplicationMessageContent

- (PKApplicationMessageContent)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageContent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKApplicationMessageContent *v6;
  PKApplicationMessageContent *v8;
  PKApplicationMessageGroupDescriptor *v9;
  PKApplicationMessageGroupDescriptor *group;
  PKApplicationMessageAction *v11;
  PKApplicationMessageAction *action;
  objc_super v13;

  v4 = a3;
  if (!objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"))
    && objc_opt_class()
    && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!self
      || (v13.receiver = self,
          v13.super_class = (Class)PKApplicationMessageContent,
          (v8 = -[PKApplicationMessageContent init](&v13, sel_init)) == 0))
    {
      self = 0;
      goto LABEL_11;
    }
    self = v8;
    v8->_type = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
    v9 = (PKApplicationMessageGroupDescriptor *)objc_claimAutoreleasedReturnValue();
    group = self->_group;
    self->_group = v9;

    if (self->_group)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
      v11 = (PKApplicationMessageAction *)objc_claimAutoreleasedReturnValue();
      action = self->_action;
      self->_action = v11;

LABEL_11:
      self = self;
      v6 = self;
      goto LABEL_3;
    }
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKApplicationMessageContent"), 0, 0);
  objc_msgSend(v4, "failWithError:", v5);

  v6 = 0;
LABEL_3:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_group, CFSTR("group"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));

}

- (PKApplicationMessageContentDefault)contentTypeDefault
{
  if (self->_type)
    self = 0;
  return (PKApplicationMessageContentDefault *)self;
}

- (int64_t)type
{
  return self->_type;
}

- (PKApplicationMessageGroupDescriptor)group
{
  return self->_group;
}

- (PKApplicationMessageAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
