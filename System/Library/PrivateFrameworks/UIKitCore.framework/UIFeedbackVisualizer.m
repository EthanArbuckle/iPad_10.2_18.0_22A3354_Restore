@implementation UIFeedbackVisualizer

void __41___UIFeedbackVisualizer_sharedVisualizer__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECD7D910;
  qword_1ECD7D910 = (uint64_t)v1;

}

void __57___UIFeedbackVisualizer_showVisualForFeedback_withDelay___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_showVisualForFeedback:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "visualizerSources");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

uint64_t __48___UIFeedbackVisualizer__showVisualForFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

uint64_t __72___UIFeedbackVisualizer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEngine:", *(_QWORD *)(a1 + 40));
}

@end
