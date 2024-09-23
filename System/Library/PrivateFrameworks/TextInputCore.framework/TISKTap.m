@implementation TISKTap

- (id)init:(id)a3 layout:(id)a4
{
  id v7;
  id v8;
  TISKTap *v9;
  TISKTap *v10;
  TIKeyboardTouchEvent *lastTouch;
  uint64_t v12;
  NSMutableArray *dragTouches;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TISKTap;
  v9 = -[TISKTap init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_firstTouch, a3);
    lastTouch = v10->_lastTouch;
    v10->_lastTouch = 0;

    v10->_pathIndex = -1;
    objc_storeStrong((id *)&v10->_layout, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    dragTouches = v10->_dragTouches;
    v10->_dragTouches = (NSMutableArray *)v12;

  }
  return v10;
}

- (unint64_t)numberOfDrags
{
  return -[NSMutableArray count](self->_dragTouches, "count");
}

- (void)addDragTouch:(id)a3
{
  -[NSMutableArray addObject:](self->_dragTouches, "addObject:", a3);
}

- (BOOL)isDownUpTap
{
  TIKeyboardTouchEvent *lastTouch;

  if (-[TIKeyboardTouchEvent stage](self->_firstTouch, "stage"))
  {
    LOBYTE(lastTouch) = 0;
  }
  else
  {
    lastTouch = self->_lastTouch;
    if (lastTouch)
      LOBYTE(lastTouch) = -[TIKeyboardTouchEvent stage](lastTouch, "stage") == 2;
  }
  return (char)lastTouch;
}

- (double)downErrorDistance:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat MidY;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TIKeyboardTouchEvent location](self->_firstTouch, "location");
  v9 = v8;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = v9 - CGRectGetMidX(v15);
  -[TIKeyboardTouchEvent location](self->_firstTouch, "location");
  v12 = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidY = CGRectGetMidY(v16);
  return sqrt((v12 - MidY) * (v12 - MidY) + v10 * v10);
}

- (double)upErrorDistance:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat MidY;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TIKeyboardTouchEvent location](self->_lastTouch, "location");
  v9 = v8;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = v9 - CGRectGetMidX(v15);
  -[TIKeyboardTouchEvent location](self->_lastTouch, "location");
  v12 = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidY = CGRectGetMidY(v16);
  return sqrt((v12 - MidY) * (v12 - MidY) + v10 * v10);
}

- (CGRect)getFrameForKey:(id)a3
{
  id v4;
  __int128 v5;
  TIKeyboardLayout *layout;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  __n128 (*v22)(uint64_t, uint64_t);
  uint64_t (*v23)();
  const char *v24;
  __int128 v25;
  __int128 v26;
  CGRect result;

  v4 = a3;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x5012000000;
  v22 = __Block_byref_object_copy__17646;
  v23 = __Block_byref_object_dispose__17647;
  v24 = "";
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v25 = *MEMORY[0x1E0C9D628];
  v26 = v5;
  layout = self->_layout;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __26__TISKTap_getFrameForKey___block_invoke;
  v16[3] = &unk_1EA105FE8;
  v17 = v4;
  v18 = &v19;
  v7 = v4;
  -[TIKeyboardLayout enumerateKeysUsingBlock:](layout, "enumerateKeysUsingBlock:", v16);
  v8 = v20[6];
  v9 = v20[7];
  v10 = v20[8];
  v11 = v20[9];

  _Block_object_dispose(&v19, 8);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (int64_t)_forcedKeyCode
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TIKeyboardTouchEvent forcedKeyCode](self->_lastTouch, "forcedKeyCode");
  v4 = 16;
  if (v3 == -1)
    v4 = 8;
  return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "forcedKeyCode");
}

- (id)stringForIntendedKey
{
  TIKeyboardLayout *layout;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  int64_t v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  v12 = -[TISKTap _forcedKeyCode](self, "_forcedKeyCode");
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  layout = self->_layout;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__TISKTap_stringForIntendedKey__block_invoke;
  v6[3] = &unk_1EA106010;
  v6[4] = v11;
  v6[5] = &v7;
  -[TIKeyboardLayout enumerateKeysUsingBlock:](layout, "enumerateKeysUsingBlock:", v6);
  if (v8[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
  return v4;
}

- (double)distance:(id)a3 withTouch:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "location");
  v8 = v7;
  objc_msgSend(v5, "location");
  *(float *)&v8 = v8 - v9;
  objc_msgSend(v6, "location");
  v11 = v10;

  objc_msgSend(v5, "location");
  v13 = v12;

  v14 = v11 - v13;
  return hypotf(*(float *)&v8, v14);
}

- (double)totalTapDistance
{
  TIKeyboardTouchEvent *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  TIKeyboardTouchEvent *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = self->_firstTouch;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_dragTouches;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = 0.0;
    do
    {
      v9 = 0;
      v10 = v3;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        -[TISKTap distance:withTouch:](self, "distance:withTouch:", v10, v11, (_QWORD)v16);
        v8 = v8 + v12;
        v3 = v11;

        ++v9;
        v10 = v3;
      }
      while (v6 != v9);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  -[TISKTap distance:withTouch:](self, "distance:withTouch:", v3, self->_lastTouch);
  v14 = v13;

  return v8 + v14;
}

- (TIKeyboardTouchEvent)firstTouch
{
  return self->_firstTouch;
}

- (void)setFirstTouch:(id)a3
{
  objc_storeStrong((id *)&self->_firstTouch, a3);
}

- (TIKeyboardTouchEvent)lastTouch
{
  return self->_lastTouch;
}

- (void)setLastTouch:(id)a3
{
  objc_storeStrong((id *)&self->_lastTouch, a3);
}

- (NSMutableArray)dragTouches
{
  return self->_dragTouches;
}

- (void)setDragTouches:(id)a3
{
  objc_storeStrong((id *)&self->_dragTouches, a3);
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

- (void)setPathIndex:(int64_t)a3
{
  self->_pathIndex = a3;
}

- (TIKeyboardLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_dragTouches, 0);
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_firstTouch, 0);
}

uint64_t __31__TISKTap_stringForIntendedKey__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) == a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

void __26__TISKTap_getFrameForKey___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, _BYTE *a8)
{
  void *v14;
  void *v15;
  uint64_t v16;
  double *v17;

  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "caseInsensitiveCompare:", v15);

  if (!v16)
  {
    v17 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    v17[6] = a3;
    v17[7] = a4;
    v17[8] = a5;
    v17[9] = a6;
    *a8 = 1;
  }
}

@end
