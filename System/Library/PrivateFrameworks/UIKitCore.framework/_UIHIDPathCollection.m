@implementation _UIHIDPathCollection

- (_UIHIDPathCollection)init
{
  _UIHIDPathCollection *v2;
  uint64_t v3;
  NSMutableDictionary *pathsById;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIHIDPathCollection;
  v2 = -[_UIHIDPathCollection init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    pathsById = v2->_pathsById;
    v2->_pathsById = (NSMutableDictionary *)v3;

    v2->_digitizerSenderID = 0x8000000800A15171;
  }
  return v2;
}

- (void)dealloc
{
  __IOHIDEvent *hidEvent;
  objc_super v4;

  hidEvent = self->_hidEvent;
  if (hidEvent)
  {
    CFRelease(hidEvent);
    self->_hidEvent = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIHIDPathCollection;
  -[_UIHIDPathCollection dealloc](&v4, sel_dealloc);
}

- (unint64_t)pathCount
{
  return -[NSMutableDictionary count](self->_pathsById, "count");
}

- (BOOL)hasPathWithId:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_pathsById, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)pathWithId:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_pathsById, "objectForKey:", a3);
}

- (id)pathsInPhase:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_pathsById, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "deliveryPhase") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)pathsTouching
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_pathsById, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isTouching"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)addPath:(id)a3
{
  NSMutableDictionary *pathsById;
  id v4;
  id v5;

  pathsById = self->_pathsById;
  v4 = a3;
  objc_msgSend(v4, "pathId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](pathsById, "setObject:forKey:", v4, v5);

}

- (void)removePath:(id)a3
{
  NSMutableDictionary *pathsById;
  id v4;

  pathsById = self->_pathsById;
  objc_msgSend(a3, "pathId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](pathsById, "removeObjectForKey:", v4);

}

- (void)updateWithHIDEvent:(__IOHIDEvent *)a3
{
  __IOHIDEvent *hidEvent;

  hidEvent = self->_hidEvent;
  if (hidEvent != a3)
  {
    if (hidEvent)
      CFRelease(hidEvent);
    self->_hidEvent = a3;
    if (a3)
      CFRetain(a3);
    self->_machTimestamp = IOHIDEventGetTimeStamp();
  }
}

- (unsigned)_collectionMask
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_pathsById, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v3)
  {

    return 0;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      v11 = v8;
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v2);
      v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "deliveryPhase");
      v8 |= v12 == 6 || v12 == 4;
      v7 |= v12 == 5;
      v5 |= v12 == 6;
      v6 |= (v12 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    }
    v13 = v12;
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v4);

  if ((v11 & 1) != 0 || (v13 | 2) == 6)
  {
    if ((v7 & 1) != 0)
    {
      result = 6;
      goto LABEL_16;
    }
    result = 2;
LABEL_14:
    if (!(v8 & 1 | ((v5 & 1) == 0)))
      result |= 0x20u;
    goto LABEL_16;
  }
  if ((v7 & 1) == 0)
  {
    result = 0;
    goto LABEL_14;
  }
  result = 4;
LABEL_16:
  if ((v6 & 1) != 0)
    result |= 1u;
  return result;
}

- (__IOHIDEvent)_createCollectionEventForEvent:(__IOHIDEvent *)a3
{
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  unsigned int v11;
  __IOHIDEvent *DigitizerEvent;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[_UIHIDPathCollection _collectionMask](self, "_collectionMask");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_pathsById, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "deliveryPhase") == 4 || objc_msgSend(v9, "deliveryPhase") == 5;
        v6 |= v10;
        objc_msgSend(v9, "deliveryPhase");
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
    v11 = v6 & 1;
  }
  else
  {
    v11 = 0;
  }

  DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent();
  objc_msgSend((id)UIApp, "_supportsIndirectInputEvents", v11);
  IOHIDEventSetIntegerValue();
  IOHIDEventGetIntegerValue();
  IOHIDEventSetIntegerValue();
  IOHIDEventGetType();
  IOHIDEventSetSenderID();
  return DigitizerEvent;
}

- (void)updateEventTimestamp:(unint64_t)a3
{
  self->_machTimestamp = a3;
}

- (id)hidEventFromCurrentState
{
  const void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  _UIHIDPathCollection *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const void *DigitizerStylusEventWithPolarOrientation;
  void *v19;
  void *v20;
  int v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  int v28;
  char *v29;
  double v30;
  float v31;
  id v32;
  _UIHIDPathCollection *v33;
  int Type;
  void *hidEvent;
  _DWORD v37[4];
  _DWORD *v38;
  id v39;
  id v40;
  const void *v41;
  id v42;
  uint64_t v43;
  char *v44;
  _UIHIDPathCollection *v45;
  __IOHIDEvent *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[92];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = _UIEventHIDGetChildStylusEvent((uint64_t)self->_hidEvent);
  v45 = self;
  BKSHIDEventGetBaseAttributes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = objc_msgSend(v6, "contextID");
  v10 = v45;
  v45->_locus = 0;
  v46 = -[_UIHIDPathCollection _createCollectionEventForEvent:](v10, "_createCollectionEventForEvent:", v10->_hidEvent);
  v11 = -[NSMutableDictionary count](v10->_pathsById, "count");
  MEMORY[0x1E0C80A78](v11);
  v44 = (char *)v37 - v12;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v51 = 0u;
  -[NSMutableDictionary objectEnumerator](v10->_pathsById, "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v48)
  {
    v37[3] = v9;
    v38 = v37;
    v39 = v8;
    v40 = v6;
    v14 = 0;
    v47 = *(_QWORD *)v52;
    v43 = *MEMORY[0x1E0C9AE00];
    v41 = v3;
    v42 = v13;
LABEL_8:
    v15 = 0;
    while (2)
    {
      if (*(_QWORD *)v52 != v47)
        objc_enumerationMutation(v42);
      v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
      switch(objc_msgSend(v16, "deliveryPhase"))
      {
        case 0:
          goto LABEL_28;
        case 1:
          v50 = v14;
          v49 = 1;
          goto LABEL_17;
        case 2:
          v50 = v14;
          v49 = 1;
          if (!v3)
            goto LABEL_18;
          goto LABEL_26;
        case 3:
          v50 = v14;
          v49 = 0;
LABEL_17:
          if (!v3)
            goto LABEL_18;
          goto LABEL_26;
        case 4:
          v50 = v14;
          v49 = 1;
          goto LABEL_25;
        case 5:
          v50 = v14;
          v49 = 1;
          goto LABEL_25;
        case 6:
          v50 = v14;
          v49 = 1;
          if (!v3)
            goto LABEL_18;
          goto LABEL_26;
        case 7:
          v50 = v14;
          v49 = 1;
          if (!v3)
            goto LABEL_18;
          goto LABEL_26;
        default:
          v50 = v14;
          v49 = 1;
LABEL_25:
          if (v3)
          {
LABEL_26:
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            IOHIDEventGetFloatValue();
            objc_msgSend(v16, "pathId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "intValue");
            objc_msgSend(v16, "identity");
            objc_msgSend(v16, "position");
            objc_msgSend(v16, "position");
            DigitizerStylusEventWithPolarOrientation = (const void *)IOHIDEventCreateDigitizerStylusEventWithPolarOrientation();

            IOHIDEventSetFloatValue();
          }
          else
          {
LABEL_18:
            objc_msgSend(v16, "pathId");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "intValue");
            objc_msgSend(v16, "identity");
            objc_msgSend(v16, "position");
            objc_msgSend(v16, "position");
            objc_msgSend(v16, "force");
            DigitizerStylusEventWithPolarOrientation = (const void *)IOHIDEventCreateDigitizerFingerEvent();

            objc_msgSend(v16, "majorRadius");
            IOHIDEventSetFloatValue();
            v3 = v41;
            IOHIDEventGetIntegerValue();
            IOHIDEventSetIntegerValue();
          }
          objc_msgSend(v16, "generationCount");
          IOHIDEventSetIntegerValue();
          objc_msgSend(v16, "pathId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "intValue");

          objc_msgSend(v16, "position");
          v23 = v22;
          objc_msgSend(v16, "position");
          v25 = v24;
          objc_msgSend(v16, "position");
          v27 = v26;
          objc_msgSend(v16, "position");
          v28 = v50;
          v29 = &v44[36 * v50];
          *(_DWORD *)v29 = v21;
          *((_DWORD *)v29 + 1) = v21;
          v31 = v30;
          *((_QWORD *)v29 + 1) = 0;
          *((_DWORD *)v29 + 4) = 0;
          *((float *)v29 + 5) = v23;
          *((float *)v29 + 6) = v25;
          *((float *)v29 + 7) = v27;
          *((float *)v29 + 8) = v31;
          IOHIDEventAppendEvent();
          CFRelease(DigitizerStylusEventWithPolarOrientation);
          v14 = v28 + 1;
LABEL_28:
          if (v48 != ++v15)
            continue;
          v32 = v42;
          v48 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v48)
            goto LABEL_8;

          v6 = v40;
          v8 = v39;
          if (!v14)
            goto LABEL_38;
          v33 = v45;
          Type = IOHIDEventGetType();
          hidEvent = v33->_hidEvent;
          if (Type != 17)
            hidEvent = (void *)_UIEventHIDGetChildPointerEvent((uint64_t)hidEvent);
          if (hidEvent)
            IOHIDEventAppendEvent();
          if (v8)
            objc_msgSend(v8, "initialTouchTimestamp");
          else
            CFAbsoluteTimeGetCurrent();
          BKSHIDEventSetDigitizerInfoWithSubEventInfos();
          break;
      }
      break;
    }
  }
  else
  {

LABEL_38:
    CFRelease(v46);
    v46 = 0;
  }

  return v46;
}

- (unint64_t)digitizerSenderID
{
  return self->_digitizerSenderID;
}

- (void)setDigitizerSenderID:(unint64_t)a3
{
  self->_digitizerSenderID = a3;
}

- (unsigned)fallbackContextId
{
  return self->_fallbackContextId;
}

- (void)setFallbackContextId:(unsigned int)a3
{
  self->_fallbackContextId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsById, 0);
}

@end
