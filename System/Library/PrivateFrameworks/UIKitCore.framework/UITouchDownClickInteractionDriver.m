@implementation UITouchDownClickInteractionDriver

void __63___UITouchDownClickInteractionDriver__handleGestureRecognizer___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelInteraction");
  }
  else if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clickDriver:didUpdateHighlightProgress:", *(_QWORD *)(a1 + 32), 1.0);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clickDriver:didPerformEvent:", *(_QWORD *)(a1 + 32), 0);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clickDriver:didPerformEvent:", *(_QWORD *)(a1 + 32), 1);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clickDriver:didPerformEvent:", *(_QWORD *)(a1 + 32), 2);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clickDriver:didPerformEvent:", *(_QWORD *)(a1 + 32), 3);

  }
}

@end
