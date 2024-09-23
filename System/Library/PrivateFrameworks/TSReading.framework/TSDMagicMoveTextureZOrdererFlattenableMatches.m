@implementation TSDMagicMoveTextureZOrdererFlattenableMatches

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveTextureZOrdererFlattenableMatches;
  -[TSDMagicMoveTextureZOrdererFlattenableMatches dealloc](&v3, sel_dealloc);
}

- (NSArray)animationMatches
{
  return self->_animationMatches;
}

- (void)setAnimationMatches:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)texturesInZOrder
{
  return self->_texturesInZOrder;
}

- (void)setTexturesInZOrder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
