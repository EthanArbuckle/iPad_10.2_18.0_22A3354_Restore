@implementation UIONavigationBarTitleRenamerViewMetricsUpdateAction

void __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke_2;
  v7[3] = &unk_1E16B2F48;
  v5 = *(id *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __108___UIONavigationBarTitleRenamerViewMetricsUpdateAction_initWithFrame_textAlignment_session_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
