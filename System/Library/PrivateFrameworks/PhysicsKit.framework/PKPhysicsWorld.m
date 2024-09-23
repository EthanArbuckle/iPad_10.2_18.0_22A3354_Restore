@implementation PKPhysicsWorld

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)aether
{
  return (void *)*((_QWORD *)self->_world + 12894);
}

- (void)enumerateBodiesAtPoint:(CGPoint)a3 usingBlock:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD v12[3];
  _QWORD v13[5];
  id v14;
  __int128 v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = x + -0.5;
  v9 = y + -0.5;
  v16.size.width = 1.0;
  v16.size.height = 1.0;
  v16.origin.x = v8;
  v16.origin.y = v9;
  if (!CGRectIsEmpty(v16))
  {
    v17.size.width = 1.0;
    v17.size.height = 1.0;
    v17.origin.x = v8;
    v17.origin.y = v9;
    if (!CGRectIsNull(v17))
    {
      v18.size.width = 1.0;
      v18.size.height = 1.0;
      v18.origin.x = v8;
      v18.origin.y = v9;
      if (CGRectIsInfinite(v18))
      {
        v15 = xmmword_208FD6370;
      }
      else
      {
        *(float *)&v10 = v8 * PKGet_INV_PTM_RATIO();
        *(float *)&v11 = v9 * PKGet_INV_PTM_RATIO();
        *(_QWORD *)&v15 = __PAIR64__(v11, v10);
        *((float *)&v15 + 2) = PKGet_INV_PTM_RATIO() + *(float *)&v10;
        *((float *)&v15 + 3) = PKGet_INV_PTM_RATIO() + *(float *)&v11;
      }
      v12[2] = 1;
      memset(v13, 0, 32);
      v13[4] = 1065353216;
      v12[0] = &off_24C0E8198;
      v12[1] = v15;
      v14 = (id)MEMORY[0x20BD0BCF8](v7);
      b2World::QueryAABB((uint64_t)self->_world, (uint64_t)v12, (float *)&v15);
      v12[0] = &off_24C0E8198;

      std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::~__hash_table((uint64_t)v13);
    }
  }

}

- (void)enumerateBodiesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  unsigned int v10;
  unsigned int v11;
  float v12;
  float v13;
  unsigned int v14;
  unsigned int v15;
  void (**v16)(PKQueryHandler *__hidden);
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;
  id v20;
  __int128 v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectIsEmpty(v22))
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    if (!CGRectIsNull(v23))
    {
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      if (CGRectIsInfinite(v24))
      {
        v21 = xmmword_208FD6370;
      }
      else
      {
        *(float *)&v10 = x * PKGet_INV_PTM_RATIO();
        *(float *)&v11 = y * PKGet_INV_PTM_RATIO();
        *(_QWORD *)&v21 = __PAIR64__(v11, v10);
        v12 = PKGet_INV_PTM_RATIO();
        v13 = PKGet_INV_PTM_RATIO();
        *(float *)&v14 = *(float *)&v10 + width * v12;
        *(float *)&v15 = *(float *)&v11 + height * v13;
        *((_QWORD *)&v21 + 1) = __PAIR64__(v15, v14);
      }
      v17 = 0u;
      memset(v18, 0, sizeof(v18));
      v16 = &off_24C0E8198;
      v19 = 1065353216;
      BYTE8(v17) = 0;
      v20 = (id)MEMORY[0x20BD0BCF8](v9);
      b2World::QueryAABB((uint64_t)self->_world, (uint64_t)&v16, (float *)&v21);
      v16 = &off_24C0E8198;

      std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::~__hash_table((uint64_t)v18);
    }
  }

}

- (void)enumerateBodiesAlongRayStart:(CGPoint)a3 end:(CGPoint)a4 usingBlock:(id)a5
{
  double y;
  double x;
  double v7;
  double v8;
  id v10;
  float v11;
  float v12;
  unsigned int v13;
  unsigned int v14;
  float v15;
  float v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  void (**v23)(PKRayCastHandler *__hidden);
  id v24;
  uint64_t v25[3];
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v10 = a5;
  v11 = PKGet_INV_PTM_RATIO();
  v12 = PKGet_INV_PTM_RATIO();
  *(float *)&v13 = v8 * v11;
  *(float *)&v14 = v7 * v12;
  v28 = __PAIR64__(v14, v13);
  v15 = PKGet_INV_PTM_RATIO();
  v16 = PKGet_INV_PTM_RATIO();
  *(float *)&v17 = x * v15;
  *(float *)&v18 = y * v16;
  v27 = __PAIR64__(v18, v17);
  v23 = &off_24C0E84A8;
  v24 = 0;
  v25[0] = (uint64_t)v25;
  v25[1] = (uint64_t)v25;
  v25[2] = 0;
  v26 = 0;
  v19 = (void *)MEMORY[0x20BD0BCF8](v10);
  v20 = v24;
  v24 = v19;

  *(float *)&v21 = v8;
  *(float *)&v22 = v7;
  v26 = __PAIR64__(v22, v21);
  b2World::RayCast((uint64_t)self->_world, (uint64_t)&v23, &v28, (uint64_t *)&v27);
  PKRayCastHandler::issueCallbacks((PKRayCastHandler *)&v23);
  v23 = &off_24C0E84A8;
  std::__list_imp<PKRayCastItem>::clear(v25);

}

- (id)bodyAtPoint:(CGPoint)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__PKPhysicsWorld_bodyAtPoint___block_invoke;
  v5[3] = &unk_24C0E8E68;
  v5[4] = &v6;
  -[PKPhysicsWorld enumerateBodiesAtPoint:usingBlock:](self, "enumerateBodiesAtPoint:usingBlock:", v5, a3.x, a3.y);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__PKPhysicsWorld_bodyAtPoint___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (id)bodyInRect:(CGRect)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__PKPhysicsWorld_bodyInRect___block_invoke;
  v5[3] = &unk_24C0E8E68;
  v5[4] = &v6;
  -[PKPhysicsWorld enumerateBodiesInRect:usingBlock:](self, "enumerateBodiesInRect:usingBlock:", v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__PKPhysicsWorld_bodyInRect___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (id)bodyAlongRayStart:(CGPoint)a3 end:(CGPoint)a4
{
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__PKPhysicsWorld_bodyAlongRayStart_end___block_invoke;
  v6[3] = &unk_24C0E8E90;
  v6[4] = &v7;
  -[PKPhysicsWorld enumerateBodiesAlongRayStart:end:usingBlock:](self, "enumerateBodiesAlongRayStart:end:usingBlock:", v6, a3.x, a3.y, a4.x, a4.y);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__PKPhysicsWorld_bodyAlongRayStart_end___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (void)setSpeed:(double)a3
{
  float v3;

  v3 = a3;
  self->_speed = v3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setVelocityThreshold:(double)a3
{
  float v3;

  v3 = a3;
  b2World::SetVelocityThreshold((b2World *)self->_world, v3);
}

- (double)velocityThreshold
{
  return b2World::GetVelocityThreshold((b2World *)self->_world);
}

- (BOOL)isSettling
{
  return b2World::IsSettling((b2World *)self->_world);
}

- (void)setSettlingLinearVelocityThreshold:(double)a3
{
  float v3;

  v3 = a3;
  b2World::SetSettlingLinearVelocityThreshold((b2World *)self->_world, v3);
}

- (double)settlingLinearVelocityThreshold
{
  return b2World::GetSettlingLinearVelocityThreshold((b2World *)self->_world);
}

- (void)setSettlingAngularVelocityThreshold:(double)a3
{
  float v3;

  v3 = a3;
  b2World::SetSettlingAngularVelocityThreshold((b2World *)self->_world, v3);
}

- (double)settlingAngularVelocityThreshold
{
  return b2World::GetSettlingAngularVelocityThreshold((b2World *)self->_world);
}

- (void)setSettlingDuration:(double)a3
{
  float v3;

  v3 = a3;
  b2World::SetSettlingDuration((b2World *)self->_world, v3);
}

- (double)settlingDuration
{
  return b2World::GetSettlingDuration((b2World *)self->_world);
}

- (void)__init__
{
  b2Vec2 *p_gravity;
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *bodies;
  NSMutableArray *v7;
  NSMutableArray *joints;
  NSMutableArray *v9;
  NSMutableArray *postStepBlocks;

  self->_gravity = (b2Vec2)0xC11CCCCD00000000;
  p_gravity = &self->_gravity;
  self->_accumulatedDt = 0.0;
  self->_speed = 1.0;
  self->_doSleep = 1;
  v4 = operator new();
  b2World::b2World((b2World *)v4, p_gravity, LOBYTE(p_gravity[1].x));
  self->_world = (void *)v4;
  *(_BYTE *)(v4 + 103189) = 1;
  b2World::SetContactListener((b2World *)v4, (b2ContactListener *)&self->_contactListener);
  *((_DWORD *)self->_world + 25734) &= ~4u;
  v5 = (NSMutableArray *)objc_opt_new();
  bodies = self->_bodies;
  self->_bodies = v5;

  v7 = (NSMutableArray *)objc_opt_new();
  joints = self->_joints;
  self->_joints = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  postStepBlocks = self->_postStepBlocks;
  self->_postStepBlocks = v9;

}

- (PKPhysicsWorld)init
{
  PKPhysicsWorld *v2;
  PKPhysicsWorld *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsWorld;
  v2 = -[PKPhysicsWorld init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKPhysicsWorld __init](v2, "__init");
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_joints, CFSTR("_joints"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodies, CFSTR("_bodies"));
  -[PKPhysicsWorld gravity](self, "gravity");
  objc_msgSend(v4, "encodeCGVector:forKey:", CFSTR("gravity"));
  -[PKPhysicsWorld speed](self, "speed");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("speedMultiplier"));

}

- (PKPhysicsWorld)initWithCoder:(id)a3
{
  id v4;
  PKPhysicsWorld *v5;
  PKPhysicsWorld *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _QWORD v36[2];
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPhysicsWorld;
  v5 = -[PKPhysicsWorld init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPhysicsWorld __init](v5, "__init");
    v7 = (void *)MEMORY[0x24BDBCF20];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_bodies"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_msgSend(v15, "_inUse") & 1) == 0)
            -[PKPhysicsWorld addBody:](v6, "addBody:", v15);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v12);
    }

    v16 = (void *)MEMORY[0x24BDBCF20];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("_joints"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          if ((objc_msgSend(v24, "_inUse", (_QWORD)v26) & 1) == 0)
            -[PKPhysicsWorld addJoint:](v6, "addJoint:", v24);
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v21);
    }

    objc_msgSend(v4, "decodeCGVectorForKey:", CFSTR("gravity"));
    -[PKPhysicsWorld setGravity:](v6, "setGravity:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speedMultiplier"));
    -[PKPhysicsWorld setSpeed:](v6, "setSpeed:");

  }
  return v6;
}

- (void)dealloc
{
  b2World *world;
  objc_super v4;

  -[PKPhysicsWorld removeAllJoints](self, "removeAllJoints");
  -[PKPhysicsWorld removeAllBodies](self, "removeAllBodies");
  -[PKPhysicsWorld removeAllFields](self, "removeAllFields");
  world = (b2World *)self->_world;
  if (world)
  {
    b2World::~b2World(world);
    MEMORY[0x20BD0BA58]();
    self->_world = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPhysicsWorld;
  -[PKPhysicsWorld dealloc](&v4, sel_dealloc);
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasBodies
{
  return -[NSMutableArray count](self->_bodies, "count") != 0;
}

- (BOOL)hasFields
{
  return PKCAether::fieldCount(*((PKCAether **)self->_world + 12894)) != 0;
}

- (void)setGravity:(CGVector)a3
{
  float dy;
  _QWORD v5[5];

  *(float *)&a3.dx = a3.dx;
  dy = a3.dy;
  self->_gravity.x = *(float *)&a3.dx;
  self->_gravity.y = dy;
  b2World::SetGravity((b2World *)self->_world, &self->_gravity, (__n128)a3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__PKPhysicsWorld_setGravity___block_invoke;
  v5[3] = &unk_24C0E8EB8;
  v5[4] = self;
  -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v5);
}

b2Body *__29__PKPhysicsWorld_setGravity___block_invoke(uint64_t a1)
{
  b2Body *result;
  b2Vec2 i;

  result = (b2Body *)objc_msgSend(*(id *)(a1 + 32), "_world");
  for (i = result[444].var13; i; i = *(b2Vec2 *)(*(_QWORD *)&i + 168))
    result = b2Body::SetAwake(*(b2Body **)&i, 1);
  return result;
}

- (CGVector)gravity
{
  double x;
  double y;
  CGVector result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  result.dy = y;
  result.dx = x;
  return result;
}

- (void)setCollisionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactListener._contactDelegate, a3);
}

- (id)collisionDelegate
{
  return objc_loadWeakRetained((id *)&self->_contactListener._contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contactListener._contactDelegate, a3);
}

- (PKPhysicsContactDelegate)contactDelegate
{
  return (PKPhysicsContactDelegate *)objc_loadWeakRetained((id *)&self->_contactListener._contactDelegate);
}

- (id)bodies
{
  return (id)-[NSMutableArray copy](self->_bodies, "copy");
}

- (id)joints
{
  NSMutableArray **p_joints;
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_joints = &self->_joints;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_joints, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *p_joints;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "_implicit", (_QWORD)v10) & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)addBody:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "_inUse"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Cant add body, already exists in a world"), CFSTR("Cant add body %@, already exists in a world"), v4);
  }
  else
  {
    objc_msgSend(v4, "set_inUse:", 1);
    objc_msgSend(v4, "set_world:", self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __26__PKPhysicsWorld_addBody___block_invoke;
    v5[3] = &unk_24C0E8EE0;
    v5[4] = self;
    v6 = v4;
    -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v5);

  }
}

uint64_t __26__PKPhysicsWorld_addBody___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  const b2FixtureDef **v5;
  uint64_t result;
  b2FixtureDef *v7;
  uint64_t Fixture;
  double v9;
  float var6;
  b2BodyDef v12;

  objc_msgSend(*(id *)(a1 + 32), "_bodies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v3 = *(void **)(a1 + 40);
  if (v3)
    objc_msgSend(v3, "_bodyDef");
  else
    memset(&v12, 0, sizeof(v12));
  objc_msgSend(*(id *)(a1 + 40), "set_body:", b2World::CreateBody((b2World *)objc_msgSend(*(id *)(a1 + 32), "_world", *(_OWORD *)&v12._sk_affectedByGravity, *(_OWORD *)&v12._sk_intersectionCallbackBitMask, *(_OWORD *)&v12.angle, *(_OWORD *)&v12.charge, *(_OWORD *)&v12.active), &v12));
  v4 = objc_msgSend(*(id *)(a1 + 40), "_body");
  *(_QWORD *)(v4 + 240) = *(_QWORD *)(a1 + 40);
  v5 = *(const b2FixtureDef ***)objc_msgSend(*(id *)(a1 + 40), "_shapes");
  for (result = objc_msgSend(*(id *)(a1 + 40), "_shapes");
        v5 != *(const b2FixtureDef ***)(result + 8);
        result = objc_msgSend(*(id *)(a1 + 40), "_shapes", v9))
  {
    v7 = (b2FixtureDef *)*v5;
    Fixture = b2Body::CreateFixture((b2Body *)v4, *v5);
    v7[1].var0 = (b2Shape *)Fixture;
    *(float *)&v9 = v7->var5;
    var6 = v7->var6;
    if (*(float *)&v9 != 1.0 || var6 != 1.0)
    {
      *(float *)&v9 = PKPhysicsReapplyScaleOnFixture(v7, (b2Fixture *)Fixture, *(float *)&v9, var6);
      Fixture = (uint64_t)v7[1].var0;
    }
    *(_QWORD *)(Fixture + 72) = *(_QWORD *)(a1 + 40);
    ++v5;
  }
  return result;
}

- (void)removeBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v4 = a3;
  v18 = v4;
  objc_msgSend(v4, "_joints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NSMutableArray removeObject:](self->_bodies, "removeObject:", v4);
  objc_msgSend(v4, "set_inUse:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        -[PKPhysicsWorld removeJoint:](self, "removeJoint:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }

  v11 = objc_msgSend(v4, "_body");
  if (v11)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __29__PKPhysicsWorld_removeBody___block_invoke;
    v12[3] = &unk_24C0E8F08;
    v12[4] = self;
    v12[5] = v17;
    v12[6] = v11;
    -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v12);
  }
  objc_msgSend(v4, "clearBox2DData");

  _Block_object_dispose(v17, 8);
}

void __29__PKPhysicsWorld_removeBody___block_invoke(uint64_t a1)
{
  b2World *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 240) = 0;
  v2 = (b2World *)objc_msgSend(*(id *)(a1 + 32), "_world");
  b2World::DestroyBody(v2, *(b2Body **)(a1 + 48), v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)removeAllBodies
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *obj;
  _QWORD v16[7];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_bodies;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v5);
        v21[0] = 0;
        v21[1] = v21;
        v21[2] = 0x3032000000;
        v21[3] = __Block_byref_object_copy_;
        v21[4] = __Block_byref_object_dispose_;
        v7 = v6;
        v22 = v7;
        objc_msgSend(v7, "_joints");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "copy");

        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v10);
              -[PKPhysicsWorld removeJoint:](self, "removeJoint:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
          }
          while (v11);
        }

        objc_msgSend(v7, "set_inUse:", 0);
        v14 = objc_msgSend(v7, "_body");
        if (v14)
        {
          v16[0] = MEMORY[0x24BDAC760];
          v16[1] = 3221225472;
          v16[2] = __33__PKPhysicsWorld_removeAllBodies__block_invoke;
          v16[3] = &unk_24C0E8F08;
          v16[5] = v21;
          v16[6] = v14;
          v16[4] = self;
          -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v16);
        }
        objc_msgSend(v7, "clearBox2DData");

        _Block_object_dispose(v21, 8);
        ++v5;
      }
      while (v5 != v3);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v3);
  }

  -[NSMutableArray removeAllObjects](self->_bodies, "removeAllObjects");
}

void __33__PKPhysicsWorld_removeAllBodies__block_invoke(uint64_t a1)
{
  b2World *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 240) = 0;
  v2 = (b2World *)objc_msgSend(*(id *)(a1 + 32), "_world");
  b2World::DestroyBody(v2, *(b2Body **)(a1 + 48), v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)addJoint:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  PKPhysicsWorld *v7;

  v4 = a3;
  if (objc_msgSend(v4, "_inUse"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Cant add joint, already exists in a world"), CFSTR("Cant add joint %@, already exists in a world"), v4);
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __27__PKPhysicsWorld_addJoint___block_invoke;
    v5[3] = &unk_24C0E8EE0;
    v6 = v4;
    v7 = self;
    -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v5);

  }
}

void __27__PKPhysicsWorld_addJoint___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "set_inUse:", 1);
  objc_msgSend(*(id *)(a1 + 32), "create");
  objc_msgSend(*(id *)(a1 + 32), "set_joint:", b2World::CreateJoint((b2World *)objc_msgSend(*(id *)(a1 + 40), "_world"), (b2Joint *)objc_msgSend(*(id *)(a1 + 32), "_jointDef")));
  *(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "_joint") + 120) = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bodyA");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "bodyA");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_joints");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "bodyB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "bodyB");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_joints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

  }
}

- (void)removeJoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[6];

  v4 = a3;
  -[NSMutableArray removeObject:](self->_joints, "removeObject:", v4);
  objc_msgSend(v4, "bodyA");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "bodyA");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_joints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v4);

  }
  objc_msgSend(v4, "bodyB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "bodyB");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_joints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v4);

  }
  v11 = objc_msgSend(v4, "_joint");
  if (v11)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __30__PKPhysicsWorld_removeJoint___block_invoke;
    v12[3] = &unk_24C0E8F30;
    v12[4] = self;
    v12[5] = v11;
    -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v12);
  }
  objc_msgSend(v4, "set_joint:", 0);
  objc_msgSend(v4, "set_inUse:", 0);

}

b2Joint *__30__PKPhysicsWorld_removeJoint___block_invoke(uint64_t a1)
{
  return b2World::DestroyJoint((b2World *)objc_msgSend(*(id *)(a1 + 32), "_world"), *(b2Joint **)(a1 + 40));
}

- (void)removeAllJoints
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_joints;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v7, "_implicit") & 1) == 0)
        {
          objc_msgSend(v7, "bodyA");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8 == 0;

          if (!v9)
          {
            objc_msgSend(v7, "bodyA");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "_joints");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeObject:", v7);

          }
          objc_msgSend(v7, "bodyB");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (!v13)
          {
            objc_msgSend(v7, "bodyB");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_joints");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObject:", v7);

          }
          v16 = objc_msgSend(v7, "_joint");
          if (v16)
          {
            v17[0] = MEMORY[0x24BDAC760];
            v17[1] = 3221225472;
            v17[2] = __33__PKPhysicsWorld_removeAllJoints__block_invoke;
            v17[3] = &unk_24C0E8F30;
            v17[4] = self;
            v17[5] = v16;
            -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v17);
          }
          objc_msgSend(v7, "set_joint:", 0);
          objc_msgSend(v7, "set_inUse:", 0);
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](self->_joints, "removeAllObjects");
}

b2Joint *__33__PKPhysicsWorld_removeAllJoints__block_invoke(uint64_t a1)
{
  return b2World::DestroyJoint((b2World *)objc_msgSend(*(id *)(a1 + 32), "_world"), *(b2Joint **)(a1 + 40));
}

- (void)addField:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__PKPhysicsWorld_addField___block_invoke;
  v6[3] = &unk_24C0E8EE0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PKPhysicsWorld _runBlockOutsideOfTimeStep:](self, "_runBlockOutsideOfTimeStep:", v6);

}

void __27__PKPhysicsWorld_addField___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;

  v2 = *(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "_world") + 103152);
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "_field");
    v9 = v8;
    if (*((_QWORD *)&v8 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 16);
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
    }
  }
  else
  {
    *((_QWORD *)&v8 + 1) = 0;
    v9 = 0uLL;
  }
  PKCAether::addField(v2, &v9);
  if (*((_QWORD *)&v9 + 1))
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v9 + 1));
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      (*(void (**)(_QWORD))(**((_QWORD **)&v8 + 1) + 16))(*((_QWORD *)&v8 + 1));
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v8 + 1));
    }
  }
}

- (void)removeField:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *((_QWORD *)self->_world + 12894);
    objc_msgSend(v4, "_field");
    v13 = v11;
    v14 = v12;
    if (v12)
    {
      p_shared_weak_owners = (unint64_t *)&v12->__shared_weak_owners_;
      do
        v8 = __ldxr(p_shared_weak_owners);
      while (__stxr(v8 + 1, p_shared_weak_owners));
    }
    PKCAether::removeField(v6, &v13);
    if (v14)
      std::__shared_weak_count::__release_weak(v14);
    if (v12)
    {
      p_shared_owners = (unint64_t *)&v12->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)())v12->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }

}

- (void)removeAllFields
{
  PKCAether::removeAllFields(*((PKCAether **)self->_world + 12894));
}

- (id)sampleFields:(CGRect)a3 categories:(unsigned int)a4 dataSize:(CGSize)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double y;
  double x;
  size_t v13;
  float *v14;
  float *v15;
  int v16;
  float *v17;
  int v18;
  float v19;
  float v20;
  float v21;
  float v22;
  unint64_t v23;
  double v24;
  void *v32;
  float32x4_t v34;
  void *__p;
  void *v36;
  float32x4_t *v37;

  height = a5.height;
  width = a5.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  PKCAether::Evaluator::Evaluator((PKCAether::Evaluator *)&v34, *((const PKCAether **)self->_world + 12894));
  v13 = vcvtd_n_u64_f64(width * height, 2uLL);
  v14 = (float *)malloc_type_malloc(v13, 0x26069796uLL);
  v15 = v14;
  if (height > 0.0)
  {
    v16 = 0;
    v17 = v14;
    do
    {
      if (width > 0.0)
      {
        v18 = 0;
        do
        {
          v20 = PKGet_INV_PTM_RATIO();
          v21 = PKGet_INV_PTM_RATIO();
          v22 = x + v9 * (float)v18 / width;
          *(float *)&v23 = v20 * v22;
          v19 = y + v8 * (float)v16 / height;
          *((float *)&v23 + 1) = v21 * v19;
          LODWORD(v24) = 1.0;
          PKCAether::Evaluator::evalForce(&v34, a4, 0.0, (float32x4_t)v23, (__n128)0, v24, 1.0, *((double *)self->_world + 12899));
          _S2 = _V0.S[2];
          __asm { FMLA            S1, S2, V0.S[2] }
          *v17++ = sqrtf(_S1);
          ++v18;
        }
        while (width > (double)v18);
      }
      ++v16;
    }
    while (height > (double)v16);
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:", v15, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }
  v37 = &v34;
  std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  return v32;
}

- (CGVector)sampleFields:(CGPoint)a3
{
  unsigned int v3;
  unsigned int v4;
  float32x2_t v5;
  float64x2_t v6;
  double v7;
  CGVector result;

  *(float *)&v3 = a3.x;
  *(float *)&v4 = a3.y;
  -[PKPhysicsWorld sampleFieldsAt:](self, "sampleFieldsAt:", COERCE_DOUBLE(__PAIR64__(v4, v3)));
  v6 = vcvtq_f64_f32(v5);
  v7 = v6.f64[1];
  result.dx = v6.f64[0];
  result.dy = v7;
  return result;
}

- (__n128)sampleFieldsAt:(uint64_t)a1
{
  float v3;
  float v4;
  unint64_t v5;
  double v6;
  __int128 v7;
  __int128 v10;
  float32x4_t v11;
  void *__p;
  void *v13;
  float32x4_t *v14;

  PKCAether::Evaluator::Evaluator((PKCAether::Evaluator *)&v11, *(const PKCAether **)(*(_QWORD *)(a1 + 8) + 103152));
  v3 = PKGet_INV_PTM_RATIO();
  v4 = PKGet_INV_PTM_RATIO();
  *(float *)&v5 = v3 * *(float *)&a2;
  HIDWORD(v5) = vmuls_lane_f32(v4, *(float32x2_t *)&a2, 1);
  LODWORD(v6) = 1.0;
  PKCAether::Evaluator::evalForce(&v11, -1, 0.0, (float32x4_t)v5, (__n128)0, v6, 1.0, *(double *)(*(_QWORD *)(a1 + 8) + 103192));
  v10 = v7;
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
  v14 = &v11;
  std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  return (__n128)v10;
}

- (CGVector)evalForce:(unsigned int)a3 point:(CGPoint)a4
{
  double y;
  double x;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  unint64_t v12;
  double v13;
  float32x2_t v14;
  double v15;
  double v16;
  float32x2_t v17;
  float64x2_t v18;
  float32x4_t v19;
  void *__p;
  void *v21;
  float32x4_t *v22;
  CGVector result;

  y = a4.y;
  x = a4.x;
  PKCAether::Evaluator::Evaluator((PKCAether::Evaluator *)&v19, *((const PKCAether **)self->_world + 12894));
  v7 = PKGet_INV_PTM_RATIO();
  v8 = PKGet_INV_PTM_RATIO();
  v9 = y;
  v10 = x;
  v11 = v8 * v9;
  *(float *)&v12 = v7 * v10;
  *((float *)&v12 + 1) = v11;
  LODWORD(v13) = 1.0;
  PKCAether::Evaluator::evalForce(&v19, -1, 0.0, (float32x4_t)v12, (__n128)0, v13, 1.0, *((double *)self->_world + 12899));
  if (__p)
  {
    v21 = __p;
    v17 = v14;
    operator delete(__p);
    v14 = v17;
  }
  v18 = vcvtq_f64_f32(v14);
  v22 = &v19;
  std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
  v16 = v18.f64[1];
  v15 = v18.f64[0];
  result.dy = v16;
  result.dx = v15;
  return result;
}

- (BOOL)stepWithTime:(double)a3 velocityIterations:(unint64_t)a4 positionIterations:(unint64_t)a5
{
  int v5;
  int v6;
  double v9;
  double v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t j;
  void *v23;
  void *v24;
  BOOL v25;
  void (**v26)(_QWORD, _QWORD);
  BOOL v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v5 = a5;
  v6 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableArray count](self->_bodies, "count"))
    return 0;
  v9 = self->_accumulatedDt + a3 * self->_speed;
  self->_accumulatedDt = v9;
  if (v9 >= 0.00833333377)
  {
    do
    {
      b2World::Step((b2World *)self->_world, 0.0083333, v6, v5);
      v10 = self->_accumulatedDt + -0.00833333377;
      self->_accumulatedDt = v10;
    }
    while (v10 >= 0.00833333377);
  }
  (*((void (**)(PKContactListener *))self->_contactListener._vptr$b2ContactListener + 7))(&self->_contactListener);
  b2World::ClearForces((b2World *)self->_world);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = self->_postStepBlocks;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v15)
          (*(void (**)(void))(v15 + 16))();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_postStepBlocks, "removeAllObjects");
  v16 = self->_bodies;
  v17 = v16;
  if (v16)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v16;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v30;
      v21 = 1;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v23, "postStepBlock", (_QWORD)v29);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (!v25)
          {
            objc_msgSend(v23, "postStepBlock");
            v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v26)[2](v26, v23);

          }
          if (objc_msgSend(v23, "isDynamic"))
            v21 &= objc_msgSend(v23, "isResting");
        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v19);
    }
    else
    {
      LOBYTE(v21) = 1;
    }

    v27 = (v21 & 1) == 0;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  begin = self->drawPacket._colors.__begin_;
  if (begin)
  {
    self->drawPacket._colors.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->drawPacket._linePoints.__begin_;
  if (v4)
  {
    self->drawPacket._linePoints.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_postStepBlocks, 0);
  objc_storeStrong((id *)&self->_joints, 0);
  objc_storeStrong((id *)&self->_bodies, 0);
  PKContactListener::~PKContactListener(&self->_contactListener);
}

- (id).cxx_construct
{
  PKContactListener::PKContactListener(&self->_contactListener);
  *(_OWORD *)&self->drawPacket._linePoints.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->drawPacket._colors.__end_ = 0u;
  *(_OWORD *)&self->drawPacket._linePoints.__begin_ = 0u;
  return self;
}

- (void)debugDraw:(float)a3 matrix:(_GLSKMatrix4 *)a4 showsPhysics:(BOOL)a5 showsOutlineInterior:(BOOL)a6 showsFields:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  BOOL v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  uint64_t j;
  int v23;
  void *v24;
  void *v25;
  void *world;
  char IsAwake;
  void *v28;
  void *v29;
  char v30;
  _QWORD *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float *v40;
  float32x2_t *v41;
  float v42;
  float32x2_t v43;
  float32x2_t v44;
  float v45;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  uint64_t v47;
  unint64_t v48;
  NSMutableArray *obj;
  uint64_t v52;
  uint64_t v53;
  int v54;
  void *__p;
  std::__shared_weak_count *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[3];
  _BYTE v65[128];
  uint64_t v66;

  v7 = a7;
  v8 = a5;
  v66 = *MEMORY[0x24BDAC8D0];
  b2Draw::b2Draw((b2Draw *)v64);
  v64[0] = &off_24C0E7C68;
  v64[2] = &self->drawPacket;
  self->drawPacket._linePoints.__end_ = self->drawPacket._linePoints.__begin_;
  self->drawPacket._colors.__end_ = self->drawPacket._colors.__begin_;
  if (v8)
    v11 = 3;
  else
    v11 = 0;
  if (v7)
    v12 = v11 | 0x20;
  else
    v12 = v11;
  b2Draw::SetFlags((uint64_t)v64, v12);
  b2World::SetDebugDraw((b2World *)self->_world, (b2Draw *)v64);
  if (v8)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = self->_bodies;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (!v13)
      goto LABEL_56;
    v52 = *(_QWORD *)v61;
    v14 = (void *)vdup_n_s32(0x3F19999Au);
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v61 != v52)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "_body");
        if (!v16)
        {
LABEL_22:
          for (j = *(_QWORD *)(v17 + 176); j; j = *(_QWORD *)(j + 16))
          {
            if ((b2Body::IsActive((b2Body *)v17) & 1) != 0)
            {
              v23 = *(_DWORD *)(v17 + 20);
              if (v23 == 1)
              {
                world = self->_world;
                __p = (void *)0x3F0000003F000000;
                LODWORD(v56) = 1063675494;
                b2World::DrawShape((uint64_t)world, j, (b2Transform *)(v17 + 32), (QuadTreeNode *)&__p);
              }
              else if (v23)
              {
                IsAwake = b2Body::IsAwake((b2Body *)v17);
                v28 = self->_world;
                if ((IsAwake & 1) != 0)
                {
                  __p = (void *)0x3E8000003DA3D70ALL;
                  LODWORD(v56) = 1065185444;
                }
                else
                {
                  __p = v14;
                  LODWORD(v56) = 1058642330;
                }
                b2World::DrawShape((uint64_t)v28, j, (b2Transform *)(v17 + 32), (QuadTreeNode *)&__p);
              }
              else
              {
                v24 = self->_world;
                __p = (void *)0x3F6666663F000000;
                LODWORD(v56) = 1056964608;
                b2World::DrawShape((uint64_t)v24, j, (b2Transform *)(v17 + 32), (QuadTreeNode *)&__p);
              }
            }
            else
            {
              v25 = self->_world;
              __p = (void *)0x3F0000003F000000;
              LODWORD(v56) = 1050253722;
              b2World::DrawShape((uint64_t)v25, j, (b2Transform *)(v17 + 32), (QuadTreeNode *)&__p);
            }
          }
          continue;
        }
        objc_msgSend(v16, "outline");
        v18 = v56;
        if (__p)
          v19 = a6;
        else
          v19 = 1;
        if (!v56)
          goto LABEL_21;
        p_shared_owners = (unint64_t *)&v56->__shared_owners_;
        do
          v21 = __ldaxr(p_shared_owners);
        while (__stlxr(v21 - 1, p_shared_owners));
        if (!v21)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
          if (v19)
            goto LABEL_22;
        }
        else
        {
LABEL_21:
          if (v19)
            goto LABEL_22;
        }
        objc_msgSend(v16, "representedObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_opt_respondsToSelector();
        v59 = 0;
        if ((v30 & 1) != 0)
          objc_msgSend(v29, "_getWorldTransform:positionY:rotation:xScale:yScale:", 0, 0, 0, (char *)&v59 + 4, &v59);
        else
          v59 = 0x3F8000003F800000;
        v58 = 0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v29, "_getBasePhysicsScale:yScale:", (char *)&v58 + 4, &v58);
          *(float *)&v59 = *(float *)&v59 / *(float *)&v58;
          *((float *)&v59 + 1) = *((float *)&v59 + 1) / *((float *)&v58 + 1);
        }
        objc_msgSend(v16, "outline");
        v31 = __p;
        v32 = v56;
        if (v56)
        {
          v33 = (unint64_t *)&v56->__shared_owners_;
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        v56 = 0;
        v57 = 0;
        __p = 0;
        std::vector<b2Vec2>::resize((uint64_t)&__p, (uint64_t)(v31[2] - v31[1]) >> 3);
        v35 = v31[1];
        v36 = (int *)__p;
        v37 = v31[2] - v35;
        if (v37)
        {
          v38 = v37 >> 3;
          if ((unint64_t)(v37 >> 3) <= 1)
            v38 = 1;
          v39 = v59;
          v40 = (float *)(v35 + 4);
          v41 = (float32x2_t *)__p;
          do
          {
            v42 = *(v40 - 1) * *((float *)&v39 + 1);
            v43 = *(float32x2_t *)(v17 + 40);
            v44 = (float32x2_t)vrev64_s32((int32x2_t)v43);
            v43.f32[0] = -v43.f32[0];
            v45 = *v40;
            v40 += 2;
            *v41++ = vadd_f32(*(float32x2_t *)(v17 + 32), vmla_n_f32(vmul_n_f32(v43, v45 * *(float *)&v39), v44, v42));
            --v38;
          }
          while (v38);
        }
        v53 = 0x3E8000003DA3D70ALL;
        v54 = 1065185444;
        PKDebugDraw::DrawSolidPolygon((uint64_t)v64, v36, (unint64_t)v37 >> 3, (int *)&v53);
        if (__p)
        {
          v56 = (std::__shared_weak_count *)__p;
          operator delete(__p);
        }

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (!v13)
      {
LABEL_56:

        break;
      }
    }
  }
  b2World::DrawDebugData((b2World *)self->_world);
  b2World::SetDebugDraw((b2World *)self->_world, 0);
  begin = self->drawPacket._linePoints.__begin_;
  v47 = self->drawPacket._linePoints.__end_ - begin;
  if (v47)
  {
    v48 = v47 >> 3;
    if (v48 <= 1)
      v48 = 1;
    do
    {
      *(float32x2_t *)begin = vadd_f32(vadd_f32(vmul_n_f32(*(float32x2_t *)&a4->var0.var0, *(float *)begin * a3), vmul_n_f32(*(float32x2_t *)&a4->var1[4], *((float *)begin + 1) * a3)), vadd_f32(vmul_f32(*(float32x2_t *)&a4->var1[8], 0), *(float32x2_t *)&a4->var1[12]));
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
      --v48;
    }
    while (v48);
  }
}

- (const)debugDrawPacket
{
  return &self->drawPacket;
}

- (void)set_bodies:(id)a3
{
  objc_storeStrong((id *)&self->_bodies, a3);
}

- (NSMutableArray)_bodies
{
  return self->_bodies;
}

- (void)set_doSleep:(BOOL)a3
{
  self->_doSleep = a3;
}

- (BOOL)_doSleep
{
  return self->_doSleep;
}

- (BOOL)isEqualToWorld:(id)a3
{
  PKPhysicsWorld *v4;
  id *p_isa;
  BOOL v6;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (PKPhysicsWorld *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    v6 = 1;
  }
  else if ((COERCE_UNSIGNED_INT(self->_speed - v4->_speed) & 0x60000000) != 0
         || (COERCE_UNSIGNED_INT(self->_gravity.x - v4->_gravity.x) & 0x60000000) != 0
         || (COERCE_UNSIGNED_INT(self->_gravity.y - v4->_gravity.y) & 0x60000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v8 = 0;
    while (-[NSMutableArray count](self->_joints, "count") > v8)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_joints, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[10], "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToJoint:", v10);

      v6 = 0;
      ++v8;
      if ((v11 & 1) == 0)
        goto LABEL_7;
    }
    v12 = 0;
    do
    {
      v13 = -[NSMutableArray count](self->_bodies, "count");
      v6 = v13 <= v12;
      if (v13 <= v12)
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_bodies, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa[9], "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToBody:", v15);

      ++v12;
    }
    while ((v16 & 1) != 0);
  }
LABEL_7:

  return v6;
}

- (void)_runBlockOutsideOfTimeStep:(id)a3
{
  id v4;
  NSMutableArray *postStepBlocks;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*((_BYTE *)self->_world + 102936) & 2) != 0)
  {
    postStepBlocks = self->_postStepBlocks;
    v6 = (void *)MEMORY[0x20BD0BCF8]();
    -[NSMutableArray addObject:](postStepBlocks, "addObject:", v6);

  }
  else
  {
    (*((void (**)(void))v4 + 2))();
  }

}

+ (id)world
{
  return objc_alloc_init(PKPhysicsWorld);
}

- (void)_world
{
  return self->_world;
}

- (b2Vec2)_gravity
{
  float x;
  float y;
  b2Vec2 result;

  x = self->_gravity.x;
  y = self->_gravity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_gravity:(b2Vec2)a3
{
  self->_gravity = a3;
}

@end
