@implementation _PASArgOption

- (_PASArgOption)initWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6 required:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _PASArgOption *v17;
  _PASArgOption *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (objc_msgSend(v13, "length"))
  {
    if (!v14)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name.length > 0"));

    if (!v14)
      goto LABEL_5;
  }
  if (objc_msgSend(v14, "length") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!shortName || shortName.length == 1"));

  }
LABEL_5:
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("helpDescription"));

  }
  v24.receiver = self;
  v24.super_class = (Class)_PASArgOption;
  v17 = -[_PASArgOption init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortName, a4);
    objc_storeStrong((id *)&v18->_argMetavar, a5);
    objc_storeStrong((id *)&v18->_helpDescription, a6);
    v18->_required = a7;
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_PASArgOption name:%@ shortName:%@ help:%@ argMetavar:%@"), self->_name, self->_shortName, self->_helpDescription, self->_argMetavar);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)helpDescription
{
  return self->_helpDescription;
}

- (NSString)argMetavar
{
  return self->_argMetavar;
}

- (BOOL)required
{
  return self->_required;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argMetavar, 0);
  objc_storeStrong((id *)&self->_helpDescription, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)optionWithName:(id)a3 shortName:(id)a4 help:(id)a5
{
  return (id)objc_msgSend(a1, "optionWithName:shortName:argMetavar:help:", a3, a4, 0, a5);
}

+ (id)optionWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6
{
  return (id)objc_msgSend(a1, "optionWithName:shortName:argMetavar:help:required:", a3, a4, a5, a6, 0);
}

+ (id)optionWithName:(id)a3 shortName:(id)a4 argMetavar:(id)a5 help:(id)a6 required:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:shortName:argMetavar:help:required:", v15, v14, v13, v12, v7);

  return v16;
}

@end
