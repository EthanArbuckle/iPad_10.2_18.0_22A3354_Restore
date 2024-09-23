@implementation PencilEducationElementTextField

- (int64_t)_textInputSource
{
  return 3;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PencilEducationElementTextField;
  -[PencilEducationElementTextField textRectForBounds:](&v13, sel_textRectForBounds_);
  v8 = v7;
  v10 = v9;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  result = CGRectInset(v14, 12.0, 0.0);
  v11 = v8;
  v12 = v10;
  result.size.height = v12;
  result.origin.y = v11;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PencilEducationElementTextField;
  -[PencilEducationElementTextField editingRectForBounds:](&v13, sel_editingRectForBounds_);
  v8 = v7;
  v10 = v9;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  result = CGRectInset(v14, 12.0, 0.0);
  v11 = v8;
  v12 = v10;
  result.size.height = v12;
  result.origin.y = v11;
  return result;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PencilEducationElementTextField;
  -[PencilEducationElementTextField buildMenuWithBuilder:](&v7, sel_buildMenuWithBuilder_, v4);
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6BC0], "contextSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    objc_msgSend(v4, "removeMenuForIdentifier:", *MEMORY[0x24BDF7BC0]);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  -[PencilEducationElementTextField allowedCalloutActions](self, "allowedCalloutActions", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a4;
  if (!-[PencilEducationElementTextField ignoreScribbleInsertText](self, "ignoreScribbleInsertText"))
  {
    v10.receiver = self;
    v10.super_class = (Class)PencilEducationElementTextField;
    -[PencilEducationElementTextField insertText:alternatives:style:](&v10, sel_insertText_alternatives_style_, v8, v9, a5);
  }

}

- (BOOL)ignoreScribbleInsertText
{
  return self->_ignoreScribbleInsertText;
}

- (void)setIgnoreScribbleInsertText:(BOOL)a3
{
  self->_ignoreScribbleInsertText = a3;
}

- (NSSet)allowedCalloutActions
{
  return self->_allowedCalloutActions;
}

- (void)setAllowedCalloutActions:(id)a3
{
  objc_storeStrong((id *)&self->_allowedCalloutActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedCalloutActions, 0);
}

@end
