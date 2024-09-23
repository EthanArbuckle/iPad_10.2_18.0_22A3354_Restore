@implementation PXGBurstStackEffect

- (PXGBurstStackEffect)initWithEntityManager:(id)a3
{
  PXGBurstStackEffect *v3;
  PXGBurstStackEffect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGBurstStackEffect;
  v3 = -[PXGEffect initWithEntityManager:](&v6, sel_initWithEntityManager_, a3);
  v4 = v3;
  if (v3)
    -[PXGBurstStackEffect setNumberOfItemsStackedBehind:](v3, "setNumberOfItemsStackedBehind:", 2);
  return v4;
}

- (id)shader
{
  return 0;
}

- (void)setNumberOfItemsStackedBehind:(int64_t)a3
{
  -[PXGEffect setNumberOfSiblingSprites:](self, "setNumberOfSiblingSprites:", a3 & ~(a3 >> 63));
}

- (id)createSiblingsTextureForMainSpriteTexture:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[PXGEffectWrappingTexture createTexture](PXGEffectWrappingTexture, "createTexture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", v3);

  return v4;
}

- (void)configureSiblingSprites:(id *)a3 siblingsSpriteIndexRange:(_PXGSpriteIndexRange)a4 siblingsTexture:(id)a5 forMainRenderSpriteRef:(id *)a6 mainPresentationSpriteRef:(id *)a7 mainSpriteIndex:(unsigned int)a8 mainSpriteTexture:(id)a9 screenScale:(double)a10
{
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  uint64_t var0;
  float v23;
  double v24;
  double x;
  double y;
  double width;
  CGFloat height;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  CGFloat MidX;
  CGFloat MidY;
  double v32;
  CGFloat v33;
  float64x2_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CGFloat *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  float64x2_t v43;
  _OWORD *v44;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  float *v53;
  char *v54;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  uint64_t v56;
  __int128 v57;
  void *v58;
  objc_class *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  id v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v15 = a5;
  PXFloatRoundToPixel();
  v17 = v16;
  PXFloatRoundToPixel();
  v19 = v18;
  v20 = PXFloatApproximatelyEqualToFloat();
  v21 = 1.0;
  if (!v20)
    v21 = v19;
  v68 = v21;
  var0 = a3->var0;
  PXRectWithCenterAndSize();
  v23 = *((double *)a7->var1 + 2);
  v65 = v24;
  v66 = v17 * (double)var0;
  PXRectRoundToPixel();
  x = v72.origin.x;
  y = v72.origin.y;
  width = v72.size.width;
  height = v72.size.height;
  var1 = a6->var1;
  MidX = CGRectGetMidX(v72);
  v73.origin.x = x;
  v73.origin.y = y;
  v73.size.width = width;
  v73.size.height = height;
  MidY = CGRectGetMidY(v73);
  v32 = v23;
  v74.origin.x = x;
  v74.origin.y = y;
  v74.size.width = width;
  v74.size.height = height;
  v69 = CGRectGetWidth(v74);
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  v33 = CGRectGetHeight(v75);
  v34.f64[0] = v69;
  v34.f64[1] = v33;
  *(CGFloat *)var1 = MidX;
  *((CGFloat *)var1 + 1) = MidY;
  *((double *)var1 + 2) = v32;
  *((float32x2_t *)var1 + 3) = vcvt_f32_f64(v34);
  if ((_DWORD)var0)
  {
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 32 * var0;
    v67 = v66 / v65;
    do
    {
      y = y - v17;
      x = v17 + x;
      width = width + -v17 * 2.0;
      v39 = (CGFloat *)((char *)a3->var2 + v37);
      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = v17 - v68;
      v40 = CGRectGetMidX(v76);
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = v17 - v68;
      v41 = CGRectGetMidY(v77);
      v78.origin.x = x;
      v78.origin.y = y;
      v78.size.width = width;
      v78.size.height = v17 - v68;
      v70 = CGRectGetWidth(v78);
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = v17 - v68;
      v42 = CGRectGetHeight(v79);
      v43.f64[0] = v70;
      v43.f64[1] = v42;
      *v39 = v40;
      v39[1] = v41;
      v39[2] = v32;
      *((float32x2_t *)v39 + 3) = vcvt_f32_f64(v43);
      v44 = (_OWORD *)((char *)a3->var3 + v35);
      var2 = a7->var2;
      v46 = *((_OWORD *)var2 + 1);
      *v44 = *(_OWORD *)var2;
      v44[1] = v46;
      v47 = *((_OWORD *)var2 + 5);
      v49 = *((_OWORD *)var2 + 2);
      v48 = *((_OWORD *)var2 + 3);
      v44[4] = *((_OWORD *)var2 + 4);
      v44[5] = v47;
      v44[2] = v49;
      v44[3] = v48;
      v50 = *((_OWORD *)var2 + 9);
      v52 = *((_OWORD *)var2 + 6);
      v51 = *((_OWORD *)var2 + 7);
      v44[8] = *((_OWORD *)var2 + 8);
      v44[9] = v50;
      v44[6] = v52;
      v44[7] = v51;
      v53 = (float *)((char *)a3->var3 + 4 * v36);
      *(float *)&v42 = *v53 * 0.6;
      *v53 = *(float *)&v42;
      *(float *)&v42 = v67 * v53[4];
      v53[4] = *(float *)&v42;
      v54 = (char *)a3->var4 + v36;
      var3 = a7->var3;
      v56 = *((_QWORD *)var3 + 4);
      v57 = *((_OWORD *)var3 + 1);
      *(_OWORD *)v54 = *(_OWORD *)var3;
      *((_OWORD *)v54 + 1) = v57;
      *((_QWORD *)v54 + 4) = v56;
      *(_QWORD *)((char *)a3->var4 + v36 + 24) = a8;
      v37 += 32;
      v36 += 40;
      v35 += 160;
    }
    while (v38 != v37);
  }
  v71 = v15;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (objc_class *)objc_opt_class();
    NSStringFromClass(v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBurstStackEffect.m"), 85, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("siblingsTexture"), v60);
LABEL_11:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (objc_class *)objc_opt_class();
    NSStringFromClass(v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "px_descriptionForAssertionMessage");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGBurstStackEffect.m"), 85, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("siblingsTexture"), v60, v62);

    goto LABEL_11;
  }
LABEL_8:
  objc_msgSend(v71, "addSpriteIndexRange:", a4.var0, HIDWORD(*(unint64_t *)&a4));

}

@end
