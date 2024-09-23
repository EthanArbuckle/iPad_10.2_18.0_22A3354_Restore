@implementation _UIFluidSliderDiscreteVolumeButtonDriver

- (void)setView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _UIPhysicalButtonInteraction *v8;
  _UIPhysicalButtonInteraction *physicalButtonInteraction;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIFluidSliderDiscreteVolumeButtonDriver;
  -[_UIFluidSliderDiscreteButtonDriver setView:](&v14, sel_setView_);
  -[_UIFluidSliderDiscreteVolumeButtonDriver physicalButtonInteraction](self, "physicalButtonInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {

    if (!v6)
    {
      +[_UIPhysicalButtonConfiguration _volumeConfigurations](_UIPhysicalButtonConfiguration, "_volumeConfigurations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_UIPhysicalButtonInteraction initWithConfigurations:delegate:]([_UIPhysicalButtonInteraction alloc], "initWithConfigurations:delegate:", v7, self);
      physicalButtonInteraction = self->_physicalButtonInteraction;
      self->_physicalButtonInteraction = v8;

      v10 = -[_UIFluidSliderDiscreteButtonDriver enabled](self, "enabled");
      -[_UIFluidSliderDiscreteVolumeButtonDriver physicalButtonInteraction](self, "physicalButtonInteraction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setEnabled:", v10);

    }
    -[_UIFluidSliderDiscreteButtonDriver view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderDiscreteVolumeButtonDriver physicalButtonInteraction](self, "physicalButtonInteraction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInteraction:", v12);
  }
  else
  {
    objc_msgSend(v5, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFluidSliderDiscreteVolumeButtonDriver physicalButtonInteraction](self, "physicalButtonInteraction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeInteraction:", v13);

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFluidSliderDiscreteVolumeButtonDriver;
  -[_UIFluidSliderDiscreteButtonDriver setEnabled:](&v7, sel_setEnabled_);
  v5 = -[_UIFluidSliderDiscreteButtonDriver enabled](self, "enabled");
  -[_UIFluidSliderDiscreteVolumeButtonDriver physicalButtonInteraction](self, "physicalButtonInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setEnabled:", v5);

  if (!a3)
    -[_UIFluidSliderDiscreteVolumeButtonDriver cancel](self, "cancel");
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFluidSliderDiscreteVolumeButtonDriver;
  -[_UIFluidSliderDiscreteButtonDriver cancel](&v3, sel_cancel);
  -[_UIFluidSliderDiscreteVolumeButtonDriver _end](self, "_end");
}

- (NSString)name
{
  return (NSString *)CFSTR("Discrete Volume Button");
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  uint64_t v6;
  id v7;

  v7 = a4;
  v6 = objc_msgSend(v7, "_state");
  if ((unint64_t)(v6 - 2) < 2)
  {
    -[_UIFluidSliderDiscreteVolumeButtonDriver _end](self, "_end");
    goto LABEL_10;
  }
  if (v6 != 1)
  {
    if (v6)
      goto LABEL_10;
    -[_UIFluidSliderDiscreteVolumeButtonDriver _beginWithButton:](self, "_beginWithButton:", objc_msgSend(v7, "_button"));
  }
  if (-[_UIFluidSliderDiscreteVolumeButtonDriver _pressedButton](self, "_pressedButton") == 1)
  {
    -[_UIFluidSliderDiscreteButtonDriver pressUp](self, "pressUp");
  }
  else if (-[_UIFluidSliderDiscreteVolumeButtonDriver _pressedButton](self, "_pressedButton") == 2)
  {
    -[_UIFluidSliderDiscreteButtonDriver pressDown](self, "pressDown");
  }
LABEL_10:

}

- (void)_end
{
  if (-[_UIFluidSliderDiscreteVolumeButtonDriver _pressedButton](self, "_pressedButton"))
  {
    if (-[_UIFluidSliderDiscreteVolumeButtonDriver _pressedButton](self, "_pressedButton") == 1)
    {
      -[_UIFluidSliderDiscreteButtonDriver releaseUp](self, "releaseUp");
    }
    else if (-[_UIFluidSliderDiscreteVolumeButtonDriver _pressedButton](self, "_pressedButton") == 2)
    {
      -[_UIFluidSliderDiscreteButtonDriver releaseDown](self, "releaseDown");
    }
    -[_UIFluidSliderDiscreteVolumeButtonDriver set_pressedButton:](self, "set_pressedButton:", 0);
  }
}

- (_UIPhysicalButtonInteraction)physicalButtonInteraction
{
  return self->_physicalButtonInteraction;
}

- (unint64_t)_pressedButton
{
  return self->__pressedButton;
}

- (void)set_pressedButton:(unint64_t)a3
{
  self->__pressedButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonInteraction, 0);
}

@end
