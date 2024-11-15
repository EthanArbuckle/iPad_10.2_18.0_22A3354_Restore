@implementation SASBulletinCacheNode

- (AFBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (SASBulletinCacheNode)previousNode
{
  return self->_previousNode;
}

- (void)setPreviousNode:(id)a3
{
  objc_storeStrong((id *)&self->_previousNode, a3);
}

- (SASBulletinCacheNode)nextNode
{
  return self->_nextNode;
}

- (void)setNextNode:(id)a3
{
  objc_storeStrong((id *)&self->_nextNode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextNode, 0);
  objc_storeStrong((id *)&self->_previousNode, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end
