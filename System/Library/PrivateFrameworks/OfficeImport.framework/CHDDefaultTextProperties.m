@implementation CHDDefaultTextProperties

- (id)allTextDefaultProperties
{
  return -[EDKeyedCollection objectWithKey:](self, "objectWithKey:", 2);
}

- (id)showLabelsTextDefaultProperties
{
  return -[EDKeyedCollection objectWithKey:](self, "objectWithKey:", 0);
}

- (id)seriesTitlesTextDefaultProperties
{
  return -[EDKeyedCollection objectWithKey:](self, "objectWithKey:", 3);
}

- (id)percentageTextDefaultProperties
{
  return -[EDKeyedCollection objectWithKey:](self, "objectWithKey:", 1);
}

@end
