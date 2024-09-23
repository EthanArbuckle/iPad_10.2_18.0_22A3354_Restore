@implementation ProductSuffix

void __ProductSuffix_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  __CFString *v3;
  uint64_t v4;
  __CFString *v5;

  _CFGetProductName();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v5, "length"))
  {
    if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("ipod")))
    {

      v5 = CFSTR("iphone");
    }
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("~%@"), v5);
    v1 = (void *)qword_1ECD82A90;
    qword_1ECD82A90 = v0;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "model");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = CFSTR("~iphone");
    if (v1)
    {
      objc_msgSend(v1, "rangeOfString:options:", CFSTR("iPad"), 9);
      if (v4)
        v3 = CFSTR("~ipad");
    }
    objc_storeStrong((id *)&qword_1ECD82A90, v3);
  }

}

@end
