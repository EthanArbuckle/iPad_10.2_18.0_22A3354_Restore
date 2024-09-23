@implementation UIFocusEnvironmentPreferenceEnumerationContext

void __92___UIFocusEnvironmentPreferenceEnumerationContext_initWithFocusEnvironment_enumerationMode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a2;
  if (objc_msgSend(v6, sel_allowsWeakReference))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    _UIFocusEnvironmentEffectivePreferredFocusEnvironments(v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v9, v6);
    if ((unint64_t)objc_msgSend(v9, "count") > 1
      || (objc_msgSend(v9, "firstObject"), v10 = (id)objc_claimAutoreleasedReturnValue(), v10, v10 != v6))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Trying to enumerate a focus hierarchy with a focus environment that is in the process of deallocating. This should never happen.", buf, 2u);
      }

    }
    else
    {
      v11 = _UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_4;
      if (!_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_4)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_4);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Trying to enumerate a focus hierarchy with a focus environment that is in the process of deallocating. This should never happen.", v14, 2u);
      }
    }
    *a3 = 1;
  }

}

@end
