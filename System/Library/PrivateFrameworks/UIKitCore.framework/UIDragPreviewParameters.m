@implementation UIDragPreviewParameters

- (_UIDragPreviewShadowProperties)_shadowProperties
{
  return self->__shadowProperties;
}

- (void)_setShadowProperties:(id)a3
{
  objc_storeStrong((id *)&self->__shadowProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__shadowProperties, 0);
}

@end
