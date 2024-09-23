@implementation VTUIProximityView

- (BOOL)_shouldUsePhoneLandscapeLayoutForSize:(CGSize)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "interfaceOrientation");

  +[MGWrapper sharedMGWrapper](MGWrapper, "sharedMGWrapper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDeviceIPad");

  if ((unint64_t)(v7 - 3) < 2)
    return v9 ^ 1;
  else
    return 0;
}

- (void)updateContainerConstraintsForOrientationChangeToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  v6 = (void *)MEMORY[0x24BDD1628];
  -[VTUIProximityView viewConstraints](self, "viewConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deactivateConstraints:", v7);

  -[VTUIProximityView _setupConstraintsToSize:](self, "_setupConstraintsToSize:", width, height);
  -[VTUIProximityView layoutIfNeeded](self, "layoutIfNeeded");
}

@end
