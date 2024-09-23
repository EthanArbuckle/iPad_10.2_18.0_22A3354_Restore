@implementation _UICommandParentReplacements

- (void)_setReplacementElements:(id)a3 forElement:(id)a4
{
  NSMutableDictionary *childReplacements;
  id v8;
  void *v9;
  _UICommandChildReplacements *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v15 = a4;
  childReplacements = self->_childReplacements;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](childReplacements, "objectForKeyedSubscript:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICommandInternalDiff.m"), 82, CFSTR("child replacements already set"));

  }
  v10 = objc_alloc_init(_UICommandChildReplacements);
  -[_UICommandChildReplacements _setReplacementElements:](v10, "_setReplacementElements:", v8);

  v11 = self->_childReplacements;
  if (v11)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v10, v15);
    v12 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_childReplacements;
    self->_childReplacements = v12;

  }
}

- (NSDictionary)childReplacements
{
  return &self->_childReplacements->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childReplacements, 0);
}

@end
