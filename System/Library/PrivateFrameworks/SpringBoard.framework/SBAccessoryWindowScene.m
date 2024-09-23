@implementation SBAccessoryWindowScene

- (SBWindowScene)associatedWindowScene
{
  return self->_associatedWindowScene;
}

- (void)setAssociatedWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_associatedWindowScene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedWindowScene, 0);
}

@end
