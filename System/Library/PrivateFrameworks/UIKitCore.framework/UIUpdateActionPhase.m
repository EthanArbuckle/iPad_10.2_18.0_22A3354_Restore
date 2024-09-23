@implementation UIUpdateActionPhase

+ (UIUpdateActionPhase)afterUpdateScheduled
{
  if (_MergedGlobals_1253 != -1)
    dispatch_once(&_MergedGlobals_1253, &__block_literal_global_544);
  return (UIUpdateActionPhase *)(id)qword_1ECD81AB0;
}

void __43__UIUpdateActionPhase_afterUpdateScheduled__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceScheduledItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81AB0;
  qword_1ECD81AB0 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)beforeEventDispatch
{
  if (qword_1ECD81AB8 != -1)
    dispatch_once(&qword_1ECD81AB8, &__block_literal_global_1_18);
  return (UIUpdateActionPhase *)(id)qword_1ECD81AC0;
}

void __42__UIUpdateActionPhase_beforeEventDispatch__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceBeginItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81AC0;
  qword_1ECD81AC0 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)afterEventDispatch
{
  if (qword_1ECD81AC8 != -1)
    dispatch_once(&qword_1ECD81AC8, &__block_literal_global_2_16);
  return (UIUpdateActionPhase *)(id)qword_1ECD81AD0;
}

void __41__UIUpdateActionPhase_afterEventDispatch__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceBeginItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81AD0;
  qword_1ECD81AD0 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)beforeCADisplayLinkDispatch
{
  if (qword_1ECD81AD8 != -1)
    dispatch_once(&qword_1ECD81AD8, &__block_literal_global_3_19);
  return (UIUpdateActionPhase *)(id)qword_1ECD81AE0;
}

void __50__UIUpdateActionPhase_beforeCADisplayLinkDispatch__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceCADisplayLinksItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81AE0;
  qword_1ECD81AE0 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)afterCADisplayLinkDispatch
{
  if (qword_1ECD81AE8 != -1)
    dispatch_once(&qword_1ECD81AE8, &__block_literal_global_4_19);
  return (UIUpdateActionPhase *)(id)qword_1ECD81AF0;
}

void __49__UIUpdateActionPhase_afterCADisplayLinkDispatch__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceCADisplayLinksItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81AF0;
  qword_1ECD81AF0 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)beforeCATransactionCommit
{
  if (qword_1ECD81AF8 != -1)
    dispatch_once(&qword_1ECD81AF8, &__block_literal_global_5_12);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B00;
}

void __48__UIUpdateActionPhase_beforeCATransactionCommit__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B00;
  qword_1ECD81B00 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)afterCATransactionCommit
{
  if (qword_1ECD81B08 != -1)
    dispatch_once(&qword_1ECD81B08, &__block_literal_global_6_10);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B10;
}

void __47__UIUpdateActionPhase_afterCATransactionCommit__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B10;
  qword_1ECD81B10 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)beforeLowLatencyEventDispatch
{
  if (qword_1ECD81B18 != -1)
    dispatch_once(&qword_1ECD81B18, &__block_literal_global_7_10);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B20;
}

void __52__UIUpdateActionPhase_beforeLowLatencyEventDispatch__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyHIDEventsItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B20;
  qword_1ECD81B20 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)afterLowLatencyEventDispatch
{
  if (qword_1ECD81B28 != -1)
    dispatch_once(&qword_1ECD81B28, &__block_literal_global_8_6);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B30;
}

void __51__UIUpdateActionPhase_afterLowLatencyEventDispatch__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyHIDEventsItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B30;
  qword_1ECD81B30 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)beforeLowLatencyCATransactionCommit
{
  if (qword_1ECD81B38 != -1)
    dispatch_once(&qword_1ECD81B38, &__block_literal_global_9_9);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B40;
}

void __58__UIUpdateActionPhase_beforeLowLatencyCATransactionCommit__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 0;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B40;
  qword_1ECD81B40 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)afterLowLatencyCATransactionCommit
{
  if (qword_1ECD81B48 != -1)
    dispatch_once(&qword_1ECD81B48, &__block_literal_global_10_6);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B50;
}

void __57__UIUpdateActionPhase_afterLowLatencyCATransactionCommit__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceLowLatencyCATransactionCommitItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B50;
  qword_1ECD81B50 = (uint64_t)v0;

}

+ (UIUpdateActionPhase)afterUpdateComplete
{
  if (qword_1ECD81B58 != -1)
    dispatch_once(&qword_1ECD81B58, &__block_literal_global_11_7);
  return (UIUpdateActionPhase *)(id)qword_1ECD81B60;
}

void __42__UIUpdateActionPhase_afterUpdateComplete__block_invoke()
{
  UIUpdateActionPhase *v0;
  void *v1;
  objc_super v2;

  v0 = [UIUpdateActionPhase alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)UIUpdateActionPhase;
    v0 = (UIUpdateActionPhase *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
    {
      v0->_order = 1;
      v0->_item = (_UIUpdateSequenceItemInternal *)&_UIUpdateSequenceDoneItemInternal;
    }
  }
  v1 = (void *)qword_1ECD81B60;
  qword_1ECD81B60 = (uint64_t)v0;

}

@end
