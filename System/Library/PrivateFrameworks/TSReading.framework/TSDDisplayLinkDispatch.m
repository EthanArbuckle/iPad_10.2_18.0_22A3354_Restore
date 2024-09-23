@implementation TSDDisplayLinkDispatch

- (void)teardown
{
  objc_sync_enter(self);
  -[TSDDisplayLink teardown](self->_displayLink, "teardown");

  self->_displayLink = 0;
  self->_blocks = 0;
  objc_sync_exit(self);
}

- (void)performBlockNextFrame:(id)a3
{
  void *v4;
  NSMutableArray *blocks;
  TSDDisplayLink *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = (void *)objc_msgSend(a3, "copy");
  objc_sync_enter(self);
  blocks = self->_blocks;
  if (!blocks)
  {
    blocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blocks = blocks;
  }
  -[NSMutableArray addObject:](blocks, "addObject:", v4);
  if (!self->_displayLink)
  {
    v6 = objc_alloc_init(TSDDisplayLink);
    v7 = MEMORY[0x24BDAC760];
    self->_displayLink = v6;
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __48__TSDDisplayLinkDispatch_performBlockNextFrame___block_invoke;
    v8[3] = &unk_24D82D030;
    v8[4] = self;
    -[TSDDisplayLink setTickBlock:](v6, "setTickBlock:", v8);
    -[TSDDisplayLink start](self->_displayLink, "start");
  }
  objc_sync_exit(self);

}

uint64_t __48__TSDDisplayLinkDispatch_performBlockNextFrame___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  v5 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_sync_exit(v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i) + 16))();
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v10 = v4;
  return 1;
}

@end
