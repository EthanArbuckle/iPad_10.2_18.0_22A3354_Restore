@implementation _UIDragEventSample

+ (id)sampleFromHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  const __CFArray *Children;
  const __CFArray *v26;
  uint64_t Count;
  CFIndex v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[17];

  v34[16] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v4 = objc_opt_new();
  _UIEventHIDUIWindowForHIDEvent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 24), v5);
  BKSHIDEventGetBaseAttributes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(v4 + 16) = objc_msgSend(v6, "contextID");

  IOHIDEventGetChildren();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v10 = *MEMORY[0x1E0CD2538];
  v9 = *(double *)(MEMORY[0x1E0CD2538] + 8);
  v11 = *(double *)(MEMORY[0x1E0CD2538] + 16);
  if (v8)
  {
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v7);
        IOHIDEventGetFloatValue();
        v15 = v14;
        IOHIDEventGetFloatValue();
        v17 = v16;
        IOHIDEventGetFloatValue();
        v10 = v10 + v15;
        v9 = v9 + v17;
        v11 = v11 + v18;
        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }
  v19 = objc_msgSend(v7, "count");

  -[UIWindow _fbsScene]((id *)v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10 / (double)v19;
  v22 = v9 / (double)v19;
  *(double *)(v4 + 32) = v21;
  *(double *)(v4 + 40) = v22;
  *(double *)(v4 + 48) = v11 / (double)v19;
  *(double *)(v4 + 56) = _UIConvertScenePoint3DToWindow(v20, v5, v21, v22);
  *(_QWORD *)(v4 + 64) = v23;
  *(_QWORD *)(v4 + 72) = v24;
  *(_BYTE *)(v4 + 8) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 2);
  *(_BYTE *)(v4 + 9) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 1);
  *(_BYTE *)(v4 + 10) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 3);
  *(_BYTE *)(v4 + 11) = _UIEventHIDIsDragEventLocusType((uint64_t)a3, 4);
  *(_QWORD *)&v30 = 0;
  *((_QWORD *)&v30 + 1) = &v30;
  *(_QWORD *)&v31 = 0x2020000000;
  BYTE8(v31) = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = ___UIEventHIDAnyChildIsTouching_block_invoke;
  v34[3] = &unk_1E16B1D90;
  v34[4] = &v30;
  _UIEventHIDEnumerateChildren((uint64_t)a3, 11, v34);
  LOBYTE(v19) = *(_BYTE *)(*((_QWORD *)&v30 + 1) + 24);
  _Block_object_dispose(&v30, 8);
  *(_BYTE *)(v4 + 12) = v19 ^ 1;
  if (IOHIDEventGetType() == 11)
  {
    Children = (const __CFArray *)IOHIDEventGetChildren();
    v26 = Children;
    if (Children)
    {
      Count = CFArrayGetCount(Children);
      if (Count)
      {
        v28 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v26, v28);
          if (IOHIDEventGetIntegerValue() == 65318 && IOHIDEventGetIntegerValue() == 2)
            break;
          if (Count == ++v28)
            goto LABEL_17;
        }
        *(_WORD *)(v4 + 9) = 256;
      }
    }
  }
LABEL_17:

  return (id)v4;
}

- (id)hitTestWithEvent:(id)a3
{
  id v4;
  UIWindow *window;
  void *v6;
  double y;
  double x;
  double z;
  UIWindow *v10;
  void *v11;

  v4 = a3;
  window = self->_window;
  if (window && !-[UIView isHidden](window, "isHidden"))
  {
    x = self->_sceneLocation.x;
    y = self->_sceneLocation.y;
    z = self->_sceneLocation.z;
    if (self->_isPolicyDriven)
    {
      v10 = self->_window;
      -[UIWindow _fbsScene]((id *)&v10->super.super.super.isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIWindow _hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:](v10, "_hitTestLocation:sceneLocationZ:inScene:withWindowServerHitTestWindow:event:", v11, self->_window, v4, x, y, z);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[UIWindow _globalHitTestForLocation:sceneLocationZ:inWindowServerHitTestWindow:withEvent:](UIWindow, "_globalHitTestForLocation:sceneLocationZ:inWindowServerHitTestWindow:withEvent:", self->_window, v4, self->_sceneLocation.x, self->_sceneLocation.y, self->_sceneLocation.z);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; isApplicationEnter:%d isApplicationExit:%d isApplicationWithin:%d isDragEnd:%d isPolicyDriven:%d>"),
               objc_opt_class(),
               self,
               self->_isApplicationEnter,
               self->_isApplicationExit,
               self->_isApplicationWithin,
               self->_isDragEnd,
               self->_isPolicyDriven);
}

- (UIWindow)window
{
  return self->_window;
}

- (CAPoint3D)sceneLocation
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_sceneLocation.x;
  y = self->_sceneLocation.y;
  z = self->_sceneLocation.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (CAPoint3D)locationInWindow
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_locationInWindow.x;
  y = self->_locationInWindow.y;
  z = self->_locationInWindow.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)isApplicationEnter
{
  return self->_isApplicationEnter;
}

- (BOOL)isApplicationWithin
{
  return self->_isApplicationWithin;
}

- (BOOL)isApplicationExit
{
  return self->_isApplicationExit;
}

- (BOOL)isPolicyDriven
{
  return self->_isPolicyDriven;
}

- (BOOL)isDragEnd
{
  return self->_isDragEnd;
}

- (unsigned)windowServerHitTestContextID
{
  return self->_windowServerHitTestContextID;
}

- (BOOL)hasBeenDelivered
{
  return self->_hasBeenDelivered;
}

- (void)setHasBeenDelivered:(BOOL)a3
{
  self->_hasBeenDelivered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
