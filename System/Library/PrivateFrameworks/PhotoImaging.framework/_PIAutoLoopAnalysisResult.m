@implementation _PIAutoLoopAnalysisResult

- (NSDictionary)recipe
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecipe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipe, 0);
}

@end
