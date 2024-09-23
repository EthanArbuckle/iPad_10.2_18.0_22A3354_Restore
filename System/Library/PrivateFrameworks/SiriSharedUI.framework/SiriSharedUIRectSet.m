@implementation SiriSharedUIRectSet

- (SiriSharedUIRectSet)initWithRectValues:(id)a3
{
  id v4;
  SiriSharedUIRectSet *v5;
  uint64_t v6;
  NSSet *rectValues;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIRectSet;
  v5 = -[SiriSharedUIRectSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    rectValues = v5->_rectValues;
    v5->_rectValues = (NSSet *)v6;

  }
  return v5;
}

- (SiriSharedUIRectSet)initWithFramesForViews:(id)a3 inCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  SiriSharedUIRectSet *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v14, "frame", (_QWORD)v35);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        objc_msgSend(v14, "superview");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "convertRect:fromCoordinateSpace:", v23, v16, v18, v20, v22);
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v25, v27, v29, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v32);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v11);
  }

  v33 = -[SiriSharedUIRectSet initWithRectValues:](self, "initWithRectValues:", v8);
  return v33;
}

- (SiriSharedUIRectSet)init
{
  return -[SiriSharedUIRectSet initWithRectValues:](self, "initWithRectValues:", MEMORY[0x1E0C9AA60]);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SiriSharedUIRectSet _rectValues](self, "_rectValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "CGRectValue");
        v16.x = x;
        v16.y = y;
        if (CGRectContainsPoint(v17, v16))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSSet)_rectValues
{
  return self->_rectValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectValues, 0);
}

@end
