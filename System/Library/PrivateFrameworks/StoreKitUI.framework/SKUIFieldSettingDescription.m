@implementation SKUIFieldSettingDescription

- (SKUIFieldSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  SKUIFieldSettingDescription *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFieldSettingDescription initWithViewElement:parent:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIFieldSettingDescription;
  v8 = -[SKUISettingDescription initWithViewElement:parent:](&v10, sel_initWithViewElement_parent_, v6, v7);
  if (v8)
    v8->_fieldType = objc_msgSend((id)objc_opt_class(), "_fieldTypeFromElement:", v6);

  return v8;
}

- (int64_t)fieldType
{
  return self->_fieldType;
}

- (id)fieldValueForKey:(id)a3
{
  void *fieldValues;

  fieldValues = self->_fieldValues;
  if (fieldValues)
  {
    objc_msgSend(fieldValues, "objectForKey:", a3);
    fieldValues = (void *)objc_claimAutoreleasedReturnValue();
  }
  return fieldValues;
}

- (void)setFieldValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *fieldValues;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  fieldValues = self->_fieldValues;
  if (!fieldValues)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_fieldValues;
    self->_fieldValues = v8;

    fieldValues = self->_fieldValues;
  }
  -[NSMutableDictionary objectForKey:](fieldValues, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqual:", v10) & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKey:](self->_fieldValues, "setObject:forKey:", v12, v6);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v12, v6, 0);
    -[SKUIFieldSettingDescription _dispatchEventOfType:extraInfo:](self, "_dispatchEventOfType:extraInfo:", 15, v11);

  }
}

+ (int64_t)_fieldTypeFromElement:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a1, "_inputViewElementFromElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      v4 = 0;
    }
    else if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    {
      v4 = 2;
    }
    else
    {
      v4 = -1;
    }
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (id)_inputViewElementFromElement:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__78;
  v11 = __Block_byref_object_dispose__78;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SKUIFieldSettingDescription__inputViewElementFromElement___block_invoke;
  v6[3] = &unk_1E73A01D0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateChildrenUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __60__SKUIFieldSettingDescription__inputViewElementFromElement___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v6;
  id v7;

  v7 = a2;
  v6 = objc_msgSend(v7, "elementType");
  if ((unint64_t)(v6 - 139) < 2 || v6 == 58 || v6 == 18)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (BOOL)allowsSelection
{
  SKUISettingsGroupController **p_controller;
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  char v12;
  char v13;

  if (self->_fieldType != 1)
    return 0;
  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained
    && (v5 = WeakRetained,
        v6 = objc_loadWeakRetained((id *)p_controller),
        v7 = objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()),
        v6,
        v5,
        v7))
  {
    v8 = objc_loadWeakRetained((id *)p_controller);
    objc_msgSend(v8, "valueForSettingDescription:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isAuthenticating");

    v11 = v10 ^ 1;
  }
  else
  {
    v9 = 0;
    v11 = 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v9, "BOOLValue");
  else
    v13 = 0;
  v12 = v13 & v11;

  return v12;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  id WeakRetained;
  int v5;
  id v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v5 = objc_msgSend(WeakRetained, "isMemberOfClass:", objc_opt_class());

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v6, "submitSettingDescription:", self);

  }
  v7[2]();

}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  objc_class *v6;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
    if (v4[5] > 2uLL)
      v5 = 0;
    else
      v5 = (void *)objc_opt_class();

  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)_dispatchEventOfType:(unint64_t)a3 extraInfo:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = (void *)objc_opt_class();
  -[SKUISettingDescription viewElement](self, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_inputViewElementFromElement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[SKUISettingDescription viewElement](self, "viewElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", a3, 1, 1, v9, 0);

}

- (SKUISettingsGroupController)controller
{
  return (SKUISettingsGroupController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValues, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)initWithViewElement:parent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFieldSettingDescription initWithViewElement:parent:]";
}

@end
