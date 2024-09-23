@implementation UITableAnimateSwipeDeletion

void ___UITableAnimateSwipeDeletion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSSet<UIViewPropertyAnimator *> *_UITableAnimateSwipeDeletion(__strong id<UITable_RowDataSource>, NSIndexPath *__strong, UITableViewCell *__strong, UIView *__strong, UISwipeOccurrence *__strong, UIColor *__strong, void (^__strong)(BOOL), void (^__strong)(BOOL))_block_invoke");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_UITableShared.m"), 241, CFSTR("deleteAnimationsRunning is less than or equal to 0 while entering a completion handler. It seems like the initial animation count is incorrect. This is a UIKit bug."));

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(_QWORD *)(v4 + 24);
  }
  *(_QWORD *)(v4 + 24) = v5 - 1;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAutoresizesSubviews:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_setSkipsLayout:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 40), "frame");
    objc_msgSend(*(id *)(a1 + 48), "convertRect:toView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
      (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, a2 == 0);
    objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 48), "convertRect:fromView:", 0, v7, v9, v11, v13);
    objc_msgSend(*(id *)(a1 + 40), "setFrame:");
    objc_msgSend(*(id *)(a1 + 32), "_setDeleteAnimationInProgress:", 0);
    objc_msgSend(*(id *)(a1 + 48), "setUserInteractionEnabled:", 1);
  }
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setHeight:forRowAtIndexPath:usingPresentationValues:", *(_QWORD *)(a1 + 40), 1, 0.0);
  objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(a1 + 64), "setFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, *(double *)(a1 + 48) - *(double *)(a1 + 72), *(double *)(a1 + 56) + *(double *)(a1 + 56));
}

void ___UITableAnimateSwipeDeletion_block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD aBlock[4];
  id v10;
  id v11;

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UITableAnimateSwipeDeletion_block_invoke_6;
  aBlock[3] = &unk_1E16BC218;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (a2)
  {
    (*((void (**)(void *, _QWORD))v5 + 2))(v5, 0);
  }
  else
  {
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = ___UITableAnimateSwipeDeletion_block_invoke_7;
    v7[3] = &unk_1E16B1B28;
    v8 = *(id *)(a1 + 32);
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v7, v6, 0.5, 0.0, 1.0, 0.0);

  }
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t ___UITableAnimateSwipeDeletion_block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

@end
