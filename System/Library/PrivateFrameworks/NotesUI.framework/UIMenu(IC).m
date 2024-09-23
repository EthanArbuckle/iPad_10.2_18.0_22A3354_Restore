@implementation UIMenu(IC)

+ (id)ic_inlineMenuWithElementSize:()IC children:
{
  void *v5;

  objc_msgSend(a1, "ic_inlineMenuWithChildren:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredElementSize:", a3);
  return v5;
}

+ (uint64_t)ic_inlineMenuWithChildren:()IC
{
  return objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E5C2F8C0, 0, 0, 1, a3);
}

@end
