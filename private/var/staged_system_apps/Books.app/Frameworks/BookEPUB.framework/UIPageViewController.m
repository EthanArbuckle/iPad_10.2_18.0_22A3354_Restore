@implementation UIPageViewController

- (id)be_pageCurl
{
  objc_class *v3;
  objc_ivar *InstanceVariable;

  v3 = (objc_class *)objc_opt_class(UIPageViewController);
  InstanceVariable = class_getInstanceVariable(v3, "_pageCurl");
  return object_getIvar(self, InstanceVariable);
}

- (BOOL)be_areCurlAnimationsInFlightOrPending
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIPageViewController be_pageCurl](self, "be_pageCurl"));
  v3 = objc_msgSend(v2, "_areAnimationsInFlightOrPending");

  return v3;
}

@end
