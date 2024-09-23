@implementation PVNoneEffect

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;
  HGNode **v8;
  void *v9;

  v8 = v6;
  -[PVEffect effectID](self, "effectID", a3, a4, a5, a6.m_Obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Rendering a 'None' effect. Please check your effect stack. ID %@"), v9);

  return (HGRef<HGNode>)PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, v8);
}

- (BOOL)loadEffect
{
  void *v3;
  objc_super v5;

  -[PVEffect effectID](self, "effectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Loading a 'None' effect. Please check your effect stack. ID %@"), v3);

  v5.receiver = self;
  v5.super_class = (Class)PVNoneEffect;
  return -[PVEffect loadEffect](&v5, sel_loadEffect);
}

- (CGSize)outputSize
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  -[PVEffect effectID](self, "effectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Querying a 'None' effect. Please check your effect stack. ID %@"), v3);

  v6.receiver = self;
  v6.super_class = (Class)PVNoneEffect;
  -[PVEffect outputSize](&v6, sel_outputSize);
  result.height = v5;
  result.width = v4;
  return result;
}

@end
