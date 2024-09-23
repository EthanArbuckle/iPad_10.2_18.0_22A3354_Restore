@implementation TUIStatefulElementBox

- (TUIStatefulElementBox)init
{
  TUIStatefulElementBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIStatefulElementBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    result->super.super._storage._data = TUIStatefulElementBoxStorageDataset | 1;
  return result;
}

- (void)setMenuContainer:(id)a3
{
  TUIMenuContainer *v5;
  TUIMenuContainer *menuContainer;
  TUIMenuContainer *v7;

  v5 = (TUIMenuContainer *)a3;
  menuContainer = self->_menuContainer;
  v7 = v5;
  if (menuContainer != v5)
  {
    -[TUIMenuContainer setParentModel:](menuContainer, "setParentModel:", 0);
    objc_storeStrong((id *)&self->_menuContainer, a3);
    -[TUIMenuContainer setParentModel:](self->_menuContainer, "setParentModel:", self);
  }

}

- (void)onContainedModelsChanged
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TUIStatefulElementBox;
  -[TUIContainerBox onContainedModelsChanged](&v2, "onContainedModelsChanged");
}

- (void)setStateMap:(id)a3
{
  NSDictionary *v5;
  NSDictionary *stateMap;
  NSDictionary *v7;
  NSDictionary *v8;
  _QWORD v9[5];

  v5 = (NSDictionary *)a3;
  stateMap = self->_stateMap;
  v8 = v5;
  if (stateMap != v5)
  {
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](stateMap, "enumerateKeysAndObjectsUsingBlock:", &stru_243088, v5);
    objc_storeStrong((id *)&self->_stateMap, a3);
    v7 = self->_stateMap;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_163A08;
    v9[3] = &unk_2413E0;
    v9[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v9);
    -[TUIStatefulElementBox onContainedModelsChanged](self, "onContainedModelsChanged");
  }

}

- (void)appendLayoutChildrenToArray:(id)a3
{
  id v4;
  NSDictionary *stateMap;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  stateMap = self->_stateMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_163AB8;
  v7[3] = &unk_2413E0;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](stateMap, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)appendContainedChildrenToArray:(id)a3
{
  id v4;
  NSDictionary *stateMap;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  stateMap = self->_stateMap;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_163B68;
  v7[3] = &unk_2430B0;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](stateMap, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIStatefulElementBoxLayout, a2);
}

- (void)setEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->super.super._flags + 6);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  v5 = (*(_DWORD *)&self->super.super._flags | ((unint64_t)(*((unsigned __int16 *)&self->super.super._flags + 2) | (v3 << 16)) << 32)) & 0xFFFFFFFDFFFFFFFFLL | v4;
  *(_DWORD *)&self->super.super._flags = self->super.super._flags;
  *((_BYTE *)&self->super.super._flags + 6) = v3;
  *((_WORD *)&self->super.super._flags + 2) = WORD2(v5);
}

- (BOOL)enabled
{
  return (*((unsigned __int16 *)&self->super.super._flags + 2) >> 1) & 1;
}

- (void)setPressedScale:(double)a3
{
  Storage *p_storage;
  float v4;
  uint64_t v5;
  float *DataForKey;

  p_storage = &self->super.super._storage;
  v4 = a3;
  if (v4 == 0.0)
  {
    v5 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xBu);
    if (!v5)
      return;
    DataForKey = (float *)v5;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0xBu);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)&self->super.super._storage, 0xBu, 4uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = v4;
}

- (double)pressedScale
{
  float *v2;

  v2 = (float *)TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0xBu);
  if (v2)
    return *v2;
  else
    return 0.0;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  float top;
  Storage *p_storage;
  float left;
  float bottom;
  float right;
  uint64_t v8;
  float *DataForKey;

  top = a3.top;
  p_storage = &self->super.super._storage;
  left = a3.left;
  bottom = a3.bottom;
  right = a3.right;
  if (TUIInsets32Equal(top, left, bottom, right, 0.0, 0.0, 0.0, 0.0))
  {
    v8 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)p_storage, 0x26u);
    if (!v8)
      return;
    DataForKey = (float *)v8;
    TUI::Util::PartialStruct::Storage::markAsDefault(&p_storage->_data, 0x26u);
  }
  else
  {
    DataForKey = (float *)TUI::Util::PartialStruct::Storage::allocateDataForKey((TUI::Util::PartialStruct::Storage::Header **)p_storage, 0x26u, 0x10uLL, 1);
    if (!DataForKey)
      return;
  }
  *DataForKey = top;
  DataForKey[1] = left;
  DataForKey[2] = bottom;
  DataForKey[3] = right;
}

- (UIEdgeInsets)touchInsets
{
  uint64_t v2;
  float *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v2 = TUI::Util::PartialStruct::Storage::dataForKey((TUI::Util::PartialStruct::Storage *)&self->super.super._storage, 0x26u);
  v3 = (float *)&TUIInsets32Zero;
  if (v2)
    v3 = (float *)v2;
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (NSDictionary)stateMap
{
  return self->_stateMap;
}

- (id)renderModelBlock
{
  return self->_renderModelBlock;
}

- (void)setRenderModelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TUIElementActionTriggerHandler)triggerHandler
{
  return self->_triggerHandler;
}

- (void)setTriggerHandler:(id)a3
{
  objc_storeStrong((id *)&self->_triggerHandler, a3);
}

- (TUIPointer)pointer
{
  return self->_pointer;
}

- (void)setPointer:(id)a3
{
  objc_storeStrong((id *)&self->_pointer, a3);
}

- (TUIFocusStyle)focusStyle
{
  return self->_focusStyle;
}

- (void)setFocusStyle:(id)a3
{
  objc_storeStrong((id *)&self->_focusStyle, a3);
}

- (BOOL)isEditableControl
{
  return self->_isEditableControl;
}

- (void)setIsEditableControl:(BOOL)a3
{
  self->_isEditableControl = a3;
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_focusStyle, 0);
  objc_storeStrong((id *)&self->_pointer, 0);
  objc_storeStrong((id *)&self->_triggerHandler, 0);
  objc_storeStrong(&self->_renderModelBlock, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
}

@end
