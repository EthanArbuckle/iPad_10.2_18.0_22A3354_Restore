@implementation ICRadioLikeResponse

- (BOOL)shouldFlushTrackCache
{
  void *v2;
  void *v3;
  char v4;

  -[ICRadioResponse contentDictionary](self, "contentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("flush-track-cache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

@end
