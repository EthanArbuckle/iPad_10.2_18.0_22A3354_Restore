@implementation UIKBTouchState

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBTouchState *v4;
  uint64_t v5;
  NSUUID *touchUUID;

  v4 = objc_alloc_init(UIKBTouchState);
  v4->_timestamp = self->_timestamp;
  v4->_phase = self->_phase;
  objc_storeStrong((id *)&v4->_window, self->_window);
  v4->_locationInWindow = self->_locationInWindow;
  v4->_pathMajorRadius = self->_pathMajorRadius;
  v4->_pathIndex = self->_pathIndex;
  v5 = -[NSUUID copy](self->_touchUUID, "copy");
  touchUUID = v4->_touchUUID;
  v4->_touchUUID = (NSUUID *)v5;

  v4->_tapCount = self->_tapCount;
  v4->_inputSource = self->_inputSource;
  return v4;
}

+ (id)touchUUIDForTouch:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)_MergedGlobals_30;
    if (!_MergedGlobals_30)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 0);
      v6 = (void *)_MergedGlobals_30;
      _MergedGlobals_30 = v5;

      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 0);
      v8 = (void *)qword_1ECD78150;
      qword_1ECD78150 = v7;

      v4 = (void *)_MergedGlobals_30;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)_MergedGlobals_30, "setObject:forKey:", v9, v3);
      objc_msgSend((id)qword_1ECD78150, "setObject:forKey:", v3, v9);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)touchForTouchUUID:(id)a3
{
  void *v3;

  v3 = (void *)qword_1ECD78150;
  if (qword_1ECD78150)
  {
    objc_msgSend((id)qword_1ECD78150, "objectForKey:", a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)touchesForTouchUUIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1ECD78150)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend((id)qword_1ECD78150, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)touchUUIDsForTouches:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_MergedGlobals_30)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend((id)_MergedGlobals_30, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (void)releaseUUIDForTouch:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "touchUUIDForTouch:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)_MergedGlobals_30, "removeObjectForKey:", v5);
    objc_msgSend((id)qword_1ECD78150, "removeObjectForKey:", v4);
  }

}

+ (id)touchStateForTouch:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "timestamp");
  *((_QWORD *)v5 + 1) = v6;
  *((_QWORD *)v5 + 2) = objc_msgSend(v4, "phase");
  objc_msgSend(v4, "window");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v7;

  objc_msgSend(v4, "_pathMajorRadius");
  *((double *)v5 + 4) = v9;
  *((_QWORD *)v5 + 5) = objc_msgSend(v4, "_pathIndex");
  objc_msgSend(a1, "touchUUIDForTouch:", v4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)*((_QWORD *)v5 + 6);
  *((_QWORD *)v5 + 6) = v10;

  *((_QWORD *)v5 + 7) = objc_msgSend(v4, "tapCount");
  objc_msgSend(v4, "locationInView:", 0);
  *((_QWORD *)v5 + 10) = v12;
  *((_QWORD *)v5 + 11) = v13;
  objc_storeWeak((id *)v5 + 9, v4);

  *((_QWORD *)v5 + 8) = 1;
  return v5;
}

+ (id)touchStateForTouchUUID:(id)a3 withTimestamp:(double)a4 phase:(int64_t)a5 location:(CGPoint)a6 pathIndex:(unsigned __int8)a7 inView:(id)a8
{
  unsigned int v9;
  double y;
  double x;
  id v14;
  id v15;
  double *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v9 = a7;
  y = a6.y;
  x = a6.x;
  v14 = a3;
  v15 = a8;
  v16 = (double *)objc_alloc_init((Class)objc_opt_class());
  v16[1] = a4;
  *((_QWORD *)v16 + 2) = a5;
  objc_msgSend(v15, "window");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)*((_QWORD *)v16 + 3);
  *((_QWORD *)v16 + 3) = v17;

  objc_msgSend(v15, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:fromView:", v15, x, y);
  v21 = v20;
  v23 = v22;

  *((_QWORD *)v16 + 10) = v21;
  *((_QWORD *)v16 + 11) = v23;

  v16[4] = 1.0;
  *((_QWORD *)v16 + 5) = v9;
  v24 = (void *)*((_QWORD *)v16 + 6);
  *((_QWORD *)v16 + 6) = v14;

  return v16;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UIKBTouchState window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTouchState locationInWindow](self, "locationInWindow");
  objc_msgSend(v5, "convertPoint:toView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIKBTouchState touchUUID](self, "touchUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; UUID = %@"), v5);

  v6 = -[UIKBTouchState phase](self, "phase");
  if (v6 <= 4 && ((0x1Bu >> v6) & 1) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR("; phase = %@"), off_1E16D6F68[v6]);
  return v3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)phase
{
  return self->_phase;
}

- (UIWindow)window
{
  return self->_window;
}

- (CGPoint)locationInWindow
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInWindow.x;
  y = self->_locationInWindow.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)pathMajorRadius
{
  return self->_pathMajorRadius;
}

- (unint64_t)pathIndex
{
  return self->_pathIndex;
}

- (NSUUID)touchUUID
{
  return self->_touchUUID;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (int64_t)inputSource
{
  return self->_inputSource;
}

- (UITouch)uiTouch
{
  return (UITouch *)objc_loadWeakRetained((id *)&self->_uiTouch);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiTouch);
  objc_storeStrong((id *)&self->_touchUUID, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
