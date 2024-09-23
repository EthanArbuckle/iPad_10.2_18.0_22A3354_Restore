@implementation WFUIKitActionInterfaceRequest

- (WFUIKitActionInterfaceRequest)initWithActionClassName:(id)a3 userInterfaceClassName:(id)a4 presentationSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  void *v12;
  WFUIKitActionInterfaceRequest *v13;
  uint64_t v14;
  NSString *actionClassName;
  uint64_t v16;
  NSString *userInterfaceClassName;
  WFUIKitActionInterfaceRequest *v18;
  void *v20;
  void *v21;
  objc_super v22;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIKitActionInterfaceRequest.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionClassName"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUIKitActionInterfaceRequest.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterfaceClassName"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)WFUIKitActionInterfaceRequest;
  v13 = -[WFUIKitActionInterfaceRequest init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    actionClassName = v13->_actionClassName;
    v13->_actionClassName = (NSString *)v14;

    v16 = objc_msgSend(v12, "copy");
    userInterfaceClassName = v13->_userInterfaceClassName;
    v13->_userInterfaceClassName = (NSString *)v16;

    v13->_presentationSize.width = width;
    v13->_presentationSize.height = height;
    v18 = v13;
  }

  return v13;
}

- (WFUIKitActionInterfaceRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  WFUIKitActionInterfaceRequest *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionClassName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInterfaceClassName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("presentationSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "wf_CGSizeValue");
  v9 = v8;
  v11 = v10;

  if (v5)
    v12 = v6 == 0;
  else
    v12 = 1;
  if (v12 || (v9 == *MEMORY[0x24BDBF148] ? (v13 = v11 == *(double *)(MEMORY[0x24BDBF148] + 8)) : (v13 = 0), v13))
  {
    v14 = 0;
  }
  else
  {
    self = -[WFUIKitActionInterfaceRequest initWithActionClassName:userInterfaceClassName:presentationSize:](self, "initWithActionClassName:userInterfaceClassName:presentationSize:", v5, v6, v9, v11);
    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFUIKitActionInterfaceRequest actionClassName](self, "actionClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionClassName"));

  -[WFUIKitActionInterfaceRequest userInterfaceClassName](self, "userInterfaceClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userInterfaceClassName"));

  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &self->_presentationSize, "{CGSize=dd}");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("presentationSize"));

}

- (NSString)actionClassName
{
  return self->_actionClassName;
}

- (NSString)userInterfaceClassName
{
  return self->_userInterfaceClassName;
}

- (CGSize)presentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_presentationSize.width;
  height = self->_presentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceClassName, 0);
  objc_storeStrong((id *)&self->_actionClassName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
