@implementation UIWindowSceneProminentPlacement

+ (unint64_t)_placementType
{
  return 2;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneProminentPlacement;
  result = -[UIWindowScenePlacement _init](&v3, sel__init);
  if (result)
    *((_BYTE *)result + 8) = 0;
  return result;
}

+ (UIWindowSceneProminentPlacement)prominentPlacement
{
  return (UIWindowSceneProminentPlacement *)(id)objc_msgSend(objc_alloc((Class)a1), "_init");
}

+ (id)_largeProminentPlacement
{
  void *v2;

  objc_msgSend(a1, "prominentPlacement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setPrefersLargeSize:", 1);
  return v2;
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0DC5C20]);
  objc_msgSend(v4, "setPrefersLargeSize:", -[UIWindowSceneProminentPlacement _prefersLargeSize](self, "_prefersLargeSize"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWindowSceneProminentPlacement;
  v4 = -[UIWindowScenePlacement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_setPrefersLargeSize:", -[UIWindowSceneProminentPlacement _prefersLargeSize](self, "_prefersLargeSize"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIWindowSceneProminentPlacement;
  if (-[UIWindowScenePlacement isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[UIWindowSceneProminentPlacement _prefersLargeSize](self, "_prefersLargeSize");
    v6 = v5 ^ objc_msgSend(v4, "_prefersLargeSize") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_requestCenterSlot
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWindowSceneProminentPlacement;
  -[UIWindowScenePlacement descriptionBuilderWithMultilinePrefix:](&v4, sel_descriptionBuilderWithMultilinePrefix_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_prefersLargeSize
{
  return self->_prefersLargeSize;
}

- (void)_setPrefersLargeSize:(BOOL)a3
{
  self->_prefersLargeSize = a3;
}

@end
