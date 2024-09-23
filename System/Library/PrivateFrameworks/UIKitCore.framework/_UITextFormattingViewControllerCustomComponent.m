@implementation _UITextFormattingViewControllerCustomComponent

- (_UITextFormattingViewControllerCustomComponent)initWithComponentKey:(id)a3 preferredSize:(int64_t)a4 title:(id)a5 accessibilityHint:(id)a6 systemImageName:(id)a7
{
  id v13;
  id v14;
  id v15;
  _UITextFormattingViewControllerCustomComponent *v16;
  _UITextFormattingViewControllerCustomComponent *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_UITextFormattingViewControllerCustomComponent;
  v16 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:](&v19, sel_initWithComponentKey_preferredSize_, a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_title, a5);
    objc_storeStrong((id *)&v17->_accessibilityHint, a6);
    objc_storeStrong((id *)&v17->_systemImageName, a7);
  }

  return v17;
}

- (_UITextFormattingViewControllerCustomComponent)initWithComponentKey:(id)a3 preferredSize:(int64_t)a4 title:(id)a5 accessibilityHint:(id)a6 systemImageName:(id)a7 subcomponents:(id)a8
{
  id v15;
  _UITextFormattingViewControllerCustomComponent *v16;
  _UITextFormattingViewControllerCustomComponent *v17;

  v15 = a8;
  v16 = -[_UITextFormattingViewControllerCustomComponent initWithComponentKey:preferredSize:title:accessibilityHint:systemImageName:](self, "initWithComponentKey:preferredSize:title:accessibilityHint:systemImageName:", a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->__subcomponents, a8);

  return v17;
}

- (_UITextFormattingViewControllerCustomComponent)initWithComponentKey:(id)a3 preferredSize:(int64_t)a4 title:(id)a5 accessibilityHint:(id)a6 systemImageName:(id)a7 textAnimationName:(id)a8
{
  id v15;
  _UITextFormattingViewControllerCustomComponent *v16;
  _UITextFormattingViewControllerCustomComponent *v17;

  v15 = a8;
  v16 = -[_UITextFormattingViewControllerCustomComponent initWithComponentKey:preferredSize:title:accessibilityHint:systemImageName:](self, "initWithComponentKey:preferredSize:title:accessibilityHint:systemImageName:", a3, a4, a5, a6, a7);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->__textAnimationName, a8);

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize");
  -[_UITextFormattingViewControllerCustomComponent title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextFormattingViewControllerCustomComponent accessibilityHint](self, "accessibilityHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextFormattingViewControllerCustomComponent systemImageName](self, "systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)objc_msgSend(v5, "initWithComponentKey:preferredSize:title:accessibilityHint:systemImageName:", v6, v7, v8, v9, v10);

  v12 = -[NSArray copyWithZone:](self->__subcomponents, "copyWithZone:", a3);
  v13 = (void *)v11[6];
  v11[6] = v12;

  v14 = -[NSString copyWithZone:](self->__textAnimationName, "copyWithZone:", a3);
  v15 = (void *)v11[7];
  v11[7] = v14;

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  _UITextFormattingViewControllerCustomComponent *v4;
  _UITextFormattingViewControllerCustomComponent *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = (_UITextFormattingViewControllerCustomComponent *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerComponent componentKey](v5, "componentKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7
        && (v8 = -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize"),
            v8 == -[UITextFormattingViewControllerComponent preferredSize](v5, "preferredSize")))
      {
        -[_UITextFormattingViewControllerCustomComponent title](self, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UITextFormattingViewControllerCustomComponent title](v5, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[_UITextFormattingViewControllerCustomComponent accessibilityHint](self, "accessibilityHint");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UITextFormattingViewControllerCustomComponent accessibilityHint](v5, "accessibilityHint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v12))
          {
            -[_UITextFormattingViewControllerCustomComponent systemImageName](self, "systemImageName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITextFormattingViewControllerCustomComponent systemImageName](v5, "systemImageName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v13;
            if (objc_msgSend(v13, "isEqualToString:", v23))
            {
              -[_UITextFormattingViewControllerCustomComponent _subcomponents](self, "_subcomponents");
              v14 = objc_claimAutoreleasedReturnValue();
              -[_UITextFormattingViewControllerCustomComponent _subcomponents](v5, "_subcomponents");
              v15 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v14;
              v16 = (void *)v14;
              v17 = (void *)v15;
              if (objc_msgSend(v16, "isEqualToArray:", v15))
              {
                -[_UITextFormattingViewControllerCustomComponent _textAnimationName](self, "_textAnimationName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UITextFormattingViewControllerCustomComponent _textAnimationName](v5, "_textAnimationName");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v21, "isEqualToString:", v20);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize") ^ v4;
  -[_UITextFormattingViewControllerCustomComponent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[_UITextFormattingViewControllerCustomComponent accessibilityHint](self, "accessibilityHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[_UITextFormattingViewControllerCustomComponent systemImageName](self, "systemImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[_UITextFormattingViewControllerCustomComponent _subcomponents](self, "_subcomponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[_UITextFormattingViewControllerCustomComponent _textAnimationName](self, "_textAnimationName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UITextFormattingViewControllerComponent componentKey](self, "componentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_ComponentKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UITextFormattingViewControllerComponent preferredSize](self, "preferredSize"), CFSTR("_PreferredSize"));
  -[_UITextFormattingViewControllerCustomComponent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_Title"));

  -[_UITextFormattingViewControllerCustomComponent accessibilityHint](self, "accessibilityHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("_AccessibilityHint"));

  -[_UITextFormattingViewControllerCustomComponent systemImageName](self, "systemImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("_SystemImageName"));

  -[_UITextFormattingViewControllerCustomComponent _subcomponents](self, "_subcomponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_Subcomponents"));

  -[_UITextFormattingViewControllerCustomComponent _textAnimationName](self, "_textAnimationName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("_TextAnimationNameCodingKey"));

}

- (_UITextFormattingViewControllerCustomComponent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UITextFormattingViewControllerCustomComponent *v9;
  void *v10;
  uint64_t v11;
  NSString *title;
  void *v13;
  uint64_t v14;
  NSString *accessibilityHint;
  void *v16;
  uint64_t v17;
  NSString *systemImageName;
  void *v19;
  uint64_t v20;
  NSArray *subcomponents;
  void *v22;
  uint64_t v23;
  NSString *textAnimationName;

  v4 = a3;
  _UITextFormattingViewControllerCustomComponentClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("_ComponentKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _UITextFormattingViewControllerCustomComponentClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("_PreferredSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:](self, "initWithComponentKey:preferredSize:", v6, v8);
  if (v9)
  {
    _UITextFormattingViewControllerCustomComponentClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_Title"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v11;

    _UITextFormattingViewControllerCustomComponentClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_AccessibilityHint"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessibilityHint = v9->_accessibilityHint;
    v9->_accessibilityHint = (NSString *)v14;

    _UITextFormattingViewControllerCustomComponentClasses();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_SystemImageName"));
    v17 = objc_claimAutoreleasedReturnValue();
    systemImageName = v9->_systemImageName;
    v9->_systemImageName = (NSString *)v17;

    _UITextFormattingViewControllerCustomComponentClasses();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_Subcomponents"));
    v20 = objc_claimAutoreleasedReturnValue();
    subcomponents = v9->__subcomponents;
    v9->__subcomponents = (NSArray *)v20;

    _UITextFormattingViewControllerCustomComponentClasses();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("_TextAnimationNameCodingKey"));
    v23 = objc_claimAutoreleasedReturnValue();
    textAnimationName = v9->__textAnimationName;
    v9->__textAnimationName = (NSString *)v23;

  }
  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)accessibilityHint
{
  return self->_accessibilityHint;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSArray)_subcomponents
{
  return self->__subcomponents;
}

- (NSString)_textAnimationName
{
  return self->__textAnimationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textAnimationName, 0);
  objc_storeStrong((id *)&self->__subcomponents, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_accessibilityHint, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
