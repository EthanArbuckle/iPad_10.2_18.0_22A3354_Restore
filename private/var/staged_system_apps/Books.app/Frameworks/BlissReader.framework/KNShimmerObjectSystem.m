@implementation KNShimmerObjectSystem

- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8
{
  _BOOL4 v8;
  id v12;
  double v13;
  double v14;
  CGAffineTransform *Rotation;
  double v16;
  double v17;
  float v18;
  float v19;
  float32x2_t v20;
  KNShimmerSystem v21;
  float32x2_t v22;
  double v23;
  void *v24;
  void *v25;
  CGAffineTransform v26;

  v8 = a6;
  v12 = a8;
  v13 = fmax(a3 * 1.1 + -0.1, 0.0);
  v14 = -v13;
  if (v8)
    v14 = v13;
  memset(&v26, 0, sizeof(v26));
  Rotation = CGAffineTransformMakeRotation(&v26, v14 + v14);
  if (v12)
  {
    v16 = TSDMixFloats(Rotation, a3 * 5.0, a3 * a3, a3);
    if (v16 <= 1.0)
      v17 = 1.0 - v16;
    else
      v17 = 0.0;
    v18 = v13;
    v19 = v17 * a4;
    self[2]._vertexUniforms.SpeedMax = v18;
    *(float *)self[3].super.TSDGPUParticleSystem_opaque = v19;
    v20 = vcvt_f32_f64(*(float64x2_t *)&v26.a);
    v21 = (KNShimmerSystem)vcvt_f32_f64(*(float64x2_t *)&v26.c);
    v22 = vcvt_f32_f64(*(float64x2_t *)&v26.tx);
    self[3]._vertexUniforms.Opacity = 0.0;
    *(float32x2_t *)&self[3]._anon_8[4] = v20;
    *(_DWORD *)self[4]._anon_8 = 0;
    self[4].super = v21;
    self[4]._vertexUniforms.SpeedMax = 1.0;
    *(float32x2_t *)&self[4]._vertexUniforms.Percent = v22;
    -[KNShimmerSystem speedMax](self, "speedMax");
    *(float *)&v23 = v23;
    *(_DWORD *)&self[5].super.TSDGPUParticleSystem_opaque[4] = LODWORD(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "renderEncoder"));
    objc_msgSend(v24, "setVertexBytes:length:atIndex:", &self->_vertexUniforms, 144, 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "renderEncoder"));
    -[KNShimmerObjectSystem drawMetalWithEncoder:](self, "drawMetalWithEncoder:", v25);

  }
}

- ($AAD9533F3604406277746FEA2624957A)vertexUniforms
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  $AAD9533F3604406277746FEA2624957A result;

  v3 = *(_OWORD *)&self[4]._vertexUniforms.Percent;
  v2[6] = *(_OWORD *)self[4].super.TSDGPUParticleSystem_opaque;
  v2[7] = v3;
  v2[8] = *(_OWORD *)&self[5].super.TSDGPUParticleSystem_opaque[4];
  v4 = *(_OWORD *)self[2]._anon_8;
  v2[2] = *(_OWORD *)&self[1]._vertexUniforms.Opacity;
  v2[3] = v4;
  v5 = *(_OWORD *)&self[3]._anon_8[4];
  v2[4] = *(_OWORD *)&self[2]._vertexUniforms.SpeedMax;
  v2[5] = v5;
  v7 = *(_OWORD *)&self->_vertexUniforms.Percent;
  v6 = *(_OWORD *)&self[1].super.TSDGPUParticleSystem_opaque[4];
  *v2 = v7;
  v2[1] = v6;
  result.var2 = *(float *)&v7;
  result.var1 = *(float *)&v6;
  return result;
}

- (void)setVertexUniforms:(id)a3
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_OWORD *)&self->_vertexUniforms.Percent = *v3;
  v4 = v3[4];
  v6 = v3[1];
  v5 = v3[2];
  *(_OWORD *)self[2]._anon_8 = v3[3];
  *(_OWORD *)&self[2]._vertexUniforms.SpeedMax = v4;
  *(_OWORD *)&self[1].super.TSDGPUParticleSystem_opaque[4] = v6;
  *(_OWORD *)&self[1]._vertexUniforms.Opacity = v5;
  v7 = v3[8];
  v9 = v3[5];
  v8 = v3[6];
  *(_OWORD *)&self[4]._vertexUniforms.Percent = v3[7];
  *(_OWORD *)&self[5].super.TSDGPUParticleSystem_opaque[4] = v7;
  *(_OWORD *)&self[3]._anon_8[4] = v9;
  *(_OWORD *)self[4].super.TSDGPUParticleSystem_opaque = v8;
}

@end
