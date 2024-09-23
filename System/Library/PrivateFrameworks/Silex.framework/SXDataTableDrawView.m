@implementation SXDataTableDrawView

- (SXDataTableDrawView)initWithFrame:(CGRect)a3
{
  SXDataTableDrawView *v3;
  uint64_t v4;
  NSMutableArray *drawBlocks;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SXDataTableDrawView;
  v3 = -[SXDataTableDrawView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    drawBlocks = v3->_drawBlocks;
    v3->_drawBlocks = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableDrawView setBackgroundColor:](v3, "setBackgroundColor:", v6);

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  NSMutableArray *v9;
  NSMutableArray *v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)SXDataTableDrawView;
  -[SXDataTableDrawView drawRect:](&v22, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  CGContextClearRect(CurrentContext, v25);
  if (self)
  {
    v9 = self->_drawBlocks;
    if (v9)
    {
      v10 = v9;
      v11 = -[NSMutableArray count](self->_drawBlocks, "count");

      if (v11)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v12 = self->_drawBlocks;
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v19;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
              -[SXDataTableDrawView frame](self, "frame", (_QWORD)v18);
              (*(void (**)(uint64_t, CGContext *))(v17 + 16))(v17, CurrentContext);
              ++v16;
            }
            while (v14 != v16);
            v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v14);
        }

      }
    }
  }
}

- (uint64_t)drawBlocks
{
  if (result)
    return *(_QWORD *)(result + 416);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawBlocks, 0);
}

@end
