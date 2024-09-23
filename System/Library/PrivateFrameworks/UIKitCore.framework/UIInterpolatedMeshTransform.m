@implementation UIInterpolatedMeshTransform

+ (id)valueWithMeshTransform:(id)a3
{
  return (id)objc_msgSend(a1, "valueWithMeshTransform:epsilon:", a3, 0.00000001);
}

+ (id)valueWithMeshTransform:(id)a3 epsilon:(double)a4
{
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;

  v7 = a3;
  objc_msgSend(v7, "depthNormalization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD2A90]);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIInterpolatedMeshTransform.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[mesh depthNormalization] isEqualToString:kCADepthNormalizationNone]"));

  }
  v10 = objc_opt_new();
  v11 = objc_msgSend(v7, "mutableCopy");

  v12 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v11;

  *(double *)(v10 + 16) = a4;
  return (id)v10;
}

- (id)interpolateTo:(id)a3 progress:(double)a4
{
  id *v5;
  CAMutableMeshTransform **p_mesh;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  unint64_t v10;
  float64x2_t v11;
  id v12;
  float64x2_t v13;
  double v14;
  CAMutableMeshTransform *v15;
  __int128 v17;
  _OWORD v19[2];
  double v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  float64x2_t v24;
  float64x2_t v25;
  double v26;

  v5 = (id *)a3;
  -[UIInterpolatedMeshTransform _updateZeroMeshToBeCompatibleWithVector:](self, "_updateZeroMeshToBeCompatibleWithVector:", v5);
  objc_msgSend(v5, "_updateZeroMeshToBeCompatibleWithVector:", self);
  p_mesh = &self->_mesh;
  v7 = -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount");
  if (v7 == objc_msgSend(v5[1], "vertexCount")
    && (v8 = -[CAMutableMeshTransform faceCount](*p_mesh, "faceCount"), v8 == objc_msgSend(v5[1], "faceCount")))
  {
    if (-[CAMutableMeshTransform vertexCount](*p_mesh, "vertexCount"))
    {
      v10 = 0;
      *(double *)&v9 = 1.0 - a4;
      v17 = v9;
      do
      {
        v26 = 0.0;
        v24 = 0u;
        v25 = 0u;
        if (*p_mesh)
          -[CAMutableMeshTransform vertexAtIndex:](*p_mesh, "vertexAtIndex:", v10);
        v23 = 0.0;
        v11 = 0uLL;
        v21 = 0u;
        v22 = 0u;
        v12 = v5[1];
        if (v12)
        {
          objc_msgSend(v12, "vertexAtIndex:", v10);
          v13 = v21;
          v11 = v22;
          v14 = v23;
        }
        else
        {
          v13 = 0uLL;
          v14 = 0.0;
        }
        v15 = *p_mesh;
        v19[0] = vaddq_f64(vmulq_n_f64(v13, a4), vmulq_n_f64(v24, *(double *)&v17));
        v19[1] = vaddq_f64(vmulq_n_f64(v11, a4), vmulq_n_f64(v25, *(double *)&v17));
        v20 = v14 * a4 + *(double *)&v17 * v26;
        -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](v15, "replaceVertexAtIndex:withVertex:", v10++, v19, v17);
      }
      while (v10 < -[CAMutableMeshTransform vertexCount](*p_mesh, "vertexCount"));
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_mesh, v5[1]);
  }

  return self;
}

- (void)integrateWithVelocity:(id)a3 target:(id)a4 intermediateTarget:(id)a5 intermediateTargetVelocity:(id)a6 parameters:(id *)a7 state:(id *)a8 delta:(double)a9
{
  _QWORD *v15;
  id *v16;
  _QWORD *v17;
  _QWORD *v18;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1;
  CAMutableMeshTransform **p_mesh;
  CAMutableMeshTransform *mesh;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CAMutableMeshTransform *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  $F24F406B2B787EFB06265DBA3D28CBD5 v81;
  $F24F406B2B787EFB06265DBA3D28CBD5 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  $F24F406B2B787EFB06265DBA3D28CBD5 v88;
  $F24F406B2B787EFB06265DBA3D28CBD5 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  double v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  $F24F406B2B787EFB06265DBA3D28CBD5 var0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v107;
  __int128 v108;

  v58 = a9;
  v15 = a3;
  v16 = (id *)a4;
  v17 = a5;
  v18 = a6;
  var1 = a8->var1;
  var0 = a8->var0;
  v107 = var1;
  v108 = *(_OWORD *)&a8->var2;
  -[UIInterpolatedMeshTransform _updateZeroMeshToBeCompatibleWithVector:](self, "_updateZeroMeshToBeCompatibleWithVector:", v16);
  objc_msgSend(v15, "_updateZeroMeshToBeCompatibleWithVector:", v16);
  objc_msgSend(v16, "_updateZeroMeshToBeCompatibleWithVector:", self);
  objc_msgSend(v17, "_updateZeroMeshToBeCompatibleWithVector:", v16);
  objc_msgSend(v18, "_updateZeroMeshToBeCompatibleWithVector:", v16);
  mesh = self->_mesh;
  p_mesh = &self->_mesh;
  v22 = -[CAMutableMeshTransform vertexCount](mesh, "vertexCount");
  if (v22 == objc_msgSend(v16[1], "vertexCount")
    && (v23 = -[CAMutableMeshTransform faceCount](*p_mesh, "faceCount"), v23 == objc_msgSend(v16[1], "faceCount")))
  {
    if (objc_msgSend(v16[1], "vertexCount"))
    {
      v24 = 0;
      do
      {
        v105 = 0;
        v103 = 0u;
        v104 = 0u;
        if (*p_mesh)
          -[CAMutableMeshTransform vertexAtIndex:](*p_mesh, "vertexAtIndex:", v24);
        v102 = 0.0;
        v100 = 0u;
        v101 = 0u;
        v25 = v16[1];
        if (v25)
          objc_msgSend(v25, "vertexAtIndex:", v24);
        v99 = 0;
        v97 = 0u;
        v98 = 0u;
        v26 = (void *)v15[1];
        if (v26)
          objc_msgSend(v26, "vertexAtIndex:", v24);
        v96 = 0;
        v94 = 0u;
        v95 = 0u;
        v27 = (void *)v17[1];
        if (v27)
          objc_msgSend(v27, "vertexAtIndex:", v24);
        v93 = 0;
        v91 = 0u;
        v92 = 0u;
        v28 = (void *)v18[1];
        if (v28)
        {
          objc_msgSend(v28, "vertexAtIndex:", v24);
          v29 = v91;
        }
        else
        {
          v29 = 0;
        }
        *(_QWORD *)&a7->var2.var0 = v100;
        v77 = v94;
        v78 = v29;
        v79 = v103;
        v80 = v97;
        v81 = var0;
        v82 = v107;
        v83 = v108;
        v30 = *(_OWORD *)&a7->var2.var2;
        v74 = *(_OWORD *)&a7->var2.var0;
        v75 = v30;
        v76 = *(_QWORD *)&a7->var3;
        v31 = *(_OWORD *)&a7->var0.var2;
        v70 = *(_OWORD *)&a7->var0.var0;
        v71 = v31;
        v32 = *(_OWORD *)&a7->var1.var2;
        v72 = *(_OWORD *)&a7->var1.var0;
        v73 = v32;
        v33 = v58;
        +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v77, &v70, v58, *(_QWORD *)&v58);
        v68 = v84;
        v69 = v85;
        v66 = v86;
        v67 = v87;
        var0 = v88;
        v107 = v89;
        v108 = v90;
        a7->var2.var0 = *((double *)&v100 + 1);
        v77 = *((_QWORD *)&v94 + 1);
        v78 = *((_QWORD *)&v91 + 1);
        v79 = *((_QWORD *)&v103 + 1);
        v80 = *((_QWORD *)&v97 + 1);
        v81 = var0;
        v82 = v107;
        v83 = v108;
        v34 = *(_OWORD *)&a7->var2.var2;
        v74 = *(_OWORD *)&a7->var2.var0;
        v75 = v34;
        v76 = *(_QWORD *)&a7->var3;
        v35 = *(_OWORD *)&a7->var0.var2;
        v70 = *(_OWORD *)&a7->var0.var0;
        v71 = v35;
        v36 = *(_OWORD *)&a7->var1.var2;
        v72 = *(_OWORD *)&a7->var1.var0;
        v73 = v36;
        +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v77, &v70, v33);
        v64 = v84;
        v65 = v85;
        v62 = v86;
        v63 = v87;
        var0 = v88;
        v107 = v89;
        v108 = v90;
        *(_QWORD *)&a7->var2.var0 = v101;
        v77 = v95;
        v78 = v92;
        v79 = v104;
        v80 = v98;
        v81 = var0;
        v82 = v107;
        v83 = v108;
        v37 = *(_OWORD *)&a7->var2.var2;
        v74 = *(_OWORD *)&a7->var2.var0;
        v75 = v37;
        v76 = *(_QWORD *)&a7->var3;
        v38 = *(_OWORD *)&a7->var0.var2;
        v70 = *(_OWORD *)&a7->var0.var0;
        v71 = v38;
        v39 = *(_OWORD *)&a7->var1.var2;
        v72 = *(_OWORD *)&a7->var1.var0;
        v73 = v39;
        +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v77, &v70, v33);
        v40 = v86;
        v60 = v84;
        v61 = v85;
        v59 = v87;
        var0 = v88;
        v107 = v89;
        v108 = v90;
        a7->var2.var0 = *((double *)&v101 + 1);
        v77 = *((_QWORD *)&v95 + 1);
        v78 = *((_QWORD *)&v92 + 1);
        v79 = *((_QWORD *)&v104 + 1);
        v80 = *((_QWORD *)&v98 + 1);
        v81 = var0;
        v82 = v107;
        v83 = v108;
        v41 = *(_OWORD *)&a7->var2.var2;
        v74 = *(_OWORD *)&a7->var2.var0;
        v75 = v41;
        v76 = *(_QWORD *)&a7->var3;
        v42 = *(_OWORD *)&a7->var0.var2;
        v70 = *(_OWORD *)&a7->var0.var0;
        v71 = v42;
        v43 = *(_OWORD *)&a7->var1.var2;
        v72 = *(_OWORD *)&a7->var1.var0;
        v73 = v43;
        +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v77, &v70, v33);
        v44 = v84;
        v45 = v85;
        v46 = v86;
        v47 = v87;
        var0 = v88;
        v107 = v89;
        v108 = v90;
        a7->var2.var0 = v102;
        v77 = v96;
        v78 = v93;
        v79 = v105;
        v80 = v99;
        v81 = var0;
        v82 = v107;
        v83 = v108;
        v48 = *(_OWORD *)&a7->var2.var2;
        v74 = *(_OWORD *)&a7->var2.var0;
        v75 = v48;
        v76 = *(_QWORD *)&a7->var3;
        v49 = *(_OWORD *)&a7->var0.var2;
        v70 = *(_OWORD *)&a7->var0.var0;
        v71 = v49;
        v50 = *(_OWORD *)&a7->var1.var2;
        v72 = *(_OWORD *)&a7->var1.var0;
        v73 = v50;
        +[UIFloatCompoundSpringIntegrator integrateWithState:springParameters:deltaTime:](UIFloatCompoundSpringIntegrator, "integrateWithState:springParameters:deltaTime:", &v77, &v70, v33);
        v51 = v84;
        v52 = v85;
        v53 = v87;
        var0 = v88;
        v107 = v89;
        v108 = v90;
        v54 = *p_mesh;
        *(_QWORD *)&v70 = v66;
        *((_QWORD *)&v70 + 1) = v62;
        *(_QWORD *)&v71 = v40;
        *((_QWORD *)&v71 + 1) = v46;
        *(_QWORD *)&v72 = v86;
        -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](v54, "replaceVertexAtIndex:withVertex:", v24, &v70);
        v55 = (void *)v15[1];
        *(_QWORD *)&v70 = v67;
        *((_QWORD *)&v70 + 1) = v63;
        *(_QWORD *)&v71 = v59;
        *((_QWORD *)&v71 + 1) = v47;
        *(_QWORD *)&v72 = v53;
        objc_msgSend(v55, "replaceVertexAtIndex:withVertex:", v24, &v70);
        v56 = (void *)v17[1];
        *(_QWORD *)&v70 = v68;
        *((_QWORD *)&v70 + 1) = v64;
        *(_QWORD *)&v71 = v60;
        *((_QWORD *)&v71 + 1) = v44;
        *(_QWORD *)&v72 = v51;
        objc_msgSend(v56, "replaceVertexAtIndex:withVertex:", v24, &v70);
        v57 = (void *)v18[1];
        *(_QWORD *)&v70 = v69;
        *((_QWORD *)&v70 + 1) = v65;
        *(_QWORD *)&v71 = v61;
        *((_QWORD *)&v71 + 1) = v45;
        *(_QWORD *)&v72 = v52;
        objc_msgSend(v57, "replaceVertexAtIndex:withVertex:", v24++, &v70);
      }
      while (v24 < objc_msgSend(v16[1], "vertexCount"));
    }
  }
  else
  {
    objc_storeStrong((id *)p_mesh, v16[1]);
  }

}

- (BOOL)isApproximatelyEqualTo:(id)a3 withinEpsilon:(id)a4
{
  _QWORD *v6;
  double *v7;
  BOOL v8;
  void *v9;
  double v10;
  CAMutableMeshTransform *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  __int128 v18;
  __int128 v19;
  double v20;
  __int128 v21;
  __int128 v22;
  double v23;

  v6 = a3;
  v7 = (double *)a4;
  if (!-[UIInterpolatedMeshTransform _isApproximatelyZeroWithinEpsilon:](self, "_isApproximatelyZeroWithinEpsilon:", v7[2])|| (objc_msgSend(v6, "_isApproximatelyZeroWithinEpsilon:", v7[2]) & 1) == 0)
  {
    v9 = (void *)v6[1];
    v10 = v7[2];
    v11 = self->_mesh;
    v12 = v9;
    v13 = -[CAMutableMeshTransform vertexCount](v11, "vertexCount");
    v14 = objc_msgSend(v12, "vertexCount");
    v8 = v13 == v14;
    if (!-[CAMutableMeshTransform vertexCount](v11, "vertexCount") || v13 != v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    v15 = 1;
    while (1)
    {
      if (v11)
      {
        -[CAMutableMeshTransform vertexAtIndex:](v11, "vertexAtIndex:", v15 - 1);
        if (v12)
          goto LABEL_9;
      }
      else
      {
        v23 = 0.0;
        v21 = 0u;
        v22 = 0u;
        if (v12)
        {
LABEL_9:
          objc_msgSend(v12, "vertexAtIndex:", v15 - 1);
          v16 = *(double *)&v18;
          goto LABEL_12;
        }
      }
      v20 = 0.0;
      v16 = 0.0;
      v18 = 0u;
      v19 = 0u;
LABEL_12:
      v8 = vabdd_f64(*(double *)&v21, v16) < v10
        && vabdd_f64(*((double *)&v21 + 1), *((double *)&v18 + 1)) < v10
        && vabdd_f64(*(double *)&v22, *(double *)&v19) < v10
        && vabdd_f64(*((double *)&v22 + 1), *((double *)&v19 + 1)) < v10
        && vabdd_f64(v23, v20) < v10;
      if (v15 < -[CAMutableMeshTransform vertexCount](v11, "vertexCount", (_QWORD)v18))
      {
        ++v15;
        if (v8)
          continue;
      }
      goto LABEL_20;
    }
  }
  v8 = 1;
LABEL_21:

  return v8;
}

- (BOOL)isCompatibleWith:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v4 = (id *)a3;
  v5 = -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount");
  if (v5 == objc_msgSend(v4[1], "vertexCount"))
  {
    v6 = -[CAMutableMeshTransform faceCount](self->_mesh, "faceCount");
    v7 = v6 == objc_msgSend(v4[1], "faceCount");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isUndefined
{
  _BOOL4 v3;
  unint64_t v4;
  CAMutableMeshTransform *mesh;
  double v6;
  __int128 v10;
  __int128 v11;
  double v12;

  if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
    LOBYTE(v3) = -[CAMutableMeshTransform faceCount](self->_mesh, "faceCount") == 0;
  else
    LOBYTE(v3) = 1;
  if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount") && !v3)
  {
    v4 = 1;
    do
    {
      mesh = self->_mesh;
      if (mesh)
      {
        -[CAMutableMeshTransform vertexAtIndex:](mesh, "vertexAtIndex:", v4 - 1);
        v6 = *(double *)&v10;
      }
      else
      {
        v12 = 0.0;
        v6 = 0.0;
        v10 = 0u;
        v11 = 0u;
      }
      v3 = 1;
      if (fabs(v6) != INFINITY
        && fabs(*((double *)&v10 + 1)) != INFINITY
        && fabs(*(double *)&v11) != INFINITY
        && fabs(*((double *)&v11 + 1)) != INFINITY)
      {
        v3 = fabs(v12) == INFINITY;
      }
    }
    while (v4++ < -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount", (_QWORD)v10) && !v3);
  }
  return v3;
}

- (id)getValue
{
  return (id)-[CAMutableMeshTransform copy](self->_mesh, "copy");
}

+ (id)epsilonCompatibleWithVector:(id)a3
{
  return (id)objc_msgSend(a1, "zeroCompatibleWithVector:", 0);
}

+ (id)zeroCompatibleWithVector:(id)a3
{
  id *v3;
  unint64_t v4;
  id v5;
  void *v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (id *)objc_msgSend(a3, "copy");
    if (objc_msgSend(v3[1], "vertexCount"))
    {
      v4 = 0;
      do
      {
        v5 = v3[1];
        v13 = 0;
        v11 = 0u;
        v12 = 0u;
        objc_msgSend(v5, "replaceVertexAtIndex:withVertex:", v4++, &v11);
      }
      while (v4 < objc_msgSend(v3[1], "vertexCount"));
    }
  }
  else
  {
    v13 = 0;
    v11 = 0u;
    v12 = 0u;
    v8 = xmmword_18667B1F0;
    v9 = 0;
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 1, &v11, 1, &v8, *MEMORY[0x1E0CD2A90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInterpolatedMeshTransform valueWithMeshTransform:](UIInterpolatedMeshTransform, "valueWithMeshTransform:", v6);
    v3 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[UIInterpolatedMeshTransform valueWithMeshTransform:epsilon:](UIInterpolatedMeshTransform, "valueWithMeshTransform:epsilon:", self->_mesh, self->_epsilon);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reinitWithVector:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  CAMutableMeshTransform *mesh;
  void *v8;
  CAMutableMeshTransform *v9;
  CAMutableMeshTransform *v10;
  _OWORD v11[2];
  uint64_t v12;

  v4 = a3;
  v5 = -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount");
  if (v5 == objc_msgSend(*((id *)v4 + 1), "vertexCount"))
  {
    if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
    {
      v6 = 0;
      do
      {
        mesh = self->_mesh;
        v8 = (void *)*((_QWORD *)v4 + 1);
        if (v8)
        {
          objc_msgSend(v8, "vertexAtIndex:", v6);
        }
        else
        {
          v12 = 0;
          memset(v11, 0, sizeof(v11));
        }
        -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](mesh, "replaceVertexAtIndex:withVertex:", v6++, v11);
      }
      while (v6 < -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"));
    }
    self->_epsilon = *((double *)v4 + 2);
  }
  else
  {
    v9 = (CAMutableMeshTransform *)objc_msgSend(*((id *)v4 + 1), "mutableCopy");
    v10 = self->_mesh;
    self->_mesh = v9;

  }
}

- (id)multiplyByScalar:(double)a3
{
  unint64_t v4;
  CAMutableMeshTransform *mesh;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double epsilon;
  float64x2_t v12;
  float64x2_t v13;
  double v14;
  _OWORD v15[2];
  double v16;

  if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
  {
    v4 = 0;
    do
    {
      mesh = self->_mesh;
      if (mesh)
      {
        -[CAMutableMeshTransform vertexAtIndex:](self->_mesh, "vertexAtIndex:", v4);
        v6 = v12;
        v7 = v13;
        v8 = v14;
      }
      else
      {
        v14 = 0.0;
        v6 = 0uLL;
        v8 = 0.0;
        v7 = 0uLL;
        v12 = 0u;
        v13 = 0u;
      }
      v15[0] = vmulq_n_f64(v6, a3);
      v15[1] = vmulq_n_f64(v7, a3);
      v16 = v8 * a3;
      -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](mesh, "replaceVertexAtIndex:withVertex:", v4++, v15);
    }
    while (v4 < -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"));
  }
  epsilon = self->_epsilon;
  if (fabs(a3) >= epsilon)
    self->_epsilon = epsilon * a3;
  return self;
}

- (id)multiplyByVector:(id)a3
{
  id *v4;
  UIInterpolatedMeshTransform *v5;
  uint64_t v6;
  unint64_t v7;
  CAMutableMeshTransform *mesh;
  id v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  UIInterpolatedMeshTransform *v13;
  float64x2_t v15;
  float64x2_t v16;
  double v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  _OWORD v21[2];
  double v22;

  v4 = (id *)a3;
  if (objc_msgSend(v4, "_isApproximatelyZeroWithinEpsilon:", *((double *)v4 + 2)))
  {
    objc_msgSend(v4, "multiplyByScalar:", 0.0);
    v5 = (UIInterpolatedMeshTransform *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIInterpolatedMeshTransform _updateZeroMeshToBeCompatibleWithVector:](self, "_updateZeroMeshToBeCompatibleWithVector:", v4);
    v6 = -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount");
    if (v6 == objc_msgSend(v4[1], "vertexCount"))
    {
      if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
      {
        v7 = 0;
        do
        {
          mesh = self->_mesh;
          if (mesh)
          {
            -[CAMutableMeshTransform vertexAtIndex:](self->_mesh, "vertexAtIndex:", v7);
          }
          else
          {
            v20 = 0.0;
            v18 = 0u;
            v19 = 0u;
          }
          v9 = v4[1];
          if (v9)
          {
            objc_msgSend(v9, "vertexAtIndex:", v7);
            v10 = v15;
            v11 = v16;
            v12 = v17;
          }
          else
          {
            v17 = 0.0;
            v10 = 0uLL;
            v12 = 0.0;
            v11 = 0uLL;
            v15 = 0u;
            v16 = 0u;
          }
          v21[0] = vmulq_f64(v10, v18);
          v21[1] = vmulq_f64(v11, v19);
          v22 = v12 * v20;
          -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](mesh, "replaceVertexAtIndex:withVertex:", v7++, v21, *(_OWORD *)&v15, *(_OWORD *)&v16, *(_QWORD *)&v17);
        }
        while (v7 < -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"));
      }
      self->_epsilon = *((double *)v4 + 2) * self->_epsilon;
    }
    v5 = self;
  }
  v13 = v5;

  return v13;
}

- (id)addVector:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  CAMutableMeshTransform *mesh;
  void *v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  UIInterpolatedMeshTransform *v12;
  float64x2_t v14;
  float64x2_t v15;
  double v16;
  float64x2_t v17;
  float64x2_t v18;
  double v19;
  _OWORD v20[2];
  double v21;

  v4 = a3;
  if ((objc_msgSend(v4, "_isApproximatelyZeroWithinEpsilon:", *((double *)v4 + 2)) & 1) == 0)
  {
    -[UIInterpolatedMeshTransform _updateZeroMeshToBeCompatibleWithVector:](self, "_updateZeroMeshToBeCompatibleWithVector:", v4);
    v5 = -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount");
    if (v5 == objc_msgSend(*((id *)v4 + 1), "vertexCount"))
    {
      if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
      {
        v6 = 0;
        do
        {
          mesh = self->_mesh;
          if (mesh)
          {
            -[CAMutableMeshTransform vertexAtIndex:](self->_mesh, "vertexAtIndex:", v6);
          }
          else
          {
            v19 = 0.0;
            v17 = 0u;
            v18 = 0u;
          }
          v8 = (void *)*((_QWORD *)v4 + 1);
          if (v8)
          {
            objc_msgSend(v8, "vertexAtIndex:", v6);
            v9 = v14;
            v10 = v15;
            v11 = v16;
          }
          else
          {
            v16 = 0.0;
            v9 = 0uLL;
            v11 = 0.0;
            v10 = 0uLL;
            v14 = 0u;
            v15 = 0u;
          }
          v20[0] = vaddq_f64(v9, v17);
          v20[1] = vaddq_f64(v10, v18);
          v21 = v11 + v19;
          -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](mesh, "replaceVertexAtIndex:withVertex:", v6++, v20, *(_OWORD *)&v14, *(_OWORD *)&v15, *(_QWORD *)&v16);
        }
        while (v6 < -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"));
      }
      self->_epsilon = *((double *)v4 + 2) + self->_epsilon;
    }
  }
  v12 = self;

  return self;
}

- (NSString)debugDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  CAMutableMeshTransform *mesh;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p\n Vertices (%zu):\n"), v5, self, -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"));

  if (-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
  {
    v7 = 0;
    do
    {
      mesh = self->_mesh;
      if (mesh)
        -[CAMutableMeshTransform vertexAtIndex:](mesh, "vertexAtIndex:", v7);
      objc_msgSend(v6, "appendFormat:", CFSTR("{{%f, %f}, {%f, %f, %f}}\n"), 0, 0, 0, 0, 0);
      ++v7;
    }
    while (v7 < -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"));
  }
  if (-[UIInterpolatedMeshTransform _isApproximatelyZeroWithinEpsilon:](self, "_isApproximatelyZeroWithinEpsilon:", self->_epsilon))
  {
    objc_msgSend(v6, "appendString:", CFSTR("(Approximately Zero)"));
  }
  return (NSString *)v6;
}

- (void)_updateZeroMeshToBeCompatibleWithVector:(id)a3
{
  id *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  CAMutableMeshTransform *mesh;
  _OWORD v9[2];
  uint64_t v10;

  v4 = (id *)a3;
  if (-[UIInterpolatedMeshTransform _isApproximatelyZeroWithinEpsilon:](self, "_isApproximatelyZeroWithinEpsilon:", self->_epsilon))
  {
    v5 = -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount");
    if (v5 != objc_msgSend(v4[1], "vertexCount"))
    {
      v6 = (void *)objc_msgSend(v4[1], "mutableCopy");
      if (objc_msgSend(v6, "vertexCount"))
      {
        v7 = 0;
        do
        {
          v10 = 0;
          memset(v9, 0, sizeof(v9));
          objc_msgSend(v6, "replaceVertexAtIndex:withVertex:", v7++, v9);
        }
        while (v7 < objc_msgSend(v6, "vertexCount"));
      }
      mesh = self->_mesh;
      self->_mesh = (CAMutableMeshTransform *)v6;

    }
  }

}

- (BOOL)_isApproximatelyZeroWithinEpsilon:(double)a3
{
  unint64_t v5;
  CAMutableMeshTransform *mesh;
  double v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  double v12;

  if (!-[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount"))
    return 1;
  v5 = 1;
  do
  {
    mesh = self->_mesh;
    if (mesh)
    {
      -[CAMutableMeshTransform vertexAtIndex:](mesh, "vertexAtIndex:", v5 - 1);
      v7 = *(double *)&v10;
    }
    else
    {
      v12 = 0.0;
      v7 = 0.0;
      v10 = 0u;
      v11 = 0u;
    }
    v8 = fabs(v7) < a3
      && fabs(*((double *)&v10 + 1)) < a3
      && fabs(*(double *)&v11) < a3
      && fabs(*((double *)&v11 + 1)) < a3
      && fabs(v12) < a3;
    if (v5 >= -[CAMutableMeshTransform vertexCount](self->_mesh, "vertexCount", (_QWORD)v10))
      break;
    ++v5;
  }
  while (v8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mesh, 0);
}

@end
