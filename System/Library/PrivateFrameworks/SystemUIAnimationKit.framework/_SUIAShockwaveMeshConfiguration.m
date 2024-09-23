@implementation _SUIAShockwaveMeshConfiguration

- (void)_setMeshFrame:(CGRect)a3
{
  NSMutableDictionary *propertyDictionary;
  void *v4;
  CGRect v5;

  propertyDictionary = self->super._propertyDictionary;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v4, CFSTR("meshFrame"));

}

- (CGRect)meshFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  CGRect result;

  v7 = 0u;
  v8 = 0u;
  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("meshFrame"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValue:size:", &v7, 32);

  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v6 = *((double *)&v8 + 1);
  v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setMeshTransform:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->super._propertyDictionary, "setObject:forKey:", a3, CFSTR("meshTransform"));
}

- (CAMeshTransform)meshTransform
{
  return (CAMeshTransform *)-[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("meshTransform"));
}

- (void)_setViewTransform:(CATransform3D *)a3
{
  NSMutableDictionary *propertyDictionary;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  _OWORD v9[8];

  propertyDictionary = self->super._propertyDictionary;
  v4 = *(_OWORD *)&a3->m33;
  v9[4] = *(_OWORD *)&a3->m31;
  v9[5] = v4;
  v5 = *(_OWORD *)&a3->m43;
  v9[6] = *(_OWORD *)&a3->m41;
  v9[7] = v5;
  v6 = *(_OWORD *)&a3->m13;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v6;
  v7 = *(_OWORD *)&a3->m23;
  v9[2] = *(_OWORD *)&a3->m21;
  v9[3] = v7;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](propertyDictionary, "setObject:forKey:", v8, CFSTR("viewTransform"));

}

- (CATransform3D)viewTransform
{
  void *v4;
  CATransform3D *result;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->super._propertyDictionary, "objectForKey:", CFSTR("viewTransform"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "CATransform3DValue");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

+ (int64_t)configurationType
{
  return 2;
}

+ (id)meshConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  id v16;
  _SUIAShockwaveMeshConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  _SUIAShockwaveMeshConfiguration *v36;
  void *v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  void *v77;
  CGFloat rect;
  double v80;
  double v81;
  double v82;
  CGFloat y;
  CATransform3D v84;
  CATransform3D v85;
  CATransform3D v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v10 = a5.size.height;
  v11 = a5.size.width;
  v12 = a5.origin.y;
  v13 = a5.origin.x;
  v16 = a6;
  v17 = objc_alloc_init(_SUIAShockwaveMeshConfiguration);
  objc_msgSend(v16, "meshPointsAnimationSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "meshPointsCancelledAnimationSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "meshPositionAnimationSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = SUIAScreenEdgeForNormalizedButtonRect();
  if (a4 == 2 || a4 == 1)
    goto LABEL_6;
  if (!a4)
  {
    if (!objc_msgSend(v16, "useSiriMeshForCapture"))
    {
      +[_SUIAShockwaveMeshes captureButtonMesh](_SUIAShockwaveMeshes, "captureButtonMesh");
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v23 = (void *)v22;
      goto LABEL_9;
    }
LABEL_6:
    +[_SUIAShockwaveMeshes siriButtonAndEdgeMesh](_SUIAShockwaveMeshes, "siriButtonAndEdgeMesh");
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v23 = 0;
LABEL_9:
  memset(&v86, 0, sizeof(v86));
  CATransform3DMakeScale(&v86, 1.0, -1.0, 1.0);
  if (v21 == 2)
  {
    v84 = v86;
    v24 = 1.57079633;
  }
  else
  {
    if (v21 == 1)
      goto LABEL_16;
    v84 = v86;
    if (v21 == 8)
      v24 = -1.57079633;
    else
      v24 = 3.14159265;
  }
  CATransform3DRotate(&v85, &v84, v24, 0.0, 0.0, 1.0);
  v86 = v85;
LABEL_16:
  v81 = v13;
  v82 = v11;
  v80 = v10;
  v85 = v86;
  -[_SUIAShockwaveMeshConfiguration _setViewTransform:](v17, "_setViewTransform:", &v85);
  BSRectWithSize();
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) == 0)
    {
      v32 = v25;
      v33 = v26;
      v34 = v27;
      v35 = v28;
      if (((1 << a3) & 0x11) != 0)
      {
        -[_SUIAShockwaveMeshConfiguration _setMeshFrame:](v17, "_setMeshFrame:", SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v25, v26, v27, v28, 1.0, v29, v30, v31, v81, v12, v82, v80, x, y, width, height));
        -[_SUIAShockwaveMeshConfiguration _setMeshTransform:](v17, "_setMeshTransform:", v23);
        if (a3 != 4)
          goto LABEL_48;
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v17, "_setBehaviorSettings:forKeypath:", v20, CFSTR("meshFrame"));
        v36 = v17;
        v37 = v19;
      }
      else
      {
        v50 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v25, v26, v27, v28, 1.0, v29, v30, v31, v81, v12, v82, v80, x, y, width, height);
        if (!a4)
        {
          objc_msgSend(v16, "captureHintMeshOffset", v50);
          v58 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v32, v33, v34, v35, v54, v55, v56, v57, v81, v12, v82, v80, x, y, width, height);
          v60 = v59;
          v62 = v61;
          v64 = v63;
          objc_msgSend(v16, "captureHintAnimationSettings");
          v65 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "captureHintAnimationSettings");
          v66 = objc_claimAutoreleasedReturnValue();

          v53 = v64;
          v52 = v62;
          v51 = v60;
          v50 = v58;
          v20 = (void *)v65;
          v18 = (void *)v66;
        }
        -[_SUIAShockwaveMeshConfiguration _setMeshFrame:](v17, "_setMeshFrame:", v50, v51, v52, v53);
        -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v17, "_setBehaviorSettings:forKeypath:", v20, CFSTR("meshFrame"));
        -[_SUIAShockwaveMeshConfiguration _setMeshTransform:](v17, "_setMeshTransform:", v23);
        v36 = v17;
        v37 = v18;
      }
      -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v36, "_setBehaviorSettings:forKeypath:", v37, CFSTR("meshTransform"));
      goto LABEL_48;
    }
    v87.origin.x = x;
    v87.origin.y = y;
    v87.size.width = width;
    v87.size.height = height;
    CGRectGetWidth(v87);
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    CGRectGetHeight(v88);
    objc_msgSend(v16, "meshSquareFinalSizeDiagonalRatio");
    if (v21 == 4 || v21 == 1)
    {
      v89.origin.x = x;
      v89.origin.y = y;
      v89.size.width = width;
      v89.size.height = height;
      CGRectGetWidth(v89);
      objc_msgSend(v16, "meshRectangularFinalShortDimensionRatio");
      v90.origin.x = x;
      v90.origin.y = y;
      v90.size.width = width;
      v90.size.height = height;
      CGRectGetHeight(v90);
      objc_msgSend(v16, "meshRectangularFinalLongDimensionRatio");
    }
    v91.origin.x = SUIAExpandNormalizedRect(x, y, width, height, v13);
    v38 = v91.origin.x;
    v39 = x;
    v40 = v91.origin.y;
    v41 = v91.size.width;
    v42 = v91.size.height;
    CGRectGetMidX(v91);
    v92.origin.x = v38;
    v92.origin.y = v40;
    v92.size.width = v41;
    v92.size.height = v42;
    CGRectGetMidY(v92);
    rect = width;
    if (objc_msgSend(v16, "shouldBehaveLikeLargeScreen:", width, height))
    {
      objc_msgSend(v16, "meshFinalProportionTowardsCenterOnLargeDisplays");
      UIRectGetCenter();
      v43 = v39;
      v44 = y;
      v45 = height;
      UIRectGetCenter();
    }
    else
    {
      v45 = height;
      v43 = v39;
      v44 = y;
    }
    if (v21 == 2)
    {
      v93.origin.x = v43;
      v93.origin.y = v44;
      v93.size.width = rect;
      v93.size.height = v45;
      CGRectGetWidth(v93);
      v94.origin.x = v43;
      v94.origin.y = v44;
      v94.size.width = rect;
      v94.size.height = v45;
      CGRectGetWidth(v94);
      objc_msgSend(v16, "meshFinalProportionAcrossScreenLongEdge");
    }
    else if (v21 == 1)
    {
      v95.origin.x = v43;
      v95.origin.y = v44;
      v95.size.width = rect;
      v95.size.height = v45;
      CGRectGetHeight(v95);
      objc_msgSend(v16, "meshFinalProportionAcrossScreenShortEdge");
    }
    else
    {
      v46 = v43;
      v47 = v44;
      v48 = rect;
      v49 = v45;
      if (v21 == 8)
      {
        CGRectGetWidth(*(CGRect *)&v46);
        objc_msgSend(v16, "meshFinalProportionAcrossScreenLongEdge");
      }
      else
      {
        CGRectGetHeight(*(CGRect *)&v46);
        v96.origin.x = v43;
        v96.origin.y = v44;
        v96.size.width = rect;
        v96.size.height = v45;
        CGRectGetHeight(v96);
        objc_msgSend(v16, "meshFinalProportionAcrossScreenShortEdge");
      }
    }
    BSRectCenteredAboutPoint();
    -[_SUIAShockwaveMeshConfiguration _setMeshFrame:](v17, "_setMeshFrame:");
    v67 = 7;
    if (!a4)
    {
      objc_msgSend(v16, "captureHintRetargetImpulse");
      v69 = v68;
      v70 = (void *)objc_msgSend(v18, "copy");

      objc_msgSend(v70, "retargetImpulse");
      objc_msgSend(v70, "setRetargetImpulse:", v69 + v71);
      v72 = (void *)objc_msgSend(v19, "copy");

      objc_msgSend(v72, "retargetImpulse");
      objc_msgSend(v72, "setRetargetImpulse:", v69 + v73);
      v74 = (void *)objc_msgSend(v20, "copy");

      objc_msgSend(v74, "retargetImpulse");
      objc_msgSend(v74, "setRetargetImpulse:", v69 + v75);
      if (objc_msgSend(v16, "useSiriMeshForCapture"))
        v67 = 7;
      else
        v67 = 9;
      v20 = v74;
      v19 = v72;
      v18 = v70;
    }
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v17, "_setBehaviorSettings:forKeypath:", v20, CFSTR("meshFrame"));
    +[_SUIAShockwaveMeshes identityMeshTransformRows:columns:](_SUIAShockwaveMeshes, "identityMeshTransformRows:columns:", v67, v67);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUIAShockwaveMeshConfiguration _setMeshTransform:](v17, "_setMeshTransform:", v76);

    if (a3 == 5)
      v77 = v19;
    else
      v77 = v18;
    -[_SUIAAbstractDictionaryBackedConfiguration _setBehaviorSettings:forKeypath:](v17, "_setBehaviorSettings:forKeypath:", v77, CFSTR("meshTransform"));
    if (a3 != 5)
    {
      objc_msgSend(v16, "meshPointsEndTransitionDelay");
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v17, "_setDelay:forApplicationOfKeypath:", CFSTR("meshTransform"));
    }
  }
LABEL_48:

  return v17;
}

@end
