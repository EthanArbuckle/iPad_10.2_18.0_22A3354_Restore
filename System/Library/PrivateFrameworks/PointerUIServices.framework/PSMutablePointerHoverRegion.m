@implementation PSMutablePointerHoverRegion

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PSPointerHoverRegion _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PSPointerHoverRegion _copyWithClass:](self, "_copyWithClass:", objc_opt_class());
}

- (void)setCoordinateSpaceSourceContextID:(unsigned int)a3
{
  self->super._coordinateSpaceSourceContextID = a3;
}

- (void)setCoordinateSpaceSourceLayerRenderID:(unint64_t)a3
{
  self->super._coordinateSpaceSourceLayerRenderID = a3;
}

- (void)setContentBounds:(CGRect)a3
{
  self->super._contentBounds = a3;
}

- (void)setContentHoverInverseScale:(double)a3
{
  self->super._contentHoverInverseScale = a3;
}

- (void)setContentMatchMoveSource:(id)a3
{
  PSMatchMoveSource *v4;
  PSMatchMoveSource *contentMatchMoveSource;

  v4 = (PSMatchMoveSource *)objc_msgSend(a3, "copy");
  contentMatchMoveSource = self->super._contentMatchMoveSource;
  self->super._contentMatchMoveSource = v4;

}

- (void)setContentSlipValue:(id)a3
{
  NSValue *v4;
  NSValue *contentSlipValue;

  v4 = (NSValue *)objc_msgSend(a3, "copy");
  contentSlipValue = self->super._contentSlipValue;
  self->super._contentSlipValue = v4;

}

- (void)setHitTestBounds:(CGRect)a3
{
  self->super._hitTestBounds = a3;
}

- (void)setOverlayEffectVisible:(BOOL)a3
{
  -[PSMutablePointerHoverRegion setOverlayEffectStyle:](self, "setOverlayEffectStyle:", a3);
}

- (void)setOverlayEffectStyle:(int64_t)a3
{
  self->super._overlayEffectStyle = a3;
}

- (void)setPointerPortalSourceCollection:(id)a3
{
  PSPointerPortalSourceCollection *v4;
  PSPointerPortalSourceCollection *pointerPortalSourceCollection;

  v4 = (PSPointerPortalSourceCollection *)objc_msgSend(a3, "copy");
  pointerPortalSourceCollection = self->super._pointerPortalSourceCollection;
  self->super._pointerPortalSourceCollection = v4;

}

- (void)setPointerRecenteringAxes:(unint64_t)a3
{
  self->super._pointerRecenteringAxes = a3;
}

- (void)setPointerLatchingAxes:(unint64_t)a3
{
  self->super._pointerLatchingAxes = a3;
}

- (void)setPointerShape:(id)a3
{
  PSPointerShape *v4;
  PSPointerShape *pointerShape;

  v4 = (PSPointerShape *)objc_msgSend(a3, "copy");
  pointerShape = self->super._pointerShape;
  self->super._pointerShape = v4;

}

- (void)setPointerSlipValue:(id)a3
{
  NSValue *v4;
  NSValue *pointerSlipValue;

  v4 = (NSValue *)objc_msgSend(a3, "copy");
  pointerSlipValue = self->super._pointerSlipValue;
  self->super._pointerSlipValue = v4;

}

- (void)setPointerVisualIntensity:(double)a3
{
  self->super._pointerVisualIntensity = a3;
}

- (void)setPreferredPointerMaterialLuminance:(unint64_t)a3
{
  self->super._preferredPointerMaterialLuminance = a3;
}

- (void)setShouldPointerUnderlayContent:(BOOL)a3
{
  self->super._shouldPointerUnderlayContent = a3;
}

- (void)setShouldPointerSuppressMirroring:(BOOL)a3
{
  self->super._shouldPointerSuppressMirroring = a3;
}

- (void)setAccessories:(id)a3
{
  NSArray *v4;
  NSArray *accessories;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  accessories = self->super._accessories;
  self->super._accessories = v4;

}

@end
