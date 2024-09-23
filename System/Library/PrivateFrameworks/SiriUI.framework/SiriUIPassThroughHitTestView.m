@implementation SiriUIPassThroughHitTestView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SiriUIPassThroughHitTestView subviews](self, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        v15 = v14;
        v17 = v16;
        objc_msgSend(v13, "bounds");
        v27.x = v15;
        v27.y = v17;
        if (CGRectContainsPoint(v28, v27))
        {
          objc_msgSend(v13, "hitTest:withEvent:", v7, v15, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
  }

  v20.receiver = self;
  v20.super_class = (Class)SiriUIPassThroughHitTestView;
  -[SiriUIPassThroughHitTestView hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7, x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v18;
}

@end
