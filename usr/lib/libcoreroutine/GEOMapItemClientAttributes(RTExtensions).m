@implementation GEOMapItemClientAttributes(RTExtensions)

- (id)initWithLOIType:()RTExtensions event:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&off_1EFCED6E8;
  v7 = objc_msgSendSuper2(&v11, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D271E0]), "initWithLOIType:event:", a3, v6);
    objc_msgSend(v7, "setRoutineAttributes:", v8);

    v9 = v7;
  }

  return v7;
}

@end
