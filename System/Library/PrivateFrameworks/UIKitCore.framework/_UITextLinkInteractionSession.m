@implementation _UITextLinkInteractionSession

- (_UITextLinkInteractionSession)initWithTextItemInteraction:(id)a3
{
  id v4;
  _UITextLinkInteractionSession *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextLinkInteractionSession;
  v5 = -[_UITextLinkInteractionSession init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE0300B0))
    {
      objc_storeWeak((id *)&v5->_interaction, v4);
      objc_storeWeak((id *)&v5->_linkInteractionView, v6);
    }
    else
    {

      v5 = 0;
    }

  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_linkInteractionView);
  objc_msgSend(WeakRetained, "cancelInteractionWithLink");

  v4.receiver = self;
  v4.super_class = (Class)_UITextLinkInteractionSession;
  -[_UITextLinkInteractionSession dealloc](&v4, sel_dealloc);
}

- (BOOL)canInteractWithLinkAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  char v6;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_linkInteractionView);
  v6 = objc_msgSend(WeakRetained, "willInteractWithLinkAtPoint:", x, y);

  return v6;
}

- (BOOL)_allowItemInteractions
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  v3 = objc_msgSend(WeakRetained, "_allowItemInteractions");

  return v3;
}

- (BOOL)tapOnLinkWithGesture:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_linkInteractionView);
  if (WeakRetained
    && -[_UITextLinkInteractionSession _allowItemInteractions](self, "_allowItemInteractions")
    && (objc_msgSend(v4, "view"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "location"),
        objc_msgSend(v6, "convertPoint:toView:", WeakRetained),
        v8 = v7,
        v10 = v9,
        v6,
        objc_msgSend(WeakRetained, "willInteractWithLinkAtPoint:", v8, v10)))
  {
    objc_msgSend(WeakRetained, "cancelInteractionWithLink");
    objc_msgSend(WeakRetained, "tapLinkAtPoint:", v8, v10);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkInteractionView);
  objc_destroyWeak((id *)&self->_interaction);
}

@end
