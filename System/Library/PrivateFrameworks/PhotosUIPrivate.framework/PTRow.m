@implementation PTRow

void __64__PTRow_PhotosUI__pu_rowWithTitle_settingsProvider_isTransient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  v5 = a2;
  v4(v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F20], "px_viewControllerWithSettings:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_debugSetTransient:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

id __44__PTRow_PhotosUI__pu_rowWithTitle_settings___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __42__PTRow_PhotosUI__pu_rowWithTitle_action___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

void __62__PTRow_PhotosUI__pu_rowWithTitle_asynchronousOutputProducer___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "pu_debugSetTransient:", 1);
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

void __42__PTRow_PhotosUI__pu_rowWithTitle_output___block_invoke(uint64_t a1, void *a2)
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
