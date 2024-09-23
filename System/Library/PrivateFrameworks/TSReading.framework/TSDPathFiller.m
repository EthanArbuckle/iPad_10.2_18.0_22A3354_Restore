@implementation TSDPathFiller

- (TSDPathFiller)initWithProperties:(id)a3 bundle:(id)a4 dataManager:(void *)a5 precedingStroker:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDPathFiller;
  return -[TSDPathStroker initWithProperties:bundle:dataManager:precedingStroker:](&v7, sel_initWithProperties_bundle_dataManager_precedingStroker_, a3, a4, a5, a6);
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4 inColor:(id)a5
{
  TSDPathStroker *mPrecedingStroker;

  mPrecedingStroker = self->super.mPrecedingStroker;
  if (mPrecedingStroker)
    -[TSDPathStroker strokePath:inContext:inColor:](mPrecedingStroker, "strokePath:inContext:inColor:", a3, a4, a5);
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(a5, "CGColor"));
  CGContextAddPath(a4, a3);
  CGContextFillPath(a4);
}

@end
