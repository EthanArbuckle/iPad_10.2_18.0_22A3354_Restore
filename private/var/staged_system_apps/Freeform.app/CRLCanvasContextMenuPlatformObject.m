@implementation CRLCanvasContextMenuPlatformObject

+ (id)platformObjectWithInteraction:(id)a3
{
  id v3;
  CRLCanvasContextMenuPlatformObject *v4;

  v3 = a3;
  v4 = -[CRLCanvasContextMenuPlatformObject initWithInteraction:]([CRLCanvasContextMenuPlatformObject alloc], "initWithInteraction:", v3);

  return v4;
}

- (CRLCanvasContextMenuPlatformObject)initWithInteraction:(id)a3
{
  id v5;
  CRLCanvasContextMenuPlatformObject *v6;
  CRLCanvasContextMenuPlatformObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLCanvasContextMenuPlatformObject;
  v6 = -[CRLCanvasContextMenuPlatformObject init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_interaction, a3);

  return v7;
}

- (UIContextMenuInteraction)interaction
{
  return self->_interaction;
}

- (void)setInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_interaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
