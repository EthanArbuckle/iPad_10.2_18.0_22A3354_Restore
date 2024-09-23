@implementation ChartIntervalButtonRow

- (ChartIntervalButtonRow)initWithMaxChartInterval:(int64_t)a3 chartIntervalButtonRowDelegate:(id)a4
{
  id v6;
  ChartIntervalButtonRow *v7;
  ChartIntervalButtonRow *v8;
  NSArray *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ChartIntervalButton *v15;
  void *v16;
  NSArray *intervalButtons;
  NSArray *v18;
  void *v19;

  v6 = a4;
  v7 = -[ChartIntervalButtonRow init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_maxChartInterval = a3;
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 9);
    v10 = 0;
    v11 = *MEMORY[0x24BDBF090];
    v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      v15 = -[ChartIntervalButton initWithFrame:]([ChartIntervalButton alloc], "initWithFrame:", v11, v12, v13, v14);
      +[ChartIntervalButton titleForInterval:](ChartIntervalButton, "titleForInterval:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ChartIntervalButton setText:](v15, "setText:", v16);

      -[ChartIntervalButton setTag:](v15, "setTag:", v10);
      -[ChartIntervalButton setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
      -[ChartIntervalButton setTextAlignment:](v15, "setTextAlignment:", 1);
      -[NSArray addObject:](v9, "addObject:", v15);
      -[ChartIntervalButtonRow addSubview:](v8, "addSubview:", v15);

      ++v10;
    }
    while (v10 != 9);
    intervalButtons = v8->_intervalButtons;
    v8->_intervalButtons = v9;
    v18 = v9;

    -[ChartIntervalButtonRow sizeToBoldLabels](v8, "sizeToBoldLabels");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v8, sel_intervalButtonsTapped_);

    -[ChartIntervalButtonRow addGestureRecognizer:](v8, "addGestureRecognizer:", v19);
  }

  return v8;
}

- (void)sizeToBoldLabels
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_intervalButtons;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setSelected:", 1, (_QWORD)v8);
        objc_msgSend(v7, "sizeToFit");
        objc_msgSend(v7, "setSelected:", 0);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  double v15;
  int v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  int64_t v27;
  double v28;
  int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[ChartIntervalButtonRow bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = self->_intervalButtons;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "tag");
        if (v14 <= -[ChartIntervalButtonRow maxChartInterval](self, "maxChartInterval"))
        {
          objc_msgSend(v13, "bounds");
          v11 = v15 + v11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  v16 = -[ChartIntervalButtonRow maxChartInterval](self, "maxChartInterval");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = self->_intervalButtons;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = (v4 - v11 + -32.0) / (double)v16;
    v21 = *(_QWORD *)v39;
    v22 = v6 + -5.0;
    v23 = 16.0;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v17);
        v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "tag", (_QWORD)v38);
        v27 = -[ChartIntervalButtonRow maxChartInterval](self, "maxChartInterval");
        v28 = 0.0;
        if (v26 <= v27)
        {
          v29 = objc_msgSend(v25, "isSelected", 0.0);
          v28 = 1.0;
          if (!v29)
            v28 = 0.8;
        }
        objc_msgSend(v25, "setAlpha:", v28);
        objc_msgSend(v25, "frame");
        v31 = v30;
        v33 = v32;
        v34 = RoundToPixel(v23);
        objc_msgSend(v25, "font");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "ascender");
        v37 = v22 - RoundToPixel(v36);

        objc_msgSend(v25, "setFrame:", v34, v37, v31, v33);
        v23 = v23 + v20 + v31;
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v19);
  }

}

- (int64_t)intervalForTouchLocation:(CGPoint)a3
{
  double x;
  int v5;
  double v6;
  float v7;
  float v8;

  x = a3.x;
  v5 = -[ChartIntervalButtonRow maxChartInterval](self, "maxChartInterval", a3.x, a3.y);
  -[ChartIntervalButtonRow bounds](self, "bounds");
  v7 = x / v6 * (float)(v5 + 1);
  v8 = floorf(v7);
  if (v8 >= (float)v5)
    v8 = (float)v5;
  return (uint64_t)fmaxf(v8, 0.0);
}

- (void)intervalButtonsTapped:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 3)
  {
    objc_msgSend(v9, "locationInView:", self);
    v4 = -[ChartIntervalButtonRow intervalForTouchLocation:](self, "intervalForTouchLocation:");
    -[ChartIntervalButtonRow intervalButtons](self, "intervalButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ChartIntervalButtonRow selectedButton](self, "selectedButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "indexOfObject:", v6);

    if (v4 != v7)
    {
      -[ChartIntervalButtonRow delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chartIntervalButtonRow:didSelectChartInterval:", self, v4);

      -[ChartIntervalButtonRow selectChartIntervalButtonForInterval:](self, "selectChartIntervalButtonForInterval:", v4);
    }
  }

}

- (void)selectChartIntervalButtonForInterval:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3 != -1)
  {
    -[ChartIntervalButtonRow selectedButton](self, "selectedButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelected:", 0);

    -[ChartIntervalButtonRow intervalButtons](self, "intervalButtons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSelected:", 1);
    -[ChartIntervalButtonRow setSelectedButton:](self, "setSelectedButton:", v7);
    -[ChartIntervalButtonRow setNeedsLayout](self, "setNeedsLayout");

  }
}

- (ChartIntervalButtonRowDelegate)delegate
{
  return (ChartIntervalButtonRowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)intervalButtons
{
  return self->_intervalButtons;
}

- (void)setIntervalButtons:(id)a3
{
  objc_storeStrong((id *)&self->_intervalButtons, a3);
}

- (ChartIntervalButton)selectedButton
{
  return (ChartIntervalButton *)objc_loadWeakRetained((id *)&self->_selectedButton);
}

- (void)setSelectedButton:(id)a3
{
  objc_storeWeak((id *)&self->_selectedButton, a3);
}

- (int64_t)maxChartInterval
{
  return self->_maxChartInterval;
}

- (void)setMaxChartInterval:(int64_t)a3
{
  self->_maxChartInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedButton);
  objc_storeStrong((id *)&self->_intervalButtons, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
