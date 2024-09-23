@implementation NSMutableDictionary

- (void)addObject:(id)a3 toSetForKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self, "objectForKey:", v6));
    if (!v7)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v8);

  }
}

@end
