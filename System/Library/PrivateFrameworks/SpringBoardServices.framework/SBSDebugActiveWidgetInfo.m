@implementation SBSDebugActiveWidgetInfo

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  _QWORD *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v4[1] = self->_liveWidgetCount;
    v4[2] = self->_staticWidgetCount;
    v4[3] = self->_fakeWidgetCount;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t liveWidgetCount;
  id v5;

  liveWidgetCount = self->_liveWidgetCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", liveWidgetCount, CFSTR("liveWidgetCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_staticWidgetCount, CFSTR("staticWidgetCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fakeWidgetCount, CFSTR("fakeWidgetCount"));

}

- (SBSDebugActiveWidgetInfo)initWithCoder:(id)a3
{
  id v4;
  SBSDebugActiveWidgetInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSDebugActiveWidgetInfo;
  v5 = -[SBSDebugActiveWidgetInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_liveWidgetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("liveWidgetCount"));
    v5->_staticWidgetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("staticWidgetCount"));
    v5->_fakeWidgetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fakeWidgetCount"));
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  unint64_t liveWidgetCount;
  id v5;

  liveWidgetCount = self->_liveWidgetCount;
  v5 = a3;
  objc_msgSend(v5, "encodeUInt64:forKey:", liveWidgetCount, CFSTR("liveWidgetCount"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_staticWidgetCount, CFSTR("staticWidgetCount"));
  objc_msgSend(v5, "encodeUInt64:forKey:", self->_fakeWidgetCount, CFSTR("fakeWidgetCount"));

}

- (SBSDebugActiveWidgetInfo)initWithBSXPCCoder:(id)a3
{
  id v4;
  SBSDebugActiveWidgetInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSDebugActiveWidgetInfo;
  v5 = -[SBSDebugActiveWidgetInfo init](&v7, sel_init);
  if (v5)
  {
    v5->_liveWidgetCount = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("liveWidgetCount"));
    v5->_staticWidgetCount = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("staticWidgetCount"));
    v5->_fakeWidgetCount = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("fakeWidgetCount"));
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_staticWidgetCount + self->_liveWidgetCount + self->_fakeWidgetCount;
}

- (BOOL)isEqual:(id)a3
{
  SBSDebugActiveWidgetInfo *v4;
  void *v5;
  char isKindOfClass;
  SBSDebugActiveWidgetInfo *v7;
  BOOL v8;

  v4 = (SBSDebugActiveWidgetInfo *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = self->_liveWidgetCount == v7->_liveWidgetCount
        && self->_staticWidgetCount == v7->_staticWidgetCount
        && self->_fakeWidgetCount == v7->_fakeWidgetCount;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)-[SBSDebugActiveWidgetInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSDebugActiveWidgetInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBSDebugActiveWidgetInfo liveWidgetCount](self, "liveWidgetCount"), CFSTR("liveWidgetCount"));
  v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBSDebugActiveWidgetInfo staticWidgetCount](self, "staticWidgetCount"), CFSTR("staticWidgetCount"));
  v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBSDebugActiveWidgetInfo fakeWidgetCount](self, "fakeWidgetCount"), CFSTR("fakeWidgetCount"));
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSDebugActiveWidgetInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (unint64_t)liveWidgetCount
{
  return self->_liveWidgetCount;
}

- (void)setLiveWidgetCount:(unint64_t)a3
{
  self->_liveWidgetCount = a3;
}

- (unint64_t)staticWidgetCount
{
  return self->_staticWidgetCount;
}

- (void)setStaticWidgetCount:(unint64_t)a3
{
  self->_staticWidgetCount = a3;
}

- (unint64_t)fakeWidgetCount
{
  return self->_fakeWidgetCount;
}

- (void)setFakeWidgetCount:(unint64_t)a3
{
  self->_fakeWidgetCount = a3;
}

@end
