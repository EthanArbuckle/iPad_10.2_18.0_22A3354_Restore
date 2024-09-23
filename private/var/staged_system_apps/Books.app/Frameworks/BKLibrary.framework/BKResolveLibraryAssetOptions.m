@implementation BKResolveLibraryAssetOptions

- (NSNumber)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(id)a3
{
  objc_storeStrong((id *)&self->_userInitiated, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInitiated, 0);
}

@end
