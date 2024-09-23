@implementation PKPassTileState

+ (id)_createForDictionary:(id)a3 withTileType:(int64_t)a4
{
  return +[PKPassTileState _createForDictionary:withTileType:isRoot:]((uint64_t)a1, a3, a4, 1);
}

+ (_QWORD)_createForDictionary:(uint64_t)a3 withTileType:(int)a4 isRoot:
{
  id v6;
  void *v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v17;

  v6 = a2;
  objc_opt_self();
  if (!v6)
    goto LABEL_10;
  v17 = 0;
  if (+[PKPassTileMetadata isGroupType:](PKPassTileMetadata, "isGroupType:", a3))
  {
    v17 = 3;
    goto LABEL_5;
  }
  objc_msgSend(v6, "PKStringForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = PKPassTileStateTypeFromString(v7, &v17);

  if (!v8)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_13;
  }
LABEL_5:
  v9 = +[PKPassTileState _createWithType:](PKPassTileState, "_createWithType:");
  if (v9
    && (+[PKPassTileStateMetadata _createForType:dictionary:](PKPassTileStateMetadata, "_createForType:dictionary:", a3, v6), v10 = objc_claimAutoreleasedReturnValue(), v11 = (void *)v9[4], v9[4] = v10, v11, objc_msgSend(v9, "_setUpWithDictionary:", v6)))
  {
    if (a4)
    {
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("actionState"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[PKPassTileState _createForDictionary:withTileType:isRoot:](PKPassTileState, v12, a3, 0);
      v14 = (void *)v9[5];
      v9[5] = v13;

    }
    v15 = v9;
  }
  else
  {
    v15 = 0;
  }

LABEL_13:
  return v15;
}

+ (id)_createWithType:(int64_t)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  if ((unint64_t)a3 >= 5)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v4 = objc_alloc(*off_1E2AC3AA0[a3]);
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v9.receiver = v4;
  v9.super_class = (Class)PKPassTileState;
  v6 = objc_msgSendSuper2(&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *((_QWORD *)v6 + 3) = a3;
    *((_BYTE *)v6 + 18) = 0;
  }
LABEL_7:

  return v7;
}

+ (id)createResolvedStateWithType:(int64_t)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  _BYTE *v7;
  objc_super v9;

  if ((unint64_t)a3 >= 5)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v4 = objc_alloc(*off_1E2AC3AA0[a3]);
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v9.receiver = v4;
  v9.super_class = (Class)PKPassTileState;
  v6 = objc_msgSendSuper2(&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *((_QWORD *)v6 + 3) = a3;
    v6[18] = 1;
  }
LABEL_7:

  v7[16] = 1;
  return v7;
}

- (PKPassTileState)init
{

  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  PKPassTileImage *v9;
  PKPassTileImage *icon;
  NSArray *v11;
  NSArray *actionDictionaries;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "PKNumberForKey:", CFSTR("enabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 1;
  self->_enabled = v7;
  self->_selected = objc_msgSend(v4, "PKBoolForKey:", CFSTR("selected"));
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("icon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = +[PKPassTileImage _createForDictionary:](PKPassTileImage, "_createForDictionary:", v8);
    icon = self->_icon;
    self->_icon = v9;

  }
  objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("actions"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actionDictionaries = self->_actionDictionaries;
  self->_actionDictionaries = v11;

  if (!self->_actionDictionaries)
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("action"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v18[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v16 = self->_actionDictionaries;
      self->_actionDictionaries = v15;

    }
  }

  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = +[PKPassTileState _createWithType:](PKPassTileState, "_createWithType:", self->_type);
  objc_storeStrong(v4 + 4, self->_metadata);
  *((_BYTE *)v4 + 16) = self->_enabled;
  *((_BYTE *)v4 + 17) = self->_selected;
  objc_storeStrong(v4 + 5, self->_actionState);
  objc_storeStrong(v4 + 6, self->_icon);
  objc_storeStrong(v4 + 1, self->_actions);
  objc_storeStrong(v4 + 7, self->_actionDictionaries);
  *((_BYTE *)v4 + 18) = self->_resolved;
  return v4;
}

- (id)createResolvedStateWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSArray *actionDictionaries;
  uint64_t v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if (self->_resolved)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileState %@ attempting double resolution."), objc_opt_class());
  v8 = +[PKPassTileState _createWithType:](PKPassTileState, "_createWithType:", self->_type);
  objc_storeStrong(v8 + 4, self->_metadata);
  *((_BYTE *)v8 + 16) = self->_enabled;
  *((_BYTE *)v8 + 17) = self->_selected;
  v9 = -[PKPassTileState createResolvedStateWithBundle:privateBundle:](self->_actionState, "createResolvedStateWithBundle:privateBundle:", v6, v7);
  v10 = v8[5];
  v8[5] = v9;

  v11 = -[PKPassTileImage createResolvedImageWithBundle:privateBundle:](self->_icon, "createResolvedImageWithBundle:privateBundle:", v6, v7);
  v12 = v8[6];
  v8[6] = v11;

  actionDictionaries = self->_actionDictionaries;
  if (actionDictionaries)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PKPassTileState_createResolvedStateWithBundle_privateBundle___block_invoke;
    v17[3] = &unk_1E2AC3A80;
    v18 = v6;
    v14 = -[NSArray pk_createArrayBySafelyApplyingBlock:](actionDictionaries, "pk_createArrayBySafelyApplyingBlock:", v17);
    v15 = v8[1];
    v8[1] = (id)v14;

  }
  *((_BYTE *)v8 + 18) = 1;

  return v8;
}

PKPaymentPassAction *__63__PKPassTileState_createResolvedStateWithBundle_privateBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKPaymentPassAction *v4;

  v3 = a2;
  v4 = -[PKPaymentPassAction initWithDictionary:bundle:]([PKPaymentPassAction alloc], "initWithDictionary:bundle:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;
  PKPassTileState *v8;
  PKPassTileState *v9;
  uint64_t v10;
  PKPassTileStateMetadata *metadata;
  uint64_t v12;
  PKPassTileState *actionState;
  uint64_t v14;
  PKPassTileImage *icon;
  uint64_t v16;
  NSArray *actions;
  void *v18;
  PKPassTileState *v19;
  unint64_t v21;
  objc_super v22;

  v4 = a3;
  v21 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKPassTileStateTypeFromString(v5, &v21);

  if ((v6 & 1) != 0 && v21 <= 4 && objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self
      && (v7 = v21,
          v22.receiver = self,
          v22.super_class = (Class)PKPassTileState,
          (v8 = -[PKPassTileState init](&v22, sel_init)) != 0))
    {
      v9 = v8;
      v8->_type = v7;
      v8->_resolved = 1;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
      v10 = objc_claimAutoreleasedReturnValue();
      metadata = v9->_metadata;
      v9->_metadata = (PKPassTileStateMetadata *)v10;

      v9->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
      v9->_selected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selected"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionState"));
      v12 = objc_claimAutoreleasedReturnValue();
      actionState = v9->_actionState;
      v9->_actionState = (PKPassTileState *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
      v14 = objc_claimAutoreleasedReturnValue();
      icon = v9->_icon;
      v9->_icon = (PKPassTileImage *)v14;

      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
      v16 = objc_claimAutoreleasedReturnValue();
      actions = v9->_actions;
      v9->_actions = (NSArray *)v16;

    }
    else
    {
      v9 = 0;
    }
    self = v9;
    v19 = self;
  }
  else
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPassTileStateDecoder"), 0, 0);
    objc_msgSend(v4, "failWithError:", v18);

    v19 = 0;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t type;
  __CFString *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->_resolved)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileState %@ attempting unresolved XPC transfer."), objc_opt_class());
    v4 = v7;
  }
  type = self->_type;
  if (type > 4)
    v6 = 0;
  else
    v6 = off_1E2AC3AC8[type];
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("type"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_selected, CFSTR("selected"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_actionState, CFSTR("actionState"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_actions, CFSTR("actions"));

}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  PKPassTileStateMetadata *metadata;
  void *v8;
  PKPassTileImage *icon;
  NSArray *v10;
  NSArray *actionDictionaries;
  PKPassTileState *v12;
  PKPassTileState *actionState;
  BOOL v14;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (v4[18] || self->_resolved || *((_QWORD *)v4 + 3) != self->_type)
    goto LABEL_23;
  v6 = (void *)*((_QWORD *)v4 + 4);
  metadata = self->_metadata;
  if (v6)
  {
    if (!metadata || (objc_msgSend(v6, "isEqualToUnresolvedMetadata:") & 1) == 0)
      goto LABEL_23;
  }
  else if (metadata)
  {
    goto LABEL_23;
  }
  if (v5[16] != self->_enabled || v5[17] != self->_selected)
    goto LABEL_23;
  v8 = (void *)*((_QWORD *)v5 + 6);
  icon = self->_icon;
  if (v8)
  {
    if (!icon || (objc_msgSend(v8, "isEqualToUnresolvedImage:") & 1) == 0)
      goto LABEL_23;
  }
  else if (icon)
  {
    goto LABEL_23;
  }
  v10 = (NSArray *)*((_QWORD *)v5 + 7);
  actionDictionaries = self->_actionDictionaries;
  if (!v10 || !actionDictionaries)
  {
    if (v10 == actionDictionaries)
      goto LABEL_19;
LABEL_23:
    v14 = 0;
    goto LABEL_24;
  }
  if ((-[NSArray isEqual:](v10, "isEqual:") & 1) == 0)
    goto LABEL_23;
LABEL_19:
  v12 = (PKPassTileState *)*((_QWORD *)v5 + 5);
  actionState = self->_actionState;
  if (v12 && actionState)
    v14 = -[PKPassTileState isEqualToUnresolvedState:](v12, "isEqualToUnresolvedState:");
  else
    v14 = v12 == actionState;
LABEL_24:

  return v14;
}

- (PKPaymentPassAction)action
{
  void *actions;

  actions = self->_actions;
  if (actions)
  {
    objc_msgSend(actions, "firstObject");
    actions = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PKPaymentPassAction *)actions;
}

- (void)setActions:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_resolved)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_actions, a3);
    v5 = v6;
  }

}

- (PKPassTileStateDefault)stateTypeDefault
{
  if (self->_type)
    self = 0;
  return (PKPassTileStateDefault *)self;
}

- (PKPassTileStateDefaultV2)stateTypeDefaultV2
{
  if (self->_type != 1)
    self = 0;
  return (PKPassTileStateDefaultV2 *)self;
}

- (PKPassTileStateCheckIn)stateTypeCheckIn
{
  if (self->_type != 2)
    self = 0;
  return (PKPassTileStateCheckIn *)self;
}

- (PKPassTileStateGroup)stateTypeGroup
{
  if (self->_type != 3)
    self = 0;
  return (PKPassTileStateGroup *)self;
}

- (PKPassTileStateHostedView)stateTypeHostedView
{
  if (self->_type != 4)
    self = 0;
  return (PKPassTileStateHostedView *)self;
}

- (int64_t)type
{
  return self->_type;
}

- (PKPassTileStateMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (PKPassTileState)actionState
{
  return self->_actionState;
}

- (void)setActionState:(id)a3
{
  objc_storeStrong((id *)&self->_actionState, a3);
}

- (PKPassTileImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)isFullBleed
{
  return self->_fullBleed;
}

- (void)setFullBleed:(BOOL)a3
{
  self->_fullBleed = a3;
}

- (NSArray)actionDictionaries
{
  return self->_actionDictionaries;
}

- (void)setActionDictionaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDictionaries, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionState, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
