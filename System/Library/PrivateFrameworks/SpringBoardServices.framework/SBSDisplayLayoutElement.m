@implementation SBSDisplayLayoutElement

- (BOOL)isSpringBoardElement
{
  return 1;
}

- (void)setLayoutRole:(int64_t)a3
{
  void *v4;
  id v5;

  -[SBSDisplayLayoutElement otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 1);

}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSDisplayLayoutElement;
  -[SBSDisplayLayoutElement succinctDescriptionBuilder](&v9, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBSDisplayLayoutRoleDescription(-[SBSDisplayLayoutElement layoutRole](self, "layoutRole"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("role"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBSDisplayLayoutElement sb_isTransitioning](self, "sb_isTransitioning"), CFSTR("transitioning"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBSDisplayLayoutElement sb_isStashedPIP](self, "sb_isStashedPIP"), CFSTR("stashedPIP"), 1);
  return v3;
}

- (BOOL)sb_isStashedPIP
{
  void *v2;
  char v3;

  -[SBSDisplayLayoutElement otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3);

  return v3;
}

- (BOOL)sb_isTransitioning
{
  void *v2;
  char v3;

  -[SBSDisplayLayoutElement otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2);

  return v3;
}

- (int64_t)layoutRole
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBSDisplayLayoutElement otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (SBSDisplayLayoutElement)initWithIdentifier:(id)a3 layoutRole:(int64_t)a4
{
  SBSDisplayLayoutElement *v5;
  SBSDisplayLayoutElement *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSDisplayLayoutElement;
  v5 = -[SBSDisplayLayoutElement initWithIdentifier:](&v9, sel_initWithIdentifier_, a3);
  v6 = v5;
  if (v5)
  {
    -[SBSDisplayLayoutElement otherSettings](v5, "otherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forSetting:", CFSTR("SpringBoard"), 0);

    -[SBSDisplayLayoutElement setLayoutRole:](v6, "setLayoutRole:", a4);
  }
  return v6;
}

- (void)sb_setTransitioning:(BOOL)a3
{
  id v3;

  -[SBSDisplayLayoutElement otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 2);

}

- (void)sb_setStashedPIP:(BOOL)a3
{
  id v3;

  -[SBSDisplayLayoutElement otherSettings](self, "otherSettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFlag:forSetting:", BSSettingFlagForBool(), 3);

}

@end
