@implementation SXTextTangierTextRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)wpEditorClass
{
  return (Class)objc_opt_class();
}

- (void)didUpdateLayer:(id)a3
{
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextTangierTextRep;
  v3 = a3;
  -[SXTextTangierTextRep didUpdateLayer:](&v5, sel_didUpdateLayer_, v3);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor", v5.receiver, v5.super_class);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

}

- (void)dealloc
{
  objc_super v3;

  -[SXTextTangierTextRep _accessibilityUnregister](self, "_accessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)SXTextTangierTextRep;
  -[SXTextTangierTextRep dealloc](&v3, sel_dealloc);
}

- (id)supportedCustomRotors
{
  return 0;
}

@end
