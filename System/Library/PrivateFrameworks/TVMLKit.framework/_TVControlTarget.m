@implementation _TVControlTarget

+ (void)addTargetInControl:(id)a3 withViewElement:(id)a4
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
    objc_msgSend(object, "removeTarget:action:forControlEvents:", v7, sel__action_, 64);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithViewElement:", v6);

  objc_msgSend(object, "addTarget:action:forControlEvents:", v8, sel__action_, 64);
  objc_setAssociatedObject(object, "AssociatedTarget", v8, (void *)0x301);

}

- (_TVControlTarget)initWithViewElement:(id)a3
{
  id v5;
  _TVControlTarget *v6;
  _TVControlTarget *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVControlTarget;
  v6 = -[_TVControlTarget init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_element, a3);

  return v7;
}

- (void)_action:(id)a3
{
  -[IKViewElement tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:](self->_element, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("select"), 1, 1, 0, a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
}

@end
