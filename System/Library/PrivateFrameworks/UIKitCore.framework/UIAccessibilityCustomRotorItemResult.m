@implementation UIAccessibilityCustomRotorItemResult

- (UIAccessibilityCustomRotorItemResult)initWithTargetElement:(id)targetElement targetRange:(UITextRange *)targetRange
{
  id v6;
  UITextRange *v7;
  UIAccessibilityCustomRotorItemResult *v8;
  void *v9;
  UIAccessibilityCustomRotorItemResult *v10;
  objc_super v12;

  v6 = targetElement;
  v7 = targetRange;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityCustomRotorItemResult;
  v8 = -[UIAccessibilityCustomRotorItemResult init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityCustomRotorItemResult setUuid:](v8, "setUuid:", v9);

    -[UIAccessibilityCustomRotorItemResult setTargetElement:](v8, "setTargetElement:", v6);
    -[UIAccessibilityCustomRotorItemResult setTargetRange:](v8, "setTargetRange:", v7);
    v10 = v8;
  }

  return v8;
}

- (NSUUID)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
}

- (id)targetElement
{
  return objc_loadWeakRetained((id *)&self->_targetElement);
}

- (void)setTargetElement:(id)targetElement
{
  objc_storeWeak((id *)&self->_targetElement, targetElement);
}

- (UITextRange)targetRange
{
  return self->_targetRange;
}

- (void)setTargetRange:(UITextRange *)targetRange
{
  objc_storeStrong((id *)&self->_targetRange, targetRange);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetRange, 0);
  objc_destroyWeak((id *)&self->_targetElement);
  objc_storeStrong((id *)&self->uuid, 0);
}

@end
