@implementation UIActivityUserDefaultsManager

void __88___UIActivityUserDefaultsManager_requestFavoritesForActivityCategory_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.sharing.sharesheetuserdefaults", v2);
  v1 = (void *)requestFavoritesForActivityCategory_completionHandler__xpc_queue;
  requestFavoritesForActivityCategory_completionHandler__xpc_queue = (uint64_t)v0;

}

void __88___UIActivityUserDefaultsManager_requestFavoritesForActivityCategory_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __88___UIActivityUserDefaultsManager_requestFavoritesForActivityCategory_completionHandler___block_invoke_2_cold_1((uint64_t)v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88___UIActivityUserDefaultsManager_requestFavoritesForActivityCategory_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Share Sheet User Defaults: Error getting synchronous remote object proxy %@", (uint8_t *)&v2, 0xCu);
}

@end
