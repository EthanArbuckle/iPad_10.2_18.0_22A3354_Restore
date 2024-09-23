@implementation PKDevicePhoneNumberAndSignature

uint64_t ___PKDevicePhoneNumberAndSignature_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  void *v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_10;
  v9 = objc_msgSend(v7, "isEqual:");
  v10 = v9;
  if (!*(_QWORD *)(a1 + 32))
  {
    if ((v9 & 1) != 0)
    {
      v12 = -1;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  v11 = objc_msgSend(v8, "isEqual:");
  v12 = v10 ? -1 : 1;
  if (v10 == v11)
  {
LABEL_10:
    v13 = objc_msgSend(v5, "slotID");
    v14 = objc_msgSend(v6, "slotID") != 1;
    v15 = v13 == 1;
    if (v13 == 1)
      v12 = -1;
    else
      v12 = 1;
    if (v15 != v14)
    {
      objc_msgSend(v7, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "compare:", v17);

    }
  }
LABEL_15:

  return v12;
}

@end
