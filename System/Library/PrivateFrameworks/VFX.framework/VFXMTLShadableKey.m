@implementation VFXMTLShadableKey

- (BOOL)isEqual:(id)a3
{
  return self->_material == (__CFXMaterial *)*((_QWORD *)a3 + 1)
      && self->_geometry == (__CFXGeometry *)*((_QWORD *)a3 + 2)
      && self->_pipeline == (VFXMTLRenderPipeline *)*((_QWORD *)a3 + 3);
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = ((uint64_t)&self->_geometry[12761710].var4
      + 64 * ((uint64_t)self->_material + 2654435769)
      + (((unint64_t)self->_material + 2654435769u) >> 2)
      + 1) ^ ((uint64_t)self->_material + 2654435769);
  return ((unint64_t)&self->_pipeline[12289054]._renderPassDesc.stencilFormat + 64 * v2 + (v2 >> 2) + 1) ^ v2;
}

@end
