@implementation SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider

- (SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider)initWithFBSScene:(id)a3
{
  id v4;
  SBFSAlwaysOnLiveRenderingAssertionFBSScene *v5;

  v4 = a3;
  v5 = -[SBFSAlwaysOnLiveRenderingAssertionFBSScene initWithScene:]([SBFSAlwaysOnLiveRenderingAssertionFBSScene alloc], "initWithScene:", v4);

  return &v5->super;
}

- (SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider)initWithUIScene:(id)a3
{
  id v4;
  SBFSAlwaysOnLiveRenderingAssertionUIScene *v5;

  v4 = a3;
  v5 = -[SBFSAlwaysOnLiveRenderingAssertionUIScene initWithScene:]([SBFSAlwaysOnLiveRenderingAssertionUIScene alloc], "initWithScene:", v4);

  return &v5->super;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider;
  return -[SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider init](&v3, sel_init);
}

- (id)assertionAttributes
{
  return (id)MEMORY[0x1E0C9AA60];
}

@end
