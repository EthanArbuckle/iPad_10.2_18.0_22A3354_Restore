@implementation UIAction

- (void)setSubtitle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAction;
  -[UIMenuElement _setSubtitle:](&v3, sel__setSubtitle_, a3);
}

- (void)setSelectedImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_discoverabilityTitle, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->stateObservers, 0);
}

+ (UIAction)actionWithTitle:(NSString *)title image:(UIImage *)image identifier:(UIActionIdentifier)identifier handler:(UIActionHandler)handler
{
  UIActionHandler v10;
  NSString *v11;
  UIImage *v12;
  NSString *v13;
  void *v14;

  v10 = handler;
  v11 = identifier;
  v12 = image;
  v13 = title;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:identifier:discoverabilityTitle:attributes:state:handler:", v13, v12, v11, 0, 0, 0, v10);

  return (UIAction *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIAction initWithAction:]([UIAction alloc], "initWithAction:", self);
}

- (UIAction)initWithAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UIAction *v12;
  uint64_t v13;
  NSString *accessibilityIdentifier;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "discoverabilityTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "attributes");
  v10 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "handler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIAction initWithTitle:image:identifier:discoverabilityTitle:attributes:state:handler:](self, "initWithTitle:image:identifier:discoverabilityTitle:attributes:state:handler:", v5, v6, v7, v8, v9, v10, v11);

  objc_storeStrong((id *)&v12->super._attributedTitle, *((id *)v4 + 1));
  objc_storeStrong((id *)&v12->super._subtitle, *((id *)v4 + 2));
  v12->_requiresAuthenticatedInput = *((_BYTE *)v4 + 72);
  objc_msgSend(v4, "accessibilityIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  accessibilityIdentifier = v12->super._accessibilityIdentifier;
  v12->super._accessibilityIdentifier = (NSString *)v13;

  objc_msgSend(v4, "_accessoryAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMenuElement set_accessoryAction:](v12, "set_accessoryAction:", v15);

  v12->super.__preferredDisplayMode = objc_msgSend(v4, "_preferredDisplayMode");
  objc_storeStrong((id *)&v12->_selectedImage, *((id *)v4 + 12));

  return v12;
}

- (UIActionIdentifier)identifier
{
  return self->_identifier;
}

- (UIMenuElementState)state
{
  return self->_state;
}

- (NSString)discoverabilityTitle
{
  return self->_discoverabilityTitle;
}

- (id)handler
{
  return self->_handler;
}

- (UIMenuElementAttributes)attributes
{
  return self->_attributes;
}

- (UIAction)initWithTitle:(id)a3 image:(id)a4 identifier:(id)a5 discoverabilityTitle:(id)a6 attributes:(unint64_t)a7 state:(int64_t)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  UIAction *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *discoverabilityTitle;
  uint64_t v23;
  id handler;
  objc_super v26;

  v15 = a5;
  v16 = a6;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)UIAction;
  v18 = -[UIMenuElement initWithTitle:image:imageName:](&v26, sel_initWithTitle_image_imageName_, a3, a4, 0);
  if (v18)
  {
    if (v15)
    {
      v19 = (void *)objc_msgSend(v15, "copy");
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("com.apple.action.dynamic.%@"), a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v18->_identifier, v19);
    if (!v15)
    {

      v19 = a3;
    }

    v21 = objc_msgSend(v16, "copy");
    discoverabilityTitle = v18->_discoverabilityTitle;
    v18->_discoverabilityTitle = (NSString *)v21;

    v18->_attributes = a7;
    v18->_state = a8;
    v23 = objc_msgSend(v17, "copy");
    handler = v18->_handler;
    v18->_handler = (id)v23;

  }
  return v18;
}

- (void)setDiscoverabilityTitle:(NSString *)discoverabilityTitle
{
  objc_setProperty_nonatomic_copy(self, a2, discoverabilityTitle, 104);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NSString isEqualToString:](self->_identifier, "isEqualToString:", v4[14]);

  return v5;
}

- (void)setState:(UIMenuElementState)state
{
  -[UIAction _setState:notifyingObservers:](self, "_setState:notifyingObservers:", state, 1);
}

- (void)setAttributes:(UIMenuElementAttributes)attributes
{
  self->_attributes = attributes;
}

+ (UIAction)actionWithHandler:(UIActionHandler)handler
{
  UIActionHandler v4;
  void *v5;

  v4 = handler;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:identifier:discoverabilityTitle:attributes:state:handler:", &stru_1E16EDF20, 0, 0, 0, 0, 0, v4);

  return (UIAction *)v5;
}

- (id)_immutableCopy
{
  return -[UIAction initWithAction:]([_UIImmutableAction alloc], "initWithAction:", self);
}

+ (NSString)_textFromCameraTitle
{
  return (NSString *)_UINSLocalizedStringWithDefaultValue(CFSTR("Scan Text"), CFSTR("Scan Text"));
}

+ (NSString)_textFromCameraImageName
{
  return (NSString *)CFSTR("text.viewfinder");
}

- (void)_setState:(int64_t)a3 notifyingObservers:(BOOL)a4
{
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a4)
      _UIMenuStateObserverableLeafStateDidChange(self);
  }
}

- (void)setImage:(UIImage *)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAction;
  -[UIMenuElement _setImage:](&v3, sel__setImage_, image);
}

- (NSPointerArray)_getStateObservers
{
  return self->stateObservers;
}

+ (UIAction)textInteractableItemDefaultAction
{
  if (_MergedGlobals_950 != -1)
    dispatch_once(&_MergedGlobals_950, &__block_literal_global_38);
  return (UIAction *)(id)qword_1ECD7CC18;
}

void __82__UIAction_UITextInteractableItemDefaultAction__textInteractableItemDefaultAction__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, 0, CFSTR("UITextInteractableItemDefaultAction"), &__block_literal_global_5_0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7CC18;
  qword_1ECD7CC18 = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (BOOL)keepsMenuPresented
{
  return (-[UIAction attributes](self, "attributes") >> 3) & 1;
}

- (UIAction)initWithCoder:(id)a3
{
  id v4;
  UIAction *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *discoverabilityTitle;
  uint64_t v10;
  UIImage *selectedImage;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIAction;
  v5 = -[UIMenuElement initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("discoverabilityTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    discoverabilityTitle = v5->_discoverabilityTitle;
    v5->_discoverabilityTitle = (NSString *)v8;

    v5->_attributes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attributes"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("states"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedImage"));
    v10 = objc_claimAutoreleasedReturnValue();
    selectedImage = v5->_selectedImage;
    v5->_selectedImage = (UIImage *)v10;

    v5->_requiresAuthenticatedInput = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresAuthenticatedInput"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *discoverabilityTitle;
  unint64_t attributes;
  int64_t state;
  UIImage *selectedImage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAction;
  -[UIMenuElement encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  discoverabilityTitle = self->_discoverabilityTitle;
  if (discoverabilityTitle)
    objc_msgSend(v4, "encodeObject:forKey:", discoverabilityTitle, CFSTR("discoverabilityTitle"));
  attributes = self->_attributes;
  if (attributes)
    objc_msgSend(v4, "encodeInteger:forKey:", attributes, CFSTR("attributes"));
  state = self->_state;
  if (state)
    objc_msgSend(v4, "encodeInteger:forKey:", state, CFSTR("states"));
  selectedImage = self->_selectedImage;
  if (selectedImage)
    objc_msgSend(v4, "encodeObject:forKey:", selectedImage, CFSTR("selectedImage"));
  if (self->_requiresAuthenticatedInput)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("requiresAuthenticatedInput"));

}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)setTitle:(NSString *)title
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIAction;
  -[UIMenuElement _setTitle:](&v3, sel__setTitle_, title);
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a5)
    (*((void (**)(id, UIAction *))a5 + 2))(a5, self);
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  if (a5)
    return (*((uint64_t (**)(id, UIAction *))a5 + 2))(a5, self);
  else
    return 0;
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    (*((void (**)(id, UIAction *))a4 + 2))(a4, self);
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4)
    return (*((uint64_t (**)(id, UIAction *))a4 + 2))(a4, self);
  else
    return 0;
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

- (id)sender
{
  return _UIMenuLeafAPISenderFromSender(self->_sender);
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return (UIPopoverPresentationControllerSourceItem *)_UIMenuLeafPresentationSourceItemFromSender(self->_sender);
}

- (void)performWithSender:(id)a3 target:(id)a4
{
  id sender;
  id v7;

  v7 = a3;
  _UIMenuStateObserverableLeafWillPerformAction(self);
  if (self->_handler)
  {
    objc_storeStrong(&self->_sender, a3);
    (*((void (**)(void))self->_handler + 2))();
    sender = self->_sender;
    self->_sender = 0;

  }
}

- (void)_performWithTarget:(id)a3
{
  -[UIAction performWithSender:target:](self, "performWithSender:target:", 0, 0);
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  return 0;
}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return (id)objc_msgSend(a5, "validatedActionForTarget:action:", a4, self);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[UIMenuElement title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIMenuElement image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("; image = <%@: %p"), objc_opt_class(), v7);
    if (objc_msgSend(v7, "isSymbolImage"))
    {
      _UIImageName(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR("; symbol = (%@)"), v8);

    }
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  }
  if (-[UIAction attributes](self, "attributes"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[UIAction attributes](self, "attributes") & 1) != 0)
      objc_msgSend(v9, "addObject:", CFSTR("Disabled"));
    if ((-[UIAction attributes](self, "attributes") & 2) != 0)
      objc_msgSend(v9, "addObject:", CFSTR("Destructive"));
    if ((-[UIAction attributes](self, "attributes") & 4) != 0)
      objc_msgSend(v9, "addObject:", CFSTR("Hidden"));
    if (-[UIAction keepsMenuPresented](self, "keepsMenuPresented"))
      objc_msgSend(v9, "addObject:", CFSTR("KeepsMenuPresented"));
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("|"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; attributes = (%@)"), v10);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return (NSString *)v6;
}

- (void)_addStateObserver:(id)a3
{
  _UIMenuStateObserverableLeafAddObserver(self, a3);
}

- (void)_removeStateObserver:(id)a3
{
  _UIMenuStateObserverableLeafRemoveObserver(self, a3);
}

- (BOOL)requiresAuthenticatedInput
{
  return self->_requiresAuthenticatedInput;
}

- (void)_setStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->stateObservers, a3);
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

+ (UIAction)captureTextFromCameraActionForResponder:(UIResponder *)responder identifier:(UIActionIdentifier)identifier
{
  UIResponder *v5;
  NSString *v6;
  void *v7;
  void *v8;
  UIResponder *v9;
  void *v10;
  _QWORD v12[4];
  UIResponder *v13;

  v5 = responder;
  v6 = identifier;
  +[UIAction _textFromCameraTitleForResponder:](UIAction, "_textFromCameraTitleForResponder:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction _textFromCameraImage](UIAction, "_textFromCameraImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__UIAction_UICaptureTextFromCameraSupporting__captureTextFromCameraActionForResponder_identifier___block_invoke;
  v12[3] = &unk_1E16B2C10;
  v13 = v5;
  v9 = v5;
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, v8, v6, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAction *)v10;
}

uint64_t __98__UIAction_UICaptureTextFromCameraSupporting__captureTextFromCameraActionForResponder_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "captureTextFromCamera:", a2);
}

+ (id)_textFromCameraTitleForResponder:(id)a3
{
  void *v3;
  __CFString *v4;
  void *v5;

  +[UIKeyboardCameraSession keyboardCameraContentTypeForResponder:](UIKeyboardCameraSession, "keyboardCameraContentTypeForResponder:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("tel")))
  {
    v4 = CFSTR("Scan Phone Number");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("street-address")))
  {
    v4 = CFSTR("Scan Address");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("url")))
  {
    v4 = CFSTR("Scan URL");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("email")))
  {
    v4 = CFSTR("Scan Email Address");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("flight-number")))
  {
    v4 = CFSTR("Scan Flight Number");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("shipment-tracking-number")))
  {
    v4 = CFSTR("Scan Tracking Number");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("date-time")))
  {
    v4 = CFSTR("Scan Date or Time");
  }
  else
  {
    v4 = CFSTR("Scan Text");
  }
  _UINSLocalizedStringWithDefaultValue(v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (UIImage)_textFromCameraImage
{
  void *v2;
  void *v3;

  +[UIAction _textFromCameraImageName](UIAction, "_textFromCameraImageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

@end
