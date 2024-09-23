@implementation _UIOMutableActionOriginContext

- (void)setSceneIdentity:(id)a3
{
  objc_storeStrong((id *)&self->super._sceneIdentity, a3);
}

- (void)setSpaceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->super._spaceIdentifier, a3);
}

- (void)setContextId:(unsigned int)a3
{
  self->super._contextId = a3;
}

- (void)setLayerId:(unint64_t)a3
{
  self->super._layerId = a3;
}

- (void)setLayerReferencePoint:(CGPoint)a3
{
  self->super._layerReferencePoint = a3;
}

@end
