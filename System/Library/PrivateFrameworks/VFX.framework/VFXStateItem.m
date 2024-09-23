@implementation VFXStateItem

- (BOOL)replaces:(id)a3
{
  uint64_t v3;

  if (*((_QWORD *)a3 + 1) == self->_action && (id)*((_QWORD *)a3 + 2) == self->_target)
    return objc_msgSend_isEqualToString_(*((void **)a3 + 3), a2, (uint64_t)self->_keyPath, v3);
  else
    return 0;
}

- (VFXStateItem)initWithAction:(int64_t)a3 target:(id)a4 keyPath:(id)a5 value:(id)a6 parent:(id)a7 index:(unint64_t)a8
{
  VFXStateItem *v14;
  const char *v15;
  uint64_t v16;
  VFXStateItem *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VFXStateItem;
  v14 = -[VFXStateItem init](&v19, sel_init);
  v17 = v14;
  if (v14)
  {
    v14->_action = a3;
    objc_msgSend_setTarget_(v14, v15, (uint64_t)a4, v16);
    v17->_keyPath = (NSString *)a5;
    v17->_value = a6;
    v17->_parent = (VFXNode *)a7;
    v17->_index = a8;
  }
  return v17;
}

+ (id)setValue:(id)a3 to:(id)a4 keyPath:(id)a5
{
  VFXStateItem *v8;
  const char *v9;

  v8 = [VFXStateItem alloc];
  return (id)objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v8, v9, 0, (uint64_t)a4, a5, a3, 0, 0);
}

+ (id)removeNode:(id)a3
{
  VFXStateItem *v4;
  const char *v5;

  v4 = [VFXStateItem alloc];
  return (id)objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v4, v5, 3, (uint64_t)a3, 0, 0, 0, 0);
}

+ (id)insertChildNode:(id)a3 parent:(id)a4 atIndex:(unint64_t)a5
{
  VFXStateItem *v8;
  const char *v9;

  v8 = [VFXStateItem alloc];
  return (id)objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v8, v9, 4, (uint64_t)a3, 0, 0, a4, a5);
}

+ (id)addAnimation:(id)a3 to:(id)a4 keyPath:(id)a5
{
  VFXStateItem *v8;
  const char *v9;

  v8 = [VFXStateItem alloc];
  return (id)objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v8, v9, 1, (uint64_t)a4, a5, a3, 0, 0);
}

+ (id)removeAnimationFrom:(id)a3 keyPath:(id)a4
{
  VFXStateItem *v6;
  const char *v7;

  v6 = [VFXStateItem alloc];
  return (id)objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v6, v7, 2, (uint64_t)a3, a4, 0, 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXStateItem;
  -[VFXStateItem dealloc](&v3, sel_dealloc);
}

- (void)setState:(id)a3
{
  if (!a3)
    NSLog(CFSTR("ici"), a2);
  self->_state = (VFXState *)a3;
}

- (int64_t)action
{
  return self->_action;
}

- (id)target
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_target)
    return self->_target;
  v5 = (void *)objc_msgSend_stateManager(self->_state, a2, v2, v3);
  return (id)objc_msgSend_world(v5, v6, v7, v8);
}

- (void)setTarget:(id)a3
{
  id v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = 0;
  else
    v5 = a3;
  self->_target = v5;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)value
{
  return self->_value;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)apply
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  switch(self->_action)
  {
    case 0:
      v5 = (void *)objc_msgSend_target(self, a2, v2, v3);
      objc_msgSend_setValue_forKeyPath_(v5, v6, (uint64_t)self->_value, (uint64_t)self->_keyPath);
      break;
    case 1:
      v13 = (void *)objc_msgSend_target(self, a2, v2, v3);
      objc_msgSend_addAnimationPlayer_forKey_(v13, v14, (uint64_t)self->_value, (uint64_t)self->_keyPath);
      break;
    case 2:
      v8 = objc_msgSend_target(self, a2, v2, v3);
      MEMORY[0x1E0DE7D20](v8, sel_removeAnimationForKey_, self->_keyPath, v15);
      break;
    case 3:
      v9 = (void *)objc_msgSend_target(self, a2, v2, v3);
      objc_msgSend_removeFromParentNode(v9, v10, v11, v12);
      break;
    case 4:
      v7 = objc_msgSend_target(self, a2, v2, v3);
      MEMORY[0x1E0DE7D20](v7, sel_insertChildNode_atIndex_, self->_target, self->_index);
      break;
    default:
      return;
  }
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id value;
  NSString *keyPath;
  const char *v8;
  uint64_t v9;
  id result;
  void *v11;
  id v12;
  NSString *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  switch(self->_action)
  {
    case 0:
      v5 = (void *)MEMORY[0x1E0CB3940];
      keyPath = self->_keyPath;
      value = self->_value;
      v29 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("set: %@ to %@ of %@\n"), v9, value, keyPath, v29);
      break;
    case 1:
      v11 = (void *)MEMORY[0x1E0CB3940];
      v13 = self->_keyPath;
      v12 = self->_value;
      v30 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v11, v14, (uint64_t)CFSTR("addAnim: %@ at %@ to %@\n"), v15, v12, v13, v30);
      break;
    case 2:
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = self->_keyPath;
      v28 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("removeAnim: at %@ from:%@\n"), v19, v17, v28);
      break;
    case 3:
      v20 = (void *)MEMORY[0x1E0CB3940];
      v26 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v20, v21, (uint64_t)CFSTR("remove: %@\n"), v22, v26);
      break;
    case 4:
      v23 = (void *)MEMORY[0x1E0CB3940];
      v27 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)objc_msgSend_stringWithFormat_(v23, v24, (uint64_t)CFSTR("insert: %@ at %d\n"), v25, v27, self->_index);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)_makeReverseItem
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id result;

  switch(self->_action)
  {
    case 0:
      v5 = (void *)objc_msgSend_target(self, a2, v2, v3);
      v8 = objc_msgSend_valueForKeyPath_(v5, v6, (uint64_t)self->_keyPath, v7);
      v12 = objc_msgSend_target(self, v9, v10, v11);
      result = (id)MEMORY[0x1E0DE7D20](VFXStateItem, sel_setValue_to_keyPath_, v8, v12);
      break;
    case 1:
      v13 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)MEMORY[0x1E0DE7D20](VFXStateItem, sel_removeAnimationFrom_keyPath_, v13, self->_keyPath);
      break;
    case 2:
      v14 = (void *)objc_msgSend_target(self, a2, v2, v3);
      v17 = objc_msgSend_animationPlayerForKey_(v14, v15, (uint64_t)self->_keyPath, v16);
      v21 = objc_msgSend_target(self, v18, v19, v20);
      result = (id)MEMORY[0x1E0DE7D20](VFXStateItem, sel_addAnimation_to_keyPath_, v17, v21);
      break;
    case 3:
      v22 = (void *)objc_msgSend_target(self, a2, v2, v3);
      v26 = (void *)objc_msgSend_parentNode(v22, v23, v24, v25);
      v30 = objc_msgSend_target(self, v27, v28, v29);
      objc_msgSend_indexOfChildNode_(v26, v31, v30, v32);
      v36 = objc_msgSend_target(self, v33, v34, v35);
      result = (id)MEMORY[0x1E0DE7D20](VFXStateItem, sel_insertChildNode_parent_atIndex_, v36, v26);
      break;
    case 4:
      v37 = objc_msgSend_target(self, a2, v2, v3);
      result = (id)MEMORY[0x1E0DE7D20](VFXStateItem, sel_removeNode_, v37, v38);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)makeReverseItem
{
  uint64_t v2;
  uint64_t v3;
  void *ReverseItem;
  const char *v6;
  uint64_t v7;

  ReverseItem = (void *)objc_msgSend__makeReverseItem(self, a2, v2, v3);
  objc_msgSend_setState_(ReverseItem, v6, (uint64_t)self->_state, v7);
  return ReverseItem;
}

- (VFXStateItem)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXStateItem *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  objc_super v35;
  _QWORD v36[8];
  _QWORD v37[13];

  v37[12] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)VFXStateItem;
  v6 = -[VFXStateItem init](&v35, sel_init);
  if (v6)
  {
    v6->_action = objc_msgSend_decodeIntegerForKey_(a3, v4, (uint64_t)CFSTR("action"), v5);
    v6->_index = objc_msgSend_decodeIntegerForKey_(a3, v7, (uint64_t)CFSTR("index"), v8);
    v9 = (void *)MEMORY[0x1E0C99E60];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    v37[3] = objc_opt_class();
    v37[4] = objc_opt_class();
    v37[5] = objc_opt_class();
    v37[6] = objc_opt_class();
    v37[7] = objc_opt_class();
    v37[8] = objc_opt_class();
    v37[9] = objc_opt_class();
    v37[10] = objc_opt_class();
    v37[11] = objc_opt_class();
    v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v37, 12);
    v14 = objc_msgSend_setWithArray_(v9, v12, v11, v13);
    v16 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v15, v14, (uint64_t)CFSTR("target"));
    objc_msgSend_setTarget_(v6, v17, v16, v18);
    v19 = objc_opt_class();
    v6->_keyPath = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("keyPath"));
    v21 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v36[3] = objc_opt_class();
    v36[4] = objc_opt_class();
    v36[5] = objc_opt_class();
    v36[6] = objc_opt_class();
    v36[7] = objc_opt_class();
    v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v36, 8);
    v26 = objc_msgSend_setWithArray_(v21, v24, v23, v25);
    v28 = (void *)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v27, v26, (uint64_t)CFSTR("value"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = VFXValueFromData(v28, v29, v30, v31);
    v6->_value = v28;
    v32 = objc_opt_class();
    v6->_parent = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, (uint64_t)CFSTR("parent"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  id target;
  NSString *keyPath;
  void *value;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  VFXNode *parent;
  unint64_t index;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_action, (uint64_t)CFSTR("action"));
  target = self->_target;
  if (target)
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)target, (uint64_t)CFSTR("target"));
  keyPath = self->_keyPath;
  if (keyPath)
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)keyPath, (uint64_t)CFSTR("keyPath"));
  value = self->_value;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    value = (void *)VFXDataFromValue(self->_value, (const char *)1, v10, v11);
  if (value)
  {
    if (objc_msgSend_conformsToProtocol_(value, v9, (uint64_t)&unk_1EEFD6900, v11))
      objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)value, (uint64_t)CFSTR("value"));
    else
      NSLog(CFSTR("failed to archive stateItem value %@ (doesn't conform to secure coding)"), value);
  }
  parent = self->_parent;
  if (parent)
    objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)parent, (uint64_t)CFSTR("parent"));
  index = self->_index;
  if (index)
    objc_msgSend_encodeInteger_forKey_(a3, v9, index, (uint64_t)CFSTR("index"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

@end
