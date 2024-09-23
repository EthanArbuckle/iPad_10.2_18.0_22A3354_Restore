@implementation _UIShareInvitationRemoteViewController

+ (id)serviceViewControllerInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CF608);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__setParticipantDetails_, 0, 0);

  return v2;
}

+ (id)exportedInterface
{
  void *v2;
  void (*v3)(void);
  void *v4;
  id result;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE07CAE8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (void (*)(void))_MergedGlobals_1341;
  v12 = _MergedGlobals_1341;
  if (!_MergedGlobals_1341)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getCKOperationProgressCallbackClassesSymbolLoc_block_invoke;
    v8[3] = &unk_1E16B14C0;
    v8[4] = &v9;
    __getCKOperationProgressCallbackClassesSymbolLoc_block_invoke(v8);
    v3 = (void (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v3();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel__dismissViewControllerWithError_, 0, 0);

    return v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSSet *_CKOperationProgressCallbackClasses(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_UIShareInvitationRemoteViewController.m"), 33, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  _UIShareInvitationRemoteViewControllerTintColorView *v4;
  objc_super v5;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_UIShareInvitationRemoteViewControllerTintColorView);
  objc_msgSend(v3, "addSubview:", v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIShareInvitationRemoteViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
}

- (void)_dismissViewController
{
  id v2;

  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissViewControllerWithError:", 0);

}

- (void)_dismissViewControllerWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dismissViewControllerWithError:", v4);

}

- (void)_shareDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_shareDidChange:", v4);

}

- (void)_shareWasMadePrivate
{
  id v2;

  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_shareWasMadePrivate");

}

- (void)_tintColorDidChangeToColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTintColor:", v4);

}

- (void)_performAuxiliaryActionWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_performAuxiliaryActionWithCompletion:", v4);

}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cloudSharingControllerDidModifyPrimarySwitch:", v3);

}

- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cloudSharingControllerDidModifySecondarySwitch:", v3);

}

- (void)_cloudSharingControllerDidUpdateRootFolderURL:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "url");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cloudSharingControllerDidUpdateRootFolderURL:", v5);

}

- (void)_cloudSharingControllerDidActivateShowSharedFolder
{
  id v2;

  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cloudSharingControllerDidActivateShowSharedFolder");

}

- (void)_cloudSharingControllerDidActivateShowActivityController
{
  id v2;

  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cloudSharingControllerDidActivateShowActivityController");

}

- (void)_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:(double)a3 y:(double)a4 width:(double)a5 height:(double)a6
{
  id v10;

  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cloudSharingControllerDidActivateAddPeopleWithRemoteSourceX:y:width:height:", a3, a4, a5, a6);

}

- (void)_cloudSharingControllerDidChooseTransport:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cloudSharingControllerDidChooseTransport:", v4);

}

- (void)_performHeaderActionWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_performHeaderActionWithCompletion:", v4);

}

- (void)_dismissAndRepresentForActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74___UIShareInvitationRemoteViewController__dismissAndRepresentForActivity___block_invoke;
  v7[3] = &unk_1E16B1D18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_dismissForActivityRepresentation:", v7);

}

- (void)_dismissForActivityRepresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dismissForActivityRepresentation:", v4);

}

- (void)_representFullscreenAfterActivityDismissal:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_representFullscreenAfterActivityDismissal:", v4);

}

- (void)_requestSavedShareWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestSavedShareWithCompletion:", v4);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  -[_UIShareInvitationRemoteViewController _updateTraitCollectionForPopoverStatus](self, "_updateTraitCollectionForPopoverStatus");
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setIsInPopoverMode:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));

  v4.receiver = self;
  v4.super_class = (Class)_UIShareInvitationRemoteViewController;
  -[UIViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[_UIShareInvitationRemoteViewController _updateTraitCollectionForPopoverStatus](self, "_updateTraitCollectionForPopoverStatus");
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setIsInPopoverMode:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));

  v6.receiver = self;
  v6.super_class = (Class)_UIShareInvitationRemoteViewController;
  -[_UIRemoteViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, v4);

}

- (void)_updateTraitCollectionForPopoverStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITraitCollection _traitCollectionWithValue:forTraitNamed:](UITraitCollection, "_traitCollectionWithValue:forTraitNamed:", v5, CFSTR("_UIShareInvitationPopoverTrait"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setOverrideTraitCollection:", v7);

  }
}

- (void)_requestContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[_UIShareInvitationRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredContentSize:", width, height);

}

- (_UISharingPublicController)publicController
{
  return (_UISharingPublicController *)objc_loadWeakRetained((id *)&self->_publicController);
}

- (void)setPublicController:(id)a3
{
  objc_storeWeak((id *)&self->_publicController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_publicController);
}

@end
