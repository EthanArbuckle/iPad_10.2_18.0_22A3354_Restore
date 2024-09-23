@implementation UICustomViewMenuElement

+ (id)elementWithViewProvider:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:image:imageName:", v6, 0, 0);

  objc_msgSend(v7, "setViewProvider:", v4);
  return v7;
}

- (UICustomViewMenuElement)initWithMenuElement:(id)a3
{
  id v4;
  UICustomViewMenuElement *v5;
  void *v6;
  id viewProvider;
  void *v8;
  id primaryActionHandler;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UICustomViewMenuElement;
  v5 = -[UIMenuElement initWithTitle:image:imageName:](&v11, sel_initWithTitle_image_imageName_, &stru_1E16EDF20, 0, 0);
  if (v5)
  {
    v6 = _Block_copy(*((const void **)v4 + 17));
    viewProvider = v5->_viewProvider;
    v5->_viewProvider = v6;

    objc_storeStrong((id *)&v5->_menuElementRepresentation, *((id *)v4 + 15));
    v8 = _Block_copy(*((const void **)v4 + 16));
    primaryActionHandler = v5->_primaryActionHandler;
    v5->_primaryActionHandler = v8;

    v5->_forceCustomViewSupport = *((_BYTE *)v4 + 73);
  }

  return v5;
}

- (UIView)contentView
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  -[UICustomViewMenuElement viewProvider](self, "viewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UICustomViewMenuElement viewProvider](self, "viewProvider");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, UICustomViewMenuElement *))v4)[2](v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (UIView *)v5;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (id)_immutableCopy
{
  return -[UICustomViewMenuElement initWithMenuElement:]([_UIImmutableCustomViewMenuElement alloc], "initWithMenuElement:", self);
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[UICustomViewMenuElement menuElementRepresentation](self, "menuElementRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UICustomViewMenuElement menuElementRepresentation](self, "menuElementRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_acceptMenuVisit:commandVisit:actionVisit:deferredElementVisit:", v15, v10, v11, v12);

  }
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    (*((void (**)(id, UICustomViewMenuElement *))a4 + 2))(a4, self);
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    return (*((uint64_t (**)(id, UICustomViewMenuElement *))a4 + 2))(a4, self);
  else
    return 0;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UICustomViewMenuElement menuElementRepresentation](self, "menuElementRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UICustomViewMenuElement menuElementRepresentation](self, "menuElementRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "_acceptBoolMenuVisit:commandVisit:actionVisit:", v8, v9, v10);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (id)_leafAlternates
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)_leafKeyInput
{
  return 0;
}

- (int64_t)_leafKeyModifierFlags
{
  return 0;
}

- (BOOL)_isDefaultCommand
{
  return 0;
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return 0;
}

- (void)performWithSender:(id)a3 target:(id)a4
{
  void *v5;
  void (**v6)(id, UICustomViewMenuElement *);

  -[UICustomViewMenuElement primaryActionHandler](self, "primaryActionHandler", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UICustomViewMenuElement primaryActionHandler](self, "primaryActionHandler");
    v6 = (void (**)(id, UICustomViewMenuElement *))objc_claimAutoreleasedReturnValue();
    v6[2](v6, self);

  }
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  return 0;
}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return 0;
}

- (BOOL)keepsMenuPresented
{
  return 0;
}

- (unint64_t)attributes
{
  return self->attributes;
}

- (void)setAttributes:(unint64_t)a3
{
  self->attributes = a3;
}

- (NSString)discoverabilityTitle
{
  return self->discoverabilityTitle;
}

- (void)setDiscoverabilityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)requiresAuthenticatedInput
{
  return self->requiresAuthenticatedInput;
}

- (int64_t)state
{
  return self->state;
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

- (BOOL)_forceCustomViewSupport
{
  return self->_forceCustomViewSupport;
}

- (void)_setForceCustomViewSupport:(BOOL)a3
{
  self->_forceCustomViewSupport = a3;
}

- (id)sender
{
  return self->_sender;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (UIMenuElement)menuElementRepresentation
{
  return self->_menuElementRepresentation;
}

- (void)setMenuElementRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_menuElementRepresentation, a3);
}

- (id)primaryActionHandler
{
  return self->_primaryActionHandler;
}

- (void)setPrimaryActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)viewProvider
{
  return self->_viewProvider;
}

- (void)setViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewProvider, 0);
  objc_storeStrong(&self->_primaryActionHandler, 0);
  objc_storeStrong((id *)&self->_menuElementRepresentation, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->discoverabilityTitle, 0);
}

@end
