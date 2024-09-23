@implementation VGSharedMeshDump

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  VGVertexAttributeBufferDump *meshPositions;
  void *v5;
  VGVertexAttributeBufferDump *meshUVs;
  void *v7;
  VGVertexAttributeBufferDump *meshTriangleIndices;
  void *v9;
  id v10;

  v10 = a3;
  meshPositions = self->_meshPositions;
  NSStringFromSelector(sel_meshPositions);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", meshPositions, v5);

  meshUVs = self->_meshUVs;
  NSStringFromSelector(sel_meshUVs);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", meshUVs, v7);

  meshTriangleIndices = self->_meshTriangleIndices;
  NSStringFromSelector(sel_meshTriangleIndices);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", meshTriangleIndices, v9);

}

- (VGSharedMeshDump)initWithCoder:(id)a3
{
  id v4;
  VGSharedMeshDump *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  VGVertexAttributeBufferDump *meshPositions;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  VGVertexAttributeBufferDump *meshUVs;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  VGVertexAttributeBufferDump *meshTriangleIndices;
  VGSharedMeshDump *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VGSharedMeshDump;
  v5 = -[VGSharedMeshDump init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_meshPositions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    meshPositions = v5->_meshPositions;
    v5->_meshPositions = (VGVertexAttributeBufferDump *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_meshUVs);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    meshUVs = v5->_meshUVs;
    v5->_meshUVs = (VGVertexAttributeBufferDump *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_meshTriangleIndices);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    meshTriangleIndices = v5->_meshTriangleIndices;
    v5->_meshTriangleIndices = (VGVertexAttributeBufferDump *)v16;

    v18 = v5;
  }

  return v5;
}

- (VGVertexAttributeBufferDump)meshPositions
{
  return self->_meshPositions;
}

- (void)setMeshPositions:(id)a3
{
  objc_storeStrong((id *)&self->_meshPositions, a3);
}

- (VGVertexAttributeBufferDump)meshUVs
{
  return self->_meshUVs;
}

- (void)setMeshUVs:(id)a3
{
  objc_storeStrong((id *)&self->_meshUVs, a3);
}

- (VGVertexAttributeBufferDump)meshTriangleIndices
{
  return self->_meshTriangleIndices;
}

- (void)setMeshTriangleIndices:(id)a3
{
  objc_storeStrong((id *)&self->_meshTriangleIndices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshTriangleIndices, 0);
  objc_storeStrong((id *)&self->_meshUVs, 0);
  objc_storeStrong((id *)&self->_meshPositions, 0);
}

@end
