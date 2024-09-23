@implementation UIVideoEditorController

+ (BOOL)canEditVideoAtPath:(NSString *)videoPath
{
  int v4;

  v4 = MGGetBoolAnswer();
  if (v4)
    LOBYTE(v4) = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath);
  return v4;
}

- (UIVideoEditorController)init
{
  UIVideoEditorController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIVideoEditorController;
  v2 = -[UIViewController init](&v4, sel_init);
  if (v2 && (!MGGetBoolAnswer() || !UIImagePickerLoadPhotoLibraryIfNecessary()))
  {

    return 0;
  }
  return v2;
}

- (void)viewWillUnload
{
  objc_super v3;

  if (-[UIViewController parentViewController](self, "parentViewController")
    && !-[UIViewController presentingViewController](self, "presentingViewController"))
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[UIVideoEditorController _removeAllChildren](self, "_removeAllChildren");
  }
  v3.receiver = self;
  v3.super_class = (Class)UIVideoEditorController;
  -[UIViewController viewWillUnload](&v3, sel_viewWillUnload);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  int v6;
  objc_super v7;

  v3 = a3;
  if ((*(_BYTE *)&self->_flags & 3) == 0)
  {
    *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFA | 1;
    -[UIVideoEditorController _setupControllers](self, "_setupControllers");
    if ((objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance") & 1) == 0)
    {
      v5 = objc_msgSend(__UIStatusBarManagerForWindow(-[UINavigationController _window](self, "_window")), "statusBarStyle");
      if (objc_msgSend(__UIStatusBarManagerForWindow(-[UINavigationController _window](self, "_window")), "isStatusBarHidden"))v6 = -1;
      else
        v6 = v5;
      self->_previousStatusBarStyle = v6;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UIVideoEditorController;
  -[UINavigationController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t previousStatusBarStyle;
  BOOL v9;
  double v11;
  double v12;
  objc_super v13;

  v3 = a3;
  if ((objc_msgSend((id)UIApp, "_viewControllerBasedStatusBarAppearance") & 1) == 0)
  {
    v5 = -[UINavigationController viewControllers](self, "viewControllers");
    if (!-[UIViewController presentedViewController](self, "presentedViewController")
      && -[NSArray count](v5, "count") >= 2)
    {
      *(_BYTE *)&self->_flags |= 4u;
      v6 = objc_msgSend(__UIStatusBarManagerForWindow(-[UINavigationController _window](self, "_window")), "statusBarStyle");
      v7 = objc_msgSend(-[NSArray lastObject](v5, "lastObject"), "_imagePickerStatusBarStyle");
      previousStatusBarStyle = self->_previousStatusBarStyle;
      v9 = (_DWORD)previousStatusBarStyle != -1 && v6 == v7;
      if (v9 && v6 != previousStatusBarStyle)
      {
        if (v3)
        {
          +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", 2);
          *(float *)&v11 = v11;
          v12 = *(float *)&v11;
          previousStatusBarStyle = self->_previousStatusBarStyle;
        }
        else
        {
          v12 = 0.0;
        }
        objc_msgSend((id)UIApp, "setStatusBarStyle:duration:", previousStatusBarStyle, v12);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UIVideoEditorController;
  -[UINavigationController viewWillDisappear:](&v13, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[UIViewController parentViewController](self, "parentViewController")
    && !-[UIViewController presentingViewController](self, "presentingViewController"))
  {
    *(_BYTE *)&self->_flags &= ~1u;
    -[UIVideoEditorController _removeAllChildren](self, "_removeAllChildren");
  }
  *(_BYTE *)&self->_flags &= ~4u;
  v5.receiver = self;
  v5.super_class = (Class)UIVideoEditorController;
  -[UINavigationController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (BOOL)_didRevertStatusBar
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

- (void)_removeAllChildren
{
  if (-[UINavigationController topViewController](self, "topViewController"))
  {
    if (-[UIViewController presentedViewController](self, "presentedViewController"))
    {
      *(_BYTE *)&self->_flags |= 2u;
      -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
      *(_BYTE *)&self->_flags &= ~2u;
    }
    -[UINavigationController setViewControllers:](self, "setViewControllers:", MEMORY[0x1E0C9AA60]);
    -[UIView layoutSubviews](-[UIViewController view](self, "view"), "layoutSubviews");
  }
}

- (id)_createInitialController
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("PLUIEditVideoViewController"))), "initWithProperties:", -[UIVideoEditorController _properties](self, "_properties"));
  objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (void)_setupControllers
{
  id v3;
  id v4;

  v3 = -[UIVideoEditorController _createInitialController](self, "_createInitialController");
  if (v3)
  {
    v4 = v3;
    -[UIVideoEditorController _removeAllChildren](self, "_removeAllChildren");
    -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", objc_msgSend(v4, "_displaysFullScreen"), 0);
    -[UINavigationController pushViewController:animated:](self, "pushViewController:animated:", v4, 0);

  }
}

- (void)_autoDismiss
{
  -[UIViewController dismissViewControllerAnimated:completion:](-[UIViewController presentingViewController](self, "presentingViewController"), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)editVideoViewControllerDidCancel:(id)a3
{
  -[UINavigationController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[UINavigationController delegate](self, "delegate"), "videoEditorControllerDidCancel:", self);
  else
    -[UIVideoEditorController _autoDismiss](self, "_autoDismiss");
}

- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  void *v7;
  int v8;
  uint64_t v9;
  BOOL v10;

  v7 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("UIImagePickerControllerMediaURL"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "isFileURL");
    if (v8)
    {
      v9 = objc_msgSend(v7, "path");
      LOBYTE(v8) = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    LOBYTE(v8) = objc_opt_isKindOfClass();
    if ((v8 & 1) != 0)
      v9 = (uint64_t)v7;
    else
      v9 = 0;
  }
  if (v7)
    v10 = (v8 & (v9 == 0)) == 0;
  else
    v10 = 0;
  if (!v10)
    goto LABEL_19;
  if (objc_msgSend(-[UINavigationController delegate](self, "delegate"), "conformsToProtocol:", &unk_1EE0CE108))
  {
    -[UINavigationController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(-[UINavigationController delegate](self, "delegate"), "videoEditorController:didTrimVideoWithOptions:", self, a4);
      return;
    }
  }
  if (v9)
  {
    -[UINavigationController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(-[UINavigationController delegate](self, "delegate"), "videoEditorController:didSaveEditedVideoToPath:", self, v9);
    else
      -[UIVideoEditorController _autoDismiss](self, "_autoDismiss");
  }
  else
  {
LABEL_19:
    -[UIVideoEditorController editVideoViewControllerDidCancel:](self, "editVideoViewControllerDidCancel:", a3);
  }
}

- (void)editVideoViewController:(id)a3 didFailWithError:(id)a4
{
  -[UINavigationController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[UINavigationController delegate](self, "delegate"), "videoEditorController:didFailWithError:", self, a4);
  else
    -[UIVideoEditorController _autoDismiss](self, "_autoDismiss");
}

- (NSString)videoPath
{
  id v3;
  NSString *result;

  v3 = -[UIVideoEditorController _videoURL](self, "_videoURL");
  if (!objc_msgSend(v3, "isFileURL"))
    return (NSString *)-[UIVideoEditorController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIVideoEditorControllerVideoPath"));
  result = (NSString *)objc_msgSend(v3, "path");
  if (!result)
    return (NSString *)-[UIVideoEditorController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIVideoEditorControllerVideoPath"));
  return result;
}

- (void)setVideoPath:(NSString *)videoPath
{
  -[UIVideoEditorController _setVideoURL:](self, "_setVideoURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", videoPath, 0));
  -[UIVideoEditorController _setValue:forProperty:](self, "_setValue:forProperty:", videoPath, CFSTR("_UIVideoEditorControllerVideoPath"));
}

- (id)_videoURL
{
  return -[UIVideoEditorController _valueForProperty:](self, "_valueForProperty:", CFSTR("_UIVideoEditorControllerVideoURL"));
}

- (void)_setVideoURL:(id)a3
{
  -[UIVideoEditorController _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("_UIVideoEditorControllerVideoURL"));
}

- (NSTimeInterval)videoMaximumDuration
{
  NSTimeInterval result;

  objc_msgSend(-[UIVideoEditorController _valueForProperty:](self, "_valueForProperty:", CFSTR("UIImagePickerControllerVideoMaximumDuration")), "doubleValue");
  return result;
}

- (void)setVideoMaximumDuration:(NSTimeInterval)videoMaximumDuration
{
  -[UIVideoEditorController _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", videoMaximumDuration), CFSTR("UIImagePickerControllerVideoMaximumDuration"));
}

- (UIImagePickerControllerQualityType)videoQuality
{
  return (uint64_t)(int)objc_msgSend(-[UIVideoEditorController _valueForProperty:](self, "_valueForProperty:", CFSTR("UIImagePickerControllerVideoQuality")), "intValue");
}

- (void)setVideoQuality:(UIImagePickerControllerQualityType)videoQuality
{
  -[UIVideoEditorController _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", videoQuality), CFSTR("UIImagePickerControllerVideoQuality"));
}

- (void)_setProperties:(id)a3
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (properties != a3)
  {

    self->_properties = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a3);
  }
}

- (void)_initializeProperties
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (!self->_properties)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E08]);
    v4 = *MEMORY[0x1E0C9AE40];
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    self->_properties = (NSMutableDictionary *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("UIImagePickerControllerAllowsEditing"), v5, CFSTR("UIImagePickerControllerVideoQuality"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 600.0), CFSTR("UIImagePickerControllerVideoMaximumDuration"), 0);
  }
}

- (id)_properties
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (!properties)
  {
    -[UIVideoEditorController _initializeProperties](self, "_initializeProperties");
    properties = self->_properties;
  }
  return (id)-[NSMutableDictionary copy](properties, "copy");
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (properties)
  {
    if (a3)
    {
LABEL_3:
      -[NSMutableDictionary setObject:forKey:](properties, "setObject:forKey:", a3, a4);
      return;
    }
  }
  else
  {
    -[UIVideoEditorController _initializeProperties](self, "_initializeProperties");
    properties = self->_properties;
    if (a3)
      goto LABEL_3;
  }
  -[NSMutableDictionary removeObjectForKey:](properties, "removeObjectForKey:", a4);
}

- (id)_valueForProperty:(id)a3
{
  NSMutableDictionary *properties;

  properties = self->_properties;
  if (!properties)
  {
    -[UIVideoEditorController _initializeProperties](self, "_initializeProperties");
    properties = self->_properties;
  }
  return (id)-[NSMutableDictionary objectForKey:](properties, "objectForKey:", a3);
}

@end
