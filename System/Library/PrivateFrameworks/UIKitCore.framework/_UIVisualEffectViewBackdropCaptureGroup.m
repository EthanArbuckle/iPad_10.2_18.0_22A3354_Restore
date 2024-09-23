@implementation _UIVisualEffectViewBackdropCaptureGroup

- (void)updateAllBackdropViews
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_backdrops;
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        updateBackdropView(*(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++), self);
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[_UIVisualEffectViewBackdropCaptureGroup updateAllBackdropViews](self, "updateAllBackdropViews");
  }
}

- (void)applyScaleHint:(double)a3
{
  if (a3 > 0.0)
    -[_UIVisualEffectViewBackdropCaptureGroup setScale:](self, "setScale:");
}

- (BOOL)allowInPlaceFiltering
{
  if (self->_disableInPlaceFiltering || self->_scale < 1.0)
    return 0;
  if (!self->_groupName)
    return 1;
  -[NSPointerArray compact](self->_backdrops, "compact");
  return -[NSPointerArray count](self->_backdrops, "count") < 2;
}

- (_UIVisualEffectViewBackdropCaptureGroup)initWithName:(id)a3 scale:(double)a4
{
  id v6;
  _UIVisualEffectViewBackdropCaptureGroup *v7;
  uint64_t v8;
  NSPointerArray *backdrops;
  uint64_t v10;
  NSString *groupName;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIVisualEffectViewBackdropCaptureGroup;
  v7 = -[_UIVisualEffectViewBackdropCaptureGroup init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v8 = objc_claimAutoreleasedReturnValue();
    backdrops = v7->_backdrops;
    v7->_backdrops = (NSPointerArray *)v8;

    v10 = objc_msgSend(v6, "copy");
    groupName = v7->_groupName;
    v7->_groupName = (NSString *)v10;

    objc_storeStrong((id *)&v7->_groupNamespace, (id)*MEMORY[0x1E0CD2960]);
    v7->_scale = a4;
  }

  return v7;
}

- (_UIVisualEffectViewBackdropCaptureGroup)init
{
  return -[_UIVisualEffectViewBackdropCaptureGroup initWithName:scale:](self, "initWithName:scale:", 0, 1.0);
}

- (void)setGroupName:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *groupName;
  NSString *v11;

  v4 = a3;
  v5 = self->_groupName;
  v6 = (NSString *)v4;
  v11 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      v8 = v11;
      if (v7)
        goto LABEL_10;
    }
    else
    {

      v8 = v11;
    }
    v9 = (NSString *)-[NSString copy](v8, "copy");
    groupName = self->_groupName;
    self->_groupName = v9;

    -[_UIVisualEffectViewBackdropCaptureGroup updateAllBackdropViews](self, "updateAllBackdropViews");
  }
  v8 = v11;
LABEL_10:

}

- (void)setDisableInPlaceFiltering:(BOOL)a3
{
  self->_disableInPlaceFiltering = a3;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupNamespace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_UIVisualEffectViewBackdropCaptureGroup)initWithBackdrop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UIVisualEffectViewBackdropCaptureGroup *v7;

  v4 = a3;
  objc_msgSend(v4, "backdropLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = -[_UIVisualEffectViewBackdropCaptureGroup initWithName:scale:](self, "initWithName:scale:", v6);

  if (v7)
    -[NSPointerArray addPointer:](v7->_backdrops, "addPointer:", v4);

  return v7;
}

- (void)removeBackdrop:(id)a3 update:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v6 = -[_UIVisualEffectViewBackdropCaptureGroup indexOfBackdropView:](self, "indexOfBackdropView:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSPointerArray removePointerAtIndex:](self->_backdrops, "removePointerAtIndex:", v6);
    if (v4)
      updateBackdropView(v7, 0);
  }

}

- (void)addBackdrop:(id)a3 update:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (-[_UIVisualEffectViewBackdropCaptureGroup indexOfBackdropView:](self, "indexOfBackdropView:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSPointerArray addPointer:](self->_backdrops, "addPointer:", v6);
    if (v4)
      updateBackdropView(v6, self);
  }

}

- (int64_t)indexOfBackdropView:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_backdrops;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      v11 = v7 + v8;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10) == v4)
        {
          v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupNamespace, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_backdrops, 0);
}

- (void)setMinimumScale:(double)a3
{
  double v3;

  if (a3 < 0.0)
    a3 = 0.0;
  v3 = fmin(a3, 1.0);
  if (self->_minimumScale != v3)
  {
    self->_minimumScale = v3;
    -[_UIVisualEffectViewBackdropCaptureGroup updateAllBackdropViews](self, "updateAllBackdropViews");
  }
}

- (id)description
{
  void *v3;
  void *v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UIVisualEffectViewBackdropCaptureGroup;
  -[_UIVisualEffectViewBackdropCaptureGroup description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_groupName)
  {
    objc_msgSend(v4, "appendFormat:", CFSTR(" grouped(name='%@'"), self->_groupName);
    if (-[NSString isEqualToString:](self->_groupNamespace, "isEqualToString:", *MEMORY[0x1E0CD2960]))
      objc_msgSend(v4, "appendString:", CFSTR(")"));
    else
      objc_msgSend(v4, "appendFormat:", CFSTR(" in namespace='%@')"), self->_groupNamespace);
  }
  if (self->_scale < 1.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" scale=%f"), *(_QWORD *)&self->_scale);
  if (self->_minimumScale > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" minimumScale=%f"), *(_QWORD *)&self->_minimumScale);
  if (self->_disableInPlaceFiltering)
    objc_msgSend(v4, "appendString:", CFSTR(" disableInPlaceFiltering"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_backdrops;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((v8 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(" backdrops={"));
        objc_msgSend(v4, "appendFormat:", CFSTR(" %p"), v11);
        v8 = 1;
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);

    objc_msgSend(v4, "appendString:", CFSTR(" }"));
  }
  else
  {

  }
  return v4;
}

- (NSString)groupNamespace
{
  return self->_groupNamespace;
}

- (double)scale
{
  return self->_scale;
}

- (double)minimumScale
{
  return self->_minimumScale;
}

- (BOOL)disableInPlaceFiltering
{
  return self->_disableInPlaceFiltering;
}

@end
