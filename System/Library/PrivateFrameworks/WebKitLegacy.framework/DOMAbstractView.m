@implementation DOMAbstractView

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DOMAbstractView;
  -[DOMObject dealloc](&v2, sel_dealloc);
}

- (DOMDocument)document
{
  DOMObjectInternal *internal;

  internal = self->super._internal;
  if (internal)
    return (DOMDocument *)kit(*((WebCore::Node **)internal + 37));
  else
    return 0;
}

- (void)_disconnectFrame
{
  removeDOMWrapper((_OWORD *)self->super._internal);
  self->super._internal = 0;
}

@end
