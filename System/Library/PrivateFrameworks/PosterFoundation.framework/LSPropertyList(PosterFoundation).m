@implementation LSPropertyList(PosterFoundation)

- (uint64_t)pf_wantsLocation
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:ofClass:", CFSTR("PRWantsLocation"), objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

@end
