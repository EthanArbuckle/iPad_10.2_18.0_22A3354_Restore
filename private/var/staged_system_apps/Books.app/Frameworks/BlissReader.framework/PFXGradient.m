@implementation PFXGradient

- (PFXGradient)initWithDocument:(id)a3 name:(id)a4
{
  PFXGradient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFXGradient;
  v4 = -[PFXSvgElement initWithDocument:name:](&v6, "initWithDocument:name:", a3, a4);
  if (v4)
    v4->mStops = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXGradient;
  -[PFXSvgElement dealloc](&v3, "dealloc");
}

- (void)addStop:(id)a3
{
  -[NSMutableArray addObject:](self->mStops, "addObject:", a3);
}

@end
