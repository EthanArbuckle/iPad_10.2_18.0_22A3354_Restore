@implementation PCSRestoreCKBackupWithCompletion

void __PCSRestoreCKBackupWithCompletion_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = *(unsigned __int8 *)(a1 + 48);
  v13 = objc_msgSend(v17, "unsignedIntValue");
  if (v12)
    v14 = v13 == 0;
  else
    v14 = 0;
  v15 = v14;
  if (!v12 && !v13)
  {
    if (objc_msgSend(v9, "unsignedIntValue"))
      v15 = 1;
    else
      v15 = objc_msgSend(v10, "unsignedIntValue") != 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v15;
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v16 + 16))(v16, objc_msgSend(v17, "unsignedIntValue"), objc_msgSend(v9, "unsignedIntValue"), objc_msgSend(v10, "unsignedIntValue"), v11);

}

@end
