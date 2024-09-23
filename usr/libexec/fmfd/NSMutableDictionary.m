@implementation NSMutableDictionary

- (void)safelySetObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    if (v7)
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v7, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", v6);
  }

}

- (void)safelyMapKey:(id)a3 toObject:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7)
  {
    if (v6)
      -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", v6, v7);
    else
      -[NSMutableDictionary removeObjectForKey:](self, "removeObjectForKey:", v7);
  }

}

@end
