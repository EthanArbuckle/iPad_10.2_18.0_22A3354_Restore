@implementation UIDatePickerIOSCompactView

void __67___UIDatePickerIOSCompactView_createDatePickerForCompactDateLabel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id WeakRetained;

  objc_msgSend(a2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "setDate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_updateUI");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 552));
  objc_msgSend(WeakRetained, "_emitValueChanged");

}

@end
