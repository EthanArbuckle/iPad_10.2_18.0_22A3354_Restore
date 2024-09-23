@implementation _UIDocumentLaunchView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)_UIDocumentLaunchView;
  -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView __viewDelegate]((id *)&self->super.super.super.isa);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (_QWORD *)v9;
  if (v9 && (*(_BYTE *)(v9 + 1088) & 1) != 0)
  {
    if (v8 && (*(void **)(v9 + 992) == v8 || *(void **)(v9 + 984) == v8))
    {
      v12 = *(void **)(v9 + 976);
      objc_msgSend((id)v9, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertPoint:toView:", v10[122], x, y);
      objc_msgSend(v12, "hitTest:withEvent:", a4);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v8;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
