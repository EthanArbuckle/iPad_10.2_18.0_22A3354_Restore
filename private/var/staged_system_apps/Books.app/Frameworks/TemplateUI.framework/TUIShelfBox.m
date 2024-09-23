@implementation TUIShelfBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIShelfLayout, a2);
}

- (void)onContainedModelsChanged
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  TUIShelfBox *v9;
  id v10;
  void *v11;
  TUIShelfBox *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  int *v16;
  unsigned __int8 v17;
  unsigned int v18;
  NSMutableArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = objc_opt_new(NSMutableArray);
  -[TUIContainerBox appendLayoutChildrenToArray:](self, "appendLayoutChildrenToArray:", v3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v7);
        v9 = v8;
        while (1)
        {
          if ((objc_opt_respondsToSelector(v9, "role") & 1) != 0)
          {
            v10 = TUIProtocolCast(&OBJC_PROTOCOL___TUIModelWithRole, v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
            if (v11)
              break;
          }
          v12 = (TUIShelfBox *)objc_claimAutoreleasedReturnValue(-[TUIBox parentModel](v9, "parentModel"));

          v13 = 0;
          if (v12)
          {
            v9 = v12;
            if (v12 != self)
              continue;
          }
          goto LABEL_13;
        }
        v14 = v11;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "role"));

        v12 = v9;
LABEL_13:
        v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("content"));
        v16 = &OBJC_IVAR___TUIShelfBox__content;
        if ((v15 & 1) != 0
          || (v17 = objc_msgSend(v13, "isEqualToString:", CFSTR("content-background")),
              v16 = &OBJC_IVAR___TUIShelfBox__contentBackground,
              (v17 & 1) != 0)
          || (v18 = objc_msgSend(v13, "isEqualToString:", CFSTR("background")),
              v16 = &OBJC_IVAR___TUIShelfBox__background,
              v18))
        {
          objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v16), v8);
        }

        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)contentWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_contentWidth.value;
}

- (void)setContentWidth:(id *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_contentWidth.value = a3;
  *(_QWORD *)&self->_contentWidth.max = v3;
}

- (TUIModelLayoutable)content
{
  return self->_content;
}

- (TUIModelLayoutable)contentBackground
{
  return self->_contentBackground;
}

- (TUIModelLayoutable)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_contentBackground, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
