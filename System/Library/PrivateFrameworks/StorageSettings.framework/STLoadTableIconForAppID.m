@implementation STLoadTableIconForAppID

void ___STLoadTableIconForAppID_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gTableIconsByID;
  _gTableIconsByID = v0;

}

void ___STLoadTableIconForAppID_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  _LoadIconForAppID((void *)_gTableIconsByID, *(void **)(a1 + 32), 0, *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___STLoadTableIconForAppID_block_invoke_3;
  v4[3] = &unk_24C756A10;
  v5 = v2;
  v6 = *(id *)(a1 + 40);
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void ___STLoadTableIconForAppID_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40));
  }
  else
  {
    PSBlankIconImage();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

@end
