@implementation UICellConfigurationState

- (id)_initWithState:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellConfigurationState;
  v5 = -[UIViewConfigurationState _initWithState:](&v7, sel__initWithState_, v4);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5[10] = v4[10];
  }

  return v5;
}

- (UICellConfigurationDropState)cellDropState
{
  return (unint64_t)(*(_WORD *)&self->_cellStateFlags >> 6);
}

- (BOOL)isReordering
{
  return (*(_WORD *)&self->_cellStateFlags >> 3) & 1;
}

- (BOOL)isSwiped
{
  return (*(_WORD *)&self->_cellStateFlags >> 2) & 1;
}

- (BOOL)isEditing
{
  return *(_WORD *)&self->_cellStateFlags & 1;
}

- (BOOL)isExpanded
{
  return (*(_WORD *)&self->_cellStateFlags >> 1) & 1;
}

- (UICellConfigurationDragState)cellDragState
{
  return ((unint64_t)*(_WORD *)&self->_cellStateFlags >> 4) & 3;
}

- (BOOL)_usesAnyPlainListStyle
{
  return HIBYTE(*(_WORD *)&self->_cellStateFlags) & 1;
}

- (void)setCellDropState:(UICellConfigurationDropState)cellDropState
{
  if (*(_WORD *)&self->_cellStateFlags >> 6 != cellDropState)
  {
    ++self->super._mutations;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFF3F | ((cellDropState & 3) << 6);
  }
}

- (void)setSwiped:(BOOL)swiped
{
  __int16 v3;

  if (((((*(_WORD *)&self->_cellStateFlags & 4) == 0) ^ swiped) & 1) == 0)
  {
    ++self->super._mutations;
    if (swiped)
      v3 = 4;
    else
      v3 = 0;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFFB | v3;
  }
}

- (void)setReordering:(BOOL)reordering
{
  __int16 v3;

  if (((((*(_WORD *)&self->_cellStateFlags & 8) == 0) ^ reordering) & 1) == 0)
  {
    ++self->super._mutations;
    if (reordering)
      v3 = 8;
    else
      v3 = 0;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFF7 | v3;
  }
}

- (void)setEditing:(BOOL)editing
{
  if (((((*(_WORD *)&self->_cellStateFlags & 1) == 0) ^ editing) & 1) == 0)
  {
    ++self->super._mutations;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFFE | editing;
  }
}

- (void)_setUsesAnyPlainListStyle:(BOOL)a3
{
  __int16 v3;

  if (((((*(_WORD *)&self->_cellStateFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    ++self->super._mutations;
    if (a3)
      v3 = 256;
    else
      v3 = 0;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFEFF | v3;
  }
}

- (void)setCellDragState:(UICellConfigurationDragState)cellDragState
{
  if ((((unint64_t)*(_WORD *)&self->_cellStateFlags >> 4) & 3) != cellDragState)
  {
    ++self->super._mutations;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFCF | (16 * (cellDragState & 3));
  }
}

- (void)setExpanded:(BOOL)expanded
{
  __int16 v3;

  if (((((*(_WORD *)&self->_cellStateFlags & 2) == 0) ^ expanded) & 1) == 0)
  {
    ++self->super._mutations;
    if (expanded)
      v3 = 2;
    else
      v3 = 0;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFFFD | v3;
  }
}

+ (UICellConfigurationState)_readonlyCellState:(uint64_t)a1
{
  id v2;
  UICellConfigurationState *v3;
  char isKindOfClass;
  UICellConfigurationState *v5;
  UICellConfigurationState *v6;
  UICellConfigurationState *v7;
  void *v9;

  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = (UICellConfigurationState *)v2;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = [UICellConfigurationState alloc];
      v6 = v5;
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(v2, "traitCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[UIViewConfigurationState initWithTraitCollection:](v6, "initWithTraitCollection:", v9);

        goto LABEL_10;
      }
      v3 = -[UICellConfigurationState _initWithState:](v5, "_initWithState:", v2);
    }
  }
  else
  {
    if (qword_1ECD82298 != -1)
      dispatch_once(&qword_1ECD82298, &__block_literal_global_628);
    v3 = (UICellConfigurationState *)(id)_MergedGlobals_1305;
  }
  v7 = v3;
LABEL_10:

  return v7;
}

- (unint64_t)_viewConfigurationState
{
  unint64_t v3;
  $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags;
  unint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UICellConfigurationState;
  v3 = -[UIViewConfigurationState _viewConfigurationState](&v10, sel__viewConfigurationState);
  cellStateFlags = self->_cellStateFlags;
  v5 = v3 | (16 * *(_DWORD *)&cellStateFlags) & 0x10 | (*(_DWORD *)&cellStateFlags << 6) & 0x80 | (unint64_t)((16 * *(_DWORD *)&cellStateFlags) & 0x40) | (*(_DWORD *)&cellStateFlags << 6) & 0x200;
  v6 = *(_BYTE *)&cellStateFlags >> 6;
  v7 = v5 | 0x20;
  if (v6 == 1)
    v5 |= 0x100uLL;
  if (v6 == 2)
    v8 = v7;
  else
    v8 = v5;
  return v8 | (*(_WORD *)&self->_cellStateFlags << 7) & 0x8000;
}

+ (UICellConfigurationState)_readonlyCellStateFromViewConfigurationState:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  UICellConfigurationState *v8;
  UICellConfigurationState *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_opt_self();
  if (a2)
  {
    v4 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
    if (!_readonlyCellStateFromViewConfigurationState__cachedStates)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      v6 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
      _readonlyCellStateFromViewConfigurationState__cachedStates = (uint64_t)v5;

      v4 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v8 = (UICellConfigurationState *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = [UICellConfigurationState alloc];
      +[UITraitCollection _emptyTraitCollection]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[UIViewConfigurationState initWithTraitCollection:](v9, "initWithTraitCollection:", v10);

      -[UICellConfigurationState _configureWithViewConfigurationState:](v8, "_configureWithViewConfigurationState:", a2);
      v11 = (void *)_readonlyCellStateFromViewConfigurationState__cachedStates;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v8, v12);

    }
  }
  else
  {
    +[UICellConfigurationState _readonlyCellState:](v3, 0);
    v8 = (UICellConfigurationState *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

void __47__UICellConfigurationState__readonlyCellState___block_invoke()
{
  UICellConfigurationState *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [UICellConfigurationState alloc];
  +[UITraitCollection _emptyTraitCollection]();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UIViewConfigurationState initWithTraitCollection:](v0, "initWithTraitCollection:", v3);
  v2 = (void *)_MergedGlobals_1305;
  _MergedGlobals_1305 = v1;

}

- (void)_configureWithViewConfigurationState:(unint64_t)a3
{
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UICellConfigurationState;
  -[UIViewConfigurationState _configureWithViewConfigurationState:](&v6, sel__configureWithViewConfigurationState_);
  -[UICellConfigurationState setEditing:](self, "setEditing:", (a3 >> 4) & 1);
  -[UICellConfigurationState setSwiped:](self, "setSwiped:", (a3 >> 6) & 1);
  -[UICellConfigurationState setExpanded:](self, "setExpanded:", (a3 >> 7) & 1);
  -[UICellConfigurationState setReordering:](self, "setReordering:", (a3 >> 9) & 1);
  -[UICellConfigurationState setCellDragState:](self, "setCellDragState:", 0);
  if ((a3 & 0x20) != 0)
    v5 = 2;
  else
    v5 = (a3 >> 8) & 1;
  -[UICellConfigurationState setCellDropState:](self, "setCellDropState:", v5);
  -[UICellConfigurationState _setUsesAnyPlainListStyle:](self, "_setUsesAnyPlainListStyle:", (a3 >> 15) & 1);
}

- (BOOL)isEqual:(id)a3
{
  UICellConfigurationState *v4;
  unsigned __int16 *v5;
  BOOL v6;
  objc_super v8;

  v4 = (UICellConfigurationState *)a3;
  v5 = (unsigned __int16 *)v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v8.receiver = self,
          v8.super_class = (Class)UICellConfigurationState,
          -[UIViewConfigurationState isEqual:](&v8, sel_isEqual_, v5))
      && ((v5[20] ^ *(_WORD *)&self->_cellStateFlags) & 0x3FF) == 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellConfigurationState)initWithCoder:(id)a3
{
  id v4;
  UICellConfigurationState *v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UICellConfigurationState;
  v5 = -[UIViewConfigurationState initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    *(_WORD *)&v5->_cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("editing"));
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("expanded")))
      v6 = 2;
    else
      v6 = 0;
    *(_WORD *)&v5->_cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFFD | v6;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("swiped")))
      v7 = 4;
    else
      v7 = 0;
    *(_WORD *)&v5->_cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFFB | v7;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("reordering")))
      v8 = 8;
    else
      v8 = 0;
    *(_WORD *)&v5->_cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFFF7 | v8;
    *(_WORD *)&v5->_cellStateFlags = (16 * (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellDragState")) & 3)) | *(_WORD *)&v5->_cellStateFlags & 0xFFCF;
    *(_WORD *)&v5->_cellStateFlags = ((objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellDropState")) & 3) << 6) | *(_WORD *)&v5->_cellStateFlags & 0xFF3F;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesAnyPlainListStyle")))
      v9 = 256;
    else
      v9 = 0;
    *(_WORD *)&v5->_cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFEFF | v9;
    if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inMultiSelectGroup")))
      v10 = 512;
    else
      v10 = 0;
    *(_WORD *)&v5->_cellStateFlags = *(_WORD *)&v5->_cellStateFlags & 0xFDFF | v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UICellConfigurationState;
  v4 = a3;
  -[UIViewConfigurationState encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", *(_WORD *)&self->_cellStateFlags & 1, CFSTR("editing"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", (*(_WORD *)&self->_cellStateFlags >> 1) & 1, CFSTR("expanded"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_WORD *)&self->_cellStateFlags >> 2) & 1, CFSTR("swiped"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_WORD *)&self->_cellStateFlags >> 3) & 1, CFSTR("reordering"));
  objc_msgSend(v4, "encodeInteger:forKey:", ((unint64_t)*(_WORD *)&self->_cellStateFlags >> 4) & 3, CFSTR("cellDragState"));
  objc_msgSend(v4, "encodeInteger:forKey:", *(_WORD *)&self->_cellStateFlags >> 6, CFSTR("cellDropState"));
  objc_msgSend(v4, "encodeBool:forKey:", HIBYTE(*(_WORD *)&self->_cellStateFlags) & 1, CFSTR("usesAnyPlainListStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_WORD *)&self->_cellStateFlags >> 9) & 1, CFSTR("inMultiSelectGroup"));

}

- (unint64_t)hash
{
  uint64_t v2;
  objc_super v4;

  v2 = *(_WORD *)&self->_cellStateFlags & 0x3FF;
  v4.receiver = self;
  v4.super_class = (Class)UICellConfigurationState;
  return -[UIViewConfigurationState hash](&v4, sel_hash) ^ v2;
}

- (void)_appendPropertiesForDescription:(id)a3
{
  id v4;
  $A3BE8D2F9F885AB89DA145E2B19EE74D cellStateFlags;
  int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UICellConfigurationState;
  -[UIViewConfigurationState _appendPropertiesForDescription:](&v10, sel__appendPropertiesForDescription_, v4);
  cellStateFlags = self->_cellStateFlags;
  if ((*(_BYTE *)&cellStateFlags & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", CFSTR("Editing"));
    cellStateFlags = self->_cellStateFlags;
    if ((*(_BYTE *)&cellStateFlags & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&cellStateFlags & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&cellStateFlags & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addObject:", CFSTR("Expanded"));
  cellStateFlags = self->_cellStateFlags;
  if ((*(_BYTE *)&cellStateFlags & 4) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&cellStateFlags & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v4, "addObject:", CFSTR("Swiped"));
  cellStateFlags = self->_cellStateFlags;
  if ((*(_BYTE *)&cellStateFlags & 8) != 0)
  {
LABEL_5:
    objc_msgSend(v4, "addObject:", CFSTR("Reordering"));
    cellStateFlags = self->_cellStateFlags;
  }
LABEL_6:
  v6 = (*(unsigned int *)&cellStateFlags >> 4) & 3;
  if (v6 == 1)
  {
    v7 = CFSTR("cellDragState = Lifting");
  }
  else
  {
    if (v6 != 2)
      goto LABEL_15;
    v7 = CFSTR("cellDragState = Dragging");
  }
  objc_msgSend(v4, "addObject:", v7);
  *(_WORD *)&cellStateFlags = self->_cellStateFlags;
LABEL_15:
  v8 = *(_BYTE *)&cellStateFlags >> 6;
  if (v8 == 1)
  {
    v9 = CFSTR("cellDropState = Not Targeted");
    goto LABEL_19;
  }
  if (v8 == 2)
  {
    v9 = CFSTR("cellDropState = Targeted");
LABEL_19:
    objc_msgSend(v4, "addObject:", v9);
  }

}

- (void)_setInMultiSelectGroup:(BOOL)a3
{
  __int16 v3;

  if (((((*(_WORD *)&self->_cellStateFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    ++self->super._mutations;
    if (a3)
      v3 = 512;
    else
      v3 = 0;
    *(_WORD *)&self->_cellStateFlags = *(_WORD *)&self->_cellStateFlags & 0xFDFF | v3;
  }
}

- (BOOL)_inMultiSelectGroup
{
  return (*(_WORD *)&self->_cellStateFlags >> 9) & 1;
}

@end
