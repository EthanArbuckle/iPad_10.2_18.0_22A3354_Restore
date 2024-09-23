@implementation TUIInputModeSwitcherAccessory

- (TUIInputModeSwitcherAccessory)initWithInputSourceIDs:(id)a3 selectedIndex:(int64_t)a4
{
  id v6;
  TUIInputModeSwitcherAccessory *v7;
  TUIInputModeSwitcherAccessory *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIInputModeSwitcherAccessory;
  v7 = -[TUICursorAccessory initWithIdentifier:actionHandler:](&v10, sel_initWithIdentifier_actionHandler_, 0, 0);
  v8 = v7;
  if (v7)
  {
    -[TUIInputModeSwitcherAccessory setInputSourceIDs:](v7, "setInputSourceIDs:", v6);
    -[TUIInputModeSwitcherAccessory setSelectedIndex:](v8, "setSelectedIndex:", a4);
    -[TUIInputModeSwitcherAccessory setIsInputSource:](v8, "setIsInputSource:", 1);
  }

  return v8;
}

- (TUIInputModeSwitcherAccessory)initWithLanguages:(id)a3 selectedIndex:(int64_t)a4 actionHandler:(id)a5
{
  id v8;
  TUIInputModeSwitcherAccessory *v9;
  TUIInputModeSwitcherAccessory *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIInputModeSwitcherAccessory;
  v9 = -[TUICursorAccessory initWithIdentifier:actionHandler:](&v12, sel_initWithIdentifier_actionHandler_, 0, a5);
  v10 = v9;
  if (v9)
  {
    -[TUIInputModeSwitcherAccessory setInputSourceIDs:](v9, "setInputSourceIDs:", v8);
    -[TUIInputModeSwitcherAccessory setSelectedIndex:](v10, "setSelectedIndex:", a4);
    -[TUIInputModeSwitcherAccessory setIsInputSource:](v10, "setIsInputSource:", 0);
  }

  return v10;
}

- (TUIInputModeSwitcherAccessory)initWithCoder:(id)a3
{
  id v4;
  TUIInputModeSwitcherAccessory *v5;
  uint64_t v6;
  NSArray *inputSourceIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIInputModeSwitcherAccessory;
  v5 = -[TUICursorAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("TUInputSourceIDsCodingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputSourceIDs = v5->_inputSourceIDs;
    v5->_inputSourceIDs = (NSArray *)v6;

    v5->_selectedIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TUSelectedIndexCodingKey"));
    v5->_isInputSource = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("TUSIsInputSourceCodingKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIInputModeSwitcherAccessory;
  v4 = a3;
  -[TUICursorAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputSourceIDs, CFSTR("TUInputSourceIDsCodingKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_selectedIndex, CFSTR("TUSelectedIndexCodingKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isInputSource, CFSTR("TUSIsInputSourceCodingKey"));

}

- (BOOL)isEqual:(id)a3
{
  TUIInputModeSwitcherAccessory *v4;
  TUIInputModeSwitcherAccessory *v5;
  TUIInputModeSwitcherAccessory *v6;
  BOOL v7;
  objc_super v9;

  v4 = (TUIInputModeSwitcherAccessory *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v7 = 1;
    }
    else
    {
      v6 = v4;
      v9.receiver = self;
      v9.super_class = (Class)TUIInputModeSwitcherAccessory;
      v7 = -[TUICursorAccessory isEqual:](&v9, sel_isEqual_, v6)
        && -[NSArray isEqualToArray:](self->_inputSourceIDs, "isEqualToArray:", v6->_inputSourceIDs)
        && self->_selectedIndex == v6->_selectedIndex
        && self->_isInputSource == v6->_isInputSource;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)additionalComponents
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIInputModeSwitcherAccessory;
  -[TUICursorAccessory additionalComponents](&v9, sel_additionalComponents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_inputSourceIDs)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputSourceIDs = %@"), self->_inputSourceIDs);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("selectedIndex = %ld"), self->_selectedIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  if (self->_isInputSource)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("isInputSource = %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIInputModeSwitcherAccessory;
  v3 = 257 * -[TUICursorAccessory hash](&v8, sel_hash);
  -[TUIInputModeSwitcherAccessory inputSourceIDs](self, "inputSourceIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  v6 = 257 * (257 * v5 + -[TUIInputModeSwitcherAccessory selectedIndex](self, "selectedIndex"));
  return v6 + -[TUIInputModeSwitcherAccessory isInputSource](self, "isInputSource");
}

- (NSArray)inputSourceIDs
{
  return self->_inputSourceIDs;
}

- (void)setInputSourceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_inputSourceIDs, a3);
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (BOOL)isInputSource
{
  return self->_isInputSource;
}

- (void)setIsInputSource:(BOOL)a3
{
  self->_isInputSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSourceIDs, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
