@implementation RBSurfaceContentsLayer

- (id)actionForKey:(id)a3
{
  return 0;
}

+ (id)defaultValueForKey:(id)a3
{
  objc_super v6;
  __int128 v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("anchorPoint")))
  {
    v7 = *MEMORY[0x24BDBEFB0];
    return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v7, "{CGPoint=dd}");
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("needsLayoutOnGeometryChange")) & 1) != 0
         || (objc_msgSend(a3, "isEqualToString:", CFSTR("allowsEdgeAntialiasing")) & 1) != 0)
  {
    return (id)MEMORY[0x24BDBD1C0];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RBSurfaceContentsLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
}

- (RBSurfaceContentsLayer)init
{
  RBSurfaceContentsLayer *v2;
  RBSurfaceContentsLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RBSurfaceContentsLayer;
  v2 = -[RBSurfaceContentsLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[RBSurfaceContentsLayer setContentsGravity:](v2, "setContentsGravity:", *MEMORY[0x24BDE5C68]);
  return v3;
}

@end
