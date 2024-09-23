@implementation UIPageCurl

uint64_t __101___UIPageCurl__enqueueCurlOfType_fromLocation_inDirection_withView_revealingView_completion_finally___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginCurlWithState:previousState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  dispatch_time_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD block[5];
  id v31;
  uint64_t v32;

  v8 = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(_QWORD *)(v9 + 40);
  v11 = v8;
  v12 = v11;
  if (a3 || v10)
  {
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "curlType");
    v15 = objc_msgSend(v12, "curlType");
    v13 = v12;
    if (v14 == v15)
    {
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "effectiveTransitionDirection");
      v17 = objc_msgSend(v12, "effectiveTransitionDirection");
      v13 = v12;
      if (v16 == v17)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        v13 = v12;
      }
    }
  }
  else
  {
    v13 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v11;
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v18 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_ui_dequeue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "_ui_enqueue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3 - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(double *)(*(_QWORD *)(a1 + 32) + 88);
      objc_msgSend(v19, "beginDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceNow");
      v23 = v20 + v22;

      v24 = v23 * 1000000000.0;
      if (v23 <= 0.0)
        v24 = 0.0;
      v25 = dispatch_time(0, (uint64_t)v24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke_2;
      block[3] = &unk_1E16C0EA8;
      v26 = *(_QWORD *)(a1 + 48);
      v31 = v19;
      v32 = v26;
      block[4] = *(_QWORD *)(a1 + 32);
      v27 = v19;
      dispatch_after(v25, MEMORY[0x1E0C80D38], block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_beginCurlWithState:previousState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
    }
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = 0;

  }
  else
  {
    *a4 = 1;
  }

}

uint64_t __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginCurlWithState:previousState:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

@end
