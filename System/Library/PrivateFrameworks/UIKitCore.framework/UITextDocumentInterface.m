@implementation UITextDocumentInterface

_QWORD *__54___UITextDocumentInterface__didPerformOutputOperation__block_invoke(uint64_t a1)
{
  _QWORD *result;
  void *v3;
  void *v4;

  result = *(_QWORD **)(a1 + 32);
  if (result[6])
  {
    objc_msgSend(result, "responseDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_controllerOutput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_performInputViewControllerOutput:", v4);

    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "setControllerOutput:", 0);
  }
  return result;
}

@end
