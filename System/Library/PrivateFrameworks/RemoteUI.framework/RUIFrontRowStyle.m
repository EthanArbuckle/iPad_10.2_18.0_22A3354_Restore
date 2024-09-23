@implementation RUIFrontRowStyle

- (RUIFrontRowStyle)init
{
  RUIFrontRowStyle *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RUIFrontRowStyle;
  v2 = -[RUIStyle init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setBackgroundColor:](v2, "setBackgroundColor:", v4);

    -[RUIStyle setRadioGroupSelectedColor:](v2, "setRadioGroupSelectedColor:", v3);
    -[RUIStyle setSelectPageDetailTextColor:](v2, "setSelectPageDetailTextColor:", v3);
    -[RUIStyle setButtonRowTextColor:](v2, "setButtonRowTextColor:", v3);
    -[RUIStyle setLabelRowTextColor:](v2, "setLabelRowTextColor:", v3);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_264);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIStyle setFocusedRowTextColor:](v2, "setFocusedRowTextColor:", v5);

    -[RUIStyle setLabelRowTextAlignment:](v2, "setLabelRowTextAlignment:", 1);
    -[RUIStyle setFooterLabelAlignment:](v2, "setFooterLabelAlignment:", 1);
    -[RUIStyle setTitleLabelTextColor:](v2, "setTitleLabelTextColor:", v3);
    -[RUIStyle setFooterLabelTextColor:](v2, "setFooterLabelTextColor:", v3);
    -[RUIStyle setHeaderLabelAlignment:](v2, "setHeaderLabelAlignment:", 1);
    -[RUIStyle setHeaderLabelTextColor:](v2, "setHeaderLabelTextColor:", v3);

  }
  return v2;
}

id __24__RUIFrontRowStyle_init__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)tableViewStyle
{
  return 1;
}

- (void)applyToObjectModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RUIFrontRowStyle;
  -[RUIStyle applyToObjectModel:](&v15, sel_applyToObjectModel_, v4);
  objc_msgSend(v4, "allPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v10, "setShowsTitlesAsHeaderViews:", 1);
        objc_msgSend(v10, "setCustomMargin:", 550.0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

@end
