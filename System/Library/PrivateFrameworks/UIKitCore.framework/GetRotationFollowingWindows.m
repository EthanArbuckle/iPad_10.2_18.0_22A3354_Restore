@implementation GetRotationFollowingWindows

void __GetRotationFollowingWindows_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1068;
  _MergedGlobals_1068 = v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", 0x1E1764C40, 0, 0, &__block_literal_global_250);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7DFF0;
  qword_1ECD7DFF0 = v2;

}

@end
