@implementation UIHoverTouchDeliveryTable

void __60___UIHoverTouchDeliveryTable_updateForEvent_forcingHitTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "isEnabled")
    && objc_msgSend(v6, "state") <= 2
    && (!*(_BYTE *)(a1 + 56) || objc_msgSend(v6, "_wantsHoverEventsWhilePointerIsLocked")))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "containsObject:", v6) & 1) == 0)
    {
      v3 = *(_QWORD *)(a1 + 48);
      v4 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
      objc_msgSend(v4, "_responder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v3) = objc_msgSend(v6, "_shouldReceiveTouch:forEvent:recognizerView:", v4, v3, v5);

      if ((_DWORD)v3)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v6);
    }
  }

}

@end
