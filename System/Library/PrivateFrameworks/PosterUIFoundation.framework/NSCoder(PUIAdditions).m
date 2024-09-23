@implementation NSCoder(PUIAdditions)

- (void)pui_encodeStyle:()PUIAdditions forKey:error:
{
  void *v8;
  id v9;

  v9 = a4;
  +[PUIStyleSerialization dataForStyle:error:](PUIStyleSerialization, "dataForStyle:error:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(a1, "encodeObject:forKey:", v8, v9);

}

- (id)pui_decodeStyleForKey:()PUIAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[PUIStyleSerialization styleForData:error:](PUIStyleSerialization, "styleForData:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
