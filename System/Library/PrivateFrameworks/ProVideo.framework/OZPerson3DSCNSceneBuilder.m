@implementation OZPerson3DSCNSceneBuilder

- (OZPerson3DSCNSceneBuilder)initWithName:(id)a3
{
  OZPerson3DSCNSceneBuilder *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OZPerson3DSCNSceneBuilder;
  v4 = -[OZPerson3DSCNSceneBuilder init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_opt_new();
    v4->_geometryMode = 1;
    v4->_rootNode = (SCNNode *)v5;
    -[OZPerson3DSCNSceneBuilder buildPersonGeometry:](v4, "buildPersonGeometry:", a3);
  }
  return v4;
}

- (id)getRootNode
{
  return self->_rootNode;
}

- (void)enablePhysics:(BOOL)a3
{
  _QWORD v3[6];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__OZPerson3DSCNSceneBuilder_enablePhysics___block_invoke_2;
  v3[3] = &unk_1E65C2B80;
  v3[4] = self;
  v3[5] = &__block_literal_global_85;
  v4 = a3;
  -[OZPerson3DSCNSceneBuilder runOnAllBodyGeometry:](self, "runOnAllBodyGeometry:", v3);
}

uint64_t __43__OZPerson3DSCNSceneBuilder_enablePhysics___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t result;
  uint64_t v5;

  if (!a2)
  {
    v5 = 0;
    return objc_msgSend(a3, "setPhysicsBody:", v5);
  }
  result = objc_msgSend(a3, "physicsBody");
  if (!result)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CD59D8], "kinematicBody");
    return objc_msgSend(a3, "setPhysicsBody:", v5);
  }
  return result;
}

uint64_t __43__OZPerson3DSCNSceneBuilder_enablePhysics___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
    return (*(uint64_t (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), a2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_msgSend(a2, "childNodes", 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)setMass:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__OZPerson3DSCNSceneBuilder_setMass___block_invoke;
  v3[3] = &__block_descriptor_36_e17_v16__0__SCNNode_8l;
  v4 = a3;
  -[OZPerson3DSCNSceneBuilder runOnAllBodyGeometry:](self, "runOnAllBodyGeometry:", v3);
}

uint64_t __37__OZPerson3DSCNSceneBuilder_setMass___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "physicsBody"), "setMass:", *(float *)(a1 + 32));
}

- (void)setFriction:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__OZPerson3DSCNSceneBuilder_setFriction___block_invoke;
  v3[3] = &__block_descriptor_36_e17_v16__0__SCNNode_8l;
  v4 = a3;
  -[OZPerson3DSCNSceneBuilder runOnAllBodyGeometry:](self, "runOnAllBodyGeometry:", v3);
}

uint64_t __41__OZPerson3DSCNSceneBuilder_setFriction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "physicsBody"), "setFriction:", *(float *)(a1 + 32));
}

- (void)setOpacity:(float)a3
{
  _QWORD v3[4];
  float v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__OZPerson3DSCNSceneBuilder_setOpacity___block_invoke;
  v3[3] = &__block_descriptor_36_e17_v16__0__SCNNode_8l;
  v4 = a3;
  -[OZPerson3DSCNSceneBuilder runOnAllBodyGeometry:](self, "runOnAllBodyGeometry:", v3);
}

uint64_t __40__OZPerson3DSCNSceneBuilder_setOpacity___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, *(float *)(a1 + 32)));
}

- (void)runOnAllBodyGeometry:(id)a3
{
  OZPerson3DSCNSceneBuilder *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *p_pair1;
  OZPerson3DSCNSceneBuilder *isa;
  OZPerson3DSCNSceneBuilder *left;
  BOOL v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *v10;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *v11;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *v13;

  begin_node = (OZPerson3DSCNSceneBuilder *)self->_jointNodeMap.__tree_.__begin_node_;
  p_pair1 = &self->_jointNodeMap.__tree_.__pair1_;
  if (begin_node != (OZPerson3DSCNSceneBuilder *)&self->_jointNodeMap.__tree_.__pair1_)
  {
    do
    {
      (*((void (**)(id, void *))a3 + 2))(a3, begin_node->_limbNodeMap.__tree_.__pair1_.__value_.__left_);
      isa = (OZPerson3DSCNSceneBuilder *)begin_node->_jointNodeMap.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (OZPerson3DSCNSceneBuilder *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (OZPerson3DSCNSceneBuilder *)begin_node->_jointNodeMap.__tree_.__pair1_.__value_.__left_;
          v9 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v9);
      }
      begin_node = left;
    }
    while (left != (OZPerson3DSCNSceneBuilder *)p_pair1);
  }
  v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)self->_limbNodeMap.__tree_.__begin_node_;
  v11 = &self->_limbNodeMap.__tree_.__pair1_;
  if (v10 != v11)
  {
    do
    {
      (*((void (**)(id, void *))a3 + 2))(a3, v10[5].__value_.__left_);
      v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)v10[1].__value_.__left_;
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)v12->__value_.__left_;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, SCNNode *>, void *>>> *)v10[2].__value_.__left_;
          v9 = v13->__value_.__left_ == v10;
          v10 = v13;
        }
        while (!v9);
      }
      v10 = v13;
    }
    while (v13 != v11);
  }
}

- (uint64_t)setTransform:(double)a3 forJoint:(double)a4
{
  unint64_t v8;
  unint64_t *v9;

  v8 = a7;
  v9 = &v8;
  return objc_msgSend(a1, "setTransform:node:", std::__tree<std::__value_type<HGGPURenderContext const*,HGRef<HGCVGLTextureFactory>>,std::__map_value_compare<HGGPURenderContext const*,std::__value_type<HGGPURenderContext const*,HGRef<HGCVGLTextureFactory>>,std::less<HGGPURenderContext const*>,true>,std::allocator<std::__value_type<HGGPURenderContext const*,HGRef<HGCVGLTextureFactory>>>>::__emplace_unique_key_args<HGGPURenderContext const*,std::piecewise_construct_t const&,std::tuple<HGGPURenderContext const* const&>,std::tuple<>>(a1 + 1, &v8, (uint64_t)&std::piecewise_construct, (uint64_t **)&v9)[5], a2, a3, a4, a5);
}

- (void)updateSimpleGeometry:(float)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  float v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  float v18;
  uint64_t v19;

  v4 = -[NSArray firstObject](-[SCNNode childNodes](self->_rootNode, "childNodes"), "firstObject");
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "childNodes"), "firstObject");
  objc_msgSend(v5, "geometry");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "geometry");
    v7 = a3 + -400.0;
    objc_msgSend(v6, "setHeight:", v7);
    if (objc_msgSend(v5, "physicsBody"))
    {
      objc_msgSend(v5, "setPhysicsBody:", 0);
      objc_msgSend(v5, "setPhysicsBody:", objc_msgSend(MEMORY[0x1E0CD59D8], "kinematicBody"));
      objc_msgSend((id)objc_msgSend(v5, "physicsBody"), "setPhysicsShape:", objc_msgSend(MEMORY[0x1E0CD59F0], "shapeWithGeometry:options:", v6, 0));
    }
  }
  else
  {
    v7 = a3 + -400.0;
  }
  v8 = (void *)objc_msgSend((id)objc_msgSend(v4, "childNodes"), "objectAtIndexedSubscript:", 1);
  v9 = v7 * 0.5;
  v10 = 1065353216;
  v12 = 0;
  v11 = 0;
  v13 = 1065353216;
  v14 = 0;
  v15 = 0;
  v16 = 1065353216;
  v17 = 0;
  v18 = v9;
  v19 = 0x3F80000000000000;
  objc_msgSend(v8, "setTransform:", &v10);
}

- (void)buildPersonGeometry:(id)a3
{
  uint64_t i;
  id v6;
  uint64_t j;
  id v8;
  id v9;

  if (self->_geometryMode)
  {
    v8 = -[OZPerson3DSCNSceneBuilder newRoundCylinderForRoot](self, "newRoundCylinderForRoot");
    objc_msgSend(v8, "setName:", a3);
    -[OZPerson3DSCNSceneBuilder addNode:joint:node:](self, "addNode:joint:node:", v8, 0, self->_rootNode);

  }
  else
  {
    v9 = -[OZPerson3DSCNSceneBuilder newNodeForJoint:](self, "newNodeForJoint:", 0);
    objc_msgSend(v9, "setName:", a3);
    -[OZPerson3DSCNSceneBuilder addNode:joint:node:](self, "addNode:joint:node:", v9, 0, self->_rootNode);
    for (i = 0; i != 16; ++i)
    {
      v6 = -[OZPerson3DSCNSceneBuilder newNodeForJoint:](self, "newNodeForJoint:", i);
      -[OZPerson3DSCNSceneBuilder addNode:joint:node:](self, "addNode:joint:node:", v6, i, v9);
      -[OZPerson3DSCNSceneBuilder defaultTransform:](self, "defaultTransform:", i);
      -[OZPerson3DSCNSceneBuilder setTransform:node:](self, "setTransform:node:", v6);
    }
    for (j = 0; j != 9; ++j)
      -[OZPerson3DSCNSceneBuilder addNode:limb:node:](self, "addNode:limb:node:", -[OZPerson3DSCNSceneBuilder newNodeForLimb:](self, "newNodeForLimb:", j), j, v9);

  }
}

- (__n128)defaultTransform:
{
  return *(__n128 *)MEMORY[0x1E0C83FF0];
}

- (uint64_t)setTransform:(__n128)a3 node:(__n128)a4
{
  _OWORD v8[4];

  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  v8[3] = a4;
  return objc_msgSend(a7, "setTransform:", v8);
}

- (void)addNode:(id)a3 joint:(unint64_t)a4 node:(id)a5
{
  __int128 v7;

  *(_QWORD *)&v7 = a4;
  *((_QWORD *)&v7 + 1) = a3;
  std::__tree<std::__value_type<unsigned long,SCNNode *>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,SCNNode *>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,SCNNode *>>>::__emplace_unique_key_args<unsigned long,std::pair<unsigned long const,SCNNode *>>((uint64_t **)&self->_jointNodeMap, (unint64_t *)&v7, &v7);
  objc_msgSend(a5, "addChildNode:", a3);
}

- (void)addNode:(id)a3 limb:(unint64_t)a4 node:(id)a5
{
  unint64_t v7;
  unint64_t *v8;

  v7 = a4;
  v8 = &v7;
  std::__tree<std::__value_type<HGGPURenderContext const*,HGRef<HGCVGLTextureFactory>>,std::__map_value_compare<HGGPURenderContext const*,std::__value_type<HGGPURenderContext const*,HGRef<HGCVGLTextureFactory>>,std::less<HGGPURenderContext const*>,true>,std::allocator<std::__value_type<HGGPURenderContext const*,HGRef<HGCVGLTextureFactory>>>>::__emplace_unique_key_args<HGGPURenderContext const*,std::piecewise_construct_t const&,std::tuple<HGGPURenderContext const* const&>,std::tuple<>>((uint64_t **)&self->_limbNodeMap, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8)[5] = (uint64_t)a3;
  objc_msgSend(a5, "addChildNode:", a3);
}

- (id)newRoundCylinderForRoot
{
  void *v2;
  void *v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setName:", CFSTR("LIMB core"));
  objc_msgSend(v3, "setGeometry:", objc_msgSend(MEMORY[0x1E0CD5970], "cylinderWithRadius:height:", 200.0, 1000.0));
  objc_msgSend(v2, "addChildNode:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setName:", CFSTR("LIMB top"));
  objc_msgSend(v4, "setGeometry:", objc_msgSend(MEMORY[0x1E0CD5A28], "sphereWithRadius:", 200.0));
  v6 = 1065353216;
  v8 = 0;
  v7 = 0;
  v9 = 1065353216;
  v10 = 0;
  v11 = 0;
  v12 = xmmword_1B3561BF0;
  v13 = 0x3F80000000000000;
  objc_msgSend(v4, "setTransform:", &v6);
  objc_msgSend(v2, "addChildNode:", v4);

  return v2;
}

- (id)newNodeForJoint:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("JOINT %lu"), a3));
  objc_msgSend(v4, "setGeometry:", objc_msgSend(MEMORY[0x1E0CD5A28], "sphereWithRadius:", 100.0));
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "geometry"), "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "blueColor"));
  return v4;
}

- (id)newNodeForLimb:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LIMB %lu"), a3));
  if (a3)
    v5 = objc_msgSend(MEMORY[0x1E0CD5970], "cylinderWithRadius:height:", 100.0, 10.0);
  else
    v5 = objc_msgSend(MEMORY[0x1E0CD5968], "coneWithTopRadius:bottomRadius:height:", 100.0, 50.0, 10.0);
  objc_msgSend(v4, "setGeometry:", v5);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "geometry"), "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x1E0CEA478], "blueColor"));
  return v4;
}

- (SCNMatrix4Pair)getJointTransformsForLimb:(SEL)a3
{
  *(_OWORD *)&retstr->var1.m31 = 0u;
  *(_OWORD *)&retstr->var1.m41 = 0u;
  *(_OWORD *)&retstr->var1.m11 = 0u;
  *(_OWORD *)&retstr->var1.m21 = 0u;
  *(_OWORD *)&retstr->var0.m31 = 0u;
  *(_OWORD *)&retstr->var0.m41 = 0u;
  *(_OWORD *)&retstr->var0.m11 = 0u;
  *(_OWORD *)&retstr->var0.m21 = 0u;
  return self;
}

- (void)updateConeLimbGeometry:(id)a3 upperRadius:(float)a4 lowerRadius:(float)a5 length:(float)a6
{
  void *v9;

  v9 = (void *)objc_msgSend(a3, "geometry");
  objc_msgSend(v9, "setHeight:", a6);
  objc_msgSend(v9, "setTopRadius:", a4);
  objc_msgSend(v9, "setBottomRadius:", a5);
}

- (void)updateCylinderLimbGeometry:(id)a3 length:(float)a4
{
  objc_msgSend((id)objc_msgSend(a3, "geometry"), "setHeight:", a4);
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&self->_limbNodeMap, (_QWORD *)self->_limbNodeMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&self->_jointNodeMap, (_QWORD *)self->_jointNodeMap.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = (char *)self + 40;
  return self;
}

@end
