@implementation UIValidateAccountBasedDelegateRespondsToSelector

void ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.UIKit.accountBasedValidation", v2);
  v1 = (void *)qword_1ECD81F60;
  qword_1ECD81F60 = (uint64_t)v0;

}

void ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  if (qword_1ECD81F50 != -1)
    dispatch_once(&qword_1ECD81F50, &__block_literal_global_604);
  if (_MergedGlobals_1287)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke_3;
    v4[3] = &unk_1E16B1888;
    v2 = *(id *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = v2;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

void ___UIValidateAccountBasedDelegateRespondsToSelector_block_invoke_3(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = _block_invoke___s_category_12;
  if (!_block_invoke___s_category_12)
  {
    v2 = __UILogCategoryGetNode("EnterpriseUtilities", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_block_invoke___s_category_12);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v6;
    v11 = 2048;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "UIKit detected a client bug in an account based app: Delegate <%@: %p> does not respond to -%@", (uint8_t *)&v9, 0x20u);

  }
}

@end
