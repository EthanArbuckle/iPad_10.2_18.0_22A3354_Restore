@implementation Li3DEngineSceneManager

- (Li3DEngineSceneManager)init
{
  Li3DEngineSceneManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)Li3DEngineSceneManager;
  v2 = -[Li3DEngineSceneManager init](&v4, sel_init);
  if (v2)
    v2->_appliedForces = (NSMutableSet *)objc_opt_new();
  return v2;
}

- (void)resetSim
{
  -[NSMutableSet removeAllObjects](-[Li3DEngineSceneManager appliedForces](self, "appliedForces"), "removeAllObjects");
}

- (BOOL)hasAppliedForce:(id)a3
{
  return -[NSMutableSet containsObject:](-[Li3DEngineSceneManager appliedForces](self, "appliedForces"), "containsObject:", a3);
}

- (BOOL)applyForce:(const void *)a3 node:(id)a4 arScale:(float)a5 objects:(void *)a6
{
  if (*((double *)a3 + 5) == 0.0
    || !*((_QWORD *)a3 + 6)
    || *(_BYTE *)a3 && -[Li3DEngineSceneManager hasAppliedForce:](self, "hasAppliedForce:"))
  {
    return 0;
  }
  LiPhysicsUtils::ApplyForce((uint64_t)a3, a4, (uint64_t)a6, a5);
  -[NSMutableSet addObject:](-[Li3DEngineSceneManager appliedForces](self, "appliedForces"), "addObject:", *((_QWORD *)a3 + 6));
  return 1;
}

- (NSMutableSet)appliedForces
{
  return self->_appliedForces;
}

@end
