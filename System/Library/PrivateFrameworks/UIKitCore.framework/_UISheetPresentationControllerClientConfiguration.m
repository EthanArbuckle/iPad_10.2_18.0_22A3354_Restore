@implementation _UISheetPresentationControllerClientConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  CGRect v25;
  CGRect v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[_UISheetPresentationControllerClientConfiguration containsFirstResponder](self, "containsFirstResponder");
    if (v6 != objc_msgSend(v5, "containsFirstResponder"))
      goto LABEL_7;
    v7 = -[_UISheetPresentationControllerClientConfiguration firstResponderRequiresKeyboard](self, "firstResponderRequiresKeyboard");
    if (v7 != objc_msgSend(v5, "firstResponderRequiresKeyboard"))
      goto LABEL_7;
    -[_UISheetPresentationControllerClientConfiguration keyboardFrame](self, "keyboardFrame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "keyboardFrame");
    v26.origin.x = v16;
    v26.origin.y = v17;
    v26.size.width = v18;
    v26.size.height = v19;
    v25.origin.x = v9;
    v25.origin.y = v11;
    v25.size.width = v13;
    v25.size.height = v15;
    if (CGRectEqualToRect(v25, v26))
    {
      -[_UISheetPresentationControllerClientConfiguration proposedDepthLevel](self, "proposedDepthLevel");
      v21 = v20;
      objc_msgSend(v5, "proposedDepthLevel");
      v23 = v21 == v22;
    }
    else
    {
LABEL_7:
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containsFirstResponder);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  NSStringFromSelector(sel_firstResponderRequiresKeyboard);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  NSStringFromSelector(sel_keyboardFrame);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  NSStringFromSelector(sel_proposedDepthLevel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (_UISheetPresentationControllerClientConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UISheetPresentationControllerClientConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerClientConfiguration;
  v5 = -[_UISheetPresentationControllerClientConfiguration init](&v11, sel_init);
  if (v5)
  {
    -[_UISheetPresentationControllerClientConfiguration setContainsFirstResponder:](v5, "setContainsFirstResponder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder")));
    -[_UISheetPresentationControllerClientConfiguration setFirstResponderRequiresKeyboard:](v5, "setFirstResponderRequiresKeyboard:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame")))
    {
      objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"));
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D628];
      v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    -[_UISheetPresentationControllerClientConfiguration setKeyboardFrame:](v5, "setKeyboardFrame:", v6, v7, v8, v9);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel"));
    -[_UISheetPresentationControllerClientConfiguration setProposedDepthLevel:](v5, "setProposedDepthLevel:");
  }

  return v5;
}

- (_UISheetPresentationControllerClientConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UISheetPresentationControllerClientConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISheetPresentationControllerClientConfiguration;
  v5 = -[_UISheetPresentationControllerClientConfiguration init](&v11, sel_init);
  if (v5)
  {
    -[_UISheetPresentationControllerClientConfiguration setContainsFirstResponder:](v5, "setContainsFirstResponder:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder")));
    -[_UISheetPresentationControllerClientConfiguration setFirstResponderRequiresKeyboard:](v5, "setFirstResponderRequiresKeyboard:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame")))
    {
      objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"));
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D628];
      v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v8 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    -[_UISheetPresentationControllerClientConfiguration setKeyboardFrame:](v5, "setKeyboardFrame:", v6, v7, v8, v9);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel"));
    -[_UISheetPresentationControllerClientConfiguration setProposedDepthLevel:](v5, "setProposedDepthLevel:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;
  CGRect v6;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration containsFirstResponder](self, "containsFirstResponder"), CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder"));
  objc_msgSend(v5, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration firstResponderRequiresKeyboard](self, "firstResponderRequiresKeyboard"), CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard"));
  -[_UISheetPresentationControllerClientConfiguration keyboardFrame](self, "keyboardFrame");
  if (!CGRectIsNull(v6))
  {
    -[_UISheetPresentationControllerClientConfiguration keyboardFrame](self, "keyboardFrame");
    objc_msgSend(v5, "encodeCGRect:forKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"));
  }
  -[_UISheetPresentationControllerClientConfiguration proposedDepthLevel](self, "proposedDepthLevel");
  *(float *)&v4 = v4;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel"), v4);

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  CGRect v5;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration containsFirstResponder](self, "containsFirstResponder"), CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyContainsFirstResponder"));
  objc_msgSend(v4, "encodeBool:forKey:", -[_UISheetPresentationControllerClientConfiguration firstResponderRequiresKeyboard](self, "firstResponderRequiresKeyboard"), CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyFirstResponderRequiresKeyboard"));
  -[_UISheetPresentationControllerClientConfiguration keyboardFrame](self, "keyboardFrame");
  if (!CGRectIsNull(v5))
  {
    -[_UISheetPresentationControllerClientConfiguration keyboardFrame](self, "keyboardFrame");
    objc_msgSend(v4, "encodeCGRect:forKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyKeyboardFrame"));
  }
  -[_UISheetPresentationControllerClientConfiguration proposedDepthLevel](self, "proposedDepthLevel");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("_UISheetPresentationControllerClientConfigurationCodingKeyProposedDepthLevel"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BOOL)containsFirstResponder
{
  return self->_containsFirstResponder;
}

- (void)setContainsFirstResponder:(BOOL)a3
{
  self->_containsFirstResponder = a3;
}

- (BOOL)firstResponderRequiresKeyboard
{
  return self->_firstResponderRequiresKeyboard;
}

- (void)setFirstResponderRequiresKeyboard:(BOOL)a3
{
  self->_firstResponderRequiresKeyboard = a3;
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (double)proposedDepthLevel
{
  return self->_proposedDepthLevel;
}

- (void)setProposedDepthLevel:(double)a3
{
  self->_proposedDepthLevel = a3;
}

@end
