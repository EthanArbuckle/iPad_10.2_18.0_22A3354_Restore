@implementation RBSCoalitionLevelGrant

+ (id)grantWithCoalitionLevel:(unint64_t)a3
{
  return -[RBSCoalitionLevelGrant _initWithCoalitionLevel:]([RBSCoalitionLevelGrant alloc], a3);
}

- (id)_initWithCoalitionLevel:(id)result
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      if (a2 < 0x65)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("initialized with invalid level");
      v7 = v3;
      v8 = 74;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("initialized with unknown level");
      v7 = v3;
      v8 = 73;
    }
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithCoalitionLevel_, v7, CFSTR("RBSCoalitionLevelGrant.m"), v8, v6);

LABEL_4:
    v9.receiver = v3;
    v9.super_class = (Class)RBSCoalitionLevelGrant;
    result = objc_msgSendSuper2(&v9, sel__init);
    if (result)
      *((_QWORD *)result + 1) = a2;
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| level:%llu>"), v4, self->_coalitionLevel);

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSCoalitionLevelGrant;
  v4 = a3;
  -[RBSAttribute encodeWithRBSXPCCoder:](&v5, sel_encodeWithRBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_coalitionLevel, CFSTR("level"), v5.receiver, v5.super_class);

}

- (RBSCoalitionLevelGrant)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSCoalitionLevelGrant *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSCoalitionLevelGrant;
  v5 = -[RBSAttribute initWithRBSXPCCoder:](&v7, sel_initWithRBSXPCCoder_, v4);
  if (v5)
    v5->_coalitionLevel = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("level"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBSCoalitionLevelGrant *v4;
  RBSCoalitionLevelGrant *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (RBSCoalitionLevelGrant *)a3;
  v5 = v4;
  if (self == v4)
    v7 = 1;
  else
    v7 = v4
      && (v6 = objc_opt_class(), v6 == objc_opt_class())
      && -[RBSCoalitionLevelGrant coalitionLevel](v5, "coalitionLevel") == self->_coalitionLevel;

  return v7;
}

- (unint64_t)hash
{
  return self->_coalitionLevel;
}

- (unint64_t)coalitionLevel
{
  return self->_coalitionLevel;
}

@end
