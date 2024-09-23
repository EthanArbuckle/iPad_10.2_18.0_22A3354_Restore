@implementation UITextSimpleLinkInteraction

void __42___UITextSimpleLinkInteraction_highlight___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "highlight");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 128), *(id *)(a1 + 32));
}

void __42___UITextSimpleLinkInteraction_highlight___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 40);
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = v2;
  if (v11 == v3)
  {

    return;
  }
  v4 = v3;
  if (v11)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {

LABEL_10:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "unhighlight");
    objc_msgSend(*(id *)(a1 + 40), "highlight");
    v8 = a1 + 32;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(v8 + 8);
    v10 = *(void **)(v7 + 128);
    *(_QWORD *)(v7 + 128) = v9;

    return;
  }
  v6 = objc_msgSend(v11, "isEqual:", v3);

  if ((v6 & 1) == 0)
    goto LABEL_10;
}

void __42___UITextSimpleLinkInteraction_highlight___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "unhighlight");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;

}

@end
