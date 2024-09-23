@implementation MessagePreviewExtractFields

uint64_t __MessagePreviewExtractFields_block_invoke(id **a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  id *v18;

  v4 = a2;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
    goto LABEL_18;
  v6 = *a1[4];
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
    goto LABEL_17;
  if (v6)
  {
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v9 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  v10 = *a1[5];
  v11 = v8;
  v8 = v11;
  if (v10 == v11)
    goto LABEL_17;
  if (v10)
  {
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  v13 = *a1[6];
  v14 = v8;
  v8 = v14;
  if (v13 == v14)
  {
LABEL_17:

    goto LABEL_18;
  }
  if (v13)
  {
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
      goto LABEL_18;
  }
  else
  {

  }
  v18 = a1[4];
  if (!*v18 || (v18 = a1[5], !*v18) || (v18 = a1[6], !*v18))
  {
    objc_storeStrong(v18, a2);
    v16 = 1;
    goto LABEL_19;
  }
LABEL_18:
  v16 = 0;
LABEL_19:

  return v16;
}

BOOL __MessagePreviewExtractFields_block_invoke_2(_QWORD **a1)
{
  return *a1[4] && *a1[5] && *a1[6] != 0;
}

@end
