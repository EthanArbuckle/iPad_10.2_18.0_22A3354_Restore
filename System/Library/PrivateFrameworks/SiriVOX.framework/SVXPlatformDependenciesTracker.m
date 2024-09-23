@implementation SVXPlatformDependenciesTracker

- (NSArray)platformDependencies
{
  return self->_platformDependencies;
}

- (void)setPlatformDependencies:(id)a3
{
  objc_storeStrong((id *)&self->_platformDependencies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformDependencies, 0);
}

@end
