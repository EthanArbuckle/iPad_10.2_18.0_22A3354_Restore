@implementation WFShortcutSuggestionsDescriptor

- (WFShortcutSuggestionsDescriptor)initWithIdentifier:(id)a3 suggestions:(id)a4 availability:(unint64_t)a5
{
  id v8;
  WFShortcutSuggestionsDescriptor *v9;
  uint64_t v10;
  NSArray *suggestions;
  WFShortcutSuggestionsDescriptor *v12;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WFShortcutSuggestionsDescriptor;
  v9 = -[WFShortcutSuggestionsDescriptor initWithIdentifier:objectType:](&v14, sel_initWithIdentifier_objectType_, a3, 6);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    suggestions = v9->_suggestions;
    v9->_suggestions = (NSArray *)v10;

    v9->_availability = a5;
    v12 = v9;
  }

  return v9;
}

- (WFShortcutSuggestionsDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFShortcutSuggestionsDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *suggestions;
  WFShortcutSuggestionsDescriptor *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFShortcutSuggestionsDescriptor;
  v5 = -[WFShortcutSuggestionsDescriptor initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("suggestions"));
    v9 = objc_claimAutoreleasedReturnValue();
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v9;

    v5->_availability = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("availability"));
    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFShortcutSuggestionsDescriptor;
  v4 = a3;
  -[WFShortcutSuggestionsDescriptor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFShortcutSuggestionsDescriptor suggestions](self, "suggestions", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("suggestions"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFShortcutSuggestionsDescriptor availability](self, "availability"), CFSTR("availability"));
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (unint64_t)availability
{
  return self->_availability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
