@implementation _TVSegmentedControlTarget

+ (void)addTargetInSegmentedControl:(id)a3 withHighlightViewElements:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id object;

  object = a3;
  v6 = a4;
  objc_getAssociatedObject(object, "AssociatedTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(object, "removeTarget:action:forControlEvents:", v7, sel__valueChanged_, 4096);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithViewElements:", v6);

  objc_msgSend(object, "addTarget:action:forControlEvents:", v8, sel__valueChanged_, 4096);
  objc_setAssociatedObject(object, "AssociatedTarget", v8, (void *)0x301);

}

- (_TVSegmentedControlTarget)initWithViewElements:(id)a3
{
  id v4;
  _TVSegmentedControlTarget *v5;
  uint64_t v6;
  NSArray *elements;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVSegmentedControlTarget;
  v5 = -[_TVSegmentedControlTarget init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    elements = v5->_elements;
    v5->_elements = (NSArray *)v6;

  }
  return v5;
}

- (void)_valueChanged:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "selectedSegmentIndex");
  if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = v4;
    if (v4 < -[NSArray count](self->_elements, "count"))
    {
      -[NSArray objectAtIndex:](self->_elements, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("highlight"), 1, 0, 0, v7, 0);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
