@implementation BKDisplayRenderOverlayAppleLogo

- (BKDisplayRenderOverlayAppleLogo)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  BKDisplayRenderOverlayAppleLogo *v4;
  BKDisplayRenderOverlayAppleLogo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlayAppleLogo;
  v4 = -[BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4)
    -[BKDisplayRenderOverlay _setType:](v4, "_setType:", 3);
  return v5;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  id v4;
  PUIProgressWindow *v5;
  PUIProgressWindow *puiProgressWindow;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc((Class)PUIProgressWindow);
  -[BKDisplayRenderOverlay level](self, "level");
  v5 = (PUIProgressWindow *)objc_msgSend(v4, "initWithProgressBarVisibility:createContext:contextLevel:appearance:", 0, 0, 0);
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = v5;

  -[PUIProgressWindow setVisible:](self->_puiProgressWindow, "setVisible:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PUIProgressWindow layer](self->_puiProgressWindow, "layer"));
  objc_msgSend(v7, "setDisableUpdateMask:", objc_msgSend(v7, "disableUpdateMask") | 0x10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayRenderOverlay display](self, "display"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueId"));

  sub_100035738(v9);
  return v7;
}

- (void)_cleanUpContentLayer
{
  PUIProgressWindow *puiProgressWindow;

  -[PUIProgressWindow setVisible:](self->_puiProgressWindow, "setVisible:", 0);
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = 0;

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUIProgressWindow *puiProgressWindow;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKDisplayRenderOverlayAppleLogo;
  v4 = -[BKDisplayBootUIRenderOverlay descriptionBuilderWithMultilinePrefix:](&v10, "descriptionBuilderWithMultilinePrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  puiProgressWindow = self->_puiProgressWindow;
  if (puiProgressWindow)
    v8 = objc_msgSend(v5, "appendObject:withName:", puiProgressWindow, CFSTR("puiProgressWindow"));
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_puiProgressWindow, 0);
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  id v12;
  BKDisplayRenderOverlayAppleLogo *v13;
  double v14;
  BKDisplayRenderOverlayAppleLogo *v15;

  v6 = a4;
  v7 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  v9 = (objc_class *)objc_opt_class(a1, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v7, "initWithName:display:", v11, v6);

  objc_msgSend(v12, "setLockBacklight:", 0);
  v13 = [BKDisplayRenderOverlayAppleLogo alloc];
  *(float *)&v14 = a3;
  v15 = -[BKDisplayRenderOverlayAppleLogo initWithOverlayDescriptor:level:](v13, "initWithOverlayDescriptor:level:", v12, v14);

  return v15;
}

@end
