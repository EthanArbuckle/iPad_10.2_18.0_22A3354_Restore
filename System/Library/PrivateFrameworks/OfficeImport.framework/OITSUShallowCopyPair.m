@implementation OITSUShallowCopyPair

- (id)copyWithZone:(_NSZone *)a3
{
  return -[OITSUPair initWithFirst:second:](+[OITSUShallowCopyPair allocWithZone:](OITSUShallowCopyPair, "allocWithZone:", a3), "initWithFirst:second:", -[OITSUPair first](self, "first"), -[OITSUPair second](self, "second"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[OITSUPair initWithFirst:second:](+[OITSUMutableShallowCopyPair allocWithZone:](OITSUMutableShallowCopyPair, "allocWithZone:", a3), "initWithFirst:second:", -[OITSUPair first](self, "first"), -[OITSUPair second](self, "second"));
}

@end
