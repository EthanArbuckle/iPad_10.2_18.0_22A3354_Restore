@implementation SurfaceLayer

- (id)actionForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("contents")) & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SurfaceLayer;
  return -[SurfaceLayer actionForKey:](&v6, sel_actionForKey_, a3);
}

@end
