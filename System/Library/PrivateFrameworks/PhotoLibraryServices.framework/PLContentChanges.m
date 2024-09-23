@implementation PLContentChanges

- (void)cleanupState
{
  NSMutableArray *container;
  NSMutableArray *updatedContent;

  container = self->_container;
  self->_container = 0;

  updatedContent = self->_updatedContent;
  self->_updatedContent = 0;

}

- (NSMutableArray)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSMutableArray)updatedContent
{
  return self->_updatedContent;
}

- (void)setUpdatedContent:(id)a3
{
  objc_storeStrong((id *)&self->_updatedContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedContent, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
