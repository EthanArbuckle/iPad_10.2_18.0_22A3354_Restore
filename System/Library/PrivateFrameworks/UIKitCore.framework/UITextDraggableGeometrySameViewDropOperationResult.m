@implementation UITextDraggableGeometrySameViewDropOperationResult

- (UITextDraggableGeometrySameViewDropOperationResult)initWithRange:(id)a3 targetedPreviewProvider:(id)a4
{
  id v7;
  id v8;
  UITextDraggableGeometrySameViewDropOperationResult *v9;
  UITextDraggableGeometrySameViewDropOperationResult *v10;
  void *v11;
  id targetedPreviewProvider;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITextDraggableGeometrySameViewDropOperationResult;
  v9 = -[UITextDraggableGeometrySameViewDropOperationResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultRange, a3);
    v11 = _Block_copy(v8);
    targetedPreviewProvider = v10->_targetedPreviewProvider;
    v10->_targetedPreviewProvider = v11;

  }
  return v10;
}

+ (UITextDraggableGeometrySameViewDropOperationResult)resultWithRange:(id)a3 targetedPreviewProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRange:targetedPreviewProvider:", v7, v6);

  return (UITextDraggableGeometrySameViewDropOperationResult *)v8;
}

- (UITextRange)resultRange
{
  return self->_resultRange;
}

- (id)targetedPreviewProvider
{
  return self->_targetedPreviewProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_targetedPreviewProvider, 0);
  objc_storeStrong((id *)&self->_resultRange, 0);
}

@end
