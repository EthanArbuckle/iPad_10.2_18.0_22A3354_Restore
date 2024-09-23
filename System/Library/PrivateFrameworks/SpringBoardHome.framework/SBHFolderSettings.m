@implementation SBHFolderSettings

- (BOOL)pinchToClose
{
  return self->_pinchToClose;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHFolderSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBHFolderSettings setAllowNestedFolders:](self, "setAllowNestedFolders:", 0);
  -[SBHFolderSettings setPinchToClose:](self, "setPinchToClose:", 0);
  -[SBHFolderSettings setMinPinchScale:](self, "setMinPinchScale:", 0.8);
  -[SBHFolderSettings setAnimatesPageScrubbing:](self, "setAnimatesPageScrubbing:", 0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Allow Nested Folders"), CFSTR("allowNestedFolders"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Pinch to Close"), CFSTR("pinchToClose"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Pinch Scale"), CFSTR("minPinchScale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animate page scrubbing"), CFSTR("animatesPageScrubbing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83078];
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "moduleWithTitle:contents:", CFSTR("Folders"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)allowNestedFolders
{
  return self->_allowNestedFolders;
}

- (void)setAllowNestedFolders:(BOOL)a3
{
  self->_allowNestedFolders = a3;
}

- (void)setPinchToClose:(BOOL)a3
{
  self->_pinchToClose = a3;
}

- (double)minPinchScale
{
  return self->_minPinchScale;
}

- (void)setMinPinchScale:(double)a3
{
  self->_minPinchScale = a3;
}

- (BOOL)animatesPageScrubbing
{
  return self->_animatesPageScrubbing;
}

- (void)setAnimatesPageScrubbing:(BOOL)a3
{
  self->_animatesPageScrubbing = a3;
}

@end
