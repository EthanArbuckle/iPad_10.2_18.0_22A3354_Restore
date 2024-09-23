@implementation MapsDebugTableSection

- (id)addCheckmarkRowsGroupWithContent:(id)a3 object:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100718408;
  v17[3] = &unk_1011C17C8;
  v18 = v8;
  v19 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100718414;
  v14[3] = &unk_1011C17F0;
  v15 = v18;
  v16 = v19;
  v10 = v19;
  v11 = v18;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addCheckmarkRowsGroupWithContent:get:set:](self, "addCheckmarkRowsGroupWithContent:get:set:", a3, v17, v14));

  return v12;
}

- (MapsDebugTableSection)init
{
  MapsDebugTableSection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTableSection;
  result = -[MapsDebugTableSection init](&v3, "init");
  if (result)
    result->_visible = 1;
  return result;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_rows;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setSection:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsDebugTableSection;
  -[MapsDebugTableSection dealloc](&v8, "dealloc");
}

- (void)addRow:(id)a3
{
  id v4;
  NSArray *rows;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  NSMutableArray *v12;
  NSMutableArray *mutableRows;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (!self->_mutableRows)
  {
    rows = self->_rows;
    if (rows)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = rows;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v15;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "setSection:", 0, (_QWORD)v14);
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }

      v11 = self->_rows;
      self->_rows = 0;

    }
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mutableRows = self->_mutableRows;
    self->_mutableRows = v12;

  }
  objc_msgSend(v4, "setSection:", self, (_QWORD)v14);
  -[NSMutableArray addObject:](self->_mutableRows, "addObject:", v4);

}

- (void)commit
{
  NSMutableArray *mutableRows;
  NSArray *v4;
  NSArray *rows;
  NSMutableArray *v6;

  mutableRows = self->_mutableRows;
  if (mutableRows)
  {
    v4 = (NSArray *)-[NSMutableArray copy](mutableRows, "copy");
    rows = self->_rows;
    self->_rows = v4;

    v6 = self->_mutableRows;
    self->_mutableRows = 0;

  }
}

- (id)addButtonRowWithTitle:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  MapsDebugActionTableRow *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugActionTableRow);
  -[MapsDebugTableRow setTitle:](v8, "setTitle:", v7);

  -[MapsDebugActionTableRow setSelectionAction:](v8, "setSelectionAction:", v6);
  -[MapsDebugTableSection addRow:](self, "addRow:", v8);
  return v8;
}

- (id)addEmptySectionBannerRowWithTitle:(id)a3
{
  id v4;
  MapsDebugEmptySectionBannerRow *v5;

  v4 = a3;
  v5 = objc_alloc_init(MapsDebugEmptySectionBannerRow);
  -[MapsDebugTableRow setTitle:](v5, "setTitle:", v4);

  -[MapsDebugTableSection addRow:](self, "addRow:", v5);
  return v5;
}

- (id)addNavigationRowWithTitle:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  MapsDebugNavigationTableRow *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugNavigationTableRow);
  -[MapsDebugTableRow setTitle:](v8, "setTitle:", v7);

  -[MapsDebugTableRow setSelectionAction:](v8, "setSelectionAction:", v6);
  -[MapsDebugTableSection addRow:](self, "addRow:", v8);
  return v8;
}

- (id)addNavigationRowForViewControllerClass:(Class)a3
{
  MapsDebugNavigationTableRow *v5;

  if (a3)
  {
    v5 = objc_alloc_init(MapsDebugNavigationTableRow);
    -[MapsDebugNavigationTableRow setViewControllerClass:](v5, "setViewControllerClass:", a3);
    -[MapsDebugTableSection addRow:](self, "addRow:", v5);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)addNavigationRowWithTitle:(id)a3 viewControllerContent:(id)a4
{
  id v6;
  id v7;
  MapsDebugNavigationTableRow *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugNavigationTableRow);
  -[MapsDebugTableRow setPrepareContentBlock:](v8, "setPrepareContentBlock:", v6);

  -[MapsDebugTableRow setTitle:](v8, "setTitle:", v7);
  -[MapsDebugTableSection addRow:](self, "addRow:", v8);
  return v8;
}

- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSwitchRowWithTitle:userDefaults:defaultsKey:](self, "addSwitchRowWithTitle:userDefaults:defaultsKey:", v7, v8, v6));

  return v9;
}

- (id)addSwitchRowWithTitle:(id)a3 userDefaults:(id)a4 defaultsKey:(id)a5
{
  return -[MapsDebugTableSection addSwitchRowWithTitle:defaultsKey:userDefaults:switchOnStateIfUnset:changeHandler:](self, "addSwitchRowWithTitle:defaultsKey:userDefaults:switchOnStateIfUnset:changeHandler:", a3, a5, a4, 0, 0);
}

- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4 switchOnStateIfUnset:(BOOL)a5 changeHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSwitchRowWithTitle:defaultsKey:userDefaults:switchOnStateIfUnset:changeHandler:](self, "addSwitchRowWithTitle:defaultsKey:userDefaults:switchOnStateIfUnset:changeHandler:", v12, v11, v13, v6, v10));

  return v14;
}

- (id)addSwitchRowWithTitle:(id)a3 defaultsKey:(id)a4 userDefaults:(id)a5 switchOnStateIfUnset:(BOOL)a6 changeHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  BOOL v27;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100A3605C;
  v24[3] = &unk_1011E0198;
  v25 = v13;
  v26 = v12;
  v27 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100A360A8;
  v20[3] = &unk_1011BF400;
  v21 = v25;
  v22 = v26;
  v23 = v14;
  v15 = v14;
  v16 = v26;
  v17 = v25;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSwitchRowWithTitle:get:set:](self, "addSwitchRowWithTitle:get:set:", a3, v24, v20));

  return v18;
}

- (id)addSwitchRowWithTitle:(id)a3 geoConfigKey:(id)a4
{
  _QWORD v5[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v6;
  _QWORD v7[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A36174;
  v7[3] = &unk_1011BFA50;
  v8 = a4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A36180;
  v5[3] = &unk_1011BFA70;
  v6 = a4;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSwitchRowWithTitle:get:set:](self, "addSwitchRowWithTitle:get:set:", a3, v7, v5));
}

- (id)addSwitchRowWithTitle:(id)a3 geoConfigKey:(id)a4 switchOnStateIfUnset:(BOOL)a5 changeHandler:(id)a6
{
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  $6E15C01CA1BE37A4936191A84F7075E2 v13;
  _QWORD v14[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v15;
  BOOL v16;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A36264;
  v14[3] = &unk_1011E01B8;
  v15 = a4;
  v16 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A362A4;
  v11[3] = &unk_1011E01E0;
  v13 = a4;
  v12 = a6;
  v8 = v12;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSwitchRowWithTitle:get:set:](self, "addSwitchRowWithTitle:get:set:", a3, v14, v11));

  return v9;
}

- (id)addSwitchRowWithTitle:(id)a3 get:(id)a4 set:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsDebugSwitchTableRow *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(MapsDebugSwitchTableRow);
  -[MapsDebugTableRow setTitle:](v11, "setTitle:", v10);

  -[MapsDebugSwitchTableRow setGet:](v11, "setGet:", v9);
  -[MapsDebugSwitchTableRow setSet:](v11, "setSet:", v8);

  -[MapsDebugTableSection addRow:](self, "addRow:", v11);
  return v11;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(float)a5 max:(float)a6 get:(id)a7 set:(id)a8
{
  return -[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:subtitleStringHandler:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:subtitleStringHandler:min:max:get:set:", a3, a4, 0, a7, a8);
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 subtitleStringHandler:(id)a5 min:(float)a6 max:(float)a7 get:(id)a8 set:(id)a9
{
  id v16;
  uint64_t (**v17)(_QWORD);
  void (**v18)(_QWORD);
  id v19;
  id v20;
  MapsDebugSliderTableRow *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;

  v16 = a4;
  v17 = (uint64_t (**)(_QWORD))a5;
  v18 = (void (**)(_QWORD))a8;
  v19 = a9;
  v20 = a3;
  v21 = objc_alloc_init(MapsDebugSliderTableRow);
  -[MapsDebugTableRow setTitle:](v21, "setTitle:", v20);

  *(float *)&v22 = a6;
  -[MapsDebugSliderTableRow setMinimum:](v21, "setMinimum:", v22);
  *(float *)&v23 = a7;
  -[MapsDebugSliderTableRow setMaximum:](v21, "setMaximum:", v23);
  -[MapsDebugSliderTableRow setGet:](v21, "setGet:", v18);
  -[MapsDebugSliderTableRow setSet:](v21, "setSet:", v19);

  -[MapsDebugSliderTableRow setSubtitleFormatString:](v21, "setSubtitleFormatString:", v16);
  -[MapsDebugSliderTableRow setSubtitleHandler:](v21, "setSubtitleHandler:", v17);
  if (v18)
  {
    if (v17)
    {
      v18[2](v18);
      v24 = v17[2](v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      -[MapsDebugTableRow setSubtitle:](v21, "setSubtitle:", v25);

    }
    else if (v16)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100A36570;
      v30[3] = &unk_1011E0208;
      v31 = v16;
      v26 = objc_retainBlock(v30);
      v18[2](v18);
      v27 = ((uint64_t (*)(_QWORD *))v26[2])(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      -[MapsDebugTableRow setSubtitle:](v21, "setSubtitle:", v28);

      -[MapsDebugSliderTableRow setSubtitleHandler:](v21, "setSubtitleHandler:", v26);
    }
  }
  -[MapsDebugTableSection addRow:](self, "addRow:", v21);

  return v21;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(float)a5 max:(float)a6 defaultsKey:(id)a7 sliderValueIfUnset:(float)a8 changeHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  float v29;
  float v30;
  float v31;

  v16 = a7;
  v17 = a9;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100A366E0;
  v27[3] = &unk_1011E0230;
  v28 = v16;
  v29 = a8;
  v30 = a6;
  v31 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100A36768;
  v24[3] = &unk_1011E0258;
  v25 = v28;
  v26 = v17;
  v18 = v17;
  v19 = v28;
  *(float *)&v20 = a5;
  *(float *)&v21 = a6;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:", a3, a4, v27, v24, v20, v21));

  return v22;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(int64_t)a5 max:(int64_t)a6 geoConfigKeyInteger:(id)a7 changeHandler:(id)a8
{
  id v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  int64_t v19;
  $6E15C01CA1BE37A4936191A84F7075E2 v20;
  _QWORD v21[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v22;
  int64_t v23;
  int64_t v24;

  v20 = a7;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A368F8;
  v21[3] = &unk_1011E0278;
  v22 = a7;
  v23 = a5;
  v24 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A36938;
  v16[3] = &unk_1011E02A0;
  v19 = a6;
  v17 = a8;
  v18 = v23;
  v11 = v17;
  *(float *)&v12 = (float)v23;
  *(float *)&v13 = (float)v24;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:", a3, a4, v21, v16, v12, v13));
  objc_msgSend(v14, "setValidate:", &stru_1011E02E0);

  return v14;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(unint64_t)a5 max:(unint64_t)a6 geoConfigKeyUInteger:(id)a7 changeHandler:(id)a8
{
  id v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  unint64_t v19;
  $6E15C01CA1BE37A4936191A84F7075E2 v20;
  _QWORD v21[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v22;
  unint64_t v23;
  unint64_t v24;

  v20 = a7;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A36AB0;
  v21[3] = &unk_1011E0278;
  v22 = a7;
  v23 = a5;
  v24 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A36AF0;
  v16[3] = &unk_1011E02A0;
  v19 = a6;
  v17 = a8;
  v18 = v23;
  v11 = v17;
  *(float *)&v12 = (float)v23;
  *(float *)&v13 = (float)v24;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:", a3, a4, v21, v16, v12, v13));
  objc_msgSend(v14, "setValidate:", &stru_1011E0300);

  return v14;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(unint64_t)a5 max:(unint64_t)a6 geoConfigKeyUint64:(id)a7 changeHandler:(id)a8
{
  id v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  unint64_t v19;
  $6E15C01CA1BE37A4936191A84F7075E2 v20;
  _QWORD v21[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v22;
  unint64_t v23;
  unint64_t v24;

  v20 = a7;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A36C68;
  v21[3] = &unk_1011E0278;
  v22 = a7;
  v23 = a5;
  v24 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A36CA8;
  v16[3] = &unk_1011E02A0;
  v19 = a6;
  v17 = a8;
  v18 = v23;
  v11 = v17;
  *(float *)&v12 = (float)v23;
  *(float *)&v13 = (float)v24;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:", a3, a4, v21, v16, v12, v13));
  objc_msgSend(v14, "setValidate:", &stru_1011E0320);

  return v14;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringFormat:(id)a4 min:(double)a5 max:(double)a6 geoConfigKeyDouble:(id)a7 changeHandler:(id)a8
{
  float v11;
  float v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  $6E15C01CA1BE37A4936191A84F7075E2 v22;
  _QWORD v23[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v24;
  double v25;
  double v26;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A36E14;
  v23[3] = &unk_1011E0278;
  v24 = a7;
  v25 = a5;
  v26 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A36E54;
  v18[3] = &unk_1011E02A0;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v19 = a8;
  v13 = v19;
  v11 = v25;
  *(float *)&v14 = v11;
  v12 = v26;
  *(float *)&v15 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:min:max:get:set:", a3, a4, v23, v18, v14, v15));

  return v16;
}

- (id)addSliderRowWithTitle:(id)a3 subtitleStringHandler:(id)a4 min:(double)a5 max:(double)a6 geoConfigKeyDouble:(id)a7 changeHandler:(id)a8
{
  float v11;
  float v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  double v20;
  double v21;
  $6E15C01CA1BE37A4936191A84F7075E2 v22;
  _QWORD v23[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v24;
  double v25;
  double v26;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100A36FC8;
  v23[3] = &unk_1011E0278;
  v24 = a7;
  v25 = a5;
  v26 = a6;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A37008;
  v18[3] = &unk_1011E02A0;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v19 = a8;
  v13 = v19;
  v11 = v25;
  *(float *)&v14 = v11;
  v12 = v26;
  *(float *)&v15 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addSliderRowWithTitle:subtitleStringFormat:subtitleStringHandler:min:max:get:set:](self, "addSliderRowWithTitle:subtitleStringFormat:subtitleStringHandler:min:max:get:set:", a3, 0, a4, v23, v18, v14, v15));

  return v16;
}

- (id)addTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 get:(id)a6 set:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MapsDebugTextFieldTableRow *v16;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(MapsDebugTextFieldTableRow);
  -[MapsDebugTableRow setTitle:](v16, "setTitle:", v15);

  -[MapsDebugTextFieldTableRow setPlaceholderText:](v16, "setPlaceholderText:", v14);
  -[MapsDebugTextFieldTableRow setInputType:](v16, "setInputType:", a5);
  -[MapsDebugTextFieldTableRow setGet:](v16, "setGet:", v13);

  -[MapsDebugTextFieldTableRow setSet:](v16, "setSet:", v12);
  -[MapsDebugTableSection addRow:](self, "addRow:", v16);
  return v16;
}

- (id)addTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 defaultsKey:(id)a6
{
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100A37228;
  v15[3] = &unk_1011B4F08;
  v16 = a6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100A3729C;
  v13[3] = &unk_1011AE420;
  v14 = v16;
  v10 = v16;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addTextFieldRowWithTitle:placeholderText:inputType:get:set:](self, "addTextFieldRowWithTitle:placeholderText:inputType:get:set:", a3, a4, a5, v15, v13));

  return v11;
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyString:(id)a6
{
  _QWORD v7[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v8;
  _QWORD v9[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A3738C;
  v9[3] = &unk_1011E0340;
  v10 = a6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A37398;
  v7[3] = &unk_1011E0360;
  v8 = a6;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addTextFieldRowWithTitle:placeholderText:inputType:get:set:](self, "addTextFieldRowWithTitle:placeholderText:inputType:get:set:", a3, a4, a5, v9, v7));
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyInteger:(id)a6
{
  _QWORD v7[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v8;
  _QWORD v9[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A37420;
  v9[3] = &unk_1011E0340;
  v10 = a6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A37474;
  v7[3] = &unk_1011E0360;
  v8 = a6;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addTextFieldRowWithTitle:placeholderText:inputType:get:set:](self, "addTextFieldRowWithTitle:placeholderText:inputType:get:set:", a3, a4, a5, v9, v7));
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyUInteger:(id)a6
{
  _QWORD v7[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v8;
  _QWORD v9[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A37518;
  v9[3] = &unk_1011E0340;
  v10 = a6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A3756C;
  v7[3] = &unk_1011E0360;
  v8 = a6;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addTextFieldRowWithTitle:placeholderText:inputType:get:set:](self, "addTextFieldRowWithTitle:placeholderText:inputType:get:set:", a3, a4, a5, v9, v7));
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyUint64:(id)a6
{
  _QWORD v7[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v8;
  _QWORD v9[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A37610;
  v9[3] = &unk_1011E0340;
  v10 = a6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A37664;
  v7[3] = &unk_1011E0360;
  v8 = a6;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addTextFieldRowWithTitle:placeholderText:inputType:get:set:](self, "addTextFieldRowWithTitle:placeholderText:inputType:get:set:", a3, a4, a5, v9, v7));
}

- (id)addGEOTextFieldRowWithTitle:(id)a3 placeholderText:(id)a4 inputType:(int64_t)a5 geoConfigKeyDouble:(id)a6
{
  _QWORD v7[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v8;
  _QWORD v9[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A37708;
  v9[3] = &unk_1011E0340;
  v10 = a6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100A37758;
  v7[3] = &unk_1011E0360;
  v8 = a6;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addTextFieldRowWithTitle:placeholderText:inputType:get:set:](self, "addTextFieldRowWithTitle:placeholderText:inputType:get:set:", a3, a4, a5, v9, v7));
}

- (id)addGEODateFieldRowWithTitle:(id)a3 placeholderText:(id)a4 geoConfigKeyDate:(id)a5
{
  _QWORD v6[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v7;
  _QWORD v8[4];
  $6E15C01CA1BE37A4936191A84F7075E2 v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A377F8;
  v8[3] = &unk_1011E0380;
  v9 = a5;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100A37804;
  v6[3] = &unk_1011E03A0;
  v7 = a5;
  return (id)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addDateFieldRowWithTitle:get:set:](self, "addDateFieldRowWithTitle:get:set:", a3, v8, v6));
}

- (id)addDateFieldRowWithTitle:(id)a3 get:(id)a4 set:(id)a5
{
  id v8;
  id v9;
  id v10;
  MapsDebugDateFieldTableRow *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(MapsDebugDateFieldTableRow);
  -[MapsDebugTableRow setTitle:](v11, "setTitle:", v10);

  -[MapsDebugDateFieldTableRow setGet:](v11, "setGet:", v9);
  -[MapsDebugDateFieldTableRow setSet:](v11, "setSet:", v8);

  -[MapsDebugTableSection addRow:](self, "addRow:", v11);
  return v11;
}

- (id)addReadOnlyRowWithTitle:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  MapsDebugReadOnlyValueRow *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugReadOnlyValueRow);
  -[MapsDebugTableRow setTitle:](v8, "setTitle:", v7);

  -[MapsDebugTableRow setSubtitle:](v8, "setSubtitle:", v6);
  -[MapsDebugTableSection addRow:](self, "addRow:", v8);
  return v8;
}

- (id)addReadOnlyRowWithTitle:(id)a3 valueFormat:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v6, &v11);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addReadOnlyRowWithTitle:value:](self, "addReadOnlyRowWithTitle:value:", v7, v8));
  return v9;
}

- (id)addReadOnlyRowWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  MapsDebugReadOnlySubtitleRow *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugReadOnlySubtitleRow);
  -[MapsDebugTableRow setTitle:](v8, "setTitle:", v7);

  -[MapsDebugTableRow setSubtitle:](v8, "setSubtitle:", v6);
  -[MapsDebugTableSection addRow:](self, "addRow:", v8);
  return v8;
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 get:(id)a4 set:(id)a5
{
  return -[MapsDebugTableSection addCheckmarkRowsGroupWithContent:backingGeoConfigKey:get:set:](self, "addCheckmarkRowsGroupWithContent:backingGeoConfigKey:get:set:", a3, GEOConfigKey_Invalid[0], GEOConfigKey_Invalid[1], a4, a5);
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 backingGeoConfigKey:(id)a4 get:(id)a5 set:(id)a6
{
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  _BYTE v19[128];

  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDebugCheckmarkRowsGroup rowsGroupContainingRows:withContent:backingGeoConfigKey:get:set:](MapsDebugCheckmarkRowsGroup, "rowsGroupContainingRows:withContent:backingGeoConfigKey:get:set:", &v18, a3, *(_QWORD *)&a4.var0, a4.var1, a5, a6));
  v8 = v18;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[MapsDebugTableSection addRow:](self, "addRow:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 defaultsKey:(id)a4 checkedRowValueIfUnset:(id)a5 changeHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A37C90;
  v21[3] = &unk_1011C17C8;
  v22 = v10;
  v23 = v11;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A37CF8;
  v18[3] = &unk_1011E03C8;
  v19 = v22;
  v20 = v12;
  v13 = v12;
  v14 = v22;
  v15 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsDebugTableSection addCheckmarkRowsGroupWithContent:get:set:](self, "addCheckmarkRowsGroupWithContent:get:set:", a3, v21, v18));

  return v16;
}

- (id)addCheckmarkRowsGroupWithContent:(id)a3 defaultsKey:(id)a4 changeHandler:(id)a5
{
  return -[MapsDebugTableSection addCheckmarkRowsGroupWithContent:defaultsKey:checkedRowValueIfUnset:changeHandler:](self, "addCheckmarkRowsGroupWithContent:defaultsKey:checkedRowValueIfUnset:changeHandler:", a3, a4, 0, a5);
}

- (id)addCheckmarkRowsGroupForConfigKey:(id)a3 content:(id)a4
{
  return -[MapsDebugTableSection addCheckmarkRowsGroupForConfigKey:content:get:set:change:](self, "addCheckmarkRowsGroupForConfigKey:content:get:set:change:", *(_QWORD *)&a3.var0, a3.var1, a4, 0, 0, 0);
}

- (id)addCheckmarkRowsGroupForConfigKey:(id)a3 content:(id)a4 get:(id)a5 set:(id)a6 change:(id)a7
{
  void *var1;
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id location;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  _BYTE v49[128];

  var1 = a3.var1;
  v11 = *(_QWORD *)&a3.var0;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v30 = a7;
  v48 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100A380CC;
  v44[3] = &unk_1011E03F0;
  v16 = v14;
  v45 = v16;
  v46 = v11;
  v47 = var1;
  v29 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDebugCheckmarkRowsGroup rowsGroupContainingRows:withContent:get:set:](MapsDebugCheckmarkRowsGroup, "rowsGroupContainingRows:withContent:get:set:", &v48, v13, v44, 0));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v48;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v18);
        -[MapsDebugTableSection addRow:](self, "addRow:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v21));
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v19);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100A3810C;
  v36[3] = &unk_1011E0418;
  v22 = v15;
  v37 = v22;
  v38 = v11;
  v39 = var1;
  objc_msgSend(v17, "setSelectionChanged:", v36);
  objc_initWeak(&location, v17);
  v23 = &_dispatch_main_q;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100A38168;
  v31[3] = &unk_1011E0440;
  v24 = v30;
  v32 = v24;
  v25 = v16;
  v33 = v25;
  objc_copyWeak(&v34, &location);
  v26 = _GEOConfigAddBlockListenerForKey(v11, var1, &_dispatch_main_q, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  objc_setAssociatedObject(v17, &unk_1014D3CC8, v27, (void *)0x301);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&location);
  return v17;
}

- (id)addIndeterminateProgressIndicator
{
  MapsDebugActivityIndicatorRow *v3;

  v3 = objc_alloc_init(MapsDebugActivityIndicatorRow);
  -[MapsDebugTableSection addRow:](self, "addRow:", v3);
  return v3;
}

- (id)addMenuRowWithTitle:(id)a3 menu:(id)a4
{
  id v6;
  id v7;
  MapsDebugMenuRow *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(MapsDebugMenuRow);
  -[MapsDebugTableRow setTitle:](v8, "setTitle:", v7);

  -[MapsDebugMenuRow setMenu:](v8, "setMenu:", v6);
  -[MapsDebugTableRow setSelectionAction:](v8, "setSelectionAction:", 0);
  -[MapsDebugTableSection addRow:](self, "addRow:", v8);
  return v8;
}

- (MapsDebugValuesViewController)displayingViewController
{
  return (MapsDebugValuesViewController *)objc_loadWeakRetained((id *)&self->_displayingViewController);
}

- (void)setDisplayingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_displayingViewController, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)rows
{
  return self->_rows;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_displayingViewController);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_mutableRows, 0);
}

@end
