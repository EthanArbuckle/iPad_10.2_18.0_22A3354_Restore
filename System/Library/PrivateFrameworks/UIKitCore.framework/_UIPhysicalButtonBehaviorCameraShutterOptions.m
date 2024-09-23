@implementation _UIPhysicalButtonBehaviorCameraShutterOptions

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return -[_UIPhysicalButtonBehaviorOptions isEqual:](&v4, sel_isEqual_, a3);
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[_UIPhysicalButtonBehaviorOptions hash](&v7, sel_hash));
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_UIPhysicalButtonBehaviorCameraShutterOptions _initWithBehavior:]([_UIPhysicalButtonBehaviorCameraShutterOptions alloc], "_initWithBehavior:", -[_UIPhysicalButtonBehaviorOptions _behavior](self, "_behavior"));
}

- (id)_initWithBehavior:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return -[_UIPhysicalButtonBehaviorOptions _initWithBehavior:](&v4, sel__initWithBehavior_, a3);
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  -[_UIPhysicalButtonBehaviorOptions encodeWithBSXPCCoder:](&v3, sel_encodeWithBSXPCCoder_, a3);
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithBSXPCCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return -[_UIPhysicalButtonBehaviorOptions initWithBSXPCCoder:](&v4, sel_initWithBSXPCCoder_, a3);
}

+ (id)behaviorOptions
{
  return -[_UIPhysicalButtonBehaviorCameraShutterOptions _initWithBehavior:]([_UIPhysicalButtonBehaviorCameraShutterOptions alloc], "_initWithBehavior:", 0);
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButton.m"), 469, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonBehaviorCameraShutterOptions init]", objc_opt_class());

  return 0;
}

- (id)debugDescription
{
  return -[_UIPhysicalButtonBehaviorCameraShutterOptions debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonBehaviorCameraShutterOptions succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  -[_UIPhysicalButtonBehaviorOptions succinctDescriptionBuilder](&v3, sel_succinctDescriptionBuilder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonBehaviorCameraShutterOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonBehaviorCameraShutterOptions descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  -[_UIPhysicalButtonBehaviorOptions descriptionBuilderWithMultilinePrefix:](&v4, sel_descriptionBuilderWithMultilinePrefix_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  -[_UIPhysicalButtonBehaviorOptions encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return -[_UIPhysicalButtonBehaviorOptions initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  -[_UIPhysicalButtonBehaviorOptions encodeWithXPCDictionary:](&v3, sel_encodeWithXPCDictionary_, a3);
}

- (_UIPhysicalButtonBehaviorCameraShutterOptions)initWithXPCDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPhysicalButtonBehaviorCameraShutterOptions;
  return -[_UIPhysicalButtonBehaviorOptions initWithXPCDictionary:](&v4, sel_initWithXPCDictionary_, a3);
}

@end
