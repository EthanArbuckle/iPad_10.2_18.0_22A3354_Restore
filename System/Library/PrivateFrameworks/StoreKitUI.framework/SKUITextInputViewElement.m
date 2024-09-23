@implementation SKUITextInputViewElement

- (SKUITextInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUITextInputViewElement *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUITextInputViewElement initWithDOMElement:parent:elementFactory:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUITextInputViewElement;
  v19 = -[SKUIInputViewElement initWithDOMElement:parent:elementFactory:](&v28, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v19)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("email")))
    {
      v21 = 7;
    }
    else
    {
      if (!objc_msgSend(v20, "isEqualToString:", CFSTR("number")))
      {
        v19->_keyboardType = 0;
        goto LABEL_12;
      }
      v21 = 4;
    }
    v19->_keyboardType = v21;
LABEL_12:
    objc_msgSend(v8, "getAttribute:", CFSTR("maxlength"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v19->_maximumLength = objc_msgSend(v22, "integerValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("secure"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v19->_secure = objc_msgSend(v24, "BOOLValue");
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("password")))
    {
      v19->_secure = 1;
    }
    objc_msgSend(v8, "getAttribute:", CFSTR("placeholdertext"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_storeStrong((id *)&v19->_placeholderText, v26);

  }
  return v19;
}

+ (BOOL)isTextInputType:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUITextInputViewElement isTextInputType:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("number")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("email")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("password")) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v12 = objc_msgSend(v3, "isEqualToString:", CFSTR("text"));
  }

  return v12;
}

- (SKUIAnimatorDOMFeature)animationInterface
{
  return (SKUIAnimatorDOMFeature *)-[SKUIViewElement featureWithName:](self, "featureWithName:", 0x1E73B34F0);
}

+ (id)supportedFeatures
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        +[SKUITextInputViewElement supportedFeatures].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v11[0] = 0x1E73B34F0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUITextInputViewElement *v4;
  SKUITextInputViewElement *v5;
  SKUITextInputViewElement *v6;
  objc_super v8;

  v4 = (SKUITextInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUITextInputViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUITextInputViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_keyboardType = -[SKUITextInputViewElement keyboardType](v4, "keyboardType");
    self->_maximumLength = -[SKUITextInputViewElement maximumLength](v4, "maximumLength");
  }

  return v6;
}

- (unint64_t)elementType
{
  return 140;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)maximumLength
{
  return self->_maximumLength;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)isTextInputType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)supportedFeatures
{
  OUTLINED_FUNCTION_1();
}

@end
