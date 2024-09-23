@implementation UIWebPlaybackTargetPicker

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[MPAVRoutingSheet dismiss](self->_actionSheet, "dismiss");
  -[UIWebPlaybackTargetPicker _dismissAirPlayRoutePickerIPad](self, "_dismissAirPlayRoutePickerIPad");
  v3.receiver = self;
  v3.super_class = (Class)UIWebPlaybackTargetPicker;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (self->_popoverController == a3)
    -[UIWebPlaybackTargetPicker _dismissAirPlayRoutePickerIPad](self, "_dismissAirPlayRoutePickerIPad");
}

- (void)_presentAirPlayPopoverAnimated:(BOOL)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  MPAudioVideoRoutingPopoverController *popoverController;
  id WeakRetained;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  popoverController = self->_popoverController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MPAudioVideoRoutingPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", WeakRetained, 15, v8, x, y, width, height);

}

- (void)_windowWillRotate:(id)a3
{
  -[MPAudioVideoRoutingPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
}

- (void)_dismissAirPlayRoutePickerIPad
{
  MPAVRoutingController *routingController;
  MPAudioVideoRoutingPopoverController *popoverController;
  id v5;

  routingController = self->_routingController;
  self->_routingController = 0;

  if (self->_popoverController)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UIWindowDidRotateNotification"), 0);
    -[MPAudioVideoRoutingPopoverController dismissPopoverAnimated:](self->_popoverController, "dismissPopoverAnimated:", 0);
    -[MPAudioVideoRoutingPopoverController setDelegate:](self->_popoverController, "setDelegate:", 0);
    popoverController = self->_popoverController;
    self->_popoverController = 0;

  }
}

- (void)showAirPlayPickerIPad:(int64_t)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  objc_class *v11;
  MPAudioVideoRoutingPopoverController *v12;
  MPAudioVideoRoutingPopoverController *popoverController;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (!self->_popoverController)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v10 = (void *)getMPAudioVideoRoutingPopoverControllerClass_softClass;
    v19 = getMPAudioVideoRoutingPopoverControllerClass_softClass;
    if (!getMPAudioVideoRoutingPopoverControllerClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getMPAudioVideoRoutingPopoverControllerClass_block_invoke;
      v15[3] = &unk_1E16B14C0;
      v15[4] = &v16;
      __getMPAudioVideoRoutingPopoverControllerClass_block_invoke((uint64_t)v15);
      v10 = (void *)v17[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v16, 8);
    v12 = (MPAudioVideoRoutingPopoverController *)objc_msgSend([v11 alloc], "initWithType:", a3);
    popoverController = self->_popoverController;
    self->_popoverController = v12;

    -[MPAudioVideoRoutingPopoverController setDelegate:](self->_popoverController, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__windowWillRotate_, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__windowDidRotate_, CFSTR("UIWindowDidRotateNotification"), 0);
    -[UIWebPlaybackTargetPicker _presentAirPlayPopoverAnimated:fromRect:](self, "_presentAirPlayPopoverAnimated:fromRect:", 1, x, y, width, height);

  }
}

- (void)showAirPlayPickerIPhone:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  MPAVRoutingSheet *v8;
  MPAVRoutingSheet *actionSheet;
  MPAVRoutingSheet *v10;
  id WeakRetained;
  _QWORD v12[5];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_actionSheet)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)getMPAVRoutingSheetClass_softClass;
    v17 = getMPAVRoutingSheetClass_softClass;
    v6 = MEMORY[0x1E0C809B0];
    if (!getMPAVRoutingSheetClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getMPAVRoutingSheetClass_block_invoke;
      v13[3] = &unk_1E16B14C0;
      v13[4] = &v14;
      __getMPAVRoutingSheetClass_block_invoke((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v14, 8);
    v8 = (MPAVRoutingSheet *)objc_msgSend([v7 alloc], "initWithAVItemType:", a3);
    actionSheet = self->_actionSheet;
    self->_actionSheet = v8;

    v10 = self->_actionSheet;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __53__UIWebPlaybackTargetPicker_showAirPlayPickerIPhone___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    -[MPAVRoutingSheet showInView:withCompletionHandler:](v10, "showInView:withCompletionHandler:", WeakRetained, v12);

  }
}

void __53__UIWebPlaybackTargetPicker_showAirPlayPickerIPhone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 416);
  *(_QWORD *)(v2 + 416) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 432);
  *(_QWORD *)(v4 + 432) = 0;

}

- (void)show:(BOOL)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  void *v10;
  objc_class *v11;
  MPAVRoutingController *v12;
  MPAVRoutingController *routingController;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v10 = (void *)getMPAVRoutingControllerClass_softClass;
  v19 = getMPAVRoutingControllerClass_softClass;
  if (!getMPAVRoutingControllerClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getMPAVRoutingControllerClass_block_invoke;
    v15[3] = &unk_1E16B14C0;
    v15[4] = &v16;
    __getMPAVRoutingControllerClass_block_invoke((uint64_t)v15);
    v10 = (void *)v17[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v16, 8);
  v12 = (MPAVRoutingController *)objc_msgSend([v11 alloc], "initWithName:", CFSTR("WebKit - HTML media element showing AirPlay route picker"));
  routingController = self->_routingController;
  self->_routingController = v12;

  -[MPAVRoutingController setDiscoveryMode:](self->_routingController, "setDiscoveryMode:", 3);
  if (v8)
    v14 = 2;
  else
    v14 = 1;
  if (UIWebCurrentUserInterfaceIdiomIsSmallScreen())
    -[UIWebPlaybackTargetPicker showAirPlayPickerIPhone:](self, "showAirPlayPickerIPhone:", v14);
  else
    -[UIWebPlaybackTargetPicker showAirPlayPickerIPad:fromRect:](self, "showAirPlayPickerIPad:fromRect:", v14, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionSheet, 0);
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
}

@end
