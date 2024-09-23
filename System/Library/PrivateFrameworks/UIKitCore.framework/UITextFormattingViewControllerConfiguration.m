@implementation UITextFormattingViewControllerConfiguration

+ (id)_forTextAnimationsUIWithSupportedAnimationNames:(id)a3 titles:(id)a4 accessibilityHints:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  id v8;

  v6 = (uint64_t)a4;
  if (a3)
  {
    v7 = sub_186507654();
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = 0;
  if (a4)
LABEL_3:
    v6 = sub_1865073A8();
LABEL_4:
  if (a5)
    a5 = (id)sub_1865073A8();
  v8 = sub_18566BEC4(v7, v6, (uint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (UITextFormattingViewControllerConfiguration)init
{
  UITextFormattingViewControllerConfiguration *v2;
  UITextFormattingViewControllerConfiguration *v3;
  UITextFormattingViewControllerComponentGroup *v4;
  UITextFormattingViewControllerComponentGroup *v5;
  UITextFormattingViewControllerComponent *v6;
  UITextFormattingViewControllerComponent *v7;
  UITextFormattingViewControllerComponent *v8;
  UITextFormattingViewControllerComponent *v9;
  UITextFormattingViewControllerComponent *v10;
  UITextFormattingViewControllerComponent *v11;
  void *v12;
  UITextFormattingViewControllerComponentGroup *v13;
  uint64_t v14;
  NSArray *groups;
  UITextFormattingViewControllerComponent *v17;
  UITextFormattingViewControllerComponentGroup *v18;
  void *v19;
  UITextFormattingViewControllerComponent *v20;
  objc_super v21;
  _QWORD v22[7];
  UITextFormattingViewControllerComponent *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)UITextFormattingViewControllerConfiguration;
  v2 = -[UITextFormattingViewControllerConfiguration init](&v21, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UITextFormattingViewControllerConfiguration set_preferringDimmingVisible:](v2, "set_preferringDimmingVisible:", 1);
    -[UITextFormattingViewControllerConfiguration set_allowContentToScroll:](v3, "set_allowContentToScroll:", 1);
    -[UITextFormattingViewControllerConfiguration set_includeDefaultFont:](v3, "set_includeDefaultFont:", 0);
    v4 = [UITextFormattingViewControllerComponentGroup alloc];
    v20 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerFormattingStylesComponent"), 5);
    v23 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[UITextFormattingViewControllerComponentGroup initWithComponents:](v4, "initWithComponents:", v19);
    v24[0] = v18;
    v5 = [UITextFormattingViewControllerComponentGroup alloc];
    v17 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerFontAttributesComponent"), 5);
    v22[0] = v17;
    v6 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerTextColorComponent"), 1);
    v22[1] = v6;
    v7 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerFontPickerComponent"), 3);
    v22[2] = v7;
    v8 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerFontSizeComponent"), 2);
    v22[3] = v8;
    v9 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerHighlightComponent"), 1);
    v22[4] = v9;
    v10 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerTextAlignmentComponent"), 3);
    v22[5] = v10;
    v11 = -[UITextFormattingViewControllerComponent initWithComponentKey:preferredSize:]([UITextFormattingViewControllerComponent alloc], "initWithComponentKey:preferredSize:", CFSTR("UITextFormattingViewControllerListStylesComponent"), 3);
    v22[6] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UITextFormattingViewControllerComponentGroup initWithComponents:](v5, "initWithComponents:", v12);
    v24[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v14 = objc_claimAutoreleasedReturnValue();
    groups = v3->_groups;
    v3->_groups = (NSArray *)v14;

  }
  return v3;
}

- (UITextFormattingViewControllerConfiguration)initWithGroups:(id)a3
{
  id v5;
  UITextFormattingViewControllerConfiguration *v6;
  UITextFormattingViewControllerConfiguration *v7;

  v5 = a3;
  v6 = -[UITextFormattingViewControllerConfiguration init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[UITextFormattingViewControllerConfiguration set_preferringDimmingVisible:](v6, "set_preferringDimmingVisible:", 1);
    -[UITextFormattingViewControllerConfiguration set_allowContentToScroll:](v7, "set_allowContentToScroll:", 1);
    -[UITextFormattingViewControllerConfiguration set_includeDefaultFont:](v7, "set_includeDefaultFont:", 0);
    objc_storeStrong((id *)&v7->_groups, a3);
  }

  return v7;
}

- (BOOL)_isTextAnimationsConfiguration
{
  return self->__textAnimationsConfiguration;
}

- (BOOL)_isTextViewConfiguration
{
  return self->__textViewConfiguration;
}

- (BOOL)_isUsingReducedMetrics
{
  return self->__useReducedMetrics;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UITextFormattingViewControllerConfiguration fontPickerConfiguration](self, "fontPickerConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setFontPickerConfiguration:", v5);

  objc_msgSend((id)v4, "set_preferringDimmingVisible:", -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible"));
  objc_msgSend((id)v4, "set_allowContentToScroll:", -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll"));
  objc_msgSend((id)v4, "set_includeDefaultFont:", -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"));
  objc_msgSend((id)v4, "_setHasPopoverPresentation:", -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation"));
  objc_msgSend((id)v4, "_setUseLandscapeLayout:", -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"));
  objc_msgSend((id)v4, "_setHasParentViewController:", -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController"));
  -[UITextFormattingViewControllerConfiguration formattingStyles](self, "formattingStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v7;

  -[UITextFormattingViewControllerConfiguration _emphasisStyles](self, "_emphasisStyles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v10;

  -[UITextFormattingViewControllerConfiguration groups](self, "groups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  v14 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v13;

  *(_BYTE *)(v4 + 8) = -[UITextFormattingViewControllerConfiguration _textAnimationsConfiguration](self, "_textAnimationsConfiguration");
  *(_BYTE *)(v4 + 9) = -[UITextFormattingViewControllerConfiguration _textViewConfiguration](self, "_textViewConfiguration");
  *(_BYTE *)(v4 + 10) = -[UITextFormattingViewControllerConfiguration _useReducedMetrics](self, "_useReducedMetrics");
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  UITextFormattingViewControllerConfiguration *v4;
  UITextFormattingViewControllerConfiguration *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  void *v27;

  v4 = (UITextFormattingViewControllerConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextFormattingViewControllerConfiguration fontPickerConfiguration](self, "fontPickerConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerConfiguration fontPickerConfiguration](v5, "fontPickerConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7)
        && (v8 = -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible"), v8 == -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](v5, "_preferringDimmingVisible"))&& (v9 = -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll"), v9 == -[UITextFormattingViewControllerConfiguration _allowContentToScroll](v5, "_allowContentToScroll"))&& (v10 = -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), v10 == -[UITextFormattingViewControllerConfiguration _includeDefaultFont](v5, "_includeDefaultFont"))&& (v11 = -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation"), v11 == -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](v5, "_hasPopoverPresentation"))&& (v12 = -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"), v12 == -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](v5, "_useLandscapeLayout"))&& (v13 = -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController"), v13 == -[UITextFormattingViewControllerConfiguration _hasParentViewController](
                     v5,
                     "_hasParentViewController")))
      {
        -[UITextFormattingViewControllerConfiguration formattingStyles](self, "formattingStyles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextFormattingViewControllerConfiguration formattingStyles](v5, "formattingStyles");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToArray:", v17))
        {
          -[UITextFormattingViewControllerConfiguration _emphasisStyles](self, "_emphasisStyles");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextFormattingViewControllerConfiguration _emphasisStyles](v5, "_emphasisStyles");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEqualToArray:", v19))
          {
            -[UITextFormattingViewControllerConfiguration groups](self, "groups");
            v20 = objc_claimAutoreleasedReturnValue();
            -[UITextFormattingViewControllerConfiguration groups](v5, "groups");
            v21 = objc_claimAutoreleasedReturnValue();
            v27 = (void *)v20;
            v22 = (void *)v20;
            v23 = (void *)v21;
            if (objc_msgSend(v22, "isEqualToArray:", v21)
              && (v25 = -[UITextFormattingViewControllerConfiguration _textAnimationsConfiguration](self, "_textAnimationsConfiguration"), v25 == -[UITextFormattingViewControllerConfiguration _textAnimationsConfiguration](v5, "_textAnimationsConfiguration"))&& (v26 = -[UITextFormattingViewControllerConfiguration _textViewConfiguration](self, "_textViewConfiguration"), v26 == -[UITextFormattingViewControllerConfiguration _textViewConfiguration](v5, "_textViewConfiguration")))
            {
              v24 = -[UITextFormattingViewControllerConfiguration _useReducedMetrics](self, "_useReducedMetrics");
              v14 = v24 ^ -[UITextFormattingViewControllerConfiguration _useReducedMetrics](v5, "_useReducedMetrics") ^ 1;
            }
            else
            {
              LOBYTE(v14) = 0;
            }

          }
          else
          {
            LOBYTE(v14) = 0;
          }

        }
        else
        {
          LOBYTE(v14) = 0;
        }

      }
      else
      {
        LOBYTE(v14) = 0;
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  -[UITextFormattingViewControllerConfiguration fontPickerConfiguration](self, "fontPickerConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v20, "hash");
  v18 = -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible");
  v17 = -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll");
  v16 = -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont");
  v15 = -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation");
  v3 = -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout");
  v4 = -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController");
  v5 = -[UITextFormattingViewControllerConfiguration _textAnimationsConfiguration](self, "_textAnimationsConfiguration");
  v6 = -[UITextFormattingViewControllerConfiguration _textViewConfiguration](self, "_textViewConfiguration");
  v7 = -[UITextFormattingViewControllerConfiguration _useReducedMetrics](self, "_useReducedMetrics");
  -[UITextFormattingViewControllerConfiguration formattingStyles](self, "formattingStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[UITextFormattingViewControllerConfiguration _emphasisStyles](self, "_emphasisStyles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[UITextFormattingViewControllerConfiguration groups](self, "groups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v9 ^ v11 ^ objc_msgSend(v12, "hash") ^ 8;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UITextFormattingViewControllerConfiguration fontPickerConfiguration](self, "fontPickerConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("_FontPickerConfiguration"));

  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _preferringDimmingVisible](self, "_preferringDimmingVisible"), CFSTR("_PreferringDimmingVisible"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _allowContentToScroll](self, "_allowContentToScroll"), CFSTR("_AllowContentToScroll"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), CFSTR("_IncludeDefaultFont"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _hasPopoverPresentation](self, "_hasPopoverPresentation"), CFSTR("_HasPopoverPresentation"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _useLandscapeLayout](self, "_useLandscapeLayout"), CFSTR("_UseLandscapeLayout"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _hasParentViewController](self, "_hasParentViewController"), CFSTR("_HasParentViewController"));
  -[UITextFormattingViewControllerConfiguration formattingStyles](self, "formattingStyles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("_FormattingStyles"));

  -[UITextFormattingViewControllerConfiguration _emphasisStyles](self, "_emphasisStyles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("_EmphasisStyles"));

  -[UITextFormattingViewControllerConfiguration groups](self, "groups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("_Groups"));

  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _textAnimationsConfiguration](self, "_textAnimationsConfiguration"), CFSTR("_TextAnimationsConfiguration"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _textViewConfiguration](self, "_textViewConfiguration"), CFSTR("_TextViewConfiguration"));
  objc_msgSend(v8, "encodeBool:forKey:", -[UITextFormattingViewControllerConfiguration _useReducedMetrics](self, "_useReducedMetrics"), CFSTR("_UseReducedMetrics"));

}

- (UITextFormattingViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewControllerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *groups;

  v4 = a3;
  v5 = -[UITextFormattingViewControllerConfiguration init](self, "init");
  if (v5)
  {
    _UITextFormattingViewControllerConfigurationClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_FontPickerConfiguration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerConfiguration setFontPickerConfiguration:](v5, "setFontPickerConfiguration:", v7);

    -[UITextFormattingViewControllerConfiguration set_preferringDimmingVisible:](v5, "set_preferringDimmingVisible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_PreferringDimmingVisible")));
    -[UITextFormattingViewControllerConfiguration set_allowContentToScroll:](v5, "set_allowContentToScroll:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_AllowContentToScroll")));
    -[UITextFormattingViewControllerConfiguration set_includeDefaultFont:](v5, "set_includeDefaultFont:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_IncludeDefaultFont")));
    -[UITextFormattingViewControllerConfiguration _setHasPopoverPresentation:](v5, "_setHasPopoverPresentation:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_HasPopoverPresentation")));
    -[UITextFormattingViewControllerConfiguration _setUseLandscapeLayout:](v5, "_setUseLandscapeLayout:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UseLandscapeLayout")));
    -[UITextFormattingViewControllerConfiguration _setHasParentViewController:](v5, "_setHasParentViewController:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_HasParentViewController")));
    _UITextFormattingViewControllerConfigurationClasses();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_FormattingStyles"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerConfiguration setFormattingStyles:](v5, "setFormattingStyles:", v9);

    _UITextFormattingViewControllerConfigurationClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_EmphasisStyles"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextFormattingViewControllerConfiguration set_emphasisStyles:](v5, "set_emphasisStyles:", v11);

    _UITextFormattingViewControllerConfigurationClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_Groups"));
    v13 = objc_claimAutoreleasedReturnValue();
    groups = v5->_groups;
    v5->_groups = (NSArray *)v13;

    v5->__textAnimationsConfiguration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_TextAnimationsConfiguration"));
    v5->__textViewConfiguration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_TextViewConfiguration"));
    v5->__useReducedMetrics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UseReducedMetrics"));
  }

  return v5;
}

- (NSArray)groups
{
  return self->_groups;
}

- (NSArray)formattingStyles
{
  return self->_formattingStyles;
}

- (void)setFormattingStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIFontPickerViewControllerConfiguration)fontPickerConfiguration
{
  return self->_fontPickerConfiguration;
}

- (void)setFontPickerConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)_textAnimationsConfiguration
{
  return self->__textAnimationsConfiguration;
}

- (void)set_textAnimationsConfiguration:(BOOL)a3
{
  self->__textAnimationsConfiguration = a3;
}

- (BOOL)_textViewConfiguration
{
  return self->__textViewConfiguration;
}

- (void)set_textViewConfiguration:(BOOL)a3
{
  self->__textViewConfiguration = a3;
}

- (BOOL)_useReducedMetrics
{
  return self->__useReducedMetrics;
}

- (void)set_useReducedMetrics:(BOOL)a3
{
  self->__useReducedMetrics = a3;
}

- (BOOL)_hasPopoverPresentation
{
  return self->__hasPopoverPresentation;
}

- (void)_setHasPopoverPresentation:(BOOL)a3
{
  self->__hasPopoverPresentation = a3;
}

- (BOOL)_useLandscapeLayout
{
  return self->__useLandscapeLayout;
}

- (void)_setUseLandscapeLayout:(BOOL)a3
{
  self->__useLandscapeLayout = a3;
}

- (BOOL)_hasParentViewController
{
  return self->__hasParentViewController;
}

- (void)_setHasParentViewController:(BOOL)a3
{
  self->__hasParentViewController = a3;
}

- (BOOL)_preferringDimmingVisible
{
  return self->__preferringDimmingVisible;
}

- (void)set_preferringDimmingVisible:(BOOL)a3
{
  self->__preferringDimmingVisible = a3;
}

- (BOOL)_allowContentToScroll
{
  return self->__allowContentToScroll;
}

- (void)set_allowContentToScroll:(BOOL)a3
{
  self->__allowContentToScroll = a3;
}

- (BOOL)_includeDefaultFont
{
  return self->__includeDefaultFont;
}

- (void)set_includeDefaultFont:(BOOL)a3
{
  self->__includeDefaultFont = a3;
}

- (NSArray)_emphasisStyles
{
  return self->__emphasisStyles;
}

- (void)set_emphasisStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__emphasisStyles, 0);
  objc_storeStrong((id *)&self->_fontPickerConfiguration, 0);
  objc_storeStrong((id *)&self->_formattingStyles, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end
