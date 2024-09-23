@implementation PBUtils

+ (id)readStringWithInstance:(int)a3 fromContainer:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a4, "childOfType:instance:", 4026, (__int16)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "eshObject");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v6 + 48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
