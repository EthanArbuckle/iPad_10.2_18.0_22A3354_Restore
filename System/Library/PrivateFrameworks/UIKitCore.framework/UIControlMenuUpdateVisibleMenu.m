@implementation UIControlMenuUpdateVisibleMenu

id ___UIControlMenuUpdateVisibleMenu_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", MEMORY[0x1E0C9AA60]);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_BYTE *)(v1 + 24) = 1;
    v2 = *(id *)(a1 + 32);
  }
  return v2;
}

@end
