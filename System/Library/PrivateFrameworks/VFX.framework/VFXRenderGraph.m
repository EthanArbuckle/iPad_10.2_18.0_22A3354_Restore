@implementation VFXRenderGraph

+ (id)renderGraphDescriptionWithSCNTechniqueDescription:(id)a3
{
  return 0;
}

- (VFXRenderGraph)init
{
  VFXRenderGraph *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXRenderGraph;
  v2 = -[VFXRenderGraph init](&v4, sel_init);
  if (v2)
    v2->_authoringGraph = sub_1B1C5F454();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_world = 0;
  v3.receiver = self;
  v3.super_class = (Class)VFXRenderGraph;
  -[VFXRenderGraph dealloc](&v3, sel_dealloc);
}

- (id)world
{
  return self->_world;
}

- (void)addWorldReference:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (void)removeWorldReference:(id)a3
{
  self->_world = 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{

  self->_name = (NSString *)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = (void *)objc_msgSend_allocWithZone_(VFXRenderGraph, a2, (uint64_t)a3, v3);
  v8 = (_QWORD *)objc_msgSend_init(v4, v5, v6, v7);
  v8[1] = sub_1B1C5FA24();
  return v8;
}

- (id)graph
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__compileRenderGraphIfNeeded(self, a2, v2, v3);
  return self->_graph;
}

- (id)diagnostics
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__compileRenderGraphIfNeeded(self, a2, v2, v3);
  return self->_diagnostics;
}

- (id)authoringGraph
{
  return self->_authoringGraph;
}

- (void)setAuthoringGraph:(id)a3
{
  id authoringGraph;

  authoringGraph = self->_authoringGraph;
  if (authoringGraph != a3)
  {

    self->_authoringGraph = a3;
  }
}

- (void)_compileRenderGraphIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  VFXWorld *world;
  uint64_t v6;
  id v7;
  id v8;

  v8 = 0;
  if (!self->_graph)
  {
    world = self->_world;
    v6 = objc_msgSend_authoringGraph(self, a2, v2, v3);
    self->_graph = sub_1B1C5FA5C(world, v6, &v8);
    v7 = v8;

    self->_diagnostics = v8;
  }
}

- (void)invalidateCompiledGraph
{

  self->_graph = 0;
  self->_diagnostics = 0;
}

- (NSArray)attachments
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_graph(self, a2, v2, v3);
  return (NSArray *)sub_1B1C61D80();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;

  v6 = objc_msgSend_valueForKey_(VFXTransaction, a2, (uint64_t)CFSTR("serializationContext"), v3);
  v10 = objc_msgSend_authoringGraph(self, v7, v8, v9);
  v11 = sub_1B1C61D08(v10, v6);
  if (v11)
    objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)v11, (uint64_t)CFSTR("authoringGraph"));
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->_name, (uint64_t)CFSTR("name"));
}

- (VFXRenderGraph)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  VFXRenderGraph *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VFXRenderGraph;
  v6 = -[VFXRenderGraph init](&v18, sel_init);
  if (v6)
  {
    v7 = (void *)objc_msgSend_valueForKey_(VFXTransaction, v4, (uint64_t)CFSTR("VFXWorldLoadingContextKey"), v5);
    v10 = objc_msgSend_valueForKey_(v7, v8, (uint64_t)CFSTR("serializationContext"), v9);
    v11 = objc_opt_class();
    v6->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("name"));
    v13 = objc_opt_class();
    v15 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, (uint64_t)CFSTR("authoringGraph"));
    if (v15)
      v16 = sub_1B1C61C90(v15, v10);
    else
      v16 = sub_1B1C5F454();
    v6->_authoringGraph = v16;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->identifier;
}

@end
