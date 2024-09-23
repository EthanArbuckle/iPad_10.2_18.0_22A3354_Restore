@implementation _UIDocumentPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CE168);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel__setAuxiliaryOptions_, 0, 0);

  return v2;
}

- (void)invalidate
{
  void *v3;

  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_documentPickerDidDismiss");

  -[_UIDocumentPickerRemoteViewController setPublicController:](self, "setPublicController:", 0);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFD780);
}

- (void)viewDidLoad
{
  _UIDocumentPickerRemoteViewControllerTintColorView *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerRemoteViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_alloc_init(_UIDocumentPickerRemoteViewControllerTintColorView);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (void)_didSelectURLWrapper:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_didSelectURL:", v5);
}

- (void)_didSelectURLBookmark:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  void (*v8)(id, uint64_t *);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  _UIDocumentPickerRemoteViewController *v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __63___UIDocumentPickerRemoteViewController__didSelectURLBookmark___block_invoke;
  v14 = &unk_1E16C36C8;
  v15 = self;
  v6 = v4;
  v16 = v6;
  v7 = &v11;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v8 = (void (*)(id, uint64_t *))_MergedGlobals_3_6;
  v21 = _MergedGlobals_3_6;
  if (!_MergedGlobals_3_6)
  {
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke;
    v17[3] = &unk_1E16B14C0;
    v17[4] = &v18;
    __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke(v17);
    v8 = (void (*)(id, uint64_t *))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v8)
  {
    v8(v6, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _FPDocumentURLFromBookmarkableString(CFStringRef, void (^__strong)(CFURLRef, CFErrorRef))");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_UIDocumentPickerRemoteViewController.m"), 32, CFSTR("%s"), dlerror(), v11, v12, v13, v14, v15);

    __break(1u);
  }
}

- (void)_dismissViewController
{
  id v2;

  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissViewController");

}

- (void)_didSelectPicker
{
  id v2;

  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_didSelectPicker");

}

- (void)_dismissWithOption:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_dismissWithOption:", v4);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerRemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v5, sel_viewServiceDidTerminateWithError_, a3);
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dismissViewController");

}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "modalPresentationStyle");

  if (v7 != 7)
    width = 0.0;
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPreferredContentSize:", width, height);

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerRemoteViewController;
  -[UIViewController setPreferredContentSize:](&v9, sel_setPreferredContentSize_, width, height);
}

- (void)_stitchFileCreationAtURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stitchFileCreationAtURL:", v4);

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

- (_UIDocumentPickerRemoteViewControllerContaining)publicController
{
  return (_UIDocumentPickerRemoteViewControllerContaining *)objc_loadWeakRetained((id *)&self->_publicController);
}

- (void)setPublicController:(id)a3
{
  objc_storeWeak((id *)&self->_publicController, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_publicController);
}

@end
