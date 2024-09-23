@implementation UIMainMenuSystem

void __34___UIMainMenuSystem__sharedSystem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_1ECD7A4B8;
  qword_1ECD7A4B8 = v1;

}

id __91___UIMainMenuSystem__buildMenuWithBuilder_fromResponderChain_atLocation_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v5, "addObjectsFromArray:", v4);
  return v5;
}

@end
