@implementation FBScene(SpringBoardScenes)

- (uint64_t)sb_isSpringBoardRootScene
{
  void *v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_msgSend(a1, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "clientProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCurrentProcess"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end
