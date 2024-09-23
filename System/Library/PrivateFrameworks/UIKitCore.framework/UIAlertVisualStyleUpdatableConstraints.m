@implementation UIAlertVisualStyleUpdatableConstraints

- (UIAlertVisualStyleUpdatableConstraints)init
{
  UIAlertVisualStyleUpdatableConstraints *v2;
  uint64_t v3;
  NSMutableDictionary *constraintsByKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAlertVisualStyleUpdatableConstraints;
  v2 = -[UIAlertVisualStyleUpdatableConstraints init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    constraintsByKey = v2->_constraintsByKey;
    v2->_constraintsByKey = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)hasUpdatableConstraints
{
  return -[NSMutableDictionary count](self->_constraintsByKey, "count") != 0;
}

- (void)addConstraint:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_constraintsByKey, "setObject:forKeyedSubscript:");
  }
}

- (id)constraintForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_constraintsByKey, "objectForKeyedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsByKey, 0);
}

@end
