@implementation _UIActivityItemCustomizationPicker

- (_UIActivityItemCustomizationPicker)initWithIdentifier:(id)a3 optionTitles:(id)a4 selectedOptionIndex:(int64_t)a5 footerText:(id)a6
{
  id v9;
  _UIActivityItemCustomizationPicker *v10;
  uint64_t v11;
  NSArray *optionTitles;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIActivityItemCustomizationPicker;
  v9 = a4;
  v10 = -[_UIActivityItemCustomization _initWithTitle:identifier:footerText:](&v14, sel__initWithTitle_identifier_footerText_, 0, a3, a6);
  v11 = objc_msgSend(v9, "copy", v14.receiver, v14.super_class);

  optionTitles = v10->_optionTitles;
  v10->_optionTitles = (NSArray *)v11;

  v10->_selectedOptionIndex = a5;
  v10->_previousSelectedOptionIndex = a5;
  return v10;
}

- (int64_t)selectedOptionIndex
{
  return self->_selectedOptionIndex;
}

- (int64_t)previousSelectedOptionIndex
{
  return self->_previousSelectedOptionIndex;
}

- (void)_setSelectedOptionIndex:(int64_t)a3
{
  int64_t selectedOptionIndex;

  selectedOptionIndex = self->_selectedOptionIndex;
  if (selectedOptionIndex != a3)
  {
    self->_previousSelectedOptionIndex = selectedOptionIndex;
    self->_selectedOptionIndex = a3;
    (*((void (**)(void))self->__handler + 2))();
  }
}

- (_UIActivityItemCustomizationPicker)initWithCoder:(id)a3
{
  id v4;
  _UIActivityItemCustomizationPicker *v5;
  uint64_t v6;
  NSArray *optionTitles;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityItemCustomizationPicker;
  v5 = -[_UIActivityItemCustomization initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("optionTitles"));
    v6 = objc_claimAutoreleasedReturnValue();
    optionTitles = v5->_optionTitles;
    v5->_optionTitles = (NSArray *)v6;

    v5->_previousSelectedOptionIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("previousSelectedOptionIndex"));
    v5->_selectedOptionIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("selectedOptionIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIActivityItemCustomizationPicker;
  v4 = a3;
  -[_UIActivityItemCustomization encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_optionTitles, CFSTR("optionTitles"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_previousSelectedOptionIndex, CFSTR("previousSelectedOptionIndex"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_selectedOptionIndex, CFSTR("selectedOptionIndex"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UIActivityItemCustomizationPicker *v4;
  _UIActivityItemCustomizationPicker *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  objc_super v15;

  v4 = (_UIActivityItemCustomizationPicker *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v15.receiver = self;
      v15.super_class = (Class)_UIActivityItemCustomizationPicker;
      if (-[_UIActivityItemCustomization isEqual:](&v15, sel_isEqual_, v5)
        && (v6 = -[_UIActivityItemCustomizationPicker previousSelectedOptionIndex](v5, "previousSelectedOptionIndex"),
            v6 == -[_UIActivityItemCustomizationPicker previousSelectedOptionIndex](self, "previousSelectedOptionIndex"))
        && (v7 = -[_UIActivityItemCustomizationPicker selectedOptionIndex](v5, "selectedOptionIndex"),
            v7 == -[_UIActivityItemCustomizationPicker selectedOptionIndex](self, "selectedOptionIndex")))
      {
        -[_UIActivityItemCustomizationPicker _optionTitles](v5, "_optionTitles");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIActivityItemCustomizationPicker _optionTitles](self, "_optionTitles");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
          v13 = 1;
        }
        else if ((v10 == 0) == (v11 != 0))
        {
          v13 = 0;
        }
        else
        {
          v13 = objc_msgSend(v10, "isEqual:", v11);
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (NSArray)_optionTitles
{
  return self->_optionTitles;
}

- (id)_handler
{
  return self->__handler;
}

- (void)_setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__handler, 0);
  objc_storeStrong((id *)&self->_optionTitles, 0);
}

@end
