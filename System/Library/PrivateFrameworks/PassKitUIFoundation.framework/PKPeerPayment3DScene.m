@implementation PKPeerPayment3DScene

- (PKPeerPayment3DScene)init
{
  PKPeerPayment3DScene *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PKPeerPayment3DScene;
  v2 = -[PKPeerPayment3DScene init](&v26, sel_init);
  if (v2)
  {
    +[PKPeerPayment3DScene staticRollPitch](PKPeerPayment3DScene, "staticRollPitch");
    *(_QWORD *)v2->_currentRollPitch = v3;
    +[PKPeerPayment3DScene rotationMatrixForRollPitch:](PKPeerPayment3DScene, "rotationMatrixForRollPitch:");
    *(_OWORD *)&v2[1].super.super.isa = v4;
    *(_OWORD *)&v2[1].super._sceneSource = v5;
    *(_OWORD *)&v2[1].super._rootNode = v6;
    *(_OWORD *)&v2[1].super._layerRootNode[1] = v7;
    +[PKPeerPayment3DScene skewForRollPitch:](PKPeerPayment3DScene, "skewForRollPitch:", *(double *)v2->_currentRollPitch);
    *(_QWORD *)v2->_currentSkew = v8;
    objc_msgSend(MEMORY[0x24BDE8250], "node");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE8208], "camera");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCamera:", v10);
    objc_msgSend(v10, "setUsesOrthographicProjection:", 1);
    objc_msgSend(v10, "setOrthographicScale:", 4.0);
    LODWORD(v11) = 1114636288;
    LODWORD(v12) = 0;
    LODWORD(v13) = 0;
    objc_msgSend(v9, "setPosition:", v12, v13, v11);
    -[PKPeerPayment3DScene setCameraNode:](v2, "setCameraNode:", v9);
    -[PKPeerPayment3DScene rootNode](v2, "rootNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addChildNode:", v9);

    objc_msgSend(MEMORY[0x24BDE8250], "node");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPayment3DScene setTextContainerNode:](v2, "setTextContainerNode:", v15);
    -[PKPeerPayment3DScene rootNode](v2, "rootNode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addChildNode:", v15);

    objc_msgSend(MEMORY[0x24BDE8250], "node");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE8230], "light");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLight:", v18);
    objc_msgSend(v18, "setType:", *MEMORY[0x24BDE82C0]);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColor:", v19);

    objc_msgSend(v18, "setSpotInnerAngle:", 40.0);
    objc_msgSend(v18, "setSpotOuterAngle:", 180.0);
    LODWORD(v20) = 0;
    LODWORD(v21) = 0;
    LODWORD(v22) = 1.0;
    LODWORD(v23) = 0;
    objc_msgSend(v17, "setOrientation:", v20, v21, v22, v23);
    -[PKPeerPayment3DScene setLightNode:](v2, "setLightNode:", v17);
    -[PKPeerPayment3DScene rootNode](v2, "rootNode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addChildNode:", v17);

    -[PKPeerPayment3DScene resetScene](v2, "resetScene");
  }
  return v2;
}

- (void)resetScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PKPeerPayment3DScene setPaused:](self, "setPaused:", 1);
  +[PKPeerPayment3DStore sharedInstance](PKPeerPayment3DStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "material");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPayment3DScene setTextMaterial:](self, "setTextMaterial:", v4);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKPeerPayment3DScene textContainerNode](self, "textContainerNode", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "childNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "removeFromParentNode");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (double)staticRollPitch
{
  return -0.000000381469818;
}

+ (double)rotationMatrixForRollPitch:(double)a1
{
  __float2 v1;
  __float2 v2;
  float32x4_t v3;
  int8x16_t v5;
  double result;
  float32x4_t v25;

  v1 = __sincosf_stret(0.5 * *(float *)&a1);
  v25 = vmulq_n_f32((float32x4_t)xmmword_213A5D800, v1.__sinval);
  v2 = __sincosf_stret(vmuls_lane_f32(0.5, *(float32x2_t *)&a1, 1));
  v3 = vmulq_n_f32((float32x4_t)xmmword_213A5D810, v2.__sinval);
  v3.i32[3] = LODWORD(v2.__cosval);
  _Q1 = (int32x4_t)vnegq_f32(v3);
  v5 = (int8x16_t)vtrn2q_s32((int32x4_t)v3, vtrn1q_s32((int32x4_t)v3, _Q1));
  _Q4 = (float32x4_t)vrev64q_s32((int32x4_t)v3);
  _Q4.i32[0] = _Q1.i32[1];
  _Q4.i32[3] = _Q1.i32[2];
  _Q3 = vaddq_f32(vmlaq_laneq_f32(vmulq_n_f32(v3, v1.__cosval), _Q4, v25, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)_Q1, 8uLL), *(float32x2_t *)v25.f32, 1), (float32x4_t)vextq_s8(v5, v5, 8uLL), v25.f32[0]));
  _Q4.i32[0] = _Q3.i32[1];
  _S5 = _Q3.i32[2];
  __asm { FMLS            S1, S5, V3.S[2] }
  _S7 = _Q3.i32[3];
  __asm { FMLA            S1, S7, V3.S[3] }
  v3.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q3.f32[2], _Q3, 3), _Q3.f32[1], _Q3.f32[0]);
  result = COERCE_DOUBLE(__PAIR64__(v3.f32[0] + v3.f32[0], _Q1.u32[0]));
  __asm
  {
    FMLA            S6, S4, V3.S[1]
    FMLA            S6, S7, V3.S[3]
    FMLS            S6, S3, V3.S[0]
    FMLA            S18, S5, V3.S[1]
    FMLA            S17, S3, V3.S[2]
    FMLA            S16, S5, V3.S[1]
    FMLA            S7, S5, V3.S[2]
    FMLS            S7, S3, V3.S[0]
    FMLS            S7, S4, V3.S[1]
  }
  return result;
}

+ (float32x2_t)skewForRollPitch:(double)a1
{
  float32x2_t v1;
  float v3;
  float v4;

  v3 = *(float *)&a1;
  v4 = sinf(*((float *)&a1 + 1));
  v1.f32[0] = sinf(v3);
  v1.f32[1] = v4;
  return vmul_f32(v1, (float32x2_t)0x3F0000003F000000);
}

- (SCNNode)lightNode
{
  return self->_lightNode;
}

- (void)setLightNode:(id)a3
{
  objc_storeStrong((id *)&self->_lightNode, a3);
}

- (SCNNode)cameraNode
{
  return self->_cameraNode;
}

- (void)setCameraNode:(id)a3
{
  objc_storeStrong((id *)&self->_cameraNode, a3);
}

- (SCNNode)textContainerNode
{
  return self->_textContainerNode;
}

- (void)setTextContainerNode:(id)a3
{
  objc_storeStrong((id *)&self->_textContainerNode, a3);
}

- (SCNMaterial)textMaterial
{
  return self->_textMaterial;
}

- (void)setTextMaterial:(id)a3
{
  objc_storeStrong((id *)&self->_textMaterial, a3);
}

- (__n128)currentRotationMatrix
{
  return a1[16];
}

- (__n128)setCurrentRotationMatrix:(__n128)a3
{
  result[16] = a2;
  result[17] = a3;
  result[18] = a4;
  result[19] = a5;
  return result;
}

- (double)currentSkew
{
  return *(double *)(a1 + 232);
}

- (void)setCurrentSkew:(PKPeerPayment3DScene *)self
{
  uint64_t v2;

  *(_QWORD *)self->_currentSkew = v2;
}

- (double)currentRollPitch
{
  return *(double *)(a1 + 240);
}

- (void)setCurrentRollPitch:(PKPeerPayment3DScene *)self
{
  uint64_t v2;

  *(_QWORD *)self->_currentRollPitch = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textMaterial, 0);
  objc_storeStrong((id *)&self->_textContainerNode, 0);
  objc_storeStrong((id *)&self->_cameraNode, 0);
  objc_storeStrong((id *)&self->_lightNode, 0);
}

@end
