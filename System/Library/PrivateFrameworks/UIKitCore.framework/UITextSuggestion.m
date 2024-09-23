@implementation UITextSuggestion

- (UITextSuggestion)init
{
  UITextSuggestion *v2;
  NSUUID *v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextSuggestion;
  v2 = -[UITextSuggestion init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v2->_uuid;
    v2->_uuid = v3;

  }
  return v2;
}

- (UITextSuggestion)initWithInputText:(id)a3 searchText:(id)a4 displayText:(id)a5 headerText:(id)a6 customInfoType:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  UITextSuggestion *v16;
  NSUUID *v17;
  NSUUID *uuid;
  uint64_t v19;
  NSString *inputText;
  uint64_t v21;
  NSString *searchText;
  uint64_t v23;
  NSString *displayText;
  uint64_t v25;
  NSString *headerText;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v28.receiver = self;
  v28.super_class = (Class)UITextSuggestion;
  v16 = -[UITextSuggestion init](&v28, sel_init);
  if (v16)
  {
    v17 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    uuid = v16->_uuid;
    v16->_uuid = v17;

    v19 = objc_msgSend(v12, "copy");
    inputText = v16->_inputText;
    v16->_inputText = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    searchText = v16->_searchText;
    v16->_searchText = (NSString *)v21;

    v23 = objc_msgSend(v14, "copy");
    displayText = v16->_displayText;
    v16->_displayText = (NSString *)v23;

    v25 = objc_msgSend(v15, "copy");
    headerText = v16->_headerText;
    v16->_headerText = (NSString *)v25;

    v16->_customInfoType = a7;
  }

  return v16;
}

+ (id)textSuggestionWithInputText:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputText:searchText:displayText:headerText:customInfoType:", v4, v4, v4, 0, 0);

  return v5;
}

+ (id)textSuggestionWithInputText:(id)a3 searchText:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputText:searchText:displayText:headerText:customInfoType:", v7, v6, v7, 0, 0);

  return v8;
}

+ (id)textSuggestionWithInputText:(id)a3 searchText:(id)a4 customInfoType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputText:searchText:displayText:headerText:customInfoType:", v9, v8, v9, 0, a5);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UITextSuggestion *v4;
  uint64_t v5;
  NSUUID *uuid;
  uint64_t v7;
  NSString *inputText;
  uint64_t v9;
  NSString *searchText;
  uint64_t v11;
  NSString *displayText;
  uint64_t v13;
  NSString *headerText;
  uint64_t v15;
  UIImage *image;
  uint64_t v17;
  UIColor *foregroundColor;
  uint64_t v19;
  UIColor *backgroundColor;

  v4 = objc_alloc_init(UITextSuggestion);
  v5 = -[NSUUID copy](self->_uuid, "copy");
  uuid = v4->_uuid;
  v4->_uuid = (NSUUID *)v5;

  v7 = -[NSString copy](self->_inputText, "copy");
  inputText = v4->_inputText;
  v4->_inputText = (NSString *)v7;

  v9 = -[NSString copy](self->_searchText, "copy");
  searchText = v4->_searchText;
  v4->_searchText = (NSString *)v9;

  v11 = -[NSString copy](self->_displayText, "copy");
  displayText = v4->_displayText;
  v4->_displayText = (NSString *)v11;

  v13 = -[NSString copy](self->_headerText, "copy");
  headerText = v4->_headerText;
  v4->_headerText = (NSString *)v13;

  v4->_displayStylePlain = self->_displayStylePlain;
  v15 = -[UIImage copy](self->_image, "copy");
  image = v4->_image;
  v4->_image = (UIImage *)v15;

  v17 = -[UIColor copy](self->_foregroundColor, "copy");
  foregroundColor = v4->_foregroundColor;
  v4->_foregroundColor = (UIColor *)v17;

  v19 = -[UIColor copy](self->_backgroundColor, "copy");
  backgroundColor = v4->_backgroundColor;
  v4->_backgroundColor = (UIColor *)v19;

  v4->_canDisplayInline = self->_canDisplayInline;
  v4->_customInfoType = self->_customInfoType;
  return v4;
}

- (TIKeyboardCandidate)_keyboardCandidate
{
  return (TIKeyboardCandidate *)+[TIKeyboardCandidateSuggestion candidateWithSuggestion:customInfoType:](TIKeyboardCandidateSuggestion, "candidateWithSuggestion:customInfoType:", self, -[UITextSuggestion customInfoType](self, "customInfoType"));
}

+ (id)classFallbacksForKeyedArchiver
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("UITextSuggestion"), 0);
}

+ (id)encodeTextSuggestions:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
}

+ (id)decodeTextSuggestions:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    v4 = a3;
    v5 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v10;
    if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to decode UITextSuggestions with error: %@", buf, 0xCu);
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  -[UITextSuggestion uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("uuid"));

  -[UITextSuggestion inputText](self, "inputText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UITextSuggestion inputText](self, "inputText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("inputText"));

  }
  -[UITextSuggestion searchText](self, "searchText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UITextSuggestion searchText](self, "searchText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("searchText"));

  }
  -[UITextSuggestion displayText](self, "displayText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UITextSuggestion displayText](self, "displayText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("displayText"));

  }
  -[UITextSuggestion headerText](self, "headerText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UITextSuggestion headerText](self, "headerText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("headerText"));

  }
  objc_msgSend(v21, "encodeBool:forKey:", -[UITextSuggestion displayStylePlain](self, "displayStylePlain"), CFSTR("displayStylePlain"));
  -[UITextSuggestion image](self, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UITextSuggestion image](self, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("image"));

  }
  -[UITextSuggestion foregroundColor](self, "foregroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UITextSuggestion foregroundColor](self, "foregroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("foregroundColor"));

  }
  -[UITextSuggestion backgroundColor](self, "backgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[UITextSuggestion backgroundColor](self, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("backgroundColor"));

  }
  if (-[UITextSuggestion canDisplayInline](self, "canDisplayInline"))
    objc_msgSend(v21, "encodeBool:forKey:", -[UITextSuggestion canDisplayInline](self, "canDisplayInline"), CFSTR("canDisplayInline"));
  v19 = -[UITextSuggestion customInfoType](self, "customInfoType");
  v20 = v21;
  if (v19)
  {
    objc_msgSend(v21, "encodeInt64:forKey:", -[UITextSuggestion customInfoType](self, "customInfoType"), CFSTR("customInfoType"));
    v20 = v21;
  }

}

- (UITextSuggestion)initWithCoder:(id)a3
{
  id v4;
  UITextSuggestion *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UITextSuggestion;
  v5 = -[UITextSuggestion init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputText"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setInputText:](v5, "setInputText:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setSearchText:](v5, "setSearchText:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setDisplayText:](v5, "setDisplayText:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerText"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setHeaderText:](v5, "setHeaderText:", v11);

    -[UITextSuggestion setDisplayStylePlain:](v5, "setDisplayStylePlain:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayStylePlain")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setImage:](v5, "setImage:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundColor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setForegroundColor:](v5, "setForegroundColor:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSuggestion setBackgroundColor:](v5, "setBackgroundColor:", v14);

    -[UITextSuggestion setCanDisplayInline:](v5, "setCanDisplayInline:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canDisplayInline")));
    -[UITextSuggestion setCustomInfoType:](v5, "setCustomInfoType:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("customInfoType")));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)inputText
{
  return self->_inputText;
}

- (void)setInputText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)displayStylePlain
{
  return self->_displayStylePlain;
}

- (void)setDisplayStylePlain:(BOOL)a3
{
  self->_displayStylePlain = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)canDisplayInline
{
  return self->_canDisplayInline;
}

- (void)setCanDisplayInline:(BOOL)a3
{
  self->_canDisplayInline = a3;
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

- (void)setCustomInfoType:(unint64_t)a3
{
  self->_customInfoType = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_inputText, 0);
}

@end
