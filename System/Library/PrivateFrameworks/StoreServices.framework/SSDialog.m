@implementation SSDialog

- (SSDialog)init
{
  SSDialog *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSDialog;
  v2 = -[SSDialog init](&v4, sel_init);
  if (v2)
    v2->_dialogDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (SSDialog)initWithDialogDictionary:(id)a3
{
  SSDialog *v4;
  SSProtocolConditionalEvaluator *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSDialog;
  v4 = -[SSDialog init](&v8, sel_init);
  if (v4)
  {
    v5 = -[SSProtocolConditionalEvaluator initWithDictionary:]([SSProtocolConditionalEvaluator alloc], "initWithDictionary:", a3);
    v6 = -[SSProtocolConditionalEvaluator dictionaryByEvaluatingConditions](v5, "dictionaryByEvaluatingConditions");

    v4->_dialogDictionary = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    if (!-[NSString length](-[SSDialog title](v4, "title"), "length")
      && !-[NSString length](-[SSDialog message](v4, "message"), "length")
      && !-[NSArray count](-[SSDialog buttons](v4, "buttons"), "count"))
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDialog;
  -[SSDialog dealloc](&v3, sel_dealloc);
}

- (NSArray)buttons
{
  NSArray *buttons;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *AvailableKey;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  SSDialogButton *v18;
  SSDialogButton *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  SSDialogButton *v27;
  SSDialogButton *v28;

  buttons = self->_buttons;
  if (!buttons)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    AvailableKey = (void *)SSValueForFirstAvailableKey(self->_dialogDictionary, (uint64_t)CFSTR("cancelButtonString"), v5, v6, v7, v8, v9, v10, (uint64_t)CFSTR("cancelButton"));
    if (objc_msgSend(AvailableKey, "length"))
    {
      v18 = -[SSDialogButton initWithTitle:actionDictionary:]([SSDialogButton alloc], "initWithTitle:actionDictionary:", AvailableKey, SSValueForFirstAvailableKey(self->_dialogDictionary, (uint64_t)CFSTR("cancelButtonAction"), v12, v13, v14, v15, v16, v17, 0));
      if (v18)
      {
        v19 = v18;
        objc_msgSend(v4, "addObject:", v18);

      }
    }
    v20 = (void *)SSValueForFirstAvailableKey(self->_dialogDictionary, (uint64_t)CFSTR("okButtonString"), v12, v13, v14, v15, v16, v17, (uint64_t)CFSTR("okButton"));
    if (objc_msgSend(v20, "length"))
    {
      v27 = -[SSDialogButton initWithTitle:actionDictionary:]([SSDialogButton alloc], "initWithTitle:actionDictionary:", v20, SSValueForFirstAvailableKey(self->_dialogDictionary, (uint64_t)CFSTR("okButtonAction"), v21, v22, v23, v24, v25, v26, 0));
      if (v27)
      {
        v28 = v27;
        objc_msgSend(v4, "addObject:", v27);

      }
    }
    self->_buttons = (NSArray *)objc_msgSend(v4, "copy");

    buttons = self->_buttons;
  }
  return buttons;
}

- (SSDialogButton)defaultButton
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *AvailableKey;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SSDialogButton *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  AvailableKey = (void *)SSValueForFirstAvailableKey(self->_dialogDictionary, (uint64_t)CFSTR("defaultButton"), v2, v3, v4, v5, v6, v7, 0);
  if (!objc_msgSend(AvailableKey, "length"))
    return 0;
  v10 = -[SSDialog buttons](self, "buttons");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v11)
    return 0;
  v12 = v11;
  v13 = *(_QWORD *)v18;
LABEL_4:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v13)
      objc_enumerationMutation(v10);
    v15 = *(SSDialogButton **)(*((_QWORD *)&v17 + 1) + 8 * v14);
    if (-[NSString isEqualToString:](-[SSDialogButton buttonTitle](v15, "buttonTitle"), "isEqualToString:", AvailableKey))
    {
      return v15;
    }
    if (v12 == ++v14)
    {
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 0;
      if (v12)
        goto LABEL_4;
      return v15;
    }
  }
}

- (void)setDefaultButton:(id)a3
{
  -[SSDialog _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend(a3, "buttonTitle"), CFSTR("defaultButton"));
}

- (NSString)message
{
  return (NSString *)-[SSDialog valueForProperty:](self, "valueForProperty:", CFSTR("explanation"));
}

- (NSString)title
{
  return (NSString *)-[SSDialog valueForProperty:](self, "valueForProperty:", CFSTR("message"));
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dialogDictionary, "objectForKey:", a3);
}

- (NSDictionary)dialogDictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dialogDictionary, "copy");
}

- (NSString)dialogKind
{
  return (NSString *)-[SSDialog valueForProperty:](self, "valueForProperty:", CFSTR("kind"));
}

- (void)setButtons:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a3, "count"))
    v5 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 0), "buttonTitle");
  else
    v5 = 0;
  if ((unint64_t)objc_msgSend(a3, "count") < 2)
    v6 = 0;
  else
    v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", 1), "buttonTitle");
  -[SSDialog _setValue:forProperty:](self, "_setValue:forProperty:", v5, CFSTR("cancelButtonString"));
  -[SSDialog _setValue:forProperty:](self, "_setValue:forProperty:", v6, CFSTR("okButtonString"));
}

- (void)setMessage:(id)a3
{
  -[SSDialog _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("explanation"));
}

- (void)setTitle:(id)a3
{
  -[SSDialog _setValue:forProperty:](self, "_setValue:forProperty:", a3, CFSTR("message"));
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *dialogDictionary;

  dialogDictionary = self->_dialogDictionary;
  if (a3)
  {
    if (!dialogDictionary)
    {
      dialogDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_dialogDictionary = dialogDictionary;
    }
    -[NSMutableDictionary setObject:forKey:](dialogDictionary, "setObject:forKey:", a3, a4);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](dialogDictionary, "removeObjectForKey:", a4);
  }
}

@end
