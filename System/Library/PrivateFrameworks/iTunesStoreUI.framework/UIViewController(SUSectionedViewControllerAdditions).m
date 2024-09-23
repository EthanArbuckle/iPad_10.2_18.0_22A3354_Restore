@implementation UIViewController(SUSectionedViewControllerAdditions)

- (uint64_t)canDisplaySectionGroup:()SUSectionedViewControllerAdditions
{
  return 0;
}

- (uint64_t)reloadForSectionsWithGroup:()SUSectionedViewControllerAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "reloadForSectionsWithGroup:", a3);
}

- (uint64_t)setDisplayedSectionGroup:()SUSectionedViewControllerAdditions
{
  return 0;
}

@end
