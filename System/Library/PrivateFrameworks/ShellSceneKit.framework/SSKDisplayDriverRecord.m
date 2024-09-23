@implementation SSKDisplayDriverRecord

- (SSKDisplayDriverRecord)initWithProfile:(id)a3
{
  id v6;
  SSKDisplayDriverRecord *v7;
  SSKDisplayDriverRecord *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SSKDisplayDriverRecord;
  v7 = -[SSKDisplayDriverRecord init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_profile, a3);
    v8->_dissociated = 0;
  }

  return v8;
}

- (SSKDisplayDriverRecord)initWithProfile:(id)a3 rootDisplay:(id)a4
{
  id v7;
  id v8;
  SSKDisplayDriverRecord *v9;
  SSKDisplayDriverRecord *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isRootIdentity") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[rootDisplay isRootIdentity]"));

  }
  v9 = -[SSKDisplayDriverRecord initWithProfile:](self, "initWithProfile:", v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_displayIdentity, a4);

  return v10;
}

- (unint64_t)hash
{
  return -[SSKDisplayProfile hash](self->_profile, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  SSKDisplayProfile *profile;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  profile = self->_profile;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__SSKDisplayDriverRecord_isEqual___block_invoke;
  v10[3] = &unk_25171C230;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", profile, v10);
  LOBYTE(profile) = objc_msgSend(v5, "isEqual");

  return (char)profile;
}

id __34__SSKDisplayDriverRecord_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (void)associateDisplay:(id)a3
{
  FBSDisplayIdentity *v5;
  FBSDisplayIdentity *displayIdentity;
  void *v7;
  void *v8;
  void *v9;

  v5 = (FBSDisplayIdentity *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  if (self->_displayIdentity)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 57, CFSTR("can't call twice. first: %@; second: %@"),
      self->_displayIdentity,
      v5);

  }
  if (self->_controller)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 58, CFSTR("associating display after controller. %@"), self->_controller);

  }
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v5;

}

- (void)associateController:(id)a3 assertion:(id)a4
{
  SSKDisplayControlling *v7;
  SSKDisplayAssertion *v8;
  SSKDisplayAssertion *v9;
  SSKDisplayControlling *controller;
  SSKDisplayAssertion *assertion;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SSKDisplayControlling *v16;

  v7 = (SSKDisplayControlling *)a3;
  v8 = (SSKDisplayAssertion *)a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("controller"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

LABEL_3:
  if (self->_controller)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 68, CFSTR("can't call twice.\nfirst: %@\nsecond: %@"), self->_controller, v7);

  }
  if (!self->_displayIdentity)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 69, CFSTR("associating controller before display. %@"), v7);

  }
  controller = self->_controller;
  self->_controller = v7;
  v16 = v7;

  assertion = self->_assertion;
  self->_assertion = v9;

}

- (void)dissociateFromController
{
  void *v4;
  void *v5;

  if (self->_dissociated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 75, CFSTR("can't call twice."));

  }
  if (!self->_controller)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSKDisplayDriverRecord.m"), 76, CFSTR("no controller to dissociate from"));

  }
  self->_dissociated = 1;
}

- (BOOL)isValid
{
  return !self->_dissociated;
}

- (NSString)state
{
  if (!self->_displayIdentity)
    return (NSString *)CFSTR(".ProfileAdded");
  if (!self->_controller)
    return (NSString *)CFSTR(".DisplayTransformed");
  if (self->_dissociated)
    return (NSString *)CFSTR(".AwaitingDisconnect");
  return (NSString *)CFSTR(".DisplayConnected");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BE0BE10], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  SSKDisplayControlling *controller;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SSKDisplayDriverRecord *v12;

  v4 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__SSKDisplayDriverRecord_appendDescriptionToFormatter___block_invoke;
  v10[3] = &unk_25171C128;
  v9 = v4;
  v11 = v9;
  v12 = self;
  objc_msgSend(v9, "appendProem:block:", self, v10);
  v5 = (id)objc_msgSend(v9, "appendObject:withName:", self->_profile, 0);
  v6 = (id)objc_msgSend(v9, "appendObject:withName:", self->_displayIdentity, 0);
  controller = self->_controller;
  if (controller)
  {
    objc_msgSend(v9, "appendProem:block:", controller, &__block_literal_global_0);
    v8 = (id)objc_msgSend(v9, "appendBool:withName:ifEqualTo:", self->_dissociated, CFSTR("dissociated"), 1);
  }

}

void __55__SSKDisplayDriverRecord_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, 0);

}

- (SSKDisplayProfile)profile
{
  return self->_profile;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (SSKDisplayControlling)controller
{
  return self->_controller;
}

- (SSKDisplayAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
