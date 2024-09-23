@implementation PLIsEDUMode

void __PLIsEDUMode_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isMultiUser") & 1) != 0)
  {
    objc_msgSend(v1, "currentUser");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    PLIsEDUMode_isEDUMode = objc_msgSend(v0, "userType") == 1;

  }
  else
  {
    PLIsEDUMode_isEDUMode = 0;
  }

}

@end
