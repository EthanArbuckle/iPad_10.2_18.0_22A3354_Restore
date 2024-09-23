@implementation SWEmbedAction

- (SWEmbedAction)initWithType:(unint64_t)a3 info:(id)a4
{
  id v7;
  SWEmbedAction *v8;
  SWEmbedAction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SWEmbedAction;
  v8 = -[SWEmbedAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_info, a4);
  }

  return v9;
}

- (BOOL)canHandle
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  SWEmbedAction *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (SWEmbedAction *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[SWEmbedAction type](self, "type");
      v6 = v5 == -[SWEmbedAction type](v4, "type");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  const __CFString *v3;

  if (-[SWEmbedAction type](self, "type") == 1)
  {
    v3 = CFSTR("url");
  }
  else if (-[SWEmbedAction type](self, "type") == 2)
  {
    v3 = CFSTR("share");
  }
  else if (-[SWEmbedAction type](self, "type") == 3)
  {
    v3 = CFSTR("close");
  }
  else
  {
    v3 = CFSTR("none");
  }
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; type: %@>"),
                       objc_opt_class(),
                       self,
                       v3);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
