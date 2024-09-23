@implementation UIViewDeferredAnimation

void __95___UIViewDeferredAnimation_calculateFrameValues_frameTimes_withFrameInterval_valueTransformer___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5)
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v9 = a2;
  v10 = *(_QWORD *)(a1 + 48);
  v18 = v9;
  if (v10)
  {
    (*(void (**)(void))(v10 + 16))();
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
  }
  v12 = v11;
  if (v11)
  {
    if (a3 + a4 >= a5)
      v13 = a5;
    else
      v13 = a3 + a4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    v14 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    if (a5 - v13 - *(double *)(a1 + 56) > 0.00000011920929)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
      v16 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
  }

}

@end
