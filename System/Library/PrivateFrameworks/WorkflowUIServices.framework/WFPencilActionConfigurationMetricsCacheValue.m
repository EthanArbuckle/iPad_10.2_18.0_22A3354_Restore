@implementation WFPencilActionConfigurationMetricsCacheValue

- (WFPencilActionConfigurationMetricsCacheValue)initWithValue:(id *)a3
{
  char *v4;
  WFPencilActionConfigurationMetricsCacheValue *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFPencilActionConfigurationMetricsCacheValue;
  v4 = -[WFPencilActionConfigurationMetricsCacheValue init](&v16, sel_init);
  v5 = (WFPencilActionConfigurationMetricsCacheValue *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0;
    v7 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    v8 = *(_OWORD *)&a3->var2.var3.top;
    v9 = *(_OWORD *)&a3->var2.var3.bottom;
    v10 = *(_OWORD *)&a3->var3.var0;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->var3.var2.top;
    *(_OWORD *)(v4 + 88) = v10;
    *(_OWORD *)(v4 + 72) = v9;
    *(_OWORD *)(v4 + 56) = v8;
    v11 = *(_OWORD *)&a3->var3.var2.bottom;
    v12 = *(_OWORD *)&a3->var4.var0;
    v13 = *(_OWORD *)&a3->var4.var2.top;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)&a3->var4.var2.bottom;
    *(_OWORD *)(v4 + 152) = v13;
    *(_OWORD *)(v4 + 136) = v12;
    *(_OWORD *)(v4 + 120) = v11;
    v14 = v4;
  }

  return v5;
}

- ($230CD50FFBDA44837086E7C5FCE6954E)value
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self->var3.var2.trailing;
  v4 = *(_OWORD *)&self->var4.var2.leading;
  *(_OWORD *)&retstr->var4.var0 = *(_OWORD *)&self->var4.var1;
  *(_OWORD *)&retstr->var4.var2.top = v4;
  *(_OWORD *)&retstr->var4.var2.bottom = *(_OWORD *)&self->var4.var2.trailing;
  v5 = *(_OWORD *)&self->var2.var3.leading;
  v6 = *(_OWORD *)&self->var3.var1;
  *(_OWORD *)&retstr->var2.var3.bottom = *(_OWORD *)&self->var2.var3.trailing;
  *(_OWORD *)&retstr->var3.var0 = v6;
  *(_OWORD *)&retstr->var3.var2.top = *(_OWORD *)&self->var3.var2.leading;
  *(_OWORD *)&retstr->var3.var2.bottom = v3;
  v7 = *(_OWORD *)&self->var2.var0;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var0 = self->var1;
  *(_OWORD *)&retstr->var1.var1 = v7;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self->var2.var2;
  *(_OWORD *)&retstr->var2.var3.top = v5;
  return self;
}

- (void)setValue:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_value.grid.chicletWidth = *(_OWORD *)&a3->var2.var1;
  *(_OWORD *)&self->_value.sidebar.leadingPadding = v4;
  *(_OWORD *)&self->_value.interfaceOrientation = v3;
  v5 = *(_OWORD *)&a3->var2.var3.top;
  v6 = *(_OWORD *)&a3->var2.var3.bottom;
  v7 = *(_OWORD *)&a3->var3.var0;
  *(_OWORD *)&self->_value.sheet.insets.top = *(_OWORD *)&a3->var3.var2.top;
  *(_OWORD *)&self->_value.sheet.grabberTopSpacing = v7;
  *(_OWORD *)&self->_value.grid.insets.bottom = v6;
  *(_OWORD *)&self->_value.grid.insets.top = v5;
  v8 = *(_OWORD *)&a3->var3.var2.bottom;
  v9 = *(_OWORD *)&a3->var4.var0;
  v10 = *(_OWORD *)&a3->var4.var2.top;
  *(_OWORD *)&self->_value.searchBar.containerInsets.bottom = *(_OWORD *)&a3->var4.var2.bottom;
  *(_OWORD *)&self->_value.searchBar.containerInsets.top = v10;
  *(_OWORD *)&self->_value.searchBar.barWidth = v9;
  *(_OWORD *)&self->_value.sheet.insets.bottom = v8;
}

@end
