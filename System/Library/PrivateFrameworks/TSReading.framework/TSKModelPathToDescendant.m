@implementation TSKModelPathToDescendant

uint64_t __TSKModelPathToDescendant_block_invoke(int a1, void *a2, id a3)
{
  if (a2 && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a2, "modelPathComponentForChild:", a3);
  else
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s-%p"), object_getClassName(a3), a3);
}

@end
