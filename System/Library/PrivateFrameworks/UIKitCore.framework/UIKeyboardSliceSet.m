@implementation UIKeyboardSliceSet

- (UIKeyboardSliceSet)initWithSliceID:(id)a3
{
  id v5;
  UIKeyboardSliceSet *v6;
  uint64_t v7;
  NSMutableSet *slices;
  NSMutableDictionary *v9;
  NSMutableDictionary *controlKeys;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  UIKeyboardSliceSet *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboardSliceSet;
  v6 = -[UIKeyboardSliceSet init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    slices = v6->_slices;
    v6->_slices = (NSMutableSet *)v7;

    objc_storeStrong((id *)&v6->_ssid, a3);
    v6->_mergePoint = 0.5;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    controlKeys = v6->_controlKeys;
    v6->_controlKeys = v9;

    v11 = v6->_controlKeys;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, CFSTR("MoreIntlNames"));

    v13 = v6->_controlKeys;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("MoreIntlStarts"));

    v15 = v6->_controlKeys;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, CFSTR("MoreIntlEnds"));

    v17 = v6;
  }

  return v6;
}

+ (UIKeyboardSliceSet)sliceSetWithDictionaryRepresenation:(id)a3
{
  id v3;
  void *v4;
  UIKeyboardSliceSet *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSString *v18;
  double x;
  double y;
  double width;
  double height;
  NSString *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("SSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[UIKeyboardSliceSet initWithSliceID:]([UIKeyboardSliceSet alloc], "initWithSliceID:", v4);
    if (v5)
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("Start"));
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v37 = CGRectFromString(v6);
      -[UIKeyboardSliceSet setStartRect:](v5, "setStartRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);

      objc_msgSend(v3, "valueForKey:", CFSTR("End"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v38 = CGRectFromString(v7);
      -[UIKeyboardSliceSet setEndRect:](v5, "setEndRect:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);

      objc_msgSend(v3, "valueForKey:", CFSTR("LeftWidth"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      -[UIKeyboardSliceSet setLeftWidth:](v5, "setLeftWidth:", v9);

      objc_msgSend(v3, "valueForKey:", CFSTR("RightWidth"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      -[UIKeyboardSliceSet setRightWidth:](v5, "setRightWidth:", v11);

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v30 = v3;
      objc_msgSend(v3, "valueForKey:", CFSTR("Slices"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v17, "valueForKey:", CFSTR("Start"));
            v18 = (NSString *)objc_claimAutoreleasedReturnValue();
            v39 = CGRectFromString(v18);
            x = v39.origin.x;
            y = v39.origin.y;
            width = v39.size.width;
            height = v39.size.height;

            objc_msgSend(v17, "valueForKey:", CFSTR("End"));
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            v40 = CGRectFromString(v23);
            v24 = v40.origin.x;
            v25 = v40.origin.y;
            v26 = v40.size.width;
            v27 = v40.size.height;

            +[UIKeyboardTransitionSlice sliceWithStart:end:](UIKeyboardTransitionSlice, "sliceWithStart:end:", x, y, width, height, v24, v25, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardSliceSet addSlice:](v5, "addSlice:", v28);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v14);
      }

      v3 = v30;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addSlice:(id)a3
{
  -[NSMutableSet addObject:](self->_slices, "addObject:", a3);
}

- (id)description
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UIKeyboardSliceSet (%@) : %ld slices"), self->_ssid, -[NSMutableSet count](self->_slices, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_slices;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t[slice %d] %@"), v7 + v9, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = (v7 + v9);
    }
    while (v6);
  }

  return v3;
}

- (NSMutableSet)slices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sliceSetID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSliceSetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CGRect)startRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_startRect, 32, 1, 0);
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

- (void)setStartRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_startRect, &v3, 32, 1, 0);
}

- (CGRect)endRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_endRect, 32, 1, 0);
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

- (void)setEndRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_endRect, &v3, 32, 1, 0);
}

- (double)leftWidth
{
  return self->_leftWidth;
}

- (void)setLeftWidth:(double)a3
{
  self->_leftWidth = a3;
}

- (double)rightWidth
{
  return self->_rightWidth;
}

- (void)setRightWidth:(double)a3
{
  self->_rightWidth = a3;
}

- (double)mergePoint
{
  return self->_mergePoint;
}

- (void)setMergePoint:(double)a3
{
  self->_mergePoint = a3;
}

- (NSMutableDictionary)controlKeys
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setControlKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlKeys, 0);
  objc_storeStrong((id *)&self->_slices, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
