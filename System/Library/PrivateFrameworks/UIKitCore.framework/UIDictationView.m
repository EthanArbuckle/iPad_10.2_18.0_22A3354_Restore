@implementation UIDictationView

+ (id)activeInstance
{
  return (id)gDictationViewSharedInstance;
}

+ (Class)dictationViewClass
{
  switch(+[UIDictationController viewMode](UIDictationController, "viewMode"))
  {
    case 2:
    case 3:
    case 4:
    case 7:
      +[UIDictationController viewMode](UIDictationController, "viewMode");
      break;
    default:
      break;
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (CGSize)viewSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  switch(+[UIDictationController viewMode](UIDictationController, "viewMode"))
  {
    case 0:
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v4 = v10;
      v12 = v11;

      v6 = v12 + -200.0;
      break;
    case 1:
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferencesActions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rivenSizeFactor:", 118.0);
      v4 = v15;
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "preferencesActions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rivenSizeFactor:", 118.0);
      v6 = v18;

      break;
    case 2:
    case 3:
    case 4:
    case 7:
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardImpl defaultSizeForInterfaceOrientation:](UIKeyboardImpl, "defaultSizeForInterfaceOrientation:", objc_msgSend(v2, "interfaceOrientation"));
      v4 = v3;
      v6 = v5;

      break;
    case 6:
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v4 = v20;

      v6 = 100.0;
      break;
    default:
      v4 = *MEMORY[0x1E0C9D820];
      v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }
  v21 = v4;
  v22 = v6;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (UIDictationView)sharedInstance
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  objc_class *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;

  if (!MGGetBoolAnswer())
  {
    v8 = 0;
    return (UIDictationView *)v8;
  }
  v3 = objc_opt_class();
  v4 = objc_msgSend(a1, "dictationViewClass");
  v5 = (void *)gDictationViewSharedInstance;
  if (gDictationViewSharedInstance)
    v6 = v3 == v4;
  else
    v6 = 0;
  if (v6)
    goto LABEL_10;
  v7 = v4;
  v8 = (id)objc_msgSend(a1, "dictationViewClass");
  if (v8)
  {
    v9 = (objc_class *)v8;
    objc_msgSend(v8, "layoutSize");
    v11 = v10;
    v13 = v12;
    if (v3 != v7)
      objc_msgSend((id)gDictationViewSharedInstance, "removeFromSuperview");
    v14 = objc_msgSend([v9 alloc], "initWithFrame:", 0.0, 0.0, v11, v13);
    v15 = (void *)gDictationViewSharedInstance;
    gDictationViewSharedInstance = v14;

    v5 = (void *)gDictationViewSharedInstance;
LABEL_10:
    v8 = v5;
  }
  return (UIDictationView *)v8;
}

- (void)highlightEndpointButton
{
  -[UIButton setHighlighted:](self->_endpointButton, "setHighlighted:", 1);
}

- (id)endpointButton
{
  UIButton *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v3 = self->_endpointButton;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "interfaceOrientation");
    v6 = 3;
    if ((unint64_t)(v5 - 1) < 2)
      v6 = 2;
    v3 = (UIButton *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                       + OBJC_IVAR___UIKeyboardDicationBackground__gradient[v6]));

  }
  return v3;
}

- (CGSize)currentScreenSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  CGSize result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation") - 3;

  if (v8 >= 2)
    v9 = v4;
  else
    v9 = v6;
  if (v8 >= 2)
    v10 = v6;
  else
    v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)applicationEnteredBackground
{
  id v2;

  -[UIView removeFromSuperview](self, "removeFromSuperview");
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableInterfaceAutorotation:", 0);

}

- (CGPoint)positionForShow
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGSize)layoutSize
{
  double v2;
  double v3;
  CGSize result;

  +[UIDictationView viewSize](UIDictationView, "viewSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)backgroundOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;

  if (self->_keyboardInTransition)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "disableInterfaceAutorotation:", 0);

    self->_keyboardInTransition = 0;
  }
}

- (void)prepareForReturnToKeyboard
{
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInteractionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionChanged");

}

- (void)finishReturnToKeyboard
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v2)
  {
    objc_msgSend(v6, "keyboardInputModeToReturn");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyboardInputMode:userInitiated:", v5, 0);
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isTrackpadMode"))
  {
    objc_msgSend(v4, "_layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didEndTrackpadModeForServerSideDictation");
LABEL_5:

  }
  objc_msgSend(v6, "setKeyboardInputModeToReturn:", 0);

}

- (void)returnToKeyboard
{
  -[UIDictationView prepareForReturnToKeyboard](self, "prepareForReturnToKeyboard");
  -[UIDictationView finishReturnToKeyboard](self, "finishReturnToKeyboard");
}

- (BOOL)isShowing
{
  void *v2;
  BOOL v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (UIDictationView)initWithFrame:(CGRect)a3
{
  UIDictationView *v3;
  UIDictationView *v4;
  UIKeyboardDicationBackground *v5;
  uint64_t v6;
  UIKeyboardDicationBackground *background;
  void *v8;
  UIDictationView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIDictationView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    if (!-[UIDictationView drawsOwnBackground](v3, "drawsOwnBackground"))
    {
      v5 = [UIKeyboardDicationBackground alloc];
      -[UIView bounds](v4, "bounds");
      v6 = -[UIKeyboardDicationBackground initWithFrame:](v5, "initWithFrame:");
      background = v4->_background;
      v4->_background = (UIKeyboardDicationBackground *)v6;

      -[UIKeyboardDicationBackground gradient](v4->_background, "gradient");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDictationView:", v4);

      -[UIView setNeedsDisplay](v4->_background, "setNeedsDisplay");
      -[UIView addSubview:](v4, "addSubview:", v4->_background);
    }
    v9 = v4;
  }

  return v4;
}

- (void)removeBackgroundView
{
  void *v3;
  UIKeyboardDicationBackground *background;

  -[UIView removeFromSuperview](self->_background, "removeFromSuperview");
  -[UIKeyboardDicationBackground gradient](self->_background, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDictationView:", 0);

  background = self->_background;
  self->_background = 0;

}

- (BOOL)drawsOwnBackground
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v6[1] = CFSTR("UIKeyboardDidShowNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[UIDictationView removeBackgroundView](self, "removeBackgroundView");
  v5.receiver = self;
  v5.super_class = (Class)UIDictationView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (void)endpointButtonPressed
{
  id v3;

  if (self->_displayDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIDictationViewDisplayDelegate doneButtonPressed](self->_displayDelegate, "doneButtonPressed");
  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopDictation");

  }
}

- (BOOL)visible
{
  void *v2;
  BOOL v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (float)audioLevelForFlamesView:(id)a3
{
  id v4;
  float v5;
  float v6;
  void *v7;
  float v8;

  v4 = a3;
  if (self->_displayDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIDictationViewDisplayDelegate nextAudioLevel](self->_displayDelegate, "nextAudioLevel");
    v6 = v5;
  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioLevel");
    v6 = v8;

  }
  return v6;
}

- (UIDictationViewDisplayDelegate)displayDelegate
{
  return self->_displayDelegate;
}

- (void)setDisplayDelegate:(id)a3
{
  self->_displayDelegate = (UIDictationViewDisplayDelegate *)a3;
}

- (BOOL)showLanguageLabel
{
  return self->_showLanguageLabel;
}

- (void)setShowLanguageLabel:(BOOL)a3
{
  self->_showLanguageLabel = a3;
}

- (BOOL)switchingLanguage
{
  return self->_switchingLanguage;
}

- (void)setSwitchingLanguage:(BOOL)a3
{
  self->_switchingLanguage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_endpointButtonLandscape, 0);
  objc_storeStrong((id *)&self->_endpointButton, 0);
  objc_storeStrong((id *)&self->_background, 0);
}

@end
