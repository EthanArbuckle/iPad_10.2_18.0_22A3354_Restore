@implementation SBSceneSnapshotRequest

- (SBSceneSnapshotRequest)initWithSize:(unint64_t)a3 orientation:(unint64_t)a4 userInterfaceStyle:(unint64_t)a5
{
  SBSceneSnapshotRequest *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSceneSnapshotRequest;
  result = -[SBSceneSnapshotRequest init](&v9, sel_init);
  if (result)
  {
    result->_size = a3;
    result->_orientation = a4;
    result->_userInterfaceStyle = a5;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)-[SBSceneSnapshotRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSceneSnapshotRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  id v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_size - 1;
  if (v5 > 5)
    v6 = CFSTR("current");
  else
    v6 = off_1E8EAC178[v5];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("size"));
  v8 = self->_orientation - 1;
  v9 = CFSTR("current");
  if (v8 <= 3)
    v9 = off_1E8EAC1A8[v8];
  v10 = (id)objc_msgSend(v4, "appendObject:withName:", v9, CFSTR("orientation"));
  if (self->_userInterfaceStyle)
    v11 = CFSTR("both");
  else
    v11 = CFSTR("current");
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("userInterfaceStyle"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneSnapshotRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end
