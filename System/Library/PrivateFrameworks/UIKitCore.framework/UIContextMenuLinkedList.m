@implementation UIContextMenuLinkedList

void __39___UIContextMenuLinkedList_removeNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __40___UIContextMenuLinkedList_nodeForMenu___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "menu");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __39___UIContextMenuLinkedList_description__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "first");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendString:", CFSTR(" -> "));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendFormat:", CFSTR("%@"), v4);

}

@end
