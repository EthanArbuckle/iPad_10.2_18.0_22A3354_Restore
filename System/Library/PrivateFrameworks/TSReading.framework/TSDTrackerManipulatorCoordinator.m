@implementation TSDTrackerManipulatorCoordinator

- (TSDTrackerManipulatorCoordinator)init
{
  TSDTrackerManipulatorCoordinator *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDTrackerManipulatorCoordinator;
  v2 = -[TSDTrackerManipulatorCoordinator init](&v4, sel_init);
  if (v2)
    v2->mRegisteredTMs = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDTrackerManipulatorCoordinator;
  -[TSDTrackerManipulatorCoordinator dealloc](&v3, sel_dealloc);
}

- (void)registerTrackerManipulator:(id)a3
{
  -[NSMutableSet addObject:](self->mRegisteredTMs, "addObject:", a3);
}

- (void)unregisterTrackerManipulator:(id)a3
{
  -[NSMutableSet removeObject:](self->mRegisteredTMs, "removeObject:", a3);
}

- (BOOL)hasRegisteredTrackerManipulator:(id)a3
{
  return -[NSMutableSet containsObject:](self->mRegisteredTMs, "containsObject:", a3);
}

- (BOOL)takeControlWithTrackerManipulator:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDTrackerManipulator *mControllingTM;
  BOOL v8;
  int v9;

  if (self->mControllingTM == a3)
  {
LABEL_16:
    LOBYTE(v9) = 1;
    return v9;
  }
  if (a3
    && !-[TSDTrackerManipulatorCoordinator hasRegisteredTrackerManipulator:](self, "hasRegisteredTrackerManipulator:", a3))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"), 76, CFSTR("attempting to take control with an unregistered TM %@"), a3);
  }
  mControllingTM = self->mControllingTM;
  if (mControllingTM)
    v8 = mControllingTM == a3;
  else
    v8 = 1;
  if (v8)
  {
LABEL_13:
    objc_msgSend((id)objc_opt_class(), "p_dynamicallySubclassGRForNotification:", a3);
    self->mControllingTM = (TSDTrackerManipulator *)a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDTrackerManipulator willTakeControl](self->mControllingTM, "willTakeControl");
    -[TSDTrackerManipulatorCoordinator p_notifyControlChange](self, "p_notifyControlChange");
    goto LABEL_16;
  }
  v9 = -[TSDTrackerManipulator allowTrackerManipulatorToTakeControl:](mControllingTM, "allowTrackerManipulatorToTakeControl:", a3);
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDTrackerManipulator didRelinquishControl](self->mControllingTM, "didRelinquishControl");
    objc_msgSend((id)objc_opt_class(), "p_removeDynamicSubclass:", self->mControllingTM);

    self->mControllingTM = 0;
    goto LABEL_13;
  }
  return v9;
}

- (BOOL)relinquishTrackerManipulatorControl:(id)a3
{
  int v3;

  if (self->mControllingTM == a3)
  {
    v3 = objc_msgSend(a3, "allowTrackerManipulatorToTakeControl:", 0);
    if (v3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TSDTrackerManipulator didRelinquishControl](self->mControllingTM, "didRelinquishControl");
      objc_msgSend((id)objc_opt_class(), "p_removeDynamicSubclass:", self->mControllingTM);

      self->mControllingTM = 0;
      -[TSDTrackerManipulatorCoordinator p_notifyControlChange](self, "p_notifyControlChange");
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)operationWillEnd
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)-[NSMutableSet copy](self->mRegisteredTMs, "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "operationWillEnd");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (void)operationDidEnd
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)-[NSMutableSet copy](self->mRegisteredTMs, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "operationDidEnd");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  -[NSMutableSet removeAllObjects](self->mRegisteredTMs, "removeAllObjects");
  -[TSDTrackerManipulatorCoordinator relinquishTrackerManipulatorControl:](self, "relinquishTrackerManipulatorControl:", self->mControllingTM);
  if (self->mControllingTM)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTrackerManipulatorCoordinator operationDidEnd]");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m");
    v11 = (objc_class *)objc_opt_class();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 151, CFSTR("Controlling TM %@ would not give up control at the end of an operation"), NSStringFromClass(v11));
  }
}

- (void)p_notifyControlChange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)-[NSMutableSet copy](self->mRegisteredTMs, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "trackerManipulatorDidTakeControl:", self->mControllingTM);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

+ (void)p_dynamicallySubclassGRForNotification:(id)a3
{
  void *v4;
  objc_class *Class;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  const char *v9;
  objc_class *v10;
  objc_class *ClassPair;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    objc_sync_enter(v4);
    if (!sClassMap)
      sClassMap = (uint64_t)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    Class = object_getClass(a3);
    if (objc_msgSend((id)objc_msgSend((id)sClassMap, "allValues"), "containsObject:", Class))
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"), 208, CFSTR("trying to subclass something that is already subclassed %@"), a3);
    }
    else
    {
      v8 = (objc_class *)objc_msgSend((id)sClassMap, "objectForKey:", Class);
      if (!v8)
      {
        v9 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("__TSDResetNotifying%s"), class_getName(Class)), "UTF8String");
        v10 = (objc_class *)objc_opt_class();
        ClassPair = objc_allocateClassPair(v10, v9, 0);
        v8 = ClassPair;
        if (!ClassPair)
        {
          v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]");
          v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m");
          v15 = (objc_class *)objc_opt_class();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 227, CFSTR("No dynamic subclass for %@!"), NSStringFromClass(v15));
          goto LABEL_11;
        }
        class_addMethod(ClassPair, sel_reset, (IMP)universalReset, "v@:");
        objc_registerClassPair(v8);
        objc_msgSend((id)sClassMap, "setObject:forUncopiedKey:", v8, Class);
      }
      object_setClass(a3, v8);
    }
LABEL_11:
    objc_sync_exit(v4);
  }
}

+ (void)p_removeDynamicSubclass:(id)a3
{
  void *v4;
  objc_class *Class;
  objc_class *Superclass;
  void *v7;
  uint64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    objc_sync_enter(v4);
    Class = object_getClass(a3);
    if ((objc_msgSend((id)objc_msgSend((id)sClassMap, "allValues"), "containsObject:", Class) & 1) != 0)
    {
      Superclass = class_getSuperclass(Class);
      object_setClass(a3, Superclass);
    }
    else
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSDTrackerManipulatorCoordinator p_removeDynamicSubclass:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"), 242, CFSTR("removing dynamic subclass from GR %@ that doesn't have one!"), a3);
    }
    objc_sync_exit(v4);
  }
}

- (TSDTrackerManipulator)controllingTM
{
  return self->mControllingTM;
}

@end
