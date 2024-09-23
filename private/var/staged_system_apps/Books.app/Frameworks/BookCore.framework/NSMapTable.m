@implementation NSMapTable

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3)
    -[NSMapTable setObject:forKey:](self, "setObject:forKey:", a3, a4);
  else
    -[NSMapTable removeObjectForKey:](self, "removeObjectForKey:", a4);
}

@end
