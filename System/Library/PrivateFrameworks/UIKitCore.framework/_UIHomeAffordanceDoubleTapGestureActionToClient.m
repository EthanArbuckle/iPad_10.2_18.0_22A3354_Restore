@implementation _UIHomeAffordanceDoubleTapGestureActionToClient

+ (id)actionForDoubleTapGestureDidSucceed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_1E1A978D8, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);
  return v7;
}

- (BOOL)didSucceed
{
  void *v2;
  void *v3;
  char v4;

  -[_UIHomeAffordanceDoubleTapGestureActionToClient info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIHomeAffordanceDoubleTapGestureActionToClient;
  -[_UIHomeAffordanceBSActionToClient appendDescriptionToStream:](&v6, sel_appendDescriptionToStream_, v4);
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[_UIHomeAffordanceDoubleTapGestureActionToClient didSucceed](self, "didSucceed"), CFSTR("didSucceed"));

}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
