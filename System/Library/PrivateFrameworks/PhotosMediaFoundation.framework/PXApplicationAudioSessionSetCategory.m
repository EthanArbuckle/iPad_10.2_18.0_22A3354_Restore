@implementation PXApplicationAudioSessionSetCategory

void __PXApplicationAudioSessionSetCategory_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __PXApplicationAudioSessionSetCategory_block_invoke_2;
  v4[3] = &unk_2514A2FB8;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "applyCategory:completion:", v3, v4);

}

void __PXApplicationAudioSessionSetCategory_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v5;
    _os_log_error_impl(&dword_244081000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Photos was unable to configure the shared audio session category. Unintentional interruption of other audio sources may occur. Error: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
