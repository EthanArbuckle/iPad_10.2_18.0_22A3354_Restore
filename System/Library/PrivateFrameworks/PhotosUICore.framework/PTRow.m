@implementation PTRow

uint64_t __36__PTRow_PhotosUICore__px_increment___block_invoke(uint64_t a1, void *a2)
{
  float v3;

  objc_msgSend(a2, "floatValue");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32) * round(v3 / *(double *)(a1 + 32)));
}

void __49__PTRow_PhotosUICore__px_rowWithTitle_urlString___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openURL:options:completionHandler:", v2, MEMORY[0x1E0C9AA70], &__block_literal_global_66967);

}

uint64_t __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v5 = v4;
  ++isIndexingQueryCount;
  v6 = isIndexing;
  if ((isIndexing & 1) == 0)
  {
    objc_msgSend(v4, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_2;
      v17[3] = &unk_1E5148A40;
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v17);
      v8 = v18;
    }
    else
    {
      objc_msgSend(v5, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "dismissButton");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "action");
        objc_msgSend(v9, "target");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendAction:to:from:forEvent:", v11, v12, 0, 0);

        if (*(_QWORD *)(a1 + 32))
        {
          v13 = dispatch_time(0, 500000000);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_3;
          v15[3] = &unk_1E5148A40;
          v16 = *(id *)(a1 + 32);
          dispatch_after(v13, MEMORY[0x1E0C80D38], v15);

        }
      }
    }

  }
  return v6 ^ 1u;
}

uint64_t __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __59__PTRow_PhotosUICore__px_rowWithTitle_postDismissalAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __46__PTRow_PhotosUICore__px_rowWithTitle_action___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return 1;
}

void __64__PTRow_PhotosUICore__px_rowWithTitle_continuousOutputProducer___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3F20];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "px_viewControllerWithContinuousOutputProducer:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

void __66__PTRow_PhotosUICore__px_rowWithTitle_asynchronousOutputProducer___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3F20];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "px_viewControllerWithAsynchronousOutputProducer:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

void __46__PTRow_PhotosUICore__px_rowWithTitle_output___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  void (**v4)(id, id);
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

@end
