@implementation _PUPickerNavigationBarAllowingUnclippedSubviewHitTest

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PUPickerNavigationBarAllowingUnclippedSubviewHitTest;
  -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if ((-[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest isHidden](self, "isHidden") & 1) != 0
      || (-[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest alpha](self, "alpha"), v9 <= 0.01)
      || !-[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    {
      v8 = 0;
    }
    else
    {
      -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest subviews](self, "subviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest _unclippedViewPassingHitTest:point:event:](self, "_unclippedViewPassingHitTest:point:event:", v10, v7, x, y);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (id)_unclippedViewPassingHitTest:(id)a3 point:(CGPoint)a4 event:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a4.y;
  x = a4.x;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest convertPoint:toView:](self, "convertPoint:toView:", v16, x, y, (_QWORD)v22);
        objc_msgSend(v16, "hitTest:withEvent:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && !objc_msgSend(v17, "clipsToBounds"))
        {
          v20 = v11;
          goto LABEL_14;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PXReduce();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "count"))
  {
    -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest _unclippedViewPassingHitTest:point:event:](self, "_unclippedViewPassingHitTest:point:event:", v20, v10, x, y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_14:

  return v18;
}

@end
