@implementation NSMutableDictionary

- (void)cr_setSafeObject:(id)a3 forKey:(id)a4
{
  if (a3)
    -[NSMutableDictionary setObject:forKey:](self, "setObject:forKey:", a3, a4);
}

@end
