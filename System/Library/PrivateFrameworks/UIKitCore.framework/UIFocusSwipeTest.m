@implementation UIFocusSwipeTest

void __25___UIFocusSwipeTest_main__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(v2 + 48))
  {
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x1E0C80D38];
    do
    {
      if (v5)
        v7 = *(double *)(*(_QWORD *)(v2 + 56) + v4) - *(double *)(*(_QWORD *)(v2 + 56) + v4 - 48);
      else
        v7 = 0.0;
      usleep((v7 * 1000000.0));
      block[0] = v3;
      block[1] = 3221225472;
      block[2] = __25___UIFocusSwipeTest_main__block_invoke_2;
      block[3] = &unk_1E16C5CA0;
      v8 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v18 = v5;
      v16 = v8;
      v17 = *(id *)(a1 + 48);
      dispatch_sync(v6, block);

      ++v5;
      v2 = *(_QWORD *)(a1 + 32);
      v4 += 48;
    }
    while (v5 < *(_QWORD *)(v2 + 48));
  }
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __25___UIFocusSwipeTest_main__block_invoke_3;
  v11[3] = &unk_1E16B47A8;
  v12 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  v14 = v10;
  dispatch_sync(MEMORY[0x1E0C80D38], v11);

}

uint64_t __25___UIFocusSwipeTest_main__block_invoke_2(uint64_t a1)
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 48 * *(_QWORD *)(a1 + 56));
  v3 = v2[2];
  v4 = v2[3];
  v5 = v2[4];
  v6 = v2[5];
  objc_msgSend(*(id *)(a1 + 40), "setState:", *((_QWORD *)v2 + 1));
  objc_msgSend(*(id *)(a1 + 40), "setDigitizerLocation:", v3, v4);
  objc_msgSend(*(id *)(a1 + 40), "setVelocity:", v5, v6);
  return objc_msgSend(*(id *)(a1 + 48), "_uiktest_handlePanGesture:", *(_QWORD *)(a1 + 40));
}

uint64_t __25___UIFocusSwipeTest_main__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_uiktest_setPanGestureRecognizer:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "stop");
}

@end
