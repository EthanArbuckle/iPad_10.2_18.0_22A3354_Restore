@implementation INStartCallIntent(Idiom)

- (id)wf_updateIdiomIfNeeded:()Idiom
{
  id result;
  objc_super v6;

  if (objc_msgSend(a1, "callCapability") != 2
    || (result = (id)objc_msgSend(a1, "preferredCallProvider"), (a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
    || result != (id)2)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&off_1EF77FB38;
    return objc_msgSendSuper2(&v6, sel_wf_updateIdiomIfNeeded_, a3);
  }
  return result;
}

@end
