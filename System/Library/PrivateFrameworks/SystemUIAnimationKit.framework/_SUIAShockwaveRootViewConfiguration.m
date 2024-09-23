@implementation _SUIAShockwaveRootViewConfiguration

- (void)_setHidden:(BOOL)a3
{
  NSMutableDictionary *propertyDictionary;
  id v4;

  propertyDictionary = self->super._propertyDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("hidden"));

}

- (BOOL)hidden
{
  void *v2;
  BOOL v4;

  v4 = 0;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("hidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v4, 1);

  return v4;
}

+ (int64_t)configurationType
{
  return 0;
}

@end
