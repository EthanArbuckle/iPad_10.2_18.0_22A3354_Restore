@implementation SUHitTestView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUHitTestView;
  -[SUHitTestView dealloc](&v3, sel_dealloc);
}

- (void)addHitTestTarget:(id)a3
{
  NSMutableArray *hitTestTargets;

  hitTestTargets = self->_hitTestTargets;
  if (!hitTestTargets)
  {
    hitTestTargets = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_hitTestTargets = hitTestTargets;
  }
  -[NSMutableArray addObject:](hitTestTargets, "addObject:", a3);
}

- (void)removeHitTestTarget:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_hitTestTargets, "removeObjectIdenticalTo:", a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  NSMutableArray *hitTestTargets;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id result;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  hitTestTargets = self->_hitTestTargets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hitTestTargets, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(hitTestTargets);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
      result = (id)objc_msgSend(v13, "hitTest:withEvent:", a4);
      if (result)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](hitTestTargets, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15.receiver = self;
    v15.super_class = (Class)SUHitTestView;
    return -[SUHitTestView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

@end
