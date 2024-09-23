@implementation OZARPersonInfo

- (OZARPersonInfo)init
{
  return (OZARPersonInfo *)-[OZARPersonInfo init:](self, "init:", objc_msgSend(MEMORY[0x1E0CB3B18], "PCValueWithSIMDFloat4x4:", *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48)));
}

- (id)init:(id)a3
{
  OZARPersonInfo *v4;
  OZARPersonInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OZARPersonInfo;
  v4 = -[OZARPersonInfo init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[OZARPersonInfo setTransform:](v4, "setTransform:", a3);
    -[OZARPersonInfo setJointTransforms:](v5, "setJointTransforms:", (id)objc_opt_new());
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OZARPersonInfo;
  -[OZARPersonInfo dealloc](&v3, sel_dealloc);
}

- (uint64_t)simdTransform
{
  return objc_msgSend((id)objc_msgSend(a1, "transform"), "PCSIMDFloat4x4Value");
}

- (__n128)simdTransform:(uint64_t)a3
{
  void *v4;
  void *v5;
  __n128 result;

  v4 = (void *)objc_msgSend(a1, "jointTransforms");
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  if (v5)
    objc_msgSend(v5, "PCSIMDFloat4x4Value");
  else
    return *(__n128 *)MEMORY[0x1E0C83FF0];
  return result;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSValue)worldSize
{
  return self->_worldSize;
}

- (void)setWorldSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSValue)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableDictionary)jointTransforms
{
  return self->_jointTransforms;
}

- (void)setJointTransforms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSValue)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
