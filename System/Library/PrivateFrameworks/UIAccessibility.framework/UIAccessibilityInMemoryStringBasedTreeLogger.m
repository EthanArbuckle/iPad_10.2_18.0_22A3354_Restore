@implementation UIAccessibilityInMemoryStringBasedTreeLogger

- (UIAccessibilityInMemoryStringBasedTreeLogger)init
{
  return -[UIAccessibilityInMemoryStringBasedTreeLogger initWithPrefix:](self, "initWithPrefix:", CFSTR(" |"));
}

- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithPrefix:(id)a3
{
  return -[UIAccessibilityInMemoryStringBasedTreeLogger initWithPrefix:elementDescriptionKey:](self, "initWithPrefix:elementDescriptionKey:", a3, CFSTR("description"));
}

- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithElementDescriptionKey:(id)a3
{
  return -[UIAccessibilityInMemoryStringBasedTreeLogger initWithPrefix:elementDescriptionKey:](self, "initWithPrefix:elementDescriptionKey:", CFSTR(" |"), CFSTR("description"));
}

- (UIAccessibilityInMemoryStringBasedTreeLogger)initWithPrefix:(id)a3 elementDescriptionKey:(id)a4
{
  id v7;
  id v8;
  UIAccessibilityInMemoryStringBasedTreeLogger *v9;
  NSMutableString *v10;
  NSMutableString *stringRepresentation;
  NSMutableArray *v12;
  NSMutableArray *currentPrefix;
  uint64_t v14;
  NSString *prefix;
  uint64_t v16;
  NSString *descriptionKey;
  void *v19;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIAccessibilityInMemoryStringBasedTreeLogger.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[descriptionKey length] > 0"));

  }
  v20.receiver = self;
  v20.super_class = (Class)UIAccessibilityInMemoryStringBasedTreeLogger;
  v9 = -[UIAccessibilityInMemoryStringBasedTreeLogger init](&v20, sel_init);
  if (v9)
  {
    v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    stringRepresentation = v9->_stringRepresentation;
    v9->_stringRepresentation = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentPrefix = v9->_currentPrefix;
    v9->_currentPrefix = v12;

    v14 = objc_msgSend(v7, "copy");
    prefix = v9->_prefix;
    v9->_prefix = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    descriptionKey = v9->_descriptionKey;
    v9->_descriptionKey = (NSString *)v16;

  }
  return v9;
}

- (id)stringRepresentation
{
  return (id)-[NSMutableString copy](self->_stringRepresentation, "copy");
}

- (void)logElement:(id)a3
{
  NSMutableArray *currentPrefix;
  id v5;
  void *v6;
  void *v7;
  id v8;

  currentPrefix = self->_currentPrefix;
  v5 = a3;
  -[NSMutableArray componentsJoinedByString:](currentPrefix, "componentsJoinedByString:", &stru_1E3E01CE0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", self->_descriptionKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableString appendFormat:](self->_stringRepresentation, "appendFormat:", CFSTR("%@ %@\n"), v8, v7);
}

- (void)push
{
  -[NSMutableArray addObject:](self->_currentPrefix, "addObject:", self->_prefix);
}

- (void)pop
{
  -[NSMutableArray removeLastObject](self->_currentPrefix, "removeLastObject");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionKey, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_currentPrefix, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end
