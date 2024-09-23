@implementation SKUIPropertyPredicateViewElement

- (SKUIPropertyPredicateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIPropertyPredicateViewElement *v11;
  void *v12;
  uint64_t v13;
  NSString *property;
  void *v15;
  uint64_t v16;
  NSString *value;
  void *v18;
  id v19;
  uint64_t v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPropertyPredicateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIPropertyPredicateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v22, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("property"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "copy");
      property = v11->_property;
      v11->_property = (NSString *)v13;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("value"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
    {
      v16 = objc_msgSend(v15, "copy");
      value = v11->_value;
      v11->_value = (NSString *)v16;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("comparisonType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      v19 = v18;
      if ((objc_msgSend(v19, "isEqualToString:", CFSTR("not-equal")) & 1) != 0)
      {
        v20 = 1;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("greater-than")) & 1) != 0)
      {
        v20 = 2;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("greater-than-or-equal")) & 1) != 0)
      {
        v20 = 3;
      }
      else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("less-than")) & 1) != 0)
      {
        v20 = 4;
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("less-than-or-equal")))
      {
        v20 = 5;
      }
      else
      {
        v20 = 0;
      }

      v11->_comparisonType = v20;
    }

  }
  return v11;
}

+ (BOOL)shouldParseChildDOMElements
{
  return 0;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIPropertyPredicateViewElement *v4;
  SKUIPropertyPredicateViewElement *v5;
  SKUIPropertyPredicateViewElement *v6;
  void *v7;
  NSString *v8;
  NSString *property;
  void *v10;
  NSString *v11;
  NSString *value;
  objc_super v14;

  v4 = (SKUIPropertyPredicateViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SKUIPropertyPredicateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v14, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIPropertyPredicateViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_comparisonType = -[SKUIPropertyPredicateViewElement comparisonType](v4, "comparisonType");
    -[SKUIPropertyPredicateViewElement property](v4, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    property = self->_property;
    self->_property = v8;

    -[SKUIPropertyPredicateViewElement value](v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSString *)objc_msgSend(v10, "copy");
    value = self->_value;
    self->_value = v11;

  }
  return v6;
}

- (id)entityValuePredicate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke;
  v3[3] = &unk_1E73A4BE8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF49C938))
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "property");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForEntityProperty:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "property");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nativeValueForStringValue:forProperty:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    v13 = objc_msgSend(*(id *)(a1 + 32), "comparisonType");
    if (v13 == 1)
    {
      if (v9 == v10)
        v14 = 0;
      else
        v14 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
    }
    else if (v13)
    {
      v14 = 0;
      if (v9 && v10)
      {
        v15 = objc_msgSend(v9, "compare:", v10);
        switch(objc_msgSend(*(id *)(a1 + 32), "comparisonType"))
        {
          case 2:
            v14 = v15 == 1;
            break;
          case 3:
            v16 = v15 >= 2;
            goto LABEL_19;
          case 4:
          case 5:
            v16 = v15 + 1 >= 2;
LABEL_19:
            v14 = !v16;
            break;
          default:
            __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1();
        }
      }
    }
    else if (v9 == v10)
    {
      v14 = 1;
    }
    else
    {
      v14 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSString)property
{
  return self->_property;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPropertyPredicateViewElement initWithDOMElement:parent:elementFactory:]";
}

void __56__SKUIPropertyPredicateViewElement_entityValuePredicate__block_invoke_cold_1()
{
  __assert_rtn("-[SKUIPropertyPredicateViewElement entityValuePredicate]_block_invoke", "SKUIPropertyPredicateViewElement.m", 90, "0");
}

@end
