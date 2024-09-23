@implementation _UIPrototypingValue

- (NSValue)currentValue
{
  NSValue *currentValue;

  currentValue = self->_currentValue;
  if (currentValue)
    return currentValue;
  -[_UIPrototypingValue defaultValue](self, "defaultValue");
  return (NSValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  void (**v8)(void *, const __CFString *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD aBlock[4];
  id v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIPrototypingValue type](self, "type");
  if (v4 > 2)
    v5 = 0;
  else
    v5 = off_1E16E7DB8[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("UIPrototypingValueType"));
  -[_UIPrototypingValue name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("UIPrototypingValueName"));

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47___UIPrototypingValue_dictionaryRepresentation__block_invoke;
  aBlock[3] = &unk_1E16E7D98;
  v7 = v3;
  v18 = v7;
  v8 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  -[_UIPrototypingValue defaultValue](self, "defaultValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, CFSTR("UIPrototypingValueDefaultValue"), v9);

  -[_UIPrototypingValue minimumValue](self, "minimumValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, CFSTR("UIPrototypingValueMinimumValue"), v10);

  -[_UIPrototypingValue maximumValue](self, "maximumValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, CFSTR("UIPrototypingValueMaximumValue"), v11);

  -[_UIPrototypingValue currentValue](self, "currentValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, CFSTR("UIPrototypingValueCurrentValue"), v12);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[_UIPrototypingValue stepSize](self, "stepSize");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, CFSTR("UIPrototypingValueStepSize"), v14);

  v15 = v7;
  return v15;
}

- (_UIPrototypingValue)initWithDictionary:(id)a3
{
  id v4;
  _UIPrototypingValue *v5;
  void *v6;
  _UIPrototypingValue *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueType"));
  v5 = (_UIPrototypingValue *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v18.receiver = self;
      v18.super_class = (Class)_UIPrototypingValue;
      v7 = -[_UIPrototypingValue init](&v18, sel_init);
      if (v7)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueType"));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UIPrototypingValueTypeInteger")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UIPrototypingValueTypeFloat")) & 1) != 0)
        {
          v9 = 1;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("UIPrototypingValueTypeBool")))
        {
          v9 = 2;
        }
        else
        {
          v9 = 0;
        }

        -[_UIPrototypingValue setType:](v7, "setType:", v9);
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPrototypingValue setName:](v7, "setName:", v10);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueDefaultValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPrototypingValue setDefaultValue:](v7, "setDefaultValue:", v11);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueMinimumValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPrototypingValue setMinimumValue:](v7, "setMinimumValue:", v12);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueMaximumValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPrototypingValue setMaximumValue:](v7, "setMaximumValue:", v13);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueCurrentValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPrototypingValue setCurrentValue:](v7, "setCurrentValue:", v14);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UIPrototypingValueStepSize"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        -[_UIPrototypingValue setStepSize:](v7, "setStepSize:", v16);

      }
      self = v7;
      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSValue)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValue, a3);
}

- (NSValue)minimumValue
{
  return self->_minimumValue;
}

- (void)setMinimumValue:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValue, a3);
}

- (NSValue)maximumValue
{
  return self->_maximumValue;
}

- (void)setMaximumValue:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValue, a3);
}

- (void)setCurrentValue:(id)a3
{
  objc_storeStrong((id *)&self->_currentValue, a3);
}

- (double)stepSize
{
  return self->_stepSize;
}

- (void)setStepSize:(double)a3
{
  self->_stepSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
