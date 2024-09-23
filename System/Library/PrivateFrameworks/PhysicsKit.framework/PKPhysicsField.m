@implementation PKPhysicsField

- (PKPhysicsField)init
{
  PKPhysicsField *v2;
  PKPhysicsField *v3;
  objc_super v10;

  ++fieldCount;
  v10.receiver = self;
  v10.super_class = (Class)PKPhysicsField;
  v2 = -[PKPhysicsField init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)v2->_scale = _Q0;
    -[PKPhysicsField setMinimumRadius:](v2, "setMinimumRadius:", 5.87747298e-39);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  --fieldCount;
  std::shared_ptr<QuadTree>::reset[abi:ne180100](&self->_field.__ptr_);
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsField;
  -[PKPhysicsField dealloc](&v3, sel_dealloc);
}

- (shared_ptr<PKCField>)_field
{
  PKCField **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<PKCField> result;

  cntrl = self->_field.__cntrl_;
  *v2 = self->_field.__ptr_;
  v2[1] = (PKCField *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKCField *)self;
  return result;
}

- (void)set_field:(shared_ptr<PKCField>)a3
{
  PKCField *ptr;

  std::shared_ptr<PKPath>::operator=[abi:ne180100](&self->_field.__ptr_, (uint64_t *)a3.__ptr_);
  ptr = self->_field.__ptr_;
  if (ptr)
    setRegionOnField((uint64_t)ptr, self->_region);
}

- (id)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  PKCField *ptr;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_region, a3);
  ptr = self->_field.__ptr_;
  if (ptr)
    setRegionOnField((uint64_t)ptr, self->_region);

}

- (void)setRepresentedObject:(id)a3
{
  PKCField *ptr;
  id v5;

  v5 = a3;
  ptr = self->_field.__ptr_;
  if (ptr)
    setRepresentedObjectOnField((uint64_t)ptr, v5);

}

- (NSObject)representedObject
{
  void *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
  {
    fieldRepresentedObject((uint64_t)ptr);
    ptr = (void *)objc_claimAutoreleasedReturnValue();
  }
  return ptr;
}

- (float)strength
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    return *((float *)ptr + 49);
  else
    return 1.0;
}

- (void)setStrength:(float)a3
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((float *)ptr + 49) = a3;
}

- (void)setDirection:(PKPhysicsField *)self
{
  __int128 v2;
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((_OWORD *)ptr + 14) = v2;
}

- (double)direction
{
  uint64_t v1;
  __int128 v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    v2 = *(_OWORD *)(v1 + 224);
  else
    *(_QWORD *)&v2 = 0;
  return *(double *)&v2;
}

- (float)falloff
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    return *((float *)ptr + 51);
  else
    return 1.0;
}

- (void)setFalloff:(float)a3
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((float *)ptr + 51) = a3;
}

- (BOOL)isEnabled
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  return ptr && *((_BYTE *)ptr + 244) != 0;
}

- (void)setEnabled:(BOOL)a3
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((_BYTE *)ptr + 244) = a3;
}

- (unsigned)categoryBitMask
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    return *((_DWORD *)ptr + 60);
  else
    return 0;
}

- (void)setCategoryBitMask:(unsigned int)a3
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((_DWORD *)ptr + 60) = a3;
}

- (BOOL)isOverride
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  return ptr && *((_BYTE *)ptr + 200) != 0;
}

- (void)setOverride:(BOOL)a3
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((_BYTE *)ptr + 200) = a3;
}

- (__n128)position
{
  return a1[2];
}

- (float)rotation
{
  return self->_rotation;
}

- (__n128)scale
{
  return a1[4];
}

- (float)minimumRadius
{
  PKCField *ptr;
  float v3;

  ptr = self->_field.__ptr_;
  if (!ptr)
    return 0.00000011921;
  v3 = *((float *)ptr + 52);
  return v3 / PKGet_INV_PTM_RATIO();
}

- (void)setMinimumRadius:(float)a3
{
  PKCField *ptr;

  ptr = self->_field.__ptr_;
  if (ptr)
    *((float *)ptr + 52) = PKGet_INV_PTM_RATIO() * a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  std::shared_ptr<QuadTree>::~shared_ptr[abi:ne180100]((uint64_t)&self->_field);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
