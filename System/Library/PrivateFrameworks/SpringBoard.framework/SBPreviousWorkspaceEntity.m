@implementation SBPreviousWorkspaceEntity

+ (id)entityWithPreviousLayoutRole:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPreviousLayoutRole:", a3);
}

- (SBPreviousWorkspaceEntity)initWithPreviousLayoutRole:(int64_t)a3
{
  SBPreviousWorkspaceEntity *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBPreviousWorkspaceEntity;
  result = -[SBWorkspaceEntity initWithIdentifier:displayChangeSettings:](&v5, sel_initWithIdentifier_displayChangeSettings_, 0, 0);
  if (result)
    result->_previousLayoutRole = a3;
  return result;
}

- (SBPreviousWorkspaceEntity)initWithIdentifier:(id)a3 displayChangeSettings:(id)a4
{
  return -[SBPreviousWorkspaceEntity initWithPreviousLayoutRole:](self, "initWithPreviousLayoutRole:", 0, a4);
}

- (BOOL)isPreviousWorkspaceEntity
{
  return 1;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPreviousWorkspaceEntity;
  -[SBWorkspaceEntity succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLayoutRoleDescription(self->_previousLayoutRole);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("previousLayoutRole"));

  return v3;
}

- (int64_t)previousLayoutRole
{
  return self->_previousLayoutRole;
}

@end
