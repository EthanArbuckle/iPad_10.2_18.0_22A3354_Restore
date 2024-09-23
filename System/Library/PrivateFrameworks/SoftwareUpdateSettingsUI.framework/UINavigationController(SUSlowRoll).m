@implementation UINavigationController(SUSlowRoll)

- (id)popViewControllerAnimated:()SUSlowRoll withCompletionBlock:
{
  id v5;
  id v6;
  id location;
  char v8;
  uint64_t v9;
  id v10;

  v10 = a1;
  v9 = a2;
  v8 = a3 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", location);
  v6 = (id)objc_msgSend(v10, "popViewControllerAnimated:", v8 & 1);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

@end
