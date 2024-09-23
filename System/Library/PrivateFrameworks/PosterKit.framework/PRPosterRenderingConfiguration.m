@implementation PRPosterRenderingConfiguration

+ (PRPosterRenderingConfiguration)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (PRPosterRenderingConfiguration *)+[PRPosterRenderingConfiguration allocWithZone:](PRImmutablePosterRenderingConfiguration, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PRPosterRenderingConfiguration;
  return (PRPosterRenderingConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (PRPosterRenderingConfiguration)init
{
  return -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](self, "initWithDepthEffectDisabled:parallaxEnabled:", 0, 0);
}

- (PRPosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  PRImmutablePosterRenderingConfiguration *v9;
  PRPosterRenderingConfiguration *p_super;
  objc_super v12;

  v4 = a4;
  v5 = a3;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PRPosterRenderingConfiguration isMemberOfClass:](self, "isMemberOfClass:", v7);

  if (v8)
  {
    v9 = -[PRImmutablePosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:]([PRImmutablePosterRenderingConfiguration alloc], "initWithDepthEffectDisabled:parallaxEnabled:", v5, v4);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PRPosterRenderingConfiguration;
    v9 = -[PRPosterRenderingConfiguration init](&v12, sel_init);
    self = &v9->super;
  }
  p_super = &v9->super;

  return p_super;
}

- (PRPosterRenderingConfiguration)initWithRenderingConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "isDepthEffectDisabled");
  v6 = objc_msgSend(v4, "isParallaxEnabled");

  return -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](self, "initWithDepthEffectDisabled:parallaxEnabled:", v5, v6);
}

- (BOOL)isEqual:(id)a3
{
  PRPosterRenderingConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRPosterRenderingConfiguration *v7;
  int v8;
  int v9;
  int v10;

  v4 = (PRPosterRenderingConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = -[PRPosterRenderingConfiguration isDepthEffectDisabled](self, "isDepthEffectDisabled");
      if (v8 == -[PRPosterRenderingConfiguration isDepthEffectDisabled](v7, "isDepthEffectDisabled"))
      {
        v10 = -[PRPosterRenderingConfiguration isParallaxEnabled](self, "isParallaxEnabled");
        v9 = v10 ^ -[PRPosterRenderingConfiguration isParallaxEnabled](v7, "isParallaxEnabled") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = -[PRPosterRenderingConfiguration isDepthEffectDisabled](self, "isDepthEffectDisabled");
  v4 = -[PRPosterRenderingConfiguration isParallaxEnabled](self, "isParallaxEnabled");
  v5 = 2;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterRenderingConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __45__PRPosterRenderingConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __45__PRPosterRenderingConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (Class)classForArchiver
{
  return (Class)objc_opt_self();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PRPosterRenderingConfiguration initWithRenderingConfiguration:](+[PRPosterRenderingConfiguration allocWithZone:](PRMutablePosterRenderingConfiguration, "allocWithZone:", a3), "initWithRenderingConfiguration:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterRenderingConfiguration isDepthEffectDisabled](self, "isDepthEffectDisabled"), CFSTR("depthEffectDisabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterRenderingConfiguration isParallaxEnabled](self, "isParallaxEnabled"), CFSTR("parallaxEnabled"));

}

- (PRPosterRenderingConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("depthEffectDisabled"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parallaxEnabled"));

  return -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:](self, "initWithDepthEffectDisabled:parallaxEnabled:", v5, v6);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterRenderingConfiguration isDepthEffectDisabled](self, "isDepthEffectDisabled"), CFSTR("depthEffectDisabled"));
  v5 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterRenderingConfiguration isParallaxEnabled](self, "isParallaxEnabled"), CFSTR("parallaxEnabled"));

}

@end
