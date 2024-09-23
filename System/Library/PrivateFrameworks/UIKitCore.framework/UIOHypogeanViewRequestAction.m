@implementation UIOHypogeanViewRequestAction

void __66___UIOHypogeanViewRequestAction_TestingOnly__overlay_viewRegistry__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECD7F558;
  qword_1ECD7F558 = (uint64_t)v0;

}

void __83___UIOHypogeanViewRequestAction_TestingOnly_initWithConfiguration_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a2;
  v5 = objc_opt_class();
  objc_msgSend(v4, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForSetting:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v5, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73___UIOHypogeanViewRequestAction_TestingOnly_performActionFromConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performActionWithDisplayDelegate:", a2);
}

void __79___UIOHypogeanViewRequestAction_TestingOnly__performActionWithDisplayDelegate___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  UIOLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_185066000, v0, OS_LOG_TYPE_DEBUG, "Hypogean Button Pressed!", v1, 2u);
  }

}

@end
