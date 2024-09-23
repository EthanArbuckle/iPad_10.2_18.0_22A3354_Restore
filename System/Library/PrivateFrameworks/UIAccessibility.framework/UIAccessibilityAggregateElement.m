@implementation UIAccessibilityAggregateElement

- (UIAccessibilityAggregateElement)initWithAccessibilityContainer:(id)a3 representedElements:(id)a4
{
  id v6;
  UIAccessibilityAggregateElement *v7;
  UIAccessibilityAggregateElement *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIAccessibilityAggregateElement;
  v7 = -[UIAccessibilityAggregateElement initWithAccessibilityContainer:](&v10, sel_initWithAccessibilityContainer_, a3);
  v8 = v7;
  if (v7)
    -[UIAccessibilityAggregateElement setRepresentedElements:](v7, "setRepresentedElements:", v6);

  return v8;
}

- (void)addRepresentedObject:(id)a3
{
  NSArray *representedElements;
  id v5;
  id v6;

  representedElements = self->_representedElements;
  v5 = a3;
  v6 = (id)-[NSArray mutableCopy](representedElements, "mutableCopy");
  objc_msgSend(v6, "axSafelyAddObject:", v5);

  -[UIAccessibilityAggregateElement setRepresentedElements:](self, "setRepresentedElements:", v6);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[UIAccessibilityAggregateElement accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIAccessibilityAggregateElement accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIAccessibilityAggregateElement representedElements](self, "representedElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXLabelForElements(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[UIAccessibilityAggregateElement accessibilityUserDefinedFrame](self, "accessibilityUserDefinedFrame"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[UIAccessibilityAggregateElement accessibilityUserDefinedFrame](self, "accessibilityUserDefinedFrame");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rectValue");
  }
  else
  {
    -[UIAccessibilityAggregateElement representedElements](self, "representedElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = UIAXFrameForElements(v4);
  }
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (NSArray)representedElements
{
  return self->_representedElements;
}

- (void)setRepresentedElements:(id)a3
{
  objc_storeStrong((id *)&self->_representedElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedElements, 0);
}

- (UIAccessibilityAggregateElement)initWithAccessibilityContainer:(id)a3
{
  objc_super v5;

  objc_opt_class();
  NSRequestConcreteImplementation();
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityAggregateElement;
  return -[UIAccessibilityAggregateElement init](&v5, sel_init);
}

@end
