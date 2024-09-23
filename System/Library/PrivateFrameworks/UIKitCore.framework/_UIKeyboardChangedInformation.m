@implementation _UIKeyboardChangedInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)automaticMinimizationEnabled
{
  return self->_automaticMinimizationEnabled;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)sourceSceneIdentityString
{
  return self->_sourceSceneIdentityString;
}

- (NSString)sourceDisplayIdentifier
{
  return self->_sourceDisplayIdentifier;
}

- (NSString)keyboardPreserveKey
{
  return self->_keyboardPreserveKey;
}

- (int)hostProcessIdentifier
{
  return self->_hostProcessIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *sourceSceneIdentityString;
  NSString *sourceDisplayIdentifier;
  NSString *sourceBundleIdentifier;
  NSString *hostBundleIdentifier;
  uint64_t hostProcessIdentifier;
  uint64_t processIdentifier;
  NSString *keyboardPreserveKey;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIKeyboardChangedInformation;
  -[_UIKeyboardUIInformation encodeWithCoder:](&v31, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  objc_msgSend(v5, "valueWithCGRect:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Position"));

  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen"), CFSTR("OnScreen"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation multipleScenes](self, "multipleScenes"), CFSTR("MultipleScenes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation isOneness](self, "isOneness"), CFSTR("IsOneness"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation automaticMinimizationEnabled](self, "automaticMinimizationEnabled"), CFSTR("AutomaticMinimization"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_avoidIntersectability, CFSTR("AvoidIntersectability"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIKeyboardChangedInformation shouldTakeSnapshot](self, "shouldTakeSnapshot"), CFSTR("TakeSnapshot"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldRestoreKeyboard, CFSTR("RestoreKeyboard"));
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[_UIKeyboardChangedInformation keyboardPositionWithIAV](self, "keyboardPositionWithIAV");
  v34.origin.x = v15;
  v34.origin.y = v16;
  v34.size.width = v17;
  v34.size.height = v18;
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  if (!CGRectEqualToRect(v32, v34))
  {
    v19 = (void *)MEMORY[0x1E0CB3B18];
    -[_UIKeyboardChangedInformation keyboardPositionWithIAV](self, "keyboardPositionWithIAV");
    objc_msgSend(v19, "valueWithCGRect:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("PositionIAV"));

  }
  -[_UIKeyboardChangedInformation keyboardPositionWithRemoteIAV](self, "keyboardPositionWithRemoteIAV");
  if (!CGRectIsEmpty(v33))
  {
    v21 = (void *)MEMORY[0x1E0CB3B18];
    -[_UIKeyboardChangedInformation keyboardPositionWithRemoteIAV](self, "keyboardPositionWithRemoteIAV");
    objc_msgSend(v21, "valueWithCGRect:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("PositionRemoteIAV"));

  }
  if (self->_isFloating)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("IsFloating"));
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_persistentOffset.x, self->_persistentOffset.y);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("PersistentOffset"));

  }
  sourceSceneIdentityString = self->_sourceSceneIdentityString;
  if (sourceSceneIdentityString)
    objc_msgSend(v4, "encodeObject:forKey:", sourceSceneIdentityString, CFSTR("SourceCanvas"));
  sourceDisplayIdentifier = self->_sourceDisplayIdentifier;
  if (sourceDisplayIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", sourceDisplayIdentifier, CFSTR("SourceDisplay"));
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  if (sourceBundleIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", sourceBundleIdentifier, CFSTR("SourceBundle"));
  hostBundleIdentifier = self->_hostBundleIdentifier;
  if (hostBundleIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", hostBundleIdentifier, CFSTR("HostBundle"));
  hostProcessIdentifier = self->_hostProcessIdentifier;
  if ((_DWORD)hostProcessIdentifier)
    objc_msgSend(v4, "encodeInt:forKey:", hostProcessIdentifier, CFSTR("HostProcessID"));
  processIdentifier = self->_processIdentifier;
  if ((_DWORD)processIdentifier)
    objc_msgSend(v4, "encodeInt:forKey:", processIdentifier, CFSTR("ProcessID"));
  keyboardPreserveKey = self->_keyboardPreserveKey;
  if (keyboardPreserveKey)
    objc_msgSend(v4, "encodeObject:forKey:", keyboardPreserveKey, CFSTR("KeyboardPreserveKey"));

}

- (CGRect)keyboardPositionWithIAV
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_keyboardPositionWithIAV, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)shouldTakeSnapshot
{
  return self->_shouldTakeSnapshot;
}

- (CGRect)keyboardPositionWithRemoteIAV
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_keyboardPositionWithRemoteIAV, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)multipleScenes
{
  return self->_multipleScenes;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (BOOL)avoidIntersectability
{
  return self->_avoidIntersectability;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIKeyboardUIInformation resetAnimationFencing](self, "resetAnimationFencing");
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardChangedInformation;
  -[_UIKeyboardChangedInformation dealloc](&v3, sel_dealloc);
}

- (void)setSourceSceneIdentityString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setSourceDisplayIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setPersistentOffset:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_persistentOffset, &v3, 16, 1, 0);
}

- (void)setMultipleScenes:(BOOL)a3
{
  self->_multipleScenes = a3;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (_UIKeyboardChangedInformation)initWithCoder:(id)a3
{
  id v4;
  _UIKeyboardChangedInformation *v5;
  void *v6;
  uint64_t v7;
  NSString *sourceSceneIdentityString;
  uint64_t v9;
  NSString *sourceDisplayIdentifier;
  uint64_t v11;
  NSString *sourceBundleIdentifier;
  uint64_t v13;
  NSString *hostBundleIdentifier;
  uint64_t v15;
  NSString *keyboardPreserveKey;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGSize v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  _UIKeyboardChangedInformation *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_UIKeyboardChangedInformation;
  v5 = -[_UIKeyboardUIInformation initWithCoder:](&v37, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x186DC9484]();
    v5->_multipleScenes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("MultipleScenes"));
    v5->_isOneness = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsOneness"));
    v5->_automaticMinimizationEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AutomaticMinimization"));
    v5->_avoidIntersectability = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AvoidIntersectability"));
    v5->_shouldTakeSnapshot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TakeSnapshot"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceCanvas"));
    v7 = objc_claimAutoreleasedReturnValue();
    sourceSceneIdentityString = v5->_sourceSceneIdentityString;
    v5->_sourceSceneIdentityString = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceDisplay"));
    v9 = objc_claimAutoreleasedReturnValue();
    sourceDisplayIdentifier = v5->_sourceDisplayIdentifier;
    v5->_sourceDisplayIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceBundle"));
    v11 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HostBundle"));
    v13 = objc_claimAutoreleasedReturnValue();
    hostBundleIdentifier = v5->_hostBundleIdentifier;
    v5->_hostBundleIdentifier = (NSString *)v13;

    v5->_hostProcessIdentifier = objc_msgSend(v4, "decodeIntForKey:", CFSTR("HostProcessID"));
    v5->_processIdentifier = objc_msgSend(v4, "decodeIntForKey:", CFSTR("ProcessID"));
    v5->_shouldRestoreKeyboard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RestoreKeyboard"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("KeyboardPreserveKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    keyboardPreserveKey = v5->_keyboardPreserveKey;
    v5->_keyboardPreserveKey = (NSString *)v15;

    -[_UIKeyboardUIInformation keyboardPosition](v5, "keyboardPosition");
    v5->_keyboardPositionWithIAV.origin.x = v17;
    v5->_keyboardPositionWithIAV.origin.y = v18;
    v5->_keyboardPositionWithIAV.size.width = v19;
    v5->_keyboardPositionWithIAV.size.height = v20;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PositionIAV")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PositionIAV"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CGRectValue");
      v5->_keyboardPositionWithIAV.origin.x = v22;
      v5->_keyboardPositionWithIAV.origin.y = v23;
      v5->_keyboardPositionWithIAV.size.width = v24;
      v5->_keyboardPositionWithIAV.size.height = v25;

    }
    v26 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v5->_keyboardPositionWithRemoteIAV.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v5->_keyboardPositionWithRemoteIAV.size = v26;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PositionRemoteIAV")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PositionRemoteIAV"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "CGRectValue");
      v5->_keyboardPositionWithRemoteIAV.origin.x = v28;
      v5->_keyboardPositionWithRemoteIAV.origin.y = v29;
      v5->_keyboardPositionWithRemoteIAV.size.width = v30;
      v5->_keyboardPositionWithRemoteIAV.size.height = v31;

    }
    v5->_isFloating = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsFloating"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersistentOffset"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "CGPointValue");
    v5->_persistentOffset.x = v33;
    v5->_persistentOffset.y = v34;

    objc_autoreleasePoolPop(v6);
    v35 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPreserveKey, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceSceneIdentityString, 0);
}

- (void)setHostBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setHostProcessIdentifier:(int)a3
{
  self->_hostProcessIdentifier = a3;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setShouldTakeSnapshot:(BOOL)a3
{
  self->_shouldTakeSnapshot = a3;
}

+ (id)informationForKeyboardUp:(CGRect)a3 withIAV:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  _UIKeyboardChangedInformation *v13;
  void *v14;
  _UIKeyboardChangedInformation *v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13 = [_UIKeyboardChangedInformation alloc];
  objc_msgSend(a1, "animationFence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v13, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 1, 1, v14, v11, v10, v9, v8, x, y, width, height);

  return v15;
}

- (id)copyWithIntersectability:(BOOL)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL8 v22;
  _BOOL8 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  CGSize size;
  uint64_t v35;
  void *v36;

  v5 = objc_alloc((Class)objc_opt_class());
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen");
  v23 = -[_UIKeyboardChangedInformation shouldTakeSnapshot](self, "shouldTakeSnapshot");
  -[_UIKeyboardUIInformation animationFence](self, "animationFence");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v5, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v22, v23, v24, v7, v9, v11, v13, v15, v17, v19, v21);

  *(_BYTE *)(v25 + 244) = self->_isFloating;
  *(CGPoint *)(v25 + 304) = self->_persistentOffset;
  v26 = -[NSString copy](self->_sourceSceneIdentityString, "copy");
  v27 = *(void **)(v25 + 256);
  *(_QWORD *)(v25 + 256) = v26;

  v28 = -[NSString copy](self->_sourceDisplayIdentifier, "copy");
  v29 = *(void **)(v25 + 264);
  *(_QWORD *)(v25 + 264) = v28;

  v30 = -[NSString copy](self->_sourceBundleIdentifier, "copy");
  v31 = *(void **)(v25 + 272);
  *(_QWORD *)(v25 + 272) = v30;

  v32 = -[NSString copy](self->_hostBundleIdentifier, "copy");
  v33 = *(void **)(v25 + 280);
  *(_QWORD *)(v25 + 280) = v32;

  *(_DWORD *)(v25 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v25 + 252) = self->_processIdentifier;
  *(_BYTE *)(v25 + 240) = !a3;
  *(_BYTE *)(v25 + 241) = self->_multipleScenes;
  *(_BYTE *)(v25 + 242) = self->_isOneness;
  *(_BYTE *)(v25 + 243) = self->_automaticMinimizationEnabled;
  size = self->_keyboardPositionWithRemoteIAV.size;
  *(CGPoint *)(v25 + 352) = self->_keyboardPositionWithRemoteIAV.origin;
  *(CGSize *)(v25 + 368) = size;
  v35 = -[NSString copy](self->_keyboardPreserveKey, "copy");
  v36 = *(void **)(v25 + 296);
  *(_QWORD *)(v25 + 296) = v35;

  *(_BYTE *)(v25 + 246) = self->_shouldRestoreKeyboard;
  objc_msgSend((id)v25, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v25, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  return (id)v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL8 v21;
  _BOOL8 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  CGSize size;
  uint64_t v34;
  void *v35;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[_UIKeyboardChangedInformation keyboardPositionWithIAV](self, "keyboardPositionWithIAV");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen");
  v22 = -[_UIKeyboardChangedInformation shouldTakeSnapshot](self, "shouldTakeSnapshot");
  -[_UIKeyboardUIInformation animationFence](self, "animationFence");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v21, v22, v23, v6, v8, v10, v12, v14, v16, v18, v20);

  *(_BYTE *)(v24 + 244) = self->_isFloating;
  *(CGPoint *)(v24 + 304) = self->_persistentOffset;
  v25 = -[NSString copy](self->_sourceSceneIdentityString, "copy");
  v26 = *(void **)(v24 + 256);
  *(_QWORD *)(v24 + 256) = v25;

  v27 = -[NSString copy](self->_sourceDisplayIdentifier, "copy");
  v28 = *(void **)(v24 + 264);
  *(_QWORD *)(v24 + 264) = v27;

  v29 = -[NSString copy](self->_sourceBundleIdentifier, "copy");
  v30 = *(void **)(v24 + 272);
  *(_QWORD *)(v24 + 272) = v29;

  v31 = -[NSString copy](self->_hostBundleIdentifier, "copy");
  v32 = *(void **)(v24 + 280);
  *(_QWORD *)(v24 + 280) = v31;

  *(_DWORD *)(v24 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v24 + 252) = self->_processIdentifier;
  *(_BYTE *)(v24 + 240) = self->_avoidIntersectability;
  *(_BYTE *)(v24 + 241) = self->_multipleScenes;
  *(_BYTE *)(v24 + 242) = self->_isOneness;
  *(_BYTE *)(v24 + 243) = self->_automaticMinimizationEnabled;
  size = self->_keyboardPositionWithRemoteIAV.size;
  *(CGPoint *)(v24 + 352) = self->_keyboardPositionWithRemoteIAV.origin;
  *(CGSize *)(v24 + 368) = size;
  v34 = -[NSString copy](self->_keyboardPreserveKey, "copy");
  v35 = *(void **)(v24 + 296);
  *(_QWORD *)(v24 + 296) = v34;

  *(_BYTE *)(v24 + 246) = self->_shouldRestoreKeyboard;
  objc_msgSend((id)v24, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  objc_msgSend((id)v24, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v24, "setResizing:", -[_UIKeyboardUIInformation resizing](self, "resizing"));
  return (id)v24;
}

- (id)copyWithoutIAVKeyboardRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc((Class)objc_opt_class());
  v9 = -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen");
  v10 = -[_UIKeyboardChangedInformation shouldTakeSnapshot](self, "shouldTakeSnapshot");
  -[_UIKeyboardUIInformation animationFence](self, "animationFence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v9, v10, v11, x, y, width, height, x, y, width, height);

  *(_BYTE *)(v12 + 244) = self->_isFloating;
  *(CGPoint *)(v12 + 304) = self->_persistentOffset;
  v13 = -[NSString copy](self->_sourceSceneIdentityString, "copy");
  v14 = *(void **)(v12 + 256);
  *(_QWORD *)(v12 + 256) = v13;

  v15 = -[NSString copy](self->_sourceDisplayIdentifier, "copy");
  v16 = *(void **)(v12 + 264);
  *(_QWORD *)(v12 + 264) = v15;

  v17 = -[NSString copy](self->_sourceBundleIdentifier, "copy");
  v18 = *(void **)(v12 + 272);
  *(_QWORD *)(v12 + 272) = v17;

  v19 = -[NSString copy](self->_hostBundleIdentifier, "copy");
  v20 = *(void **)(v12 + 280);
  *(_QWORD *)(v12 + 280) = v19;

  *(_DWORD *)(v12 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v12 + 252) = self->_processIdentifier;
  *(_BYTE *)(v12 + 240) = self->_avoidIntersectability;
  *(_BYTE *)(v12 + 241) = self->_multipleScenes;
  *(_BYTE *)(v12 + 242) = self->_isOneness;
  *(_BYTE *)(v12 + 243) = self->_automaticMinimizationEnabled;
  v21 = -[NSString copy](self->_keyboardPreserveKey, "copy");
  v22 = *(void **)(v12 + 296);
  *(_QWORD *)(v12 + 296) = v21;

  objc_msgSend((id)v12, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v12, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  return (id)v12;
}

- (id)copyWithoutFence
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  _BOOL8 v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  CGSize size;
  uint64_t v33;
  void *v34;

  v3 = objc_alloc((Class)objc_opt_class());
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen");
  v21 = -[_UIKeyboardChangedInformation shouldTakeSnapshot](self, "shouldTakeSnapshot");
  -[_UIKeyboardUIInformation animationFence](self, "animationFence");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v3, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", v20, v21, v22, v5, v7, v9, v11, v13, v15, v17, v19);

  *(_BYTE *)(v23 + 244) = self->_isFloating;
  *(CGPoint *)(v23 + 304) = self->_persistentOffset;
  v24 = -[NSString copy](self->_sourceSceneIdentityString, "copy");
  v25 = *(void **)(v23 + 256);
  *(_QWORD *)(v23 + 256) = v24;

  v26 = -[NSString copy](self->_sourceDisplayIdentifier, "copy");
  v27 = *(void **)(v23 + 264);
  *(_QWORD *)(v23 + 264) = v26;

  v28 = -[NSString copy](self->_sourceBundleIdentifier, "copy");
  v29 = *(void **)(v23 + 272);
  *(_QWORD *)(v23 + 272) = v28;

  v30 = -[NSString copy](self->_hostBundleIdentifier, "copy");
  v31 = *(void **)(v23 + 280);
  *(_QWORD *)(v23 + 280) = v30;

  *(_DWORD *)(v23 + 248) = self->_hostProcessIdentifier;
  *(_DWORD *)(v23 + 252) = self->_processIdentifier;
  *(_BYTE *)(v23 + 240) = self->_avoidIntersectability;
  *(_BYTE *)(v23 + 241) = self->_multipleScenes;
  *(_BYTE *)(v23 + 242) = self->_isOneness;
  *(_BYTE *)(v23 + 243) = self->_automaticMinimizationEnabled;
  size = self->_keyboardPositionWithRemoteIAV.size;
  *(CGPoint *)(v23 + 352) = self->_keyboardPositionWithRemoteIAV.origin;
  *(CGSize *)(v23 + 368) = size;
  v33 = -[NSString copy](self->_keyboardPreserveKey, "copy");
  v34 = *(void **)(v23 + 296);
  *(_QWORD *)(v23 + 296) = v33;

  *(_BYTE *)(v23 + 246) = self->_shouldRestoreKeyboard;
  objc_msgSend((id)v23, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend((id)v23, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  return (id)v23;
}

+ (id)informationForKeyboardDown
{
  _UIKeyboardChangedInformation *v3;
  void *v4;
  _UIKeyboardChangedInformation *v5;

  v3 = [_UIKeyboardChangedInformation alloc];
  objc_msgSend(a1, "animationFence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v3, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 0, 0, v4, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

  return v5;
}

- (_UIKeyboardChangedInformation)initWithKeyboardRect:(CGRect)a3 iavPosition:(CGRect)a4 onScreen:(BOOL)a5 takeSnapshot:(BOOL)a6 fence:(id)a7
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v12;
  _UIKeyboardChangedInformation *v13;
  _UIKeyboardChangedInformation *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3.size.height;
  v18.receiver = self;
  v18.super_class = (Class)_UIKeyboardChangedInformation;
  v13 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:fence:](&v18, sel_initWithKeyboardFrame_onScreen_animated_tracking_fence_, a5, 1, 0, a7, a3.origin.x, a3.origin.y, a3.size.width);
  v14 = v13;
  if (v13)
  {
    v13->_keyboardPositionWithIAV.origin.x = x;
    v13->_keyboardPositionWithIAV.origin.y = y;
    v13->_keyboardPositionWithIAV.size.width = width;
    v13->_keyboardPositionWithIAV.size.height = height;
    v13->_keyboardIAVHeight = height - v12;
    v13->_shouldTakeSnapshot = a6;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferencesActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_automaticMinimizationEnabled = objc_msgSend(v16, "automaticMinimizationEnabled");

  }
  return v14;
}

+ (id)animationFence
{
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *sourceSceneIdentityString;
  NSString *sourceDisplayIdentifier;
  NSString *sourceBundleIdentifier;
  NSString *hostBundleIdentifier;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __CFString *v31;
  __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  NSString *keyboardPreserveKey;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  _BOOL8 isFloating;
  NSString *v56;
  NSString *v57;
  BOOL v58;
  NSString *v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;
  CGRect v66;
  CGRect v67;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v65.receiver = self;
  v65.super_class = (Class)_UIKeyboardChangedInformation;
  -[_UIKeyboardUIInformation description](&v65, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  sourceSceneIdentityString = self->_sourceSceneIdentityString;
  sourceDisplayIdentifier = self->_sourceDisplayIdentifier;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  hostBundleIdentifier = self->_hostBundleIdentifier;
  -[_UIKeyboardUIInformation animationFence](self, "animationFence");
  v9 = objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  StringFromCGRect(v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardUIInformation keyboardPosition](self, "keyboardPosition");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[_UIKeyboardChangedInformation keyboardPositionWithIAV](self, "keyboardPositionWithIAV");
  v67.origin.x = v23;
  v67.origin.y = v24;
  v67.size.width = v25;
  v67.size.height = v26;
  v66.origin.x = v16;
  v66.origin.y = v18;
  v66.size.width = v20;
  v66.size.height = v22;
  v63 = (void *)v9;
  v64 = (void *)v4;
  v61 = v3;
  v62 = (void *)v14;
  v59 = sourceDisplayIdentifier;
  v60 = sourceSceneIdentityString;
  v58 = CGRectEqualToRect(v66, v67);
  v56 = hostBundleIdentifier;
  v57 = sourceBundleIdentifier;
  if (v58)
  {
    v54 = CFSTR("same");
  }
  else
  {
    -[_UIKeyboardChangedInformation keyboardPositionWithIAV](self, "keyboardPositionWithIAV");
    StringFromCGRect(v27, v28, v29, v30);
    v54 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  isFloating = self->_isFloating;
  if (-[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v32 = v31;
  if (self->_multipleScenes)
    v33 = CFSTR(" multiple scenes YES;");
  else
    v33 = &stru_1E16EDF20;
  if (self->_isOneness)
    v34 = CFSTR(" is in Oneness screen YES;");
  else
    v34 = &stru_1E16EDF20;
  if (self->_avoidIntersectability)
    v35 = CFSTR("NO");
  else
    v35 = CFSTR("YES");
  if (self->_shouldTakeSnapshot)
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  keyboardPreserveKey = self->_keyboardPreserveKey;
  if (keyboardPreserveKey)
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    if (self->_shouldRestoreKeyboard)
      v39 = CFSTR("YES");
    else
      v39 = CFSTR("NO");
    v40 = v39;
    v41 = v36;
    v42 = v35;
    objc_msgSend(v38, "stringWithFormat:", CFSTR("; restore %@ (with key %@)"), v40, keyboardPreserveKey);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v34;
    v50 = v33;
    v44 = (__CFString *)v54;
    v45 = v62;
    v46 = v63;
    v47 = v64;
    objc_msgSend(v61, "stringWithFormat:", CFSTR("<%@; source canvas %@; source display %@; source bundle %@; host bundle %@; animation fence %@; position %@ (with IAV %@); floating %d; on screen %@;%@ %@ intersectable %@; snapshot %@%@>"),
      v64,
      v60,
      v59,
      v57,
      v56,
      v63,
      v62,
      v54,
      isFloating,
      v32,
      v50,
      v52,
      v42,
      v41,
      v43);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41 = v36;
    v53 = v34;
    v51 = v33;
    v44 = (__CFString *)v54;
    v45 = v62;
    v46 = v63;
    v47 = v64;
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; source canvas %@; source display %@; source bundle %@; host bundle %@; animation fence %@; position %@ (with IAV %@); floating %d; on screen %@;%@ %@ intersectable %@; snapshot %@%@>"),
      v64,
      v60,
      v59,
      v57,
      hostBundleIdentifier,
      v63,
      v62,
      v54,
      isFloating,
      v32,
      v51,
      v53,
      v35,
      v41,
      &stru_1E16EDF20);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v58)
  return v48;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (_UIKeyboardChangedInformation)initWithKeyboardIAVHeight:(double)a3 onScreen:(BOOL)a4 takeSnapshot:(BOOL)a5 fence:(id)a6
{
  return -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](self, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", a4, a5, a6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0.0, 0.0, 0.0, a3);
}

+ (id)informationForKeyboardUpWithIAVHeight:(double)a3
{
  _UIKeyboardChangedInformation *v5;
  void *v6;
  _UIKeyboardChangedInformation *v7;

  v5 = [_UIKeyboardChangedInformation alloc];
  objc_msgSend(a1, "animationFence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIKeyboardChangedInformation initWithKeyboardIAVHeight:onScreen:takeSnapshot:fence:](v5, "initWithKeyboardIAVHeight:onScreen:takeSnapshot:fence:", 1, 1, v6, a3);

  return v7;
}

+ (id)informationForKeyboardPreserve:(id)a3
{
  id v4;
  _UIKeyboardChangedInformation *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = [_UIKeyboardChangedInformation alloc];
  objc_msgSend(a1, "animationFence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v5, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 0, 0, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  *(_BYTE *)(v7 + 246) = 0;
  v8 = *(void **)(v7 + 296);
  *(_QWORD *)(v7 + 296) = v4;

  return (id)v7;
}

+ (id)informationForKeyboardRestore:(id)a3
{
  id v4;
  _UIKeyboardChangedInformation *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = [_UIKeyboardChangedInformation alloc];
  objc_msgSend(a1, "animationFence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIKeyboardChangedInformation initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:](v5, "initWithKeyboardRect:iavPosition:onScreen:takeSnapshot:fence:", 0, 0, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  *(_BYTE *)(v7 + 246) = 1;
  v8 = *(void **)(v7 + 296);
  *(_QWORD *)(v7 + 296) = v4;

  return (id)v7;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (void)setAvoidIntersectability:(BOOL)a3
{
  self->_avoidIntersectability = a3;
}

- (BOOL)isOneness
{
  return self->_isOneness;
}

- (void)setIsOneness:(BOOL)a3
{
  self->_isOneness = a3;
}

- (void)setAutomaticMinimizationEnabled:(BOOL)a3
{
  self->_automaticMinimizationEnabled = a3;
}

- (void)setKeyboardPositionWithRemoteIAV:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_keyboardPositionWithRemoteIAV, &v3, 32, 1, 0);
}

- (double)keyboardIAVHeight
{
  return self->_keyboardIAVHeight;
}

- (CGPoint)persistentOffset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_persistentOffset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)shouldRestoreKeyboard
{
  return self->_shouldRestoreKeyboard;
}

- (void)setKeyboardPreserveKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

@end
