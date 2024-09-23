@implementation PUReviewScreenBarsModel

- (void)invokeCallbackForBarButtonItemWithIdentifier:(int64_t)a3
{
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[PUReviewScreenBarsModel availableItemsByIdentifier](self, "availableItemsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (const char *)objc_msgSend(v16, "action");
  objc_msgSend(v16, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(v9, "methodSignatureForSelector:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewScreenBarsModel.m"), 33, CFSTR("target %@ does not appear to respond to selector %@"), v10, v15);

    }
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelector:", v8);
    objc_msgSend(v13, "setTarget:", v10);
    objc_msgSend(v13, "setArgument:atIndex:", &v16, 2);
    objc_msgSend(v13, "invoke");

  }
}

- (void)_updateAvailableControls
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (_updateAvailableControls_onceToken != -1)
    dispatch_once(&_updateAvailableControls_onceToken, &__block_literal_global_79336);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend((id)_updateAvailableControls_controlsByIdentifier, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend((id)_updateAvailableControls_controlsByIdentifier, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (id)_updateAvailableControls_controlsByIdentifier;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PUReviewScreenBarsModel availableItemsByIdentifier](self, "availableItemsByIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend((id)_updateAvailableControls_controlsByIdentifier, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);
          if (objc_msgSend(v11, "isEnabled"))
            objc_msgSend(v17, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  -[PUReviewScreenBarsModel availableControls](self, "availableControls");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v3, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    -[PUReviewScreenBarsModel _setAvailableControls:](self, "_setAvailableControls:", v3);
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 1);
  }
  -[PUReviewScreenBarsModel enabledControls](self, "enabledControls");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v17, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
    -[PUReviewScreenBarsModel _setEnabledControls:](self, "_setEnabledControls:", v17);
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 2);
  }

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenBarsModel;
  -[PUReviewScreenBarsModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setAvailableItemsByIdentifier:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  char v6;
  NSDictionary *v7;
  NSDictionary *availableItemsByIdentifier;
  NSDictionary *v9;

  v4 = (NSDictionary *)a3;
  v5 = v4;
  if (self->_availableItemsByIdentifier != v4)
  {
    v9 = v4;
    v6 = -[NSDictionary isEqual:](v4, "isEqual:");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSDictionary *)-[NSDictionary copy](v9, "copy");
      availableItemsByIdentifier = self->_availableItemsByIdentifier;
      self->_availableItemsByIdentifier = v7;

      -[PUReviewScreenBarsModel _updateAvailableControls](self, "_updateAvailableControls");
      v5 = v9;
    }
  }

}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 4);
    v5 = v6;
  }

}

- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  if (self->_shouldPlaceScrubberInScrubberBar != a3)
  {
    self->_shouldPlaceScrubberInScrubberBar = a3;
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 4);
  }
}

- (void)setTransitioningWithCamera:(BOOL)a3
{
  if (self->_transitioningWithCamera != a3)
  {
    self->_transitioningWithCamera = a3;
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setControlCenterAlignmentPoint:(CGPoint)a3
{
  -[PUReviewScreenBarsModel setControlCenterAlignmentPoint:forceLayout:](self, "setControlCenterAlignmentPoint:forceLayout:", 0, a3.x, a3.y);
}

- (void)setControlCenterAlignmentPoint:(CGPoint)a3 forceLayout:(BOOL)a4
{
  if (a3.x != self->_controlCenterAlignmentPoint.x || a3.y != self->_controlCenterAlignmentPoint.y)
  {
    self->_controlCenterAlignmentPoint = a3;
    self->_lastControlAlignmentChangeForcedLayout = 1;
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setUseVerticalControlLayout:(BOOL)a3
{
  if (self->_useVerticalControlLayout != a3)
  {
    self->_useVerticalControlLayout = a3;
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setShouldBarsCounterrotate:(BOOL)a3
{
  if (self->_shouldBarsCounterrotate != a3)
  {
    self->_shouldBarsCounterrotate = a3;
    -[PUReviewScreenBarsModel signalChange:](self, "signalChange:", 64);
  }
}

- (NSDictionary)availableItemsByIdentifier
{
  return self->_availableItemsByIdentifier;
}

- (NSSet)availableControls
{
  return self->_availableControls;
}

- (void)_setAvailableControls:(id)a3
{
  objc_storeStrong((id *)&self->_availableControls, a3);
}

- (NSSet)enabledControls
{
  return self->_enabledControls;
}

- (void)_setEnabledControls:(id)a3
{
  objc_storeStrong((id *)&self->_enabledControls, a3);
}

- (BOOL)shouldPlaceScrubberInScrubberBar
{
  return self->_shouldPlaceScrubberInScrubberBar;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (BOOL)isTransitioningWithCamera
{
  return self->_transitioningWithCamera;
}

- (CGPoint)controlCenterAlignmentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlCenterAlignmentPoint.x;
  y = self->_controlCenterAlignmentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)lastControlAlignmentChangeForcedLayout
{
  return self->_lastControlAlignmentChangeForcedLayout;
}

- (BOOL)useVerticalControlLayout
{
  return self->_useVerticalControlLayout;
}

- (BOOL)shouldBarsCounterrotate
{
  return self->_shouldBarsCounterrotate;
}

- (BOOL)_needsUpdateAvailableControls
{
  return self->__needsUpdateAvailableControls;
}

- (void)_setNeedsUpdateAvailableControls:(BOOL)a3
{
  self->__needsUpdateAvailableControls = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_enabledControls, 0);
  objc_storeStrong((id *)&self->_availableControls, 0);
  objc_storeStrong((id *)&self->_availableItemsByIdentifier, 0);
}

void __51__PUReviewScreenBarsModel__updateAvailableControls__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E59BBE68;
  v2[1] = &unk_1E59BBE98;
  v3[0] = &unk_1E59BBE80;
  v3[1] = &unk_1E59BBEB0;
  v2[2] = &unk_1E59BBEC8;
  v2[3] = &unk_1E59BBEF8;
  v3[2] = &unk_1E59BBEE0;
  v3[3] = &unk_1E59BBF10;
  v2[4] = &unk_1E59BBF28;
  v2[5] = &unk_1E59BBF58;
  v3[4] = &unk_1E59BBF40;
  v3[5] = &unk_1E59BBF70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_updateAvailableControls_controlsByIdentifier;
  _updateAvailableControls_controlsByIdentifier = v0;

}

@end
