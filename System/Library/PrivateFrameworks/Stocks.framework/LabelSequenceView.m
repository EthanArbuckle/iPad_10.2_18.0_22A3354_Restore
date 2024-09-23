@implementation LabelSequenceView

- (LabelSequenceView)init
{
  LabelSequenceView *v2;
  LabelSequenceView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LabelSequenceView;
  v2 = -[LabelSequenceView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v3 = v2;
  if (v2)
  {
    -[LabelSequenceView layer](v2, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsDisplayOnBoundsChange:", 0);

  }
  return v3;
}

- (CGSize)requiredSize
{
  double v2;
  double v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGSize result;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDBF148];
  v2 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_stringDrawingInfoValues;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "size", (_QWORD)v16);
        v11 = v10;
        objc_msgSend(v9, "size");
        if (v12 > v2)
        {
          objc_msgSend(v9, "size");
          v2 = v13;
        }
        v3 = v3 + v11 + 15.0;
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = v3 + -15.0;
  v15 = v2;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
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
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *obj;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  _QWORD v34[3];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v28 = v5;
  objc_msgSend(v5, "setLineBreakMode:", 5);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_stringDrawingInfoValues;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *MEMORY[0x24BDBF090];
    v9 = *(_QWORD *)v30;
    v10 = *MEMORY[0x24BDF65F8];
    v11 = *MEMORY[0x24BDF6628];
    v12 = *MEMORY[0x24BDF6600];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "size");
        v16 = v15;
        v18 = v17;
        v19 = RoundToPixel(22.5);
        objc_msgSend(v14, "font");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ascender");
        v22 = RoundToPixel(v19 - v21);

        objc_msgSend(v14, "string");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v10;
        objc_msgSend(v14, "font");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = v24;
        v34[1] = v28;
        v33[1] = v11;
        v33[2] = v12;
        objc_msgSend(v14, "color");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2] = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "drawInRect:withAttributes:", v26, v8, v22, v16, v18);

        v8 = v8 + v16 + 15.0;
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

}

- (NSArray)stringDrawingInfoValues
{
  return self->_stringDrawingInfoValues;
}

- (void)setStringDrawingInfoValues:(id)a3
{
  objc_storeStrong((id *)&self->_stringDrawingInfoValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringDrawingInfoValues, 0);
}

@end
