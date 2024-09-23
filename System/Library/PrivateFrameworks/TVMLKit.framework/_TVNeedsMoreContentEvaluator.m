@implementation _TVNeedsMoreContentEvaluator

- (_TVNeedsMoreContentEvaluator)init
{

  return 0;
}

- (_TVNeedsMoreContentEvaluator)initWithScrollView:(id)a3 axis:(int64_t)a4
{
  id v7;
  _TVNeedsMoreContentEvaluator *v8;
  _TVNeedsMoreContentEvaluator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TVNeedsMoreContentEvaluator;
  v8 = -[_TVNeedsMoreContentEvaluator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scrollView, a3);
    v9->_axis = a4;
  }

  return v9;
}

- (void)setViewElement:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_storeStrong((id *)&self->_viewElement, a3);
  -[_TVNeedsMoreContentEvaluator viewElement](self, "viewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("needsMoreThreshold"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  -[_TVNeedsMoreContentEvaluator setThreshold:](self, "setThreshold:", fmax(v6, 1.0));

}

- (void)evaluateForState:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  id v42;

  -[_TVNeedsMoreContentEvaluator scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v42 = (id)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[_TVNeedsMoreContentEvaluator viewElement](self, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[_TVNeedsMoreContentEvaluator state](self, "state");
      if (a3 != 1 || v7)
      {
        v8 = -[_TVNeedsMoreContentEvaluator state](self, "state");
        if (a3 == 2 && v8 == 1)
        {
          objc_msgSend(v42, "bounds");
          v10 = v9;
          v12 = v11;
          v14 = v13;
          v16 = v15;
          -[_TVNeedsMoreContentEvaluator scrollView](self, "scrollView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "convertRect:toView:", v17, v10, v12, v14, v16);
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;

          -[_TVNeedsMoreContentEvaluator scrollView](self, "scrollView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "contentSize");
          v28 = v27;
          v30 = v29;

          v31 = -[_TVNeedsMoreContentEvaluator axis](self, "axis");
          v32 = v19;
          v33 = v21;
          v34 = v23;
          v35 = v25;
          if (v31 == 1)
          {
            v36 = v28 - CGRectGetMaxX(*(CGRect *)&v32);
            -[_TVNeedsMoreContentEvaluator threshold](self, "threshold");
            if (v36 > v14 * v37)
              goto LABEL_13;
          }
          else
          {
            v38 = v30 - CGRectGetMaxY(*(CGRect *)&v32);
            -[_TVNeedsMoreContentEvaluator threshold](self, "threshold");
            if (v38 > v16 * v39)
              goto LABEL_13;
          }
          -[_TVNeedsMoreContentEvaluator setState:](self, "setState:", 2);
          -[_TVNeedsMoreContentEvaluator viewElement](self, "viewElement");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_TVNeedsMoreContentEvaluator scrollView](self, "scrollView");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", CFSTR("needsmore"), 0, 0, 0, v41, 0);

        }
      }
      else
      {
        -[_TVNeedsMoreContentEvaluator setState:](self, "setState:", 1);
      }
    }
  }
LABEL_13:

}

- (void)reset
{
  -[_TVNeedsMoreContentEvaluator setState:](self, "setState:", 0);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (int64_t)axis
{
  return self->_axis;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
