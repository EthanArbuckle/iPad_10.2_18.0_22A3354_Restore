@implementation _TVCarouselCollectionView

- (BOOL)_canScrollX
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 2)
    return 0;
  else
    return -[_TVCarouselCollectionView isUserInteractionEnabled](self, "isUserInteractionEnabled");
}

@end
