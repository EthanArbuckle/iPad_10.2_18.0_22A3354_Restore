@implementation UIForceLevelClassifier

uint64_t __48___UIForceLevelClassifier_receiveObservedValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (!objc_msgSend(a2, "shouldFilterDueToSystemGestures")
    || (result = objc_msgSend(*(id *)(a1 + 32), "respectsSystemGestureTouchFiltering"), (result & 1) == 0))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(a2, "touchForce");
    v7 = v6;
    objc_msgSend(a2, "timestamp");
    v9 = v8;
    objc_msgSend(a2, "centroid");
    return objc_msgSend(v5, "observeTouchWithForceValue:atTimestamp:withCentroidAtLocation:", v7, v9, v10, v11);
  }
  return result;
}

uint64_t __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

uint64_t __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void __39___UIForceLevelClassifier_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  unint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained[5];
    if (v5 <= 2 && v5 + 1 == *(_QWORD *)(a1 + 40))
    {
      v6 = WeakRetained;
      objc_msgSend(a2, "doubleValue");
      objc_msgSend(v6, "_notifyDelegateOfProgress:toForceLevel:", *(_QWORD *)(a1 + 40));
      WeakRetained = v6;
    }
  }

}

@end
