@implementation SearchUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setColors:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SearchUIGradientView *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToArray:", self->_colors) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_colors, a3);
    if (objc_msgSend(v5, "count") == 1)
    {
      -[SearchUIGradientView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setColors:", 0);

      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = self;
      v9 = v7;
    }
    else
    {
      v7 = (void *)objc_opt_new();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v5;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14));
            objc_msgSend(v7, "addObject:", objc_msgSend(v15, "CGColor", (_QWORD)v17));
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

      -[SearchUIGradientView layer](self, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setColors:", v7);

      v8 = self;
      v9 = 0;
    }
    -[SearchUIGradientView setBackgroundColor:](v8, "setBackgroundColor:", v9, (_QWORD)v17);

  }
}

- (SearchUIGradientView)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIGradientView;
  return -[SearchUIGradientView init](&v3, sel_init);
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
