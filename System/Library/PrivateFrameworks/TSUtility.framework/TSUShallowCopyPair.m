@implementation TSUShallowCopyPair

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSUPair initWithFirst:second:](+[TSUShallowCopyPair allocWithZone:](TSUShallowCopyPair, "allocWithZone:", a3), "initWithFirst:second:", -[TSUPair first](self, "first"), -[TSUPair second](self, "second"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TSUPair initWithFirst:second:](+[TSUMutableShallowCopyPair allocWithZone:](TSUMutableShallowCopyPair, "allocWithZone:", a3), "initWithFirst:second:", -[TSUPair first](self, "first"), -[TSUPair second](self, "second"));
}

@end
