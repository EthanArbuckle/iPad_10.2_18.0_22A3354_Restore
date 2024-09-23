@implementation SBAlertItem

- (SBAlertItem)init
{
  SBAlertItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAlertItem;
  result = -[SBAlertItem init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_allowInSetup = 256;
    result->_allowMessageInCar = 1;
    result->_presented = 0;
    result->_presentationState = 4;
    result->_shouldMaskIcon = 1;
  }
  return result;
}

+ (id)_alertItemsController
{
  return -[objc_class sharedInstance](NSClassFromString(CFSTR("SBAlertItemsController")), "sharedInstance");
}

+ (void)activateAlertItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_alertItemsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateAlertItem:", v4);

}

- (id)alertController
{
  return self->_alertController;
}

- (id)lockLabel
{
  return 0;
}

- (id)shortLockLabel
{
  return 0;
}

- (BOOL)allowMenuButtonDismissal
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)shouldShowInEmergencyCall
{
  return 0;
}

- (BOOL)wakeDisplay
{
  _BOOL4 v3;

  v3 = -[SBAlertItem undimsScreen](self, "undimsScreen");
  if (v3)
    LOBYTE(v3) = -[SBAlertItem unlocksScreen](self, "unlocksScreen");
  return v3;
}

- (BOOL)reappearsAfterLock
{
  return !-[SBAlertItem dismissOnLock](self, "dismissOnLock");
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)didPlayPresentationSound
{
  return self->_didPlayPresentationSound;
}

- (void)playPresentationSound
{
  id v3;

  if (!-[SBAlertItem didPlayPresentationSound](self, "didPlayPresentationSound"))
  {
    self->_didPlayPresentationSound = 1;
    -[SBAlertItem sound](self, "sound");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playInEvironments:completion:", 1, 0);

  }
}

- (id)sound
{
  return 0;
}

- (void)didActivate
{
  if (!self->_didEverActivate)
    self->_didEverActivate = 1;
}

- (void)deactivate
{
  -[SBAlertItem deactivateForReason:](self, "deactivateForReason:", 2);
}

- (void)deactivateForButton
{
  -[SBAlertItem deactivateForReason:](self, "deactivateForReason:", 3);
}

- (void)deactivateForReason:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "_alertItemsController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateAlertItem:reason:", self, v3);

}

- (void)setIconImagePath:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_iconImagePath, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithContentsOfFile:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SBAlertItem setIconImage:](self, "setIconImage:", v6);
}

- (BOOL)behavesSuperModally
{
  return 0;
}

- (BOOL)allowInLoginWindow
{
  return 0;
}

- (int)alertPriority
{
  return 0;
}

- (BOOL)dismissesOverlaysOnLockScreen
{
  return 0;
}

- (BOOL)hideOnClonedDisplay
{
  return 0;
}

- (void)_setPresentationState:(unint64_t)a3
{
  if (self->_presentationState != a3)
  {
    self->_presentationState = a3;
    -[SBAlertItem presentationStateDidChangeFromState:toState:](self, "presentationStateDidChangeFromState:toState:");
  }
}

- (void)presentationStateDidChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  NSObject *v6;
  const __CFString *v7;
  int v8;
  SBAlertItem *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  SBLogCFUserNotifications();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 - 1 > 3)
      v7 = CFSTR("Unknown");
    else
      v7 = off_24D4D0090[a4 - 1];
    v8 = 134218242;
    v9 = self;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_215F8C000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Presentation state changed to %{public}@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)_deactivationCompleted
{
  -[SBAlertItem _setPresented:](self, "_setPresented:", 0);
  -[SBAlertItem _clearAlertController](self, "_clearAlertController");
}

- (id)_alertController
{
  return self->_alertController;
}

- (void)_clearAlertController
{
  _SBAlertController *alertController;

  alertController = self->_alertController;
  self->_alertController = 0;

}

- (id)_prepareNewAlertControllerWithLockedState:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _SBAlertController *v7;
  _SBAlertController *alertController;
  void *v9;
  _SBAlertItemHeaderViewController *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  -[SBAlertItem _clearAlertController](self, "_clearAlertController");
  v7 = -[_SBAlertController initWithStyleProvider:]([_SBAlertController alloc], "initWithStyleProvider:", self);
  alertController = self->_alertController;
  self->_alertController = v7;

  -[_SBAlertController setAlertItem:](self->_alertController, "setAlertItem:", self);
  -[_SBAlertController setPreferredStyle:](self->_alertController, "setPreferredStyle:", 1);
  if (!v5)
  {
    -[SBAlertItem _headerImage](self, "_headerImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[_SBAlertItemHeaderViewController initWithImage:]([_SBAlertItemHeaderViewController alloc], "initWithImage:", v9);
      -[_SBAlertController _setHeaderContentViewController:](self->_alertController, "_setHeaderContentViewController:", v10);

    }
  }
  -[SBAlertItem configure:requirePasscodeForActions:](self, "configure:requirePasscodeForActions:", v5, v4);
  if (-[SBAlertItem hideOnClonedDisplay](self, "hideOnClonedDisplay"))
    -[_SBAlertController setHiddenOnClonedDisplay:](self->_alertController, "setHiddenOnClonedDisplay:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("SBAlertItemDidPrepareNewAlertControllerNotification"), self, 0);

  return self->_alertController;
}

- (id)_systemApertureElement
{
  SAElement *systemApertureElement;
  SAElement **p_systemApertureElement;
  void *v5;

  p_systemApertureElement = &self->_systemApertureElement;
  systemApertureElement = self->_systemApertureElement;
  if (!systemApertureElement)
  {
    -[SBAlertItem _createSystemApertureElement](self, "_createSystemApertureElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "addElementLayoutSpecifierObserver:", self);
      objc_storeStrong((id *)p_systemApertureElement, v5);
    }

    systemApertureElement = *p_systemApertureElement;
  }
  return systemApertureElement;
}

- (SAElement)_existingSystemApertureElement
{
  return self->_systemApertureElement;
}

- (id)_createSystemApertureElement
{
  return 0;
}

- (void)_setPresented:(BOOL)a3
{
  _BOOL4 presented;
  BOOL v4;
  BOOL v5;

  presented = self->_presented;
  if (presented != a3)
  {
    self->_presented = a3;
    if (presented || !a3)
    {
      v4 = !presented;
      v5 = a3;
      if (v4)
        v5 = 1;
      if (!v5)
        -[SBAlertItem alertItemDidDisappear](self, "alertItemDidDisappear");
    }
    else
    {
      -[SBAlertItem alertItemDidAppear](self, "alertItemDidAppear");
    }
  }
}

- (BOOL)_hasActiveKeyboardOnScreen
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SBAlertItem alertController](self, "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sb_hasActiveKeyboardOnScreen");

  return v5;
}

- (BOOL)_didEverActivate
{
  return self->_didEverActivate;
}

- (BOOL)_displayActionButtonOnLockScreen
{
  return 0;
}

- (id)_publicDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBAlertItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAlertItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_presented, CFSTR("presented"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAlertItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  return 0;
}

- (NSString)elementIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)clientIdentifier
{
  if (clientIdentifier_onceToken != -1)
    dispatch_once(&clientIdentifier_onceToken, &__block_literal_global_1);
  return (NSString *)(id)clientIdentifier___clientIdentifier;
}

void __31__SBAlertItem_clientIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientIdentifier___clientIdentifier;
  clientIdentifier___clientIdentifier = v0;

}

- (void)elementLayoutSpecifier:(id)a3 layoutModeDidChange:(int64_t)a4 reason:(int64_t)a5
{
  if (objc_msgSend(a3, "layoutMode") <= 0 && self->_presentationState != 3)
    -[SBAlertItem deactivateForReason:](self, "deactivateForReason:", 2);
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)unlocksScreen
{
  return 1;
}

- (BOOL)ignoreIfAlreadyDisplaying
{
  return self->_ignoreIfAlreadyDisplaying;
}

- (void)setIgnoreIfAlreadyDisplaying:(BOOL)a3
{
  self->_ignoreIfAlreadyDisplaying = a3;
}

- (BOOL)allowInSetup
{
  return self->_allowInSetup;
}

- (void)setAllowInSetup:(BOOL)a3
{
  self->_allowInSetup = a3;
}

- (BOOL)suppressForKeynote
{
  return self->_suppressForKeynote;
}

- (void)setSuppressForKeynote:(BOOL)a3
{
  self->_suppressForKeynote = a3;
}

- (BOOL)pendInSetupIfNotAllowed
{
  return self->_pendInSetupIfNotAllowed;
}

- (void)setPendInSetupIfNotAllowed:(BOOL)a3
{
  self->_pendInSetupIfNotAllowed = a3;
}

- (BOOL)pendWhileKeyBagLocked
{
  return self->_pendWhileKeyBagLocked;
}

- (void)setPendWhileKeyBagLocked:(BOOL)a3
{
  self->_pendWhileKeyBagLocked = a3;
}

- (NSArray)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (void)setAllowedBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedBundleIDs, a3);
}

- (BOOL)allowInCar
{
  return self->_allowInCar;
}

- (void)setAllowInCar:(BOOL)a3
{
  self->_allowInCar = a3;
}

- (BOOL)allowMessageInCar
{
  return self->_allowMessageInCar;
}

- (void)setAllowMessageInCar:(BOOL)a3
{
  self->_allowMessageInCar = a3;
}

- (BOOL)_ignoresQuietMode
{
  return self->_ignoresQuietMode;
}

- (void)_setIgnoresQuietMode:(BOOL)a3
{
  self->_ignoresQuietMode = a3;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (BOOL)allowDuringTransitionAnimations
{
  return self->_allowDuringTransitionAnimations;
}

- (void)setAllowDuringTransitionAnimations:(BOOL)a3
{
  self->_allowDuringTransitionAnimations = a3;
}

- (NSString)_iconImagePath
{
  return self->_iconImagePath;
}

- (unint64_t)_presentationState
{
  return self->_presentationState;
}

- (BOOL)_isPresented
{
  return self->_presented;
}

- (UIImage)_headerImage
{
  return self->_headerImage;
}

- (void)_setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);
}

- (UIImage)_attachmentImage
{
  return self->_attachmentImage;
}

- (void)_setAttachmentImage:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentImage, a3);
}

- (UIWindowScene)_preferredActivationWindowScene
{
  return self->__preferredActivationWindowScene;
}

- (void)_setPreferredActivationWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->__preferredActivationWindowScene, a3);
}

- (BOOL)shouldMaskIcon
{
  return self->_shouldMaskIcon;
}

- (void)setShouldMaskIcon:(BOOL)a3
{
  self->_shouldMaskIcon = a3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->__preferredActivationWindowScene, 0);
  objc_storeStrong((id *)&self->_attachmentImage, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_iconImagePath, 0);
  objc_storeStrong((id *)&self->_allowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_systemApertureElement, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
