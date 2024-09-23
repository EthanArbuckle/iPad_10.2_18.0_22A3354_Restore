@implementation UIKeyCommand

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = *((int *)self + 52);
  v4 = -[NSString hash](self->_input, "hash") ^ v3;
  return v4 ^ -[NSIndexSet hash](self->_keyCodes, "hash") ^ *((int *)self + 54);
}

+ (UIKeyCommand)keyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags action:(SEL)action
{
  NSString *v8;
  void *v9;

  v8 = input;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", v8, modifierFlags, 0, action, 0, 0, -1);

  return (UIKeyCommand *)v9;
}

- (void)_setEnumerationPriority:(int64_t)a3
{
  self->__enumerationPriority = a3;
}

+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 upAction:(SEL)a6 discoverabilityTitle:(id)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a7;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", v13, a4, 0, a5, a6, v12, -1);

  return (UIKeyCommand *)v14;
}

- (UIKeyCommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 input:(id)a7 modifierFlags:(int64_t)a8 propertyList:(id)a9 alternates:(id)a10 discoverabilityTitle:(id)a11 attributes:(unint64_t)a12 state:(int64_t)a13
{
  int v13;
  id v19;
  UIKeyCommand *v20;
  uint64_t v21;
  NSString *input;
  uint64_t v23;
  NSString *layoutAwareInput;
  uint64_t v25;
  void *v26;
  id *p_keyCodes;
  uint64_t v28;
  NSIndexSet *layoutAwareKeyCodes;
  uint64_t v30;
  BKSHIDEventDeferringEnvironment *eventDeferringEnvironment;
  uint64_t v32;
  void *v33;
  char v34;
  char v35;
  char v36;
  NSString *layoutAwareDisplayInputOverride;
  objc_super v39;

  v13 = a8;
  v19 = a7;
  v39.receiver = self;
  v39.super_class = (Class)UIKeyCommand;
  v20 = -[UICommand initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:](&v39, sel_initWithTitle_image_imageName_action_propertyList_alternates_discoverabilityTitle_attributes_state_, a3, a4, a5, a6, a9, a10, a11, a12, a13);
  if (v20)
  {
    v21 = objc_msgSend(v19, "copy");
    input = v20->_input;
    v20->_input = (NSString *)v21;

    *((_DWORD *)v20 + 52) = v13;
    v23 = -[NSString copy](v20->_input, "copy");
    layoutAwareInput = v20->_layoutAwareInput;
    v20->_layoutAwareInput = (NSString *)v23;

    *((_DWORD *)v20 + 53) = *((_DWORD *)v20 + 52);
    v25 = _UIHIDUsageFromSpecialKeyInput((uint64_t)v19);
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    p_keyCodes = (id *)&v20->_keyCodes;
    objc_storeStrong((id *)&v20->_keyCodes, v26);
    if (v25)

    v28 = objc_msgSend(*p_keyCodes, "copy");
    layoutAwareKeyCodes = v20->_layoutAwareKeyCodes;
    v20->_layoutAwareKeyCodes = (NSIndexSet *)v28;

    v20->_upAction = 0;
    v20->_repeatable = 1;
    *((_DWORD *)v20 + 54) = -1;
    objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
    v30 = objc_claimAutoreleasedReturnValue();
    eventDeferringEnvironment = v20->__eventDeferringEnvironment;
    v20->__eventDeferringEnvironment = (BKSHIDEventDeferringEnvironment *)v30;

    v20->__enumerationPriority = -[UIKeyCommand _defaultEnumerationPriority](v20, "_defaultEnumerationPriority");
    *((_BYTE *)v20 + 221) &= ~2u;
    v32 = (uint64_t)v20->_input;
    if (v32)
    {
      if (!*p_keyCodes)
        *((_BYTE *)v20 + 221) = *((_BYTE *)v20 + 221) & 0xBF | ((_UIHIDUsageFromSpecialKeyInput(v32) != 0) << 6);
    }
    else if (objc_msgSend(*p_keyCodes, "count") == 1)
    {
      _UISpecialKeyInputFromHIDUsage(objc_msgSend(*p_keyCodes, "firstIndex"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v20 + 221) = *((_BYTE *)v20 + 221) & 0xBF | ((v33 != 0) << 6);

    }
    if (dyld_program_sdk_at_least())
      v34 = 0;
    else
      v34 = 8;
    *((_BYTE *)v20 + 221) = *((_BYTE *)v20 + 221) & 0xF7 | v34;
    if (dyld_program_sdk_at_least())
      v35 = 16;
    else
      v35 = 0;
    *((_BYTE *)v20 + 221) = *((_BYTE *)v20 + 221) & 0xEF | v35;
    if (dyld_program_sdk_at_least())
      v36 = 32;
    else
      v36 = 0;
    *((_BYTE *)v20 + 221) = *((_BYTE *)v20 + 221) & 0xDF | v36;
    layoutAwareDisplayInputOverride = v20->_layoutAwareDisplayInputOverride;
    v20->_layoutAwareDisplayInputOverride = 0;

  }
  return v20;
}

- (id)_initWithInput:(id)a3 modifierFlags:(int64_t)a4 keyCodes:(id)a5 action:(SEL)a6 upAction:(SEL)a7 discoverabilityTitle:(id)a8 buttonType:(int64_t)a9
{
  int v13;
  id v15;
  id v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  UIKeyCommand *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *input;
  uint64_t v25;
  NSString *layoutAwareInput;
  uint64_t v27;
  NSIndexSet *keyCodes;
  uint64_t v29;
  NSIndexSet *layoutAwareKeyCodes;
  uint64_t v31;
  BKSHIDEventDeferringEnvironment *eventDeferringEnvironment;
  char v33;
  char v34;
  char v35;
  NSString *layoutAwareDisplayInputOverride;
  objc_super v38;

  v13 = a4;
  v15 = a3;
  v16 = a5;
  if (a8)
    v17 = (const __CFString *)a8;
  else
    v17 = &stru_1E16EDF20;
  v18 = (void *)MEMORY[0x1E0C99D20];
  v19 = a8;
  objc_msgSend(v18, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38.receiver = self;
  v38.super_class = (Class)UIKeyCommand;
  v21 = -[UICommand initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:](&v38, sel_initWithTitle_image_imageName_action_propertyList_alternates_discoverabilityTitle_attributes_state_, v17, 0, 0, a6, 0, v20, v19, 0, 0);

  if (!v21)
    goto LABEL_24;
  if (v15 && !v16)
  {
    v22 = _UIHIDUsageFromSpecialKeyInput((uint64_t)v15);
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v22);
      v22 = objc_claimAutoreleasedReturnValue();
      v16 = (id)v22;
    }
    else
    {
      v16 = 0;
    }
LABEL_13:
    *((_BYTE *)v21 + 221) = *((_BYTE *)v21 + 221) & 0xBF | ((v22 != 0) << 6);
    goto LABEL_14;
  }
  if (!v15)
  {
    if (objc_msgSend(v16, "count") != 1)
    {
      v15 = 0;
      goto LABEL_14;
    }
    _UISpecialKeyInputFromHIDUsage(objc_msgSend(v16, "firstIndex"));
    v22 = objc_claimAutoreleasedReturnValue();
    v15 = (id)v22;
    goto LABEL_13;
  }
LABEL_14:
  v23 = objc_msgSend(v15, "copy");
  input = v21->_input;
  v21->_input = (NSString *)v23;

  *((_DWORD *)v21 + 52) = v13;
  v25 = -[NSString copy](v21->_input, "copy");
  layoutAwareInput = v21->_layoutAwareInput;
  v21->_layoutAwareInput = (NSString *)v25;

  *((_DWORD *)v21 + 53) = *((_DWORD *)v21 + 52);
  v27 = objc_msgSend(v16, "copy");
  keyCodes = v21->_keyCodes;
  v21->_keyCodes = (NSIndexSet *)v27;

  v29 = -[NSIndexSet copy](v21->_keyCodes, "copy");
  layoutAwareKeyCodes = v21->_layoutAwareKeyCodes;
  v21->_layoutAwareKeyCodes = (NSIndexSet *)v29;

  v21->_upAction = a7;
  v21->_repeatable = 1;
  *((_DWORD *)v21 + 54) = a9;
  objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
  v31 = objc_claimAutoreleasedReturnValue();
  eventDeferringEnvironment = v21->__eventDeferringEnvironment;
  v21->__eventDeferringEnvironment = (BKSHIDEventDeferringEnvironment *)v31;

  v21->__enumerationPriority = -[UIKeyCommand _defaultEnumerationPriority](v21, "_defaultEnumerationPriority");
  *((_BYTE *)v21 + 221) &= ~2u;
  if (dyld_program_sdk_at_least())
    v33 = 0;
  else
    v33 = 8;
  *((_BYTE *)v21 + 221) = *((_BYTE *)v21 + 221) & 0xF7 | v33;
  if (dyld_program_sdk_at_least())
    v34 = 16;
  else
    v34 = 0;
  *((_BYTE *)v21 + 221) = *((_BYTE *)v21 + 221) & 0xEF | v34;
  if (dyld_program_sdk_at_least())
    v35 = 32;
  else
    v35 = 0;
  *((_BYTE *)v21 + 221) = *((_BYTE *)v21 + 221) & 0xDF | v35;
  layoutAwareDisplayInputOverride = v21->_layoutAwareDisplayInputOverride;
  v21->_layoutAwareDisplayInputOverride = 0;

LABEL_24:
  return v21;
}

- (int64_t)_defaultEnumerationPriority
{
  NSString *input;
  void *v4;
  int v5;

  input = self->_input;
  _UIKeyCommandGetLocalizedSymbol(CFSTR("+"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](input, "isEqualToString:", v4) && *((_DWORD *)self + 52) == 0x100000)
  {

    return -1;
  }
  if (-[NSString isEqualToString:](self->_input, "isEqualToString:", CFSTR("UIKeyInputEscape")))
  {
    v5 = *((_DWORD *)self + 52);

    if (!v5)
      return -1;
  }
  else
  {

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__originatingResponder);
  objc_storeStrong((id *)&self->__eventDeferringEnvironment, 0);
  objc_storeStrong((id *)&self->_layoutAwareDisplayInputOverride, 0);
  objc_storeStrong((id *)&self->_layoutAwareInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_triggeringEvent, 0);
  objc_storeStrong((id *)&self->_layoutAwareKeyCodes, 0);
  objc_storeStrong((id *)&self->_keyCodes, 0);
  objc_storeStrong((id *)&self->_lastLayout, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSString *v7;
  NSString *input;
  NSIndexSet *v9;
  NSIndexSet *keyCodes;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = *((int *)self + 52);
    if (objc_msgSend(v5, "modifierFlags") == v6)
    {
      objc_msgSend(v5, "input");
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      input = self->_input;
      if (input == v7 || -[NSString isEqual:](input, "isEqual:", v7))
      {
        objc_msgSend(v5, "_keyCodes");
        v9 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
        keyCodes = self->_keyCodes;
        if (keyCodes == v9 || -[NSIndexSet isEqual:](keyCodes, "isEqual:", v9))
        {
          v11 = *((int *)self + 54);
          v12 = objc_msgSend(v5, "_buttonType") == v11;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (UIKeyModifierFlags)modifierFlags
{
  return *((int *)self + 52);
}

- (NSString)input
{
  return self->_input;
}

- (NSIndexSet)_keyCodes
{
  return self->_keyCodes;
}

- (int64_t)_buttonType
{
  return *((int *)self + 54);
}

- (void)setWantsPriorityOverSystemBehavior:(BOOL)wantsPriorityOverSystemBehavior
{
  char v3;

  if (wantsPriorityOverSystemBehavior)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 221) = *((_BYTE *)self + 221) & 0xF7 | v3;
}

+ (UIKeyCommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action input:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags propertyList:(id)propertyList alternates:(NSArray *)alternates
{
  NSArray *v16;
  id v17;
  NSString *v18;
  UIImage *v19;
  NSString *v20;
  void *v21;

  v16 = alternates;
  v17 = propertyList;
  v18 = input;
  v19 = image;
  v20 = title;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:imageName:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:", v20, v19, 0, action, v18, modifierFlags, v17, v16, 0, 0, 0);

  return (UIKeyCommand *)v21;
}

+ (UIKeyCommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5 input:(id)a6 modifierFlags:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc((Class)a1);
  v16 = (void *)objc_msgSend(v15, "initWithTitle:image:imageName:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:", v14, 0, v13, a5, v12, a7, 0, MEMORY[0x1E0C9AA60], 0, 0, 0);

  return (UIKeyCommand *)v16;
}

- (id)_nonRepeatableKeyCommand
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeyCommand:", self);
  v2[220] = 0;
  return v2;
}

- (UIKeyCommand)initWithKeyCommand:(id)a3
{
  id *v4;
  UIKeyCommand *v5;
  uint64_t v6;
  NSString *input;
  uint64_t v8;
  NSString *layoutAwareInput;
  uint64_t v10;
  NSIndexSet *keyCodes;
  uint64_t v12;
  NSIndexSet *layoutAwareKeyCodes;
  uint64_t v14;
  NSString *layoutAwareDisplayInputOverride;
  objc_super v17;

  v4 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)UIKeyCommand;
  v5 = -[UICommand initWithCommand:](&v17, sel_initWithCommand_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4[28], "copy");
    input = v5->_input;
    v5->_input = (NSString *)v6;

    *((_DWORD *)v5 + 52) = *((_DWORD *)v4 + 52);
    v8 = objc_msgSend(v4[29], "copy");
    layoutAwareInput = v5->_layoutAwareInput;
    v5->_layoutAwareInput = (NSString *)v8;

    *((_DWORD *)v5 + 53) = *((_DWORD *)v4 + 53);
    v10 = objc_msgSend(v4[21], "copy");
    keyCodes = v5->_keyCodes;
    v5->_keyCodes = (NSIndexSet *)v10;

    v12 = objc_msgSend(v4[22], "copy");
    layoutAwareKeyCodes = v5->_layoutAwareKeyCodes;
    v5->_layoutAwareKeyCodes = (NSIndexSet *)v12;

    v5->_upAction = (SEL)v4[23];
    v5->_repeatable = *((_BYTE *)v4 + 220);
    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xFE | *((_BYTE *)v4 + 221) & 1;
    *((_DWORD *)v5 + 54) = *((_DWORD *)v4 + 54);
    objc_storeStrong((id *)&v5->__eventDeferringEnvironment, v4[31]);
    v5->__enumerationPriority = (int64_t)v4[33];
    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xFD | *((_BYTE *)v4 + 221) & 2;
    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xFB | *((_BYTE *)v4 + 221) & 4;
    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xF7 | *((_BYTE *)v4 + 221) & 8;
    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xEF | *((_BYTE *)v4 + 221) & 0x10;
    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xDF | *((_BYTE *)v4 + 221) & 0x20;
    v14 = objc_msgSend(v4[30], "copy");
    layoutAwareDisplayInputOverride = v5->_layoutAwareDisplayInputOverride;
    v5->_layoutAwareDisplayInputOverride = (NSString *)v14;

    *((_BYTE *)v5 + 221) = *((_BYTE *)v5 + 221) & 0xBF | *((_BYTE *)v4 + 221) & 0x40;
  }

  return v5;
}

+ (UIKeyCommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action input:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags propertyList:(id)propertyList
{
  id v14;
  NSString *v15;
  UIImage *v16;
  NSString *v17;
  id v18;
  void *v19;
  void *v20;

  v14 = propertyList;
  v15 = input;
  v16 = image;
  v17 = title;
  v18 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTitle:image:imageName:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:", v17, v16, 0, action, v15, modifierFlags, v14, v19, 0, 0, 0);

  return (UIKeyCommand *)v20;
}

- (id)_allowGlobeModifierKeyCommand
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeyCommand:", self);
  v2[221] |= 2u;
  return v2;
}

- (id)_immutableCopy
{
  return -[UIKeyCommand initWithKeyCommand:]([_UIImmutableKeyCommand alloc], "initWithKeyCommand:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyCommand;
  -[UICommand encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[UIKeyCommand input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("input"));

  -[UIKeyCommand _keyCodes](self, "_keyCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKeyCommand _keyCodes](self, "_keyCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("keyCodes"));

  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIKeyCommand modifierFlags](self, "modifierFlags"), CFSTR("modifierFlags"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIKeyCommand wantsPriorityOverSystemBehavior](self, "wantsPriorityOverSystemBehavior"), CFSTR("wantsPriorityOverSystemBehavior"));
  objc_msgSend(v4, "encodeObject:forKey:", self->__eventDeferringEnvironment, CFSTR("eventDeferringEnvironment"));
  objc_msgSend(v4, "encodeBool:forKey:", (*((unsigned __int8 *)self + 221) >> 4) & 1, CFSTR("allowsAutomaticLocalization"));
  objc_msgSend(v4, "encodeBool:forKey:", (*((unsigned __int8 *)self + 221) >> 5) & 1, CFSTR("allowsAutomaticMirroring"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->__enumerationPriority), CFSTR("enumerationPriority"));

}

- (UIKeyCommand)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyCommand;
  return -[UICommand initWithTitle:image:imageName:action:propertyList:alternates:discoverabilityTitle:attributes:state:](&v3, sel_initWithTitle_image_imageName_action_propertyList_alternates_discoverabilityTitle_attributes_state_, &stru_1E16EDF20, 0, 0, sel__nop, 0, MEMORY[0x1E0C9AA60], 0, 0, 0);
}

- (UIKeyCommand)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIKeyCommand *v5;
  UIKeyCommand *v6;
  uint64_t v7;
  NSString *input;
  uint64_t v9;
  NSString *layoutAwareInput;
  uint64_t v11;
  NSIndexSet *keyCodes;
  int v13;
  char v14;
  char v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v4 = coder;
  v22.receiver = self;
  v22.super_class = (Class)UIKeyCommand;
  v5 = -[UICommand initWithCoder:](&v22, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 54) = -1;
    v5->_repeatable = 1;
    *((_BYTE *)v5 + 221) &= ~2u;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("input"));
    v7 = objc_claimAutoreleasedReturnValue();
    input = v6->_input;
    v6->_input = (NSString *)v7;

    v9 = -[NSString copy](v6->_input, "copy");
    layoutAwareInput = v6->_layoutAwareInput;
    v6->_layoutAwareInput = (NSString *)v9;

    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("keyCodes")))
    {
      -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyCodes"));
      v11 = objc_claimAutoreleasedReturnValue();
      keyCodes = v6->_keyCodes;
      v6->_keyCodes = (NSIndexSet *)v11;

    }
    v13 = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("modifierFlags"));
    *((_DWORD *)v6 + 52) = v13;
    *((_DWORD *)v6 + 53) = v13;
    if (-[NSCoder _ui_decodeBoolForKey:defaultValue:](v4, "_ui_decodeBoolForKey:defaultValue:", CFSTR("wantsPriorityOverSystemBehavior"), dyld_program_sdk_at_least() ^ 1))
    {
      v14 = 8;
    }
    else
    {
      v14 = 0;
    }
    *((_BYTE *)v6 + 221) = *((_BYTE *)v6 + 221) & 0xF7 | v14;
    if (-[NSCoder _ui_decodeBoolForKey:defaultValue:](v4, "_ui_decodeBoolForKey:defaultValue:", CFSTR("allowsAutomaticLocalization"), dyld_program_sdk_at_least()))
    {
      v15 = 16;
    }
    else
    {
      v15 = 0;
    }
    *((_BYTE *)v6 + 221) = *((_BYTE *)v6 + 221) & 0xEF | v15;
    if (-[NSCoder _ui_decodeBoolForKey:defaultValue:](v4, "_ui_decodeBoolForKey:defaultValue:", CFSTR("allowsAutomaticMirroring"), dyld_program_sdk_at_least()))
    {
      v16 = 32;
    }
    else
    {
      v16 = 0;
    }
    *((_BYTE *)v6 + 221) = *((_BYTE *)v6 + 221) & 0xDF | v16;
    -[NSCoder decodeObjectOfClass:forKey:](v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDeferringEnvironment"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0D00CA8], "keyboardFocusEnvironment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v6->__eventDeferringEnvironment, v18);
    if (!v17)

    v6->__enumerationPriority = -[NSCoder decodeInt32ForKey:](v4, "decodeInt32ForKey:", CFSTR("enumerationPriority"));
    v19 = (uint64_t)v6->_input;
    if (v19)
    {
      if (!v6->_keyCodes)
        *((_BYTE *)v6 + 221) = *((_BYTE *)v6 + 221) & 0xBF | ((_UIHIDUsageFromSpecialKeyInput(v19) != 0) << 6);
    }
    else if (-[NSIndexSet count](v6->_keyCodes, "count") == 1)
    {
      _UISpecialKeyInputFromHIDUsage(-[NSIndexSet firstIndex](v6->_keyCodes, "firstIndex"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v6 + 221) = *((_BYTE *)v6 + 221) & 0xBF | ((v20 != 0) << 6);

    }
  }

  return v6;
}

- (UIKeyCommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 propertyList:(id)a7 alternates:(id)a8 discoverabilityTitle:(id)a9 attributes:(unint64_t)a10 state:(int64_t)a11
{
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7, a8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 151, CFSTR("Initializer is unavailable"));

  return 0;
}

- (UIKeyCommand)initWithCommand:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyCommand.m"), 156, CFSTR("Initializer is unavailable"));

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UIKeyCommand initWithKeyCommand:]([UIKeyCommand alloc], "initWithKeyCommand:", self);
}

+ (UIKeyCommand)keyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)modifierFlags action:(SEL)action discoverabilityTitle:(NSString *)discoverabilityTitle
{
  NSString *v10;
  NSString *v11;
  void *v12;

  v10 = discoverabilityTitle;
  v11 = input;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", v11, modifierFlags, 0, action, 0, v10, -1);

  return (UIKeyCommand *)v12;
}

+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 upAction:(SEL)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", v10, a4, 0, a5, a6, 0, -1);

  return (UIKeyCommand *)v11;
}

+ (UIKeyCommand)keyCommandWithCompactInput:(id)a3 action:(SEL)a4 upAction:(SEL)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;

  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("⌘"), &stru_1E16EDF20, 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("⌥"), &stru_1E16EDF20, 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("⌃"), &stru_1E16EDF20, 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("⇧"), &stru_1E16EDF20, 0, 0, objc_msgSend(v9, "length"));
  v10 = v8;
  if (objc_msgSend(v10, "containsString:", CFSTR("⌘")))
    v11 = 0x100000;
  else
    v11 = 0;
  if (objc_msgSend(v10, "containsString:", CFSTR("⌥")))
    v11 |= 0x80000uLL;
  if (objc_msgSend(v10, "containsString:", CFSTR("⌃")))
    v12 = v11 | 0x40000;
  else
    v12 = v11;
  v13 = objc_msgSend(v10, "containsString:", CFSTR("⇧"));

  if (v13)
    v14 = v12 | 0x20000;
  else
    v14 = v12;
  objc_msgSend(a1, "keyCommandWithInput:modifierFlags:action:upAction:", v9, v14, a4, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKeyCommand *)v15;
}

+ (UIKeyCommand)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", 0, a4, v9, a5, 0, 0, -1);

  return (UIKeyCommand *)v10;
}

+ (UIKeyCommand)keyCommandWithKeyCode:(int64_t)a3 modifierFlags:(int64_t)a4 action:(SEL)a5 discoverabilityTitle:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a6;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", 0, a4, v12, a5, 0, v10, -1);

  return (UIKeyCommand *)v13;
}

+ (UIKeyCommand)keyCommandWithKeyCodes:(id)a3 modifierFlags:(int64_t)a4 action:(SEL)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", 0, a4, v8, a5, 0, 0, -1);

  return (UIKeyCommand *)v9;
}

+ (UIKeyCommand)keyCommandWithKeyCodes:(id)a3 modifierFlags:(int64_t)a4 buttonType:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", 0, a4, v8, 0, 0, 0, a5);

  return (UIKeyCommand *)v9;
}

+ (UIKeyCommand)keyCommandWithInput:(id)a3 modifierFlags:(int64_t)a4 buttonType:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithInput:modifierFlags:keyCodes:action:upAction:discoverabilityTitle:buttonType:", v8, a4, 0, 0, 0, 0, a5);

  return (UIKeyCommand *)v9;
}

- (void)_localizeWithGSKeyboard:(__GSKeyboard *)a3 automatically:(BOOL)a4 force:(BOOL)a5
{
  _BOOL4 v7;
  void *Layout;
  unsigned int v9;
  unsigned int v10;
  NSString *v11;
  NSString *lastLayout;
  NSString *v13;
  NSString *layoutAwareInput;
  NSString *layoutAwareDisplayInputOverride;
  void *v16;
  __CFString *v17;
  int v18;
  NSString *v19;
  NSString *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *v28;
  uint64_t v29;
  NSIndexSet *v30;
  NSIndexSet *layoutAwareKeyCodes;
  void *v32;
  NSString *v33;
  NSString *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _BYTE v37[48];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3 || (*((_BYTE *)self + 221) & 1) != 0)
    return;
  v7 = a4;
  Layout = (void *)GSKeyboardGetLayout();
  v9 = GSKeyboardGetHWKeyboardType() - 202;
  v10 = v9 > 5 ? -1 : dword_18667FAA0[v9];
  if (-[NSString isEqualToString:](self->_lastLayout, "isEqualToString:", Layout)
    && !a5
    && self->_lastKeyboardType == v10
    || !-[NSString length](self->_input, "length")
    || !sAllowLocalizationOfApplicationShortcuts && !-[UICommand _isDefaultCommand](self, "_isDefaultCommand")
    || !-[UIKeyCommand allowsAutomaticLocalization](self, "allowsAutomaticLocalization"))
  {
    return;
  }
  v11 = (NSString *)objc_msgSend(Layout, "copy");
  lastLayout = self->_lastLayout;
  self->_lastLayout = v11;

  self->_lastKeyboardType = v10;
  v13 = (NSString *)-[NSString copy](self->_input, "copy");
  layoutAwareInput = self->_layoutAwareInput;
  self->_layoutAwareInput = v13;

  *((_DWORD *)self + 53) = *((_DWORD *)self + 52);
  layoutAwareDisplayInputOverride = self->_layoutAwareDisplayInputOverride;
  self->_layoutAwareDisplayInputOverride = 0;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DBDC68], "shortcutWithKeyEquivalent:modifierFlags:", self->_input, *((int *)self + 52));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UICommand action](self, "action"))
    {
      NSStringFromSelector(-[UICommand action](self, "action"));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &stru_1E16EDF20;
    }
    v21 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection") == 1
       && -[UIKeyCommand allowsAutomaticMirroring](self, "allowsAutomaticMirroring");
    v35[0] = CFSTR("isRTL");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v22;
    v36[1] = v17;
    v35[1] = CFSTR("sel");
    v35[2] = CFSTR("keyboardType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastKeyboardType);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DBDC68], "localizedKeyboardShortcut:forKeyboardLayout:withAttributes:", v16, self->_lastLayout, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqual:", v25) & 1) == 0)
    {
      objc_msgSend(v25, "keyEquivalent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (NSString *)objc_msgSend(v26, "copy");
      v28 = self->_layoutAwareInput;
      self->_layoutAwareInput = v27;

      *((_DWORD *)self + 53) = objc_msgSend(v25, "modifierFlags");
      if (self->_keyCodes)
      {
        v29 = _UIHIDUsageFromSpecialKeyInput((uint64_t)self->_layoutAwareInput);
        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v29);
          v30 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = self->_layoutAwareKeyCodes;
        }
        layoutAwareKeyCodes = self->_layoutAwareKeyCodes;
        self->_layoutAwareKeyCodes = v30;

      }
      objc_msgSend(v25, "displayStringOverride");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (NSString *)objc_msgSend(v32, "copy");
      v34 = self->_layoutAwareDisplayInputOverride;
      self->_layoutAwareDisplayInputOverride = v33;

    }
    return;
  }
  -[NSString characterAtIndex:](self->_input, "characterAtIndex:", 0);
  if (GSKeyboardGetKeyCodeForChar() == -1)
  {
    v18 = *((_DWORD *)self + 52);
    if ((v18 & 0x20000) == 0)
    {
      if (GSKeyboardGetKeyCodeForChar() != -1)
        goto LABEL_15;
      v18 = *((_DWORD *)self + 52);
    }
    if ((v18 & 0xFFFDFFFF) == 0 || GSKeyboardGetKeyCodeForChar() == -1)
    {
      GSKeyboardGetHWKeyboardType();
      if (!GSKeyboardCreate())
        return;
      goto LABEL_27;
    }
  }
LABEL_15:
  if ((objc_msgSend(CFSTR("US"), "isEqualToString:", Layout) & 1) == 0)
  {
    GSKeyboardGetHWKeyboardType();
    if (GSKeyboardCreate())
    {
      if (GSKeyboardGetKeyCodeForChar() == -1)
        goto LABEL_31;
LABEL_27:
      if (GSKeyboardGetKeyCodeForChar() == -1)
      {
        if (GSKeyboardGetKeyCodeForChar() == -1)
        {
LABEL_31:
          GSKeyboardRelease();
          return;
        }
        *((_DWORD *)self + 53) |= 0x20000u;
      }
      GSKeyboardTranslateKeyWithModifiers();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v37, 0);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_layoutAwareInput;
      self->_layoutAwareInput = v19;

      goto LABEL_31;
    }
  }
}

- (NSString)discoverabilityInput
{
  NSString *layoutAwareInput;
  NSString *v4;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  layoutAwareInput = self->_layoutAwareInput;
  if (layoutAwareInput || (layoutAwareInput = self->_input) != 0)
  {
    v4 = layoutAwareInput;
    return v4;
  }
  v4 = (NSString *)objc_msgSend((id)UIApp, "_hardwareKeyboard");
  if (!v4)
    return v4;
  HIWORD(v6) = 0;
  -[NSIndexSet firstIndex](self->_layoutAwareKeyCodes, "firstIndex");
  GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  -[NSIndexSet firstIndex](self->_layoutAwareKeyCodes, "firstIndex", (char *)&v6 + 2, 0, (char *)&v6 + 2, 0, (char *)&v6 + 2, 0, 7);
  GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
  return (NSString *)0;
}

- (id)_placeholderKeyCommand
{
  _BYTE *v2;

  v2 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithKeyCommand:", self);
  v2[221] |= 1u;
  return v2;
}

- (id)_keyCommandUsingAlternate:(id)a3
{
  id v4;
  UIKeyCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  UIKeyModifierFlags v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  UIMenuElementAttributes v15;
  UIMenuElementState v16;
  uint64_t v17;
  void *v19;

  v4 = a3;
  -[UIMenuElement _imageOrName](self, "_imageOrName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [UIKeyCommand alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_asMenuElementImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_asMenuElementImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "action");
  -[UIKeyCommand input](self, "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UIKeyCommand modifierFlags](self, "modifierFlags");
  v12 = objc_msgSend(v4, "modifierFlags");

  v13 = v12 | v11;
  -[UICommand propertyList](self, "propertyList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[UICommand attributes](self, "attributes");
  v16 = -[UICommand state](self, "state");
  v17 = -[UIKeyCommand initWithTitle:image:imageName:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:](v5, "initWithTitle:image:imageName:action:input:modifierFlags:propertyList:alternates:discoverabilityTitle:attributes:state:", v6, v7, v8, v9, v10, v13, v14, MEMORY[0x1E0C9AA60], 0, v15, v16);

  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xFE | *((_BYTE *)self + 221) & 1;
  *(_DWORD *)(v17 + 216) = *((_DWORD *)self + 54);
  objc_storeStrong((id *)(v17 + 248), self->__eventDeferringEnvironment);
  *(_QWORD *)(v17 + 264) = self->__enumerationPriority;
  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xFD | *((_BYTE *)self + 221) & 2;
  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xFB | *((_BYTE *)self + 221) & 4;
  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xF7 | *((_BYTE *)self + 221) & 8;
  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xEF | *((_BYTE *)self + 221) & 0x10;
  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xDF | *((_BYTE *)self + 221) & 0x20;
  *(_BYTE *)(v17 + 221) = *(_BYTE *)(v17 + 221) & 0xBF | *((_BYTE *)self + 221) & 0x40;

  return (id)v17;
}

- (SEL)upAction
{
  return self->_upAction;
}

- (BOOL)repeatable
{
  return self->_repeatable;
}

- (BOOL)isPlaceholder
{
  return *((_BYTE *)self + 221) & 1;
}

- (NSIndexSet)_layoutAwareKeyCodes
{
  return self->_layoutAwareKeyCodes;
}

- (UIEvent)_triggeringEvent
{
  return self->_triggeringEvent;
}

- (void)_setTriggeringEvent:(id)a3
{
  objc_storeStrong((id *)&self->_triggeringEvent, a3);
}

- (BOOL)_isKeyCommandLocalized
{
  NSString *layoutAwareInput;

  layoutAwareInput = self->_layoutAwareInput;
  if (layoutAwareInput)
  {
    if (-[NSString isEqualToString:](layoutAwareInput, "isEqualToString:", self->_input))
      LOBYTE(layoutAwareInput) = *((_DWORD *)self + 53) != *((_DWORD *)self + 52);
    else
      LOBYTE(layoutAwareInput) = 1;
  }
  return (char)layoutAwareInput;
}

- (BOOL)_isKeyCommandLikelyMirrored
{
  if (objc_msgSend((id)UIApp, "userInterfaceLayoutDirection") == 1
    && (*((_BYTE *)self + 210) & 0x10) != 0
    && -[UIKeyCommand _isKeyCommandLocalized](self, "_isKeyCommandLocalized")
    && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return objc_msgSend(MEMORY[0x1E0DBDC68], "isMirroringCandidate:", self->_layoutAwareInput);
  }
  else
  {
    return 0;
  }
}

- (__GSKeyboard)_currentGSKeyboard
{
  void *v2;
  int v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHardwareKeyboardAvailable");

  if (v3)
    return (__GSKeyboard *)objc_msgSend((id)UIApp, "_hardwareKeyboard:", 0);
  else
    return 0;
}

- (BOOL)allowsAutomaticLocalization
{
  return (*((unsigned __int8 *)self + 221) >> 4) & 1;
}

- (void)setAllowsAutomaticLocalization:(BOOL)allowsAutomaticLocalization
{
  char v3;
  char v5;
  NSString *v6;
  NSString *layoutAwareInput;

  v3 = *((_BYTE *)self + 221);
  if (((((v3 & 0x10) == 0) ^ allowsAutomaticLocalization) & 1) == 0)
  {
    if (allowsAutomaticLocalization)
      v5 = 16;
    else
      v5 = 0;
    *((_BYTE *)self + 221) = v3 & 0xEF | v5;
    if (allowsAutomaticLocalization)
    {
      -[UIKeyCommand _localizeWithGSKeyboard:automatically:force:](self, "_localizeWithGSKeyboard:automatically:force:", -[UIKeyCommand _currentGSKeyboard](self, "_currentGSKeyboard"), 0, 1);
    }
    else if (-[UIKeyCommand _isKeyCommandLocalized](self, "_isKeyCommandLocalized"))
    {
      v6 = (NSString *)-[NSString copy](self->_input, "copy");
      layoutAwareInput = self->_layoutAwareInput;
      self->_layoutAwareInput = v6;

      *((_DWORD *)self + 53) = *((_DWORD *)self + 52);
    }
  }
}

- (BOOL)allowsAutomaticMirroring
{
  return (*((unsigned __int8 *)self + 221) >> 5) & 1;
}

- (void)setAllowsAutomaticMirroring:(BOOL)allowsAutomaticMirroring
{
  char v3;
  char v5;
  NSString *v6;
  NSString *layoutAwareInput;

  v3 = *((_BYTE *)self + 221);
  if (((((v3 & 0x20) == 0) ^ allowsAutomaticMirroring) & 1) == 0)
  {
    if (allowsAutomaticMirroring)
      v5 = 32;
    else
      v5 = 0;
    *((_BYTE *)self + 221) = v3 & 0xDF | v5;
    if (allowsAutomaticMirroring)
    {
      -[UIKeyCommand _localizeWithGSKeyboard:automatically:force:](self, "_localizeWithGSKeyboard:automatically:force:", -[UIKeyCommand _currentGSKeyboard](self, "_currentGSKeyboard"), 0, 1);
    }
    else if (-[UIKeyCommand _isKeyCommandLikelyMirrored](self, "_isKeyCommandLikelyMirrored"))
    {
      v6 = (NSString *)-[NSString copy](self->_input, "copy");
      layoutAwareInput = self->_layoutAwareInput;
      self->_layoutAwareInput = v6;

      *((_DWORD *)self + 53) = *((_DWORD *)self + 52);
    }
  }
}

- (id)nextResponder
{
  void *v3;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[UIKeyCommand _originatingResponder](self, "_originatingResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_allowsCommandKeyModifierElision
{
  void *v3;
  void *v4;
  char v5;

  _UIKeyCommandGetLocalizedSymbol(CFSTR("+"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyCommand _layoutAwareInput](self, "_layoutAwareInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_markHandleAfterKeyEvent
{
  *((_BYTE *)self + 221) |= 4u;
}

- (BOOL)_handleAfterKeyEvent
{
  return (*((unsigned __int8 *)self + 221) >> 2) & 1;
}

- (id)_leafKeyInput
{
  return self->_input;
}

- (int64_t)_leafKeyModifierFlags
{
  return *((int *)self + 52);
}

- (BOOL)allowGlobeModifier
{
  return (*((unsigned __int8 *)self + 221) >> 1) & 1;
}

- (BOOL)_isLikelyToConflictWithTextInputForResponder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _BOOL4 v7;

  v4 = a3;
  if (v4
    && (-[UIKeyCommand _originatingResponder](self, "_originatingResponder"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_nextResponderChainContainsResponder:", v4),
        v5,
        (v6 & 1) != 0)
    || (*((_BYTE *)self + 210) & 0x94) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = !-[NSString isEqualToString:](self->_input, "isEqualToString:", CFSTR("UIKeyInputEscape"));
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *upAction;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *input;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UIKeyCommand;
  -[UICommand description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  upAction = self->_upAction;
  if (upAction)
  {
    NSStringFromSelector(upAction);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("  UpAction: %@"), v6);

  }
  v7 = (void *)objc_opt_new();
  v8 = v7;
  v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x10000) != 0)
  {
    objc_msgSend(v7, "addObject:", CFSTR("UIKeyModifierAlphaShift"));
    v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x20000) == 0)
    {
LABEL_5:
      if ((v9 & 0x40000) == 0)
        goto LABEL_6;
      goto LABEL_16;
    }
  }
  else if ((v9 & 0x20000) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v8, "addObject:", CFSTR("UIKeyModifierShift"));
  v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x40000) == 0)
  {
LABEL_6:
    if ((v9 & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v8, "addObject:", CFSTR("UIKeyModifierControl"));
  v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x80000) == 0)
  {
LABEL_7:
    if ((v9 & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v8, "addObject:", CFSTR("UIKeyModifierAlternate"));
  v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x100000) == 0)
  {
LABEL_8:
    if ((v9 & 0x200000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_18:
  objc_msgSend(v8, "addObject:", CFSTR("UIKeyModifierCommand"));
  if ((*((_DWORD *)self + 52) & 0x200000) != 0)
LABEL_9:
    objc_msgSend(v8, "addObject:", CFSTR("UIKeyModifierNumericPad"));
LABEL_10:
  input = (__CFString *)self->_input;
  if (!input)
    input = CFSTR("<none>");
  v11 = input;
  if ((-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR(" ")) & 1) != 0)
  {
    v12 = CFSTR("<space>");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("\t")))
      goto LABEL_23;
    v12 = CFSTR("<tab>");
  }

  v11 = (__CFString *)v12;
LABEL_23:
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("|"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("  Input: %@ + (%@)"), v11, v13);

  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("  Input: %@"), v11);
  }

  return v4;
}

- (id)_readableStringForModifierFlagsUsingWords:(BOOL)a3 forHUD:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8 = v7;
  v9 = *((_DWORD *)self + 52);
  if (a3)
  {
    if ((v9 & 0x100000) != 0)
    {
      if (v4)
        v10 = CFSTR("⌘  ");
      else
        v10 = CFSTR("command ");
      objc_msgSend(v7, "appendString:", v10);
      v9 = *((_DWORD *)self + 52);
      if ((v9 & 0x40000) == 0)
      {
LABEL_4:
        if ((v9 & 0x80000) == 0)
          goto LABEL_5;
        goto LABEL_19;
      }
    }
    else if ((v9 & 0x40000) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v8, "appendString:", CFSTR("control "));
    v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x80000) == 0)
    {
LABEL_5:
      if ((v9 & 0x20000) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
LABEL_19:
    objc_msgSend(v8, "appendString:", CFSTR("option "));
    v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x20000) == 0)
    {
LABEL_6:
      if ((v9 & 0x800000) == 0)
        goto LABEL_28;
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(v8, "appendString:", CFSTR("shift "));
    if ((*((_DWORD *)self + 52) & 0x800000) == 0)
      goto LABEL_28;
LABEL_21:
    v11 = CFSTR("globe ");
LABEL_27:
    objc_msgSend(v8, "appendString:", v11);
    goto LABEL_28;
  }
  if ((v9 & 0x40000) != 0)
  {
    objc_msgSend(v7, "appendString:", CFSTR("⌃ "));
    v9 = *((_DWORD *)self + 52);
    if ((v9 & 0x80000) == 0)
    {
LABEL_10:
      if ((v9 & 0x20000) == 0)
        goto LABEL_11;
      goto LABEL_24;
    }
  }
  else if ((v9 & 0x80000) == 0)
  {
    goto LABEL_10;
  }
  objc_msgSend(v8, "appendString:", CFSTR("⌥ "));
  v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x20000) == 0)
  {
LABEL_11:
    if ((v9 & 0x100000) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(v8, "appendString:", CFSTR("⌘ "));
    if ((*((_DWORD *)self + 52) & 0x800000) == 0)
      goto LABEL_28;
    goto LABEL_26;
  }
LABEL_24:
  objc_msgSend(v8, "appendString:", CFSTR("⇧ "));
  v9 = *((_DWORD *)self + 52);
  if ((v9 & 0x100000) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v9 & 0x800000) != 0)
  {
LABEL_26:
    objc_msgSend(v8, "appendString:", CFSTR("globe "));
    v11 = CFSTR(" ");
    goto LABEL_27;
  }
LABEL_28:
  if ((unint64_t)objc_msgSend(v8, "length") >= 2)
    objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
  return v8;
}

- (id)_readableStringForInputUsingWords:(BOOL)a3 forHUD:(BOOL)a4 outIsSingleCharacterOrKeySymbol:(BOOL *)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  const __CFString *v22;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[UIKeyCommand discoverabilityInput](self, "discoverabilityInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length") == 1)
  {
    -[UIKeyCommand _currentGSKeyboard](self, "_currentGSKeyboard");
    GSKeyboardGetLocale();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uppercaseStringWithLocale:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyCommand _layoutAwareDisplayInputOverride](self, "_layoutAwareDisplayInputOverride");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UIKeyCommand _layoutAwareDisplayInputOverride](self, "_layoutAwareDisplayInputOverride");
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }

    v10 = v12;
  }
  v15 = v10;
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputUpArrow")))
  {
    v16 = CFSTR("↑");
LABEL_36:
    v18 = v9;
LABEL_37:
    objc_msgSend(v18, "appendString:", v16);
LABEL_38:
    v19 = 0;
    if (!a5)
      goto LABEL_43;
    goto LABEL_39;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputDownArrow")))
  {
    v16 = CFSTR("↓");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputLeftArrow")))
  {
    v16 = CFSTR("←");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputRightArrow")))
  {
    v16 = CFSTR("→");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputEscape")))
  {
    v16 = CFSTR("esc");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputPageUp")))
  {
    v16 = CFSTR("page up");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputPageDown")))
  {
    v16 = CFSTR("page down");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputHome")))
  {
    v16 = CFSTR("home");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputEnd")))
  {
    v16 = CFSTR("end");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(" ")))
  {
    if (v6)
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("space"), CFSTR("space"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendString:", v17);

      goto LABEL_38;
    }
    v16 = CFSTR("space");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("\t")))
  {
    if (v7)
      v16 = CFSTR("tab");
    else
      v16 = CFSTR("⇥");
    goto LABEL_36;
  }
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("\n")) & 1) != 0
    || -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("\r")))
  {
    if (v7)
      v16 = CFSTR("return");
    else
      v16 = CFSTR("⏎");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("\b")))
  {
    if (v7)
      v16 = CFSTR("delete");
    else
      v16 = CFSTR("⌫");
    goto LABEL_36;
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF1")))
  {
    v22 = CFSTR("f1");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF2")))
  {
    v22 = CFSTR("f2");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF3")))
  {
    v22 = CFSTR("f3");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF4")))
  {
    v22 = CFSTR("f4");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF5")))
  {
    v22 = CFSTR("f5");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF6")))
  {
    v22 = CFSTR("f6");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF7")))
  {
    v22 = CFSTR("f7");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF8")))
  {
    v22 = CFSTR("f8");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF9")))
  {
    v22 = CFSTR("f9");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF10")))
  {
    v22 = CFSTR("f10");
  }
  else if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF11")))
  {
    v22 = CFSTR("f11");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("UIKeyInputF12")))
    {
      v18 = v9;
      v16 = v15;
      goto LABEL_37;
    }
    v22 = CFSTR("f12");
  }
  objc_msgSend(v9, "appendString:", v22);
  v19 = 1;
  if (!a5)
    goto LABEL_43;
LABEL_39:
  v20 = (v19 & 1) != 0 || objc_msgSend(v9, "length") == 1;
  *a5 = v20;
LABEL_43:

  return v9;
}

- (BOOL)wantsPriorityOverSystemBehavior
{
  return (*((unsigned __int8 *)self + 221) >> 3) & 1;
}

- (NSString)_layoutAwareInput
{
  return self->_layoutAwareInput;
}

- (int64_t)_layoutAwareModifierFlags
{
  return *((int *)self + 53);
}

- (NSString)_layoutAwareDisplayInputOverride
{
  return self->_layoutAwareDisplayInputOverride;
}

- (void)set_layoutAwareDisplayInputOverride:(id)a3
{
  objc_storeStrong((id *)&self->_layoutAwareDisplayInputOverride, a3);
}

- (BKSHIDEventDeferringEnvironment)_eventDeferringEnvironment
{
  return self->__eventDeferringEnvironment;
}

- (void)_setEventDeferringEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->__eventDeferringEnvironment, a3);
}

- (UIResponder)_originatingResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->__originatingResponder);
}

- (void)_setOriginatingResponder:(id)a3
{
  objc_storeWeak((id *)&self->__originatingResponder, a3);
}

- (int64_t)_enumerationPriority
{
  return self->__enumerationPriority;
}

- (BOOL)_isDirectlyReachableWithTranslator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "layoutName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyCommandMatchingCache keyCommandMatchingCacheForLayout:]((uint64_t)_UIKeyCommandMatchingCache, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyCommand _layoutAwareInput](self, "_layoutAwareInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_UIKeyCommandMatchingCache directReachabilityStateForInput:modifiers:](v6, v7, -[UIKeyCommand modifierFlags](self, "modifierFlags"));

  if (v8
    || (-[UIKeyCommand _layoutAwareInput](self, "_layoutAwareInput"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "length"),
        v10,
        !v11))
  {
    v9 = v8 == 1;
  }
  else
  {
    -[UIKeyCommand _layoutAwareInput](self, "_layoutAwareInput");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "HIDUsageCodeForCharacter:modifiers:", objc_msgSend(v13, "characterAtIndex:", 0), -[UIKeyCommand modifierFlags](self, "modifierFlags"));

    v9 = v14 != -1;
    -[UIKeyCommand _layoutAwareInput](self, "_layoutAwareInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyCommandMatchingCache setDirectlyReachable:input:modifiers:](v6, v14 != -1, v15, -[UIKeyCommand modifierFlags](self, "modifierFlags"));

  }
  return v9;
}

@end
