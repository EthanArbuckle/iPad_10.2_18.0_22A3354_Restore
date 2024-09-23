@implementation WFVariableAttachment

- (WFVariableAttachment)initWithVariable:(id)a3
{
  id v6;
  void *v7;
  WFVariableAttachment *v8;
  WFVariableAttachment *v9;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFVariableAttachment.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("variable"));

  }
  v7 = (void *)objc_opt_new();
  v8 = -[WFVariableAttachment initWithData:ofType:](self, "initWithData:ofType:", v7, 0);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_variable, a3);
    v8->_enabled = 1;
    v8->_standalone = 0;
    objc_msgSend(v6, "addDelegate:", v8);
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[WFVariable removeDelegate:](self->_variable, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)WFVariableAttachment;
  -[WFVariableAttachment dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)WFVariableAttachment;
  -[WFVariableAttachment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableAttachment variable](self, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFVariableAttachment variable](self, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithVariable:", v5);

  objc_msgSend(v6, "setEnabled:", -[WFVariableAttachment isEnabled](self, "isEnabled"));
  objc_msgSend(v6, "setSelected:", -[WFVariableAttachment isSelected](self, "isSelected"));
  objc_msgSend(v6, "setHighlighted:", -[WFVariableAttachment isHighlighted](self, "isHighlighted"));
  -[WFVariableAttachment font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  -[WFVariableAttachment surroundingTextFont](self, "surroundingTextFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSurroundingTextFont:", v8);

  -[WFVariableAttachment tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v9);

  -[WFVariableAttachment overrideVariableName](self, "overrideVariableName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideVariableName:", v10);

  -[WFVariableAttachment containingSlotIdentifier](self, "containingSlotIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContainingSlotIdentifier:", v11);

  objc_msgSend(v6, "setStandalone:", -[WFVariableAttachment standalone](self, "standalone"));
  return v6;
}

- (void)variableDidChange:(id)a3
{
  objc_storeStrong((id *)&self->_variable, a3);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[WFVariableAttachment variable](self, "variable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nameIncludingPropertyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)variableName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFVariableAttachment overrideVariableName](self, "overrideVariableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFVariableAttachment variable](self, "variable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v5 = v7;
    }
    else
    {
      -[WFVariableAttachment variable](self, "variable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (UIFont)font
{
  UIFont *font;
  UIFont *v4;
  UIFont *v5;

  font = self->_font;
  if (!font)
  {
    WFSmallVariableTitleFont();
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_font;
    self->_font = v4;

    font = self->_font;
  }
  return font;
}

- (id)adjustedFont
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;

  v3 = -[WFVariableAttachment standalone](self, "standalone");
  -[WFVariableAttachment font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[WFVariableAttachment font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    objc_msgSend(v4, "fontWithSize:", v6 * 0.9);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (UIColor)tintColor
{
  UIColor *tintColor;
  UIColor *v4;
  UIColor *v5;

  tintColor = self->_tintColor;
  if (!tintColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (unint64_t)currentControlState
{
  WFVariableAttachment *v2;
  unint64_t v3;

  v2 = self;
  if (-[WFVariableAttachment isEnabled](v2, "isEnabled"))
  {
    if (-[WFVariableAttachment isSelected](v2, "isSelected"))
    {
      v3 = 2;
    }
    else if (-[WFVariableAttachment isHighlighted](v2, "isHighlighted"))
    {
      v3 = 1;
    }
    else if (-[WFVariableAttachment isEmphasized](v2, "isEmphasized"))
    {
      v3 = 4;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 3;
  }

  return v3;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  double height;
  double width;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD aBlock[5];
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke;
  aBlock[3] = &unk_24EE25470;
  aBlock[4] = self;
  v23 = a3;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFVariableAttachment variable](self, "variable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = (void *)MEMORY[0x24BEC5198];
    -[WFVariableAttachment variableName](self, "variableName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableAttachment adjustedFont](self, "adjustedFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFVariableAttachment tintColor](self, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFVariableAttachment currentControlState](self, "currentControlState");
    -[WFVariableAttachment variable](self, "variable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = 3221225472;
    v21[2] = __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke_2;
    v21[3] = &unk_24EE25498;
    v21[4] = self;
    v21[0] = v8;
    objc_msgSend(v12, "drawVariableForAppIconNamed:icon:font:tint:size:state:isAvailable:completion:", v13, v11, v14, v15, v16, objc_msgSend(v17, "isAvailable"), width, height, v21);

    -[WFVariableAttachment image](self, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      -[WFVariableAttachment image](self, "image");
    else
      v9[2](v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    v9[2](v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;

  width = a4.size.width;
  v9 = a3;
  objc_msgSend(v9, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableAttachment surroundingTextFont](self, "surroundingTextFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "wf_lineHeight");
    v14 = v13 * 0.92;
  }
  else
  {
    -[WFVariableAttachment adjustedFont](self, "adjustedFont");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wf_lineHeight");
    v14 = v16 * 1.06;

  }
  v17 = v14;
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_2558D5378))
  {
    v17 = v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "preferredHeightForDrawingTextAttachment:atCharacterIndex:withProposedHeight:", self, a6, v14);
      v17 = v18;
    }
  }
  objc_msgSend(v9, "lineFragmentPadding");
  v20 = v19;
  -[WFVariableAttachment variable](self, "variable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BEC51A0];
  -[WFVariableAttachment variableName](self, "variableName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "icon");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFVariableAttachment adjustedFont](self, "adjustedFont");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "widthForVariableViewWithName:icon:font:height:", v23, v24, v25, v17);
  v27 = v26;

  if (v12)
  {
    objc_msgSend(v12, "capHeight");
    v29 = v28;
  }
  else
  {
    -[WFVariableAttachment font](self, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "capHeight");
    v29 = v31;

  }
  v32 = v14 - v29;
  if (v27 >= width + v20 * -2.0)
    v33 = width + v20 * -2.0;
  else
    v33 = v27;
  v34 = v32 * 0.5;
  v35 = v32 < 0.0;
  v36 = 0.0;
  if (!v35)
    v36 = v34;
  v37 = -v36;

  v38 = 0.0;
  v39 = v37;
  v40 = v33;
  v41 = v14;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (WFVariable)variable
{
  return self->_variable;
}

- (id)fixUpBlock
{
  return self->_fixUpBlock;
}

- (void)setFixUpBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (void)setEmphasized:(BOOL)a3
{
  self->_emphasized = a3;
}

- (UIFont)surroundingTextFont
{
  return self->_surroundingTextFont;
}

- (void)setSurroundingTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_surroundingTextFont, a3);
}

- (NSString)overrideVariableName
{
  return self->_overrideVariableName;
}

- (void)setOverrideVariableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (WFSlotIdentifier)containingSlotIdentifier
{
  return self->_containingSlotIdentifier;
}

- (void)setContainingSlotIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)standalone
{
  return self->_standalone;
}

- (void)setStandalone:(BOOL)a3
{
  self->_standalone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideVariableName, 0);
  objc_storeStrong((id *)&self->_surroundingTextFont, 0);
  objc_storeStrong(&self->_fixUpBlock, 0);
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

id __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = (void *)MEMORY[0x24BEC5198];
  objc_msgSend(*(id *)(a1 + 32), "variableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "variable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "adjustedFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(a1 + 32), "currentControlState");
  objc_msgSend(*(id *)(a1 + 32), "variable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawVariableNamed:icon:font:tint:size:state:isAvailable:", v3, v5, v6, v7, v8, objc_msgSend(v9, "isAvailable"), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "image");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v7;
  if (v3 != v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v7);
    objc_msgSend(*(id *)(a1 + 32), "fixUpBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "fixUpBlock");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      v4 = v7;
    }
  }

}

@end
