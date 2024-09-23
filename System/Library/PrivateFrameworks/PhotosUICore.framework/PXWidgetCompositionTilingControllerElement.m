@implementation PXWidgetCompositionTilingControllerElement

- (id)contentTilingController
{
  void *v3;
  void *v4;
  void *v5;

  -[PXWidgetCompositionElement widget](self, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentTilingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXWidgetCompositionTilingControllerElement _didLoadContent](self, "_didLoadContent"))
  {
    -[PXWidgetCompositionElement scrollViewController](self, "scrollViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setScrollController:", v5);

    -[PXWidgetCompositionTilingControllerElement _setDidLoadContent:](self, "_setDidLoadContent:", 1);
  }

  return v4;
}

- (BOOL)_didLoadContent
{
  return self->__didLoadContent;
}

- (void)_setDidLoadContent:(BOOL)a3
{
  self->__didLoadContent = a3;
}

@end
