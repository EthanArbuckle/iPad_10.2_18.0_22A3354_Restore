@implementation PUITextLayoutSet

+ (id)supportedTextLayoutSetForRole:(id)a3
{
  int v3;
  PUITextLayoutSet *v4;
  void *v5;

  v3 = objc_msgSend(a3, "isEqual:", *MEMORY[0x24BE74D58]);
  v4 = [PUITextLayoutSet alloc];
  if (v3)
    v5 = &unk_25156B008;
  else
    v5 = &unk_25156B020;
  return -[PUITextLayoutSet initWithTextLayouts:](v4, "initWithTextLayouts:", v5);
}

- (PUITextLayoutSet)initWithTextLayoutsIndexSet:(id)a3
{
  id v5;
  PUITextLayoutSet *v6;
  PUITextLayoutSet *v7;
  uint64_t v8;
  NSMutableIndexSet *titleLayoutSetStorage;
  objc_super v11;
  _QWORD v12[4];
  PUITextLayoutSet *v13;
  SEL v14;

  v5 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke;
  v12[3] = &unk_25154C3F8;
  v14 = a2;
  v6 = self;
  v13 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v12);
  v11.receiver = v6;
  v11.super_class = (Class)PUITextLayoutSet;
  v7 = -[PUITextLayoutSet init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v5, "mutableCopy");
    titleLayoutSetStorage = v7->_titleLayoutSetStorage;
    v7->_titleLayoutSetStorage = (NSMutableIndexSet *)v8;

    PUITextLayoutSetSharedInit(v7);
  }

  return v7;
}

uint64_t __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  void *v5;

  result = PUITextLayoutIsValid(a2);
  if ((result & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PUITextLayout '%lu' is not valid"), a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUITextLayoutSet)initWithTextLayouts:(id)a3
{
  id v5;
  PUITextLayoutSet *v6;
  PUITextLayoutSet *v7;
  _QWORD v9[4];
  PUITextLayoutSet *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUITextLayoutSet;
  v6 = -[PUITextLayoutSet init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    PUITextLayoutSetSharedInit(v6);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__PUITextLayoutSet_initWithTextLayouts___block_invoke;
    v9[3] = &unk_25154C420;
    v11 = a2;
    v10 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  }
  return v7;
}

void __40__PUITextLayoutSet_initWithTextLayouts___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "unsignedIntValue");
  if (PUITextLayoutIsValid(v3))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addIndex:", v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PUITextLayout '%lu' is not valid"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __40__PUITextLayoutSet_initWithTextLayouts___block_invoke_cold_1(a1);
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (PUITextLayoutSet)initWithTextLayout:(unint64_t)a3
{
  PUITextLayoutSet *v6;
  PUITextLayoutSet *v7;
  PUITextLayoutSet *result;
  void *v9;
  objc_super v10;

  if (PUITextLayoutIsValid(a3))
  {
    v10.receiver = self;
    v10.super_class = (Class)PUITextLayoutSet;
    v6 = -[PUITextLayoutSet init](&v10, sel_init);
    v7 = v6;
    if (v6)
    {
      PUITextLayoutSetSharedInit(v6);
      -[NSMutableIndexSet addIndex:](v7->_titleLayoutSetStorage, "addIndex:", a3);
    }
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PUITextLayout '%lu' is not valid"), a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUITextLayoutSet initWithTextLayout:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (PUITextLayoutSet *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (unint64_t)hash
{
  return -[NSMutableIndexSet hash](self->_titleLayoutSetStorage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PUITextLayoutSet *v4;
  id *p_isa;
  char v6;

  v4 = (PUITextLayoutSet *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(p_isa[1], "isEqual:", self->_titleLayoutSetStorage);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (void)enumerateTextLayouts:(id)a3
{
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](self->_titleLayoutSetStorage, "enumerateIndexesUsingBlock:", a3);
}

- (unint64_t)numberOfTextLayouts
{
  return -[NSMutableIndexSet count](self->_titleLayoutSetStorage, "count");
}

- (BOOL)containsTextLayout:(unint64_t)a3
{
  return -[NSMutableIndexSet containsIndex:](self->_titleLayoutSetStorage, "containsIndex:", a3);
}

- (id)textLayoutSetByAddingTextLayout:(unint64_t)a3
{
  void *v5;
  PUITextLayoutSet *v6;

  if (-[PUITextLayoutSet containsTextLayout:](self, "containsTextLayout:") || !PUITextLayoutIsValid(a3))
  {
    v6 = self;
  }
  else
  {
    v5 = (void *)-[NSMutableIndexSet mutableCopy](self->_titleLayoutSetStorage, "mutableCopy");
    objc_msgSend(v5, "addIndex:", a3);
    v6 = -[PUITextLayoutSet initWithTextLayoutsIndexSet:]([PUITextLayoutSet alloc], "initWithTextLayoutsIndexSet:", v5);

  }
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  if (-[PUITextLayoutSet containsTextLayout:](self, "containsTextLayout:", 1))
    objc_msgSend(v4, "addObject:", CFSTR("PUITextLayoutVerticalTopRight"));
  if (-[PUITextLayoutSet containsTextLayout:](self, "containsTextLayout:", 1))
    objc_msgSend(v4, "addObject:", CFSTR("PUITextLayoutVerticalTopRight"));
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("supportedTextLayouts"), 1);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUITextLayoutSet)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PUITextLayoutSet *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleLayoutSetStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PUITextLayoutSet initWithTextLayoutsIndexSet:](self, "initWithTextLayoutsIndexSet:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_titleLayoutSetStorage, CFSTR("_titleLayoutSetStorage"));
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_titleLayoutSetStorage, CFSTR("_titleLayoutSetStorage"));
}

- (PUITextLayoutSet)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  PUITextLayoutSet *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_titleLayoutSetStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PUITextLayoutSet initWithTextLayoutsIndexSet:](self, "initWithTextLayoutsIndexSet:", v5);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PUITextLayoutSet initWithTextLayoutsIndexSet:](+[PUITextLayoutSet allocWithZone:](PUITextLayoutSet, "allocWithZone:", a3), "initWithTextLayoutsIndexSet:", self->_titleLayoutSetStorage);
}

- (BOOL)allTextLayoutsAreVertical
{
  return self->_allTextLayoutsAreVertical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLayoutSetStorage, 0);
}

void __48__PUITextLayoutSet_initWithTextLayoutsIndexSet___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __40__PUITextLayoutSet_initWithTextLayouts___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_1();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithTextLayout:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
