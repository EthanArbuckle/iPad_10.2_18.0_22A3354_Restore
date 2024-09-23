@implementation SBIconListModelTransaction

void __44___SBIconListModelTransaction_commitChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "node:didAddContainedNodeIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = v4;
  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(v4, "node:didRemoveContainedNodeIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v3 = v4;
  }

}

uint64_t __44___SBIconListModelTransaction_commitChanges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyListObserver:didAddIcons:didRemoveIcons:movedIcons:didReplaceIcon:withIcon:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __69___SBIconListModelTransaction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason");
}

@end
