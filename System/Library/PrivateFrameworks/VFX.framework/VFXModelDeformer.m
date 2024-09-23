@implementation VFXModelDeformer

- (VFXModelDeformer)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXModelDeformer;
  return -[VFXModelDeformer init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)requiredInputs
{
  return 0;
}

- (unint64_t)supportedOutputs
{
  return 1;
}

- (unint64_t)requiredOutputs
{
  return 1;
}

- (BOOL)deformedMeshReliesOnTransforms
{
  return 0;
}

- (BOOL)deformedMeshReliesOnFrustum
{
  return 0;
}

- (BOOL)_getDeformedMeshBoundingBox:(id *)a3
{
  return 0;
}

- (id)meshForDeformedTopology
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (id)dependencyNodeAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)_enumerateDependencyNodesUsingBlock:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v11 = 0;
  v8 = objc_msgSend_requiredInputs(self, a2, (uint64_t)a3, v3);
  if ((v8 & 0x700) != 0)
  {
    v9 = objc_msgSend_dependencyNodeAtIndex_(self, v6, 0, v7);
    (*((void (**)(id, _QWORD, uint64_t, uint64_t, char *))a3 + 2))(a3, 0, v9, v8, &v11);
  }
  if ((v8 & 0x3800) != 0)
  {
    v10 = objc_msgSend_dependencyNodeAtIndex_(self, v6, 1, v7);
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, char *))a3 + 2))(a3, 1, v10, v8, &v11);
  }
}

- (id)newDeformerInstanceForNode:(id)a3 outputs:(unint64_t)a4 computeVertexCount:(unint64_t)a5 context:(id)a6
{
  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, a4, a5, a6);
  return 0;
}

@end
