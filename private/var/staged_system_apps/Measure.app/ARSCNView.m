@implementation ARSCNView

- (id)sceneRenderingQueue
{
  return -[ARSCNView _renderingQueue](self, "_renderingQueue");
}

@end
