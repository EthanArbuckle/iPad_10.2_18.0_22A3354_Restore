@implementation EQKitMathMLTokenContent

- (EQKitMathMLTokenContent)initWithChildren:(id)a3
{
  EQKitMathMLTokenContent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EQKitMathMLTokenContent;
  v4 = -[EQKitMathMLTokenContent init](&v6, sel_init);
  if (v4)
    v4->mChildren = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLTokenContent;
  -[EQKitMathMLTokenContent dealloc](&v3, sel_dealloc);
}

- (NSArray)children
{
  return self->mChildren;
}

@end
