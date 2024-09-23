@implementation _UIGestureRecognizerDriverContextImpl

- (_QWORD)initWithGestureRecognizer:(_QWORD *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_UIGestureRecognizerDriverContextImpl;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[1] = a2;
  }
  return result;
}

- (UIWindow)eventReceivingWindow
{
  UIGestureRecognizer *gestureRecognizer;
  id WeakRetained;
  void *v4;

  gestureRecognizer = self->_gestureRecognizer;
  if (gestureRecognizer)
    WeakRetained = objc_loadWeakRetained((id *)&gestureRecognizer->_container);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "_eventReceivingWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v4;
}

- (id)activeComponentsForEvent:(id)a3
{
  return -[UIGestureRecognizer _activeComponentsForEvent:]((uint64_t)self->_gestureRecognizer, a3);
}

- (id)activeEventOfType:(int64_t)a3
{
  return -[UIGestureRecognizer _activeEventOfType:](self->_gestureRecognizer, "_activeEventOfType:", a3);
}

- (CGPoint)convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self->_gestureRecognizer, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[UIGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self->_gestureRecognizer, "_convertPoint:toSceneReferenceCoordinatesFromView:", a4, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)ignoreEventComponent:(id)a3 forEvent:(id)a4
{
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "_eventComponentType"))
  {
    if (objc_msgSend(a3, "_eventComponentType") == 1)
    {
      -[UIGestureRecognizer ignorePress:forEvent:](self->_gestureRecognizer, "ignorePress:forEvent:", a3, a4);
    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v10 = 138412290;
        v11 = a3;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unsupported event component: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    else
    {
      v7 = ignoreEventComponent_forEvent____s_category;
      if (!ignoreEventComponent_forEvent____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&ignoreEventComponent_forEvent____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = a3;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unsupported event component: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    -[UIGestureRecognizer ignoreTouch:forEvent:](self->_gestureRecognizer, "ignoreTouch:forEvent:", a3, a4);
  }
}

@end
