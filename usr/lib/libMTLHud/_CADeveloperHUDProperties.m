@implementation _CADeveloperHUDProperties

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37___CADeveloperHUDProperties_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[_CADeveloperHUDProperties instance]::dispatcher != -1)
    dispatch_once(&+[_CADeveloperHUDProperties instance]::dispatcher, block);
  return (id)+[_CADeveloperHUDProperties instance]::sharedInstance;
}

- (_CADeveloperHUDProperties)init
{
  _CADeveloperHUDProperties *v2;
  void *v3;
  _HUDLabel *v4;
  _HUDLabel *v5;
  _HUDStatistic *v6;
  _HUDStatistic *v7;
  _HUDStatistic *v8;
  _HUDLabel *v9;
  _HUDGraph *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *rows;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableDictionary *map;
  objc_super v26;
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[9];

  v29[7] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)_CADeveloperHUDProperties;
  v2 = -[_CADeveloperHUDProperties init](&v26, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCEB8];
    v4 = -[_HUDLabel initWithName:]([_HUDLabel alloc], "initWithName:", CFSTR("com.apple.hud-label.gpu-and-resolution"));
    v29[0] = v4;
    v5 = -[_HUDLabel initWithName:]([_HUDLabel alloc], "initWithName:", CFSTR("com.apple.hud-label.compositing-and-refresh-rate"));
    v29[1] = v5;
    v6 = -[_HUDStatistic initWithName:color:tolerance:graph:]([_HUDStatistic alloc], "initWithName:color:tolerance:graph:", CFSTR("com.apple.hud-stat.fps"), 0xFFFFFFFFLL, CFSTR("com.apple.hud-graph.default"), 0.100000001);
    v29[2] = v6;
    v7 = -[_HUDStatistic initWithName:color:tolerance:graph:]([_HUDStatistic alloc], "initWithName:color:tolerance:graph:", CFSTR("com.apple.hud-stat.present-interval"), 4294612749, CFSTR("com.apple.hud-graph.default"), 0.100000001);
    v29[3] = v7;
    v8 = -[_HUDStatistic initWithName:color:tolerance:graph:]([_HUDStatistic alloc], "initWithName:color:tolerance:graph:", CFSTR("com.apple.hud-stat.gpu-time"), 4282503769, CFSTR("com.apple.hud-graph.default"), 0.100000001);
    v29[4] = v8;
    v9 = -[_HUDLabel initWithName:]([_HUDLabel alloc], "initWithName:", CFSTR("com.apple.hud-label.memory"));
    v29[5] = v9;
    v10 = -[_HUDGraph initWithName:min:max:]([_HUDGraph alloc], "initWithName:min:max:", CFSTR("com.apple.hud-graph.default"), 5.0, 45.0);
    v29[6] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    rows = v2->_rows;
    v2->_rows = (NSMutableArray *)v12;

    v14 = (void *)MEMORY[0x24BDBCED8];
    v27[0] = CFSTR("com.apple.hud-label.gpu-and-resolution");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v27[1] = CFSTR("com.apple.hud-label.compositing-and-refresh-rate");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v16;
    v27[2] = CFSTR("com.apple.hud-stat.fps");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v17;
    v27[3] = CFSTR("com.apple.hud-stat.present-interval");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    v27[4] = CFSTR("com.apple.hud-stat.gpu-time");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v19;
    v27[5] = CFSTR("com.apple.hud-label.memory");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[5] = v20;
    v27[6] = CFSTR("com.apple.hud-graph.default");
    -[NSMutableArray objectAtIndexedSubscript:](v2->_rows, "objectAtIndexedSubscript:", 6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[6] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    map = v2->_map;
    v2->_map = (NSMutableDictionary *)v23;

  }
  return v2;
}

- (id)elements
{
  void *v3;
  NSMutableArray *rows;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_rows, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  rows = self->_rows;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37___CADeveloperHUDProperties_elements__block_invoke;
  v7[3] = &unk_24EE47240;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](rows, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (void)remove:(id)a3
{
  _CADeveloperHUDProperties *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *map;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v4->_map, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableArray removeObjectIdenticalTo:](v4->_rows, "removeObjectIdenticalTo:", v5);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_map, "setObject:forKeyedSubscript:", 0, v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "graph");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          map = v4->_map;
          objc_msgSend(v5, "graph");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](map, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v9, "statistics");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "removeObject:", v5);

            }
          }

        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  objc_sync_exit(v4);
}

- (const)UTF8StringForName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "value");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");

  }
  else
  {
    v6 = "";
  }

  return v6;
}

- (BOOL)addLabel:(id)a3 after:(id)a4
{
  id v6;
  id v7;
  _CADeveloperHUDProperties *v8;
  void *v9;
  int v10;
  void *v11;
  _HUDLabel *v12;
  NSMutableArray *rows;
  uint64_t v14;
  BOOL v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_map, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_2;
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_map, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_2:
      v10 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = -[_HUDLabel initWithName:]([_HUDLabel alloc], "initWithName:", v6);
  if (v12)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_map, "setObject:forKeyedSubscript:", v12, v6);
    rows = v8->_rows;
    if (v11)
      v14 = -[NSMutableArray indexOfObject:](v8->_rows, "indexOfObject:", v11) + 1;
    else
      v14 = 0;
    -[NSMutableArray insertObject:atIndex:](rows, "insertObject:atIndex:", v12, v14);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }

LABEL_14:
  objc_sync_exit(v8);

  if (v10)
    v15 = v9 == 0;
  else
    v15 = 0;
  v16 = !v15;

  return v16;
}

- (void)updateLabel:(id)a3 value:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v10 = a3;
  v6 = (__CFString *)a4;
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (v6)
        v9 = v6;
      else
        v9 = &stru_24EE475B0;
      objc_msgSend(v7, "setValue:", v9);
    }
  }
  else
  {
    v8 = 0;
  }

}

- (BOOL)addStatistic:(id)a3 after:(id)a4 color:(unsigned int)a5 tolerance:(double)a6 graph:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  _CADeveloperHUDProperties *v15;
  void *v16;
  int v17;
  _HUDStatistic *v18;
  void *v19;
  void *v20;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = self;
  objc_sync_enter(v15);
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v15->_map, "objectForKeyedSubscript:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    v16 = 0;
  }
  v18 = -[_HUDStatistic initWithName:color:tolerance:graph:]([_HUDStatistic alloc], "initWithName:color:tolerance:graph:", v12, v9, v14, a6);
  if (v18)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15->_map, "setObject:forKeyedSubscript:", v18, v12);
    -[NSMutableArray insertObject:atIndex:](v15->_rows, "insertObject:atIndex:", v18, -[NSMutableArray indexOfObject:](v15->_rows, "indexOfObject:", v16));
    -[NSMutableDictionary objectForKeyedSubscript:](v15->_map, "objectForKeyedSubscript:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "statistics");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "insertObject:atIndex:", v18, objc_msgSend(v20, "count"));

      }
    }

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }

LABEL_12:
  objc_sync_exit(v15);

  return v17 == 0;
}

- (void)setStatistic:(id)a3 value:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = v6;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "setStatistic:forFrame:", self->_frameNumber, a4);
  }
  else
  {
    v8 = 0;
  }

}

- (double)incrementStatistic:(id)a3 value:(double)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  v6 = a3;
  v7 = 0.0;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "incrementStatistic:forFrame:", self->_frameNumber, a4);
      v7 = v10;
    }
  }
  else
  {
    v9 = 0;
  }

  return v7;
}

- (BOOL)addGraph:(id)a3 after:(id)a4 min:(double)a5 max:(double)a6
{
  id v10;
  id v11;
  _CADeveloperHUDProperties *v12;
  int v13;
  _HUDGraph *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v24;
  void *v25;
  _CADeveloperHUDProperties *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = self;
  objc_sync_enter(v12);
  v24 = v11;
  obj = v12;
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_map, "objectForKeyedSubscript:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      v13 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    v25 = 0;
  }
  v14 = -[_HUDGraph initWithName:min:max:]([_HUDGraph alloc], "initWithName:min:max:", v10, a5, a6);
  if (v14)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_map, "setObject:forKeyedSubscript:", v14, v10);
    -[NSMutableArray insertObject:atIndex:](v12->_rows, "insertObject:atIndex:", v14, -[NSMutableArray indexOfObject:](v12->_rows, "indexOfObject:", v25));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v12->_rows;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v19, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v10);

            if (v21)
            {
              -[_HUDGraph statistics](v14, "statistics");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v19);

            }
          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v16);
    }

    v13 = 0;
  }
  else
  {
    v13 = 1;
  }

LABEL_19:
  objc_sync_exit(obj);

  return v13 == 0;
}

- (unint64_t)frameNumber
{
  return self->_frameNumber;
}

- (void)setFrameNumber:(unint64_t)a3
{
  self->_frameNumber = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_loggingEnabled = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unsigned)layout
{
  return self->_layout;
}

- (void)setLayout:(unsigned int)a3
{
  self->_layout = a3;
}

- (NSMutableDictionary)map
{
  return self->_map;
}

- (void)setMap:(id)a3
{
  objc_storeStrong((id *)&self->_map, a3);
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_map, 0);
}

@end
