@implementation UIScreenAddScreen

void ___UIScreenAddScreen_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  if (qword_1ECD799C0 != -1)
    dispatch_once(&qword_1ECD799C0, &__block_literal_global_820);
  v2 = (id)qword_1ECD799C8;
  v8 = v2;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (qword_1ECD799F0 != -1)
      dispatch_once(&qword_1ECD799F0, &__block_literal_global_830);
    v3 = (id)qword_1ECD799E8;
    objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ECD799F8 != -1)
      dispatch_once(&qword_1ECD799F8, &__block_literal_global_832);
    if (byte_1ECD7992C && v5)
    {
      objc_msgSend(v5, "displayIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "countForObject:", v6))
      {

      }
      else
      {
        v7 = objc_msgSend(*(id *)(a1 + 32), "_isMainLikeScreen");

        if (v7)
          objc_msgSend(v8, "replaceObjectAtIndex:withObject:", 0, *(_QWORD *)(a1 + 32));
      }
    }

    v2 = v8;
  }
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_isEmbeddedScreen"))
      goto LABEL_21;
    if (qword_1ECD799F8 != -1)
      dispatch_once(&qword_1ECD799F8, &__block_literal_global_832);
    if (byte_1ECD7992C)
      objc_msgSend(v8, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), 0);
    else
LABEL_21:
      objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 32));
  }

}

@end
