@implementation PSListController

uint64_t __81__PSListController_PUIGroupReplace__pui_replaceRows_withRows_header_insertPoint___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeContiguousSpecifiers:animated:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "insertContiguousSpecifiers:afterSpecifier:animated:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

@end
