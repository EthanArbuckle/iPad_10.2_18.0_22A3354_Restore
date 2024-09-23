@implementation USKToken

- (TfToken)token
{
  unsigned int **v2;
  _Rep *ptrAndBits;
  unsigned int *v4;
  unsigned int v5;

  ptrAndBits = self->_token._rep._ptrAndBits;
  *v2 = (unsigned int *)ptrAndBits;
  if ((ptrAndBits & 7) != 0)
  {
    v4 = (unsigned int *)((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 2, v4));
    if ((v5 & 1) == 0)
      *v2 = v4;
  }
  return (TfToken)self;
}

- (USKToken)init
{
  USKToken *v3;
  USKToken *v4;
  _Rep *ptrAndBits;
  unsigned int *v6;
  unsigned int v7;
  USKToken *v8;
  objc_super v10;

  sub_2263F8F84();
  v10.receiver = self;
  v10.super_class = (Class)USKToken;
  v3 = -[USKToken init](&v10, sel_init);
  v4 = v3;
  if (v3)
  {
    ptrAndBits = v3->_token._rep._ptrAndBits;
    if ((ptrAndBits & 7) != 0)
    {
      v6 = (unsigned int *)((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8);
      do
        v7 = __ldxr(v6);
      while (__stlxr(v7 - 2, v6));
    }
    v3->_token._rep._ptrAndBits = 0;
    v8 = v3;
  }

  return v4;
}

- (USKToken)initWithTfToken:(TfToken)a3
{
  USKToken *v5;
  USKToken *v6;
  USKToken *v7;
  objc_super v9;

  sub_2263F8F84();
  v9.receiver = self;
  v9.super_class = (Class)USKToken;
  v5 = -[USKToken init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    sub_2263BE4E4(&v5->_token._rep._ptrAndBits, a3._rep._ptrAndBits);
    v7 = v6;
  }

  return v6;
}

- (USKToken)initWithString:(id)a3
{
  id v4;
  USKToken *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  TfToken *p_token;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  void *__p[2];
  char v18;
  _Rep *v19;
  objc_super v20;

  v4 = a3;
  sub_2263F8F84();
  v20.receiver = self;
  v20.super_class = (Class)USKToken;
  v5 = -[USKToken init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v10 = (char *)objc_msgSend_UTF8String(v6, v7, v8, v9);
    sub_2263AE2A8(__p, v10);
    MEMORY[0x2276976E4](&v19, __p);
    p_token = &v5->_token;
    if (&v19 == (_Rep **)&v5->_token)
    {
      if ((v19 & 7) != 0)
      {
        v14 = (unsigned int *)((unint64_t)v19 & 0xFFFFFFFFFFFFFFF8);
        do
          v15 = __ldxr(v14);
        while (__stlxr(v15 - 2, v14));
      }
    }
    else
    {
      if (((uint64_t)p_token->_rep._ptrAndBits & 7) != 0)
      {
        v12 = (unsigned int *)((unint64_t)p_token->_rep._ptrAndBits & 0xFFFFFFFFFFFFFFF8);
        do
          v13 = __ldxr(v12);
        while (__stlxr(v13 - 2, v12));
      }
      p_token->_rep._ptrAndBits = v19;
      v19 = 0;
    }
    if (v18 < 0)
      operator delete(__p[0]);
  }

  return v5;
}

+ (id)nodeTypeWithTfToken:(TfToken)a3
{
  unsigned __int8 v4;
  id *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int *v50;
  unsigned int v51;
  unsigned int *v52;
  unsigned int v53;
  unsigned int *v54;
  unsigned int v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int *v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  unsigned int *v62;
  unsigned int v63;
  unsigned int *v64;
  unsigned int v65;
  unsigned int *v66;
  unsigned int v67;
  unsigned int *v68;
  unsigned int v69;
  unsigned int *v70;
  unsigned int v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101[60];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v4 = atomic_load((unsigned __int8 *)&qword_25583CFF0);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_25583CFF0))
  {
    v7 = operator new();
    MEMORY[0x2276976D8](&v100, "Mesh");
    v8 = v100;
    v100 = 0;
    v101[0] = v8;
    v101[1] = (uint64_t *)CFSTR("Mesh");
    MEMORY[0x2276976D8](&v99, "Points");
    v101[2] = v99;
    v99 = 0;
    v101[3] = (uint64_t *)CFSTR("Points");
    MEMORY[0x2276976D8](&v98, "BasisCurves");
    v101[4] = v98;
    v98 = 0;
    v101[5] = (uint64_t *)CFSTR("BasisCurves");
    MEMORY[0x2276976D8](&v97, "GeomSubset");
    v101[6] = v97;
    v97 = 0;
    v101[7] = (uint64_t *)CFSTR("GeomSubset");
    MEMORY[0x2276976D8](&v96, "Xform");
    v101[8] = v96;
    v96 = 0;
    v101[9] = (uint64_t *)CFSTR("Xform");
    MEMORY[0x2276976D8](&v95, "Scope");
    v101[10] = v95;
    v95 = 0;
    v101[11] = (uint64_t *)CFSTR("Scope");
    MEMORY[0x2276976D8](&v94, "Material");
    v101[12] = v94;
    v94 = 0;
    v101[13] = (uint64_t *)CFSTR("Material");
    MEMORY[0x2276976D8](&v93, "Shader");
    v101[14] = v93;
    v93 = 0;
    v101[15] = (uint64_t *)CFSTR("Shader");
    MEMORY[0x2276976D8](&v92, "Skeleton");
    v101[16] = v92;
    v92 = 0;
    v101[17] = (uint64_t *)CFSTR("Skeleton");
    MEMORY[0x2276976D8](&v91, "SkelRoot");
    v101[18] = v91;
    v91 = 0;
    v101[19] = (uint64_t *)CFSTR("SkelRoot");
    MEMORY[0x2276976D8](&v90, "SkelAnimation");
    v101[20] = v90;
    v90 = 0;
    v101[21] = (uint64_t *)CFSTR("SkelAnimation");
    MEMORY[0x2276976D8](&v89, "BlendShape");
    v101[22] = v89;
    v89 = 0;
    v101[23] = (uint64_t *)CFSTR("BlendShape");
    MEMORY[0x2276976D8](&v88, "Cube");
    v101[24] = v88;
    v88 = 0;
    v101[25] = (uint64_t *)CFSTR("Cube");
    MEMORY[0x2276976D8](&v87, "Cone");
    v101[26] = v87;
    v87 = 0;
    v101[27] = (uint64_t *)CFSTR("Cone");
    MEMORY[0x2276976D8](&v86, "Capsule");
    v101[28] = v86;
    v86 = 0;
    v101[29] = (uint64_t *)CFSTR("Capsule");
    MEMORY[0x2276976D8](&v85, "Cylinder");
    v101[30] = v85;
    v85 = 0;
    v101[31] = (uint64_t *)CFSTR("Cylinder");
    MEMORY[0x2276976D8](&v84, "Sphere");
    v101[32] = v84;
    v84 = 0;
    v101[33] = (uint64_t *)CFSTR("Sphere");
    MEMORY[0x2276976D8](&v83, "Camera");
    v101[34] = v83;
    v83 = 0;
    v101[35] = (uint64_t *)CFSTR("Camera");
    MEMORY[0x2276976D8](&v82, "SpatialAudio");
    v101[36] = v82;
    v82 = 0;
    v101[37] = (uint64_t *)CFSTR("SpatialAudio");
    MEMORY[0x2276976D8](&v81, "PhysicsScene");
    v101[38] = v81;
    v81 = 0;
    v101[39] = (uint64_t *)CFSTR("PhysicsScene");
    MEMORY[0x2276976D8](&v80, "PhysicsCollisionGroup");
    v101[40] = v80;
    v80 = 0;
    v101[41] = (uint64_t *)CFSTR("PhysicsCollisionGroup");
    MEMORY[0x2276976D8](&v79, "Preliminary_Text");
    v101[42] = v79;
    v79 = 0;
    v101[43] = (uint64_t *)CFSTR("Preliminary_Text");
    MEMORY[0x2276976D8](&v78, "Preliminary_ReferenceImage");
    v101[44] = v78;
    v78 = 0;
    v101[45] = (uint64_t *)CFSTR("Preliminary_ReferenceImage");
    MEMORY[0x2276976D8](&v77, "Preliminary_PhysicsForce");
    v101[46] = v77;
    v77 = 0;
    v101[47] = (uint64_t *)CFSTR("Preliminary_PhysicsForce");
    MEMORY[0x2276976D8](&v76, "Preliminary_PhysicsGravitationalForce");
    v101[48] = v76;
    v76 = 0;
    v101[49] = (uint64_t *)CFSTR("Preliminary_PhysicsGravitationalForce");
    MEMORY[0x2276976D8](&v75, "Preliminary_InfiniteColliderPlane");
    v101[50] = v75;
    v75 = 0;
    v101[51] = (uint64_t *)CFSTR("Preliminary_InfiniteColliderPlane");
    MEMORY[0x2276976D8](&v74, "Preliminary_Behavior");
    v101[52] = v74;
    v74 = 0;
    v101[53] = (uint64_t *)CFSTR("Preliminary_Behavior");
    MEMORY[0x2276976D8](&v73, "Preliminary_Trigger");
    v101[54] = v73;
    v73 = 0;
    v101[55] = (uint64_t *)CFSTR("Preliminary_Trigger");
    MEMORY[0x2276976D8](&v72, "Preliminary_Action");
    v101[56] = v72;
    v72 = 0;
    v101[57] = (uint64_t *)CFSTR("Preliminary_Action");
    v101[58] = 0;
    v101[59] = (uint64_t *)&stru_24EDD91A8;
    sub_2263D4908(v7, (uint64_t *)v101, 30);
    v9 = (uint64_t **)&v102;
    do
    {

      v11 = (uint64_t)*(v9 - 2);
      v9 -= 2;
      v10 = v11;
      if ((v11 & 7) != 0)
      {
        v12 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFF8);
        do
          v13 = __ldxr(v12);
        while (__stlxr(v13 - 2, v12));
      }
    }
    while (v9 != v101);
    if ((v72 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v72 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 2, v14));
    }
    if ((v73 & 7) != 0)
    {
      v16 = (unsigned int *)((unint64_t)v73 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    if ((v74 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v74 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    if ((v75 & 7) != 0)
    {
      v20 = (unsigned int *)((unint64_t)v75 & 0xFFFFFFFFFFFFFFF8);
      do
        v21 = __ldxr(v20);
      while (__stlxr(v21 - 2, v20));
    }
    if ((v76 & 7) != 0)
    {
      v22 = (unsigned int *)((unint64_t)v76 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    if ((v77 & 7) != 0)
    {
      v24 = (unsigned int *)((unint64_t)v77 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }
    if ((v78 & 7) != 0)
    {
      v26 = (unsigned int *)((unint64_t)v78 & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    if ((v79 & 7) != 0)
    {
      v28 = (unsigned int *)((unint64_t)v79 & 0xFFFFFFFFFFFFFFF8);
      do
        v29 = __ldxr(v28);
      while (__stlxr(v29 - 2, v28));
    }
    if ((v80 & 7) != 0)
    {
      v30 = (unsigned int *)((unint64_t)v80 & 0xFFFFFFFFFFFFFFF8);
      do
        v31 = __ldxr(v30);
      while (__stlxr(v31 - 2, v30));
    }
    if ((v81 & 7) != 0)
    {
      v32 = (unsigned int *)((unint64_t)v81 & 0xFFFFFFFFFFFFFFF8);
      do
        v33 = __ldxr(v32);
      while (__stlxr(v33 - 2, v32));
    }
    if ((v82 & 7) != 0)
    {
      v34 = (unsigned int *)((unint64_t)v82 & 0xFFFFFFFFFFFFFFF8);
      do
        v35 = __ldxr(v34);
      while (__stlxr(v35 - 2, v34));
    }
    if ((v83 & 7) != 0)
    {
      v36 = (unsigned int *)((unint64_t)v83 & 0xFFFFFFFFFFFFFFF8);
      do
        v37 = __ldxr(v36);
      while (__stlxr(v37 - 2, v36));
    }
    if ((v84 & 7) != 0)
    {
      v38 = (unsigned int *)((unint64_t)v84 & 0xFFFFFFFFFFFFFFF8);
      do
        v39 = __ldxr(v38);
      while (__stlxr(v39 - 2, v38));
    }
    if ((v85 & 7) != 0)
    {
      v40 = (unsigned int *)((unint64_t)v85 & 0xFFFFFFFFFFFFFFF8);
      do
        v41 = __ldxr(v40);
      while (__stlxr(v41 - 2, v40));
    }
    if ((v86 & 7) != 0)
    {
      v42 = (unsigned int *)((unint64_t)v86 & 0xFFFFFFFFFFFFFFF8);
      do
        v43 = __ldxr(v42);
      while (__stlxr(v43 - 2, v42));
    }
    if ((v87 & 7) != 0)
    {
      v44 = (unsigned int *)((unint64_t)v87 & 0xFFFFFFFFFFFFFFF8);
      do
        v45 = __ldxr(v44);
      while (__stlxr(v45 - 2, v44));
    }
    if ((v88 & 7) != 0)
    {
      v46 = (unsigned int *)((unint64_t)v88 & 0xFFFFFFFFFFFFFFF8);
      do
        v47 = __ldxr(v46);
      while (__stlxr(v47 - 2, v46));
    }
    if ((v89 & 7) != 0)
    {
      v48 = (unsigned int *)((unint64_t)v89 & 0xFFFFFFFFFFFFFFF8);
      do
        v49 = __ldxr(v48);
      while (__stlxr(v49 - 2, v48));
    }
    if ((v90 & 7) != 0)
    {
      v50 = (unsigned int *)((unint64_t)v90 & 0xFFFFFFFFFFFFFFF8);
      do
        v51 = __ldxr(v50);
      while (__stlxr(v51 - 2, v50));
    }
    if ((v91 & 7) != 0)
    {
      v52 = (unsigned int *)((unint64_t)v91 & 0xFFFFFFFFFFFFFFF8);
      do
        v53 = __ldxr(v52);
      while (__stlxr(v53 - 2, v52));
    }
    if ((v92 & 7) != 0)
    {
      v54 = (unsigned int *)((unint64_t)v92 & 0xFFFFFFFFFFFFFFF8);
      do
        v55 = __ldxr(v54);
      while (__stlxr(v55 - 2, v54));
    }
    if ((v93 & 7) != 0)
    {
      v56 = (unsigned int *)((unint64_t)v93 & 0xFFFFFFFFFFFFFFF8);
      do
        v57 = __ldxr(v56);
      while (__stlxr(v57 - 2, v56));
    }
    if ((v94 & 7) != 0)
    {
      v58 = (unsigned int *)((unint64_t)v94 & 0xFFFFFFFFFFFFFFF8);
      do
        v59 = __ldxr(v58);
      while (__stlxr(v59 - 2, v58));
    }
    if ((v95 & 7) != 0)
    {
      v60 = (unsigned int *)((unint64_t)v95 & 0xFFFFFFFFFFFFFFF8);
      do
        v61 = __ldxr(v60);
      while (__stlxr(v61 - 2, v60));
    }
    if ((v96 & 7) != 0)
    {
      v62 = (unsigned int *)((unint64_t)v96 & 0xFFFFFFFFFFFFFFF8);
      do
        v63 = __ldxr(v62);
      while (__stlxr(v63 - 2, v62));
    }
    if ((v97 & 7) != 0)
    {
      v64 = (unsigned int *)((unint64_t)v97 & 0xFFFFFFFFFFFFFFF8);
      do
        v65 = __ldxr(v64);
      while (__stlxr(v65 - 2, v64));
    }
    if ((v98 & 7) != 0)
    {
      v66 = (unsigned int *)((unint64_t)v98 & 0xFFFFFFFFFFFFFFF8);
      do
        v67 = __ldxr(v66);
      while (__stlxr(v67 - 2, v66));
    }
    if ((v99 & 7) != 0)
    {
      v68 = (unsigned int *)((unint64_t)v99 & 0xFFFFFFFFFFFFFFF8);
      do
        v69 = __ldxr(v68);
      while (__stlxr(v69 - 2, v68));
    }
    if ((v100 & 7) != 0)
    {
      v70 = (unsigned int *)((unint64_t)v100 & 0xFFFFFFFFFFFFFFF8);
      do
        v71 = __ldxr(v70);
      while (__stlxr(v71 - 2, v70));
    }
    qword_25583CFE8 = v7;
    __cxa_guard_release(&qword_25583CFF0);
  }
  if ((_QWORD *)(qword_25583CFE8 + 8) == sub_2263D4DD4(qword_25583CFE8, (uint64_t *)a3._rep._ptrAndBits))
  {
    v5 = (id *)&USKNodeTypeUnknown;
  }
  else
  {
    v101[0] = (uint64_t *)a3._rep._ptrAndBits;
    v5 = (id *)(sub_2263D4E60((uint64_t **)qword_25583CFE8, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_22640BC0C, v101)+ 5);
  }
  return *v5;
}

+ (id)schemaTypeWithTfToken:(TfToken)a3
{
  unsigned __int8 v4;
  id *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53[26];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v4 = atomic_load((unsigned __int8 *)&qword_25583D000);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_25583D000))
  {
    v7 = operator new();
    MEMORY[0x2276976D8](&v52, "BindingAPI");
    v8 = v52;
    v52 = 0;
    v53[0] = v8;
    v53[1] = (uint64_t *)CFSTR("BindingAPI");
    MEMORY[0x2276976D8](&v51, "SkelBindingAPI");
    v53[2] = v51;
    v51 = 0;
    v53[3] = (uint64_t *)CFSTR("SkelBindingAPI");
    MEMORY[0x2276976D8](&v50, "MaterialBindingAPI");
    v53[4] = v50;
    v50 = 0;
    v53[5] = (uint64_t *)CFSTR("MaterialBindingAPI");
    MEMORY[0x2276976D8](&v49, "PhysicsRigidBodyAPI");
    v53[6] = v49;
    v49 = 0;
    v53[7] = (uint64_t *)CFSTR("PhysicsRigidBodyAPI");
    MEMORY[0x2276976D8](&v48, "PhysicsMassAPI");
    v53[8] = v48;
    v48 = 0;
    v53[9] = (uint64_t *)CFSTR("PhysicsMassAPI");
    MEMORY[0x2276976D8](&v47, "PhysicsCollisionAPI");
    v53[10] = v47;
    v47 = 0;
    v53[11] = (uint64_t *)CFSTR("PhysicsCollisionAPI");
    MEMORY[0x2276976D8](&v46, "PhysicsMeshCollisionAPI");
    v53[12] = v46;
    v46 = 0;
    v53[13] = (uint64_t *)CFSTR("PhysicsMeshCollisionAPI");
    MEMORY[0x2276976D8](&v45, "PhysicsMaterialAPI");
    v53[14] = v45;
    v45 = 0;
    v53[15] = (uint64_t *)CFSTR("PhysicsMaterialAPI");
    MEMORY[0x2276976D8](&v44, "PhysicsFilteredPairsAPI");
    v53[16] = v44;
    v44 = 0;
    v53[17] = (uint64_t *)CFSTR("PhysicsFilteredPairsAPI");
    MEMORY[0x2276976D8](&v43, "Preliminary_AnchoringAPI");
    v53[18] = v43;
    v43 = 0;
    v53[19] = (uint64_t *)CFSTR("Preliminary_AnchoringAPI");
    MEMORY[0x2276976D8](&v42, "Preliminary_PhysicsColliderAPI");
    v53[20] = v42;
    v42 = 0;
    v53[21] = (uint64_t *)CFSTR("Preliminary_PhysicsColliderAPI");
    MEMORY[0x2276976D8](&v41, "Preliminary_PhysicsMaterialAPI");
    v53[22] = v41;
    v41 = 0;
    v53[23] = (uint64_t *)CFSTR("Preliminary_PhysicsMaterialAPI");
    MEMORY[0x2276976D8](&v40, "Preliminary_PhysicsRigidBodyAPI");
    v53[24] = v40;
    v40 = 0;
    v53[25] = (uint64_t *)CFSTR("Preliminary_PhysicsRigidBodyAPI");
    sub_2263D4908(v7, (uint64_t *)v53, 13);
    v9 = (uint64_t **)&v54;
    do
    {

      v11 = (uint64_t)*(v9 - 2);
      v9 -= 2;
      v10 = v11;
      if ((v11 & 7) != 0)
      {
        v12 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFF8);
        do
          v13 = __ldxr(v12);
        while (__stlxr(v13 - 2, v12));
      }
    }
    while (v9 != v53);
    if ((v40 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v40 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 2, v14));
    }
    if ((v41 & 7) != 0)
    {
      v16 = (unsigned int *)((unint64_t)v41 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    if ((v42 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v42 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    if ((v43 & 7) != 0)
    {
      v20 = (unsigned int *)((unint64_t)v43 & 0xFFFFFFFFFFFFFFF8);
      do
        v21 = __ldxr(v20);
      while (__stlxr(v21 - 2, v20));
    }
    if ((v44 & 7) != 0)
    {
      v22 = (unsigned int *)((unint64_t)v44 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    if ((v45 & 7) != 0)
    {
      v24 = (unsigned int *)((unint64_t)v45 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }
    if ((v46 & 7) != 0)
    {
      v26 = (unsigned int *)((unint64_t)v46 & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    if ((v47 & 7) != 0)
    {
      v28 = (unsigned int *)((unint64_t)v47 & 0xFFFFFFFFFFFFFFF8);
      do
        v29 = __ldxr(v28);
      while (__stlxr(v29 - 2, v28));
    }
    if ((v48 & 7) != 0)
    {
      v30 = (unsigned int *)((unint64_t)v48 & 0xFFFFFFFFFFFFFFF8);
      do
        v31 = __ldxr(v30);
      while (__stlxr(v31 - 2, v30));
    }
    if ((v49 & 7) != 0)
    {
      v32 = (unsigned int *)((unint64_t)v49 & 0xFFFFFFFFFFFFFFF8);
      do
        v33 = __ldxr(v32);
      while (__stlxr(v33 - 2, v32));
    }
    if ((v50 & 7) != 0)
    {
      v34 = (unsigned int *)((unint64_t)v50 & 0xFFFFFFFFFFFFFFF8);
      do
        v35 = __ldxr(v34);
      while (__stlxr(v35 - 2, v34));
    }
    if ((v51 & 7) != 0)
    {
      v36 = (unsigned int *)((unint64_t)v51 & 0xFFFFFFFFFFFFFFF8);
      do
        v37 = __ldxr(v36);
      while (__stlxr(v37 - 2, v36));
    }
    if ((v52 & 7) != 0)
    {
      v38 = (unsigned int *)((unint64_t)v52 & 0xFFFFFFFFFFFFFFF8);
      do
        v39 = __ldxr(v38);
      while (__stlxr(v39 - 2, v38));
    }
    qword_25583CFF8 = v7;
    __cxa_guard_release(&qword_25583D000);
  }
  if ((_QWORD *)(qword_25583CFF8 + 8) == sub_2263D4DD4(qword_25583CFF8, (uint64_t *)a3._rep._ptrAndBits))
  {
    v5 = (id *)&USKSchemaTypeUnknown;
  }
  else
  {
    v53[0] = (uint64_t *)a3._rep._ptrAndBits;
    v5 = (id *)(sub_2263D4E60((uint64_t **)qword_25583CFF8, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_22640BC0C, v53)
              + 5);
  }
  return *v5;
}

+ (id)roleTypeWithTfToken:(TfToken)a3
{
  unsigned __int8 v4;
  id *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29[10];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v4 = atomic_load((unsigned __int8 *)&qword_25583D010);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_25583D010))
  {
    v7 = operator new();
    MEMORY[0x2276976D8](&v28, "Color");
    v8 = v28;
    v28 = 0;
    v29[0] = v8;
    v29[1] = (uint64_t *)CFSTR("Color");
    MEMORY[0x2276976D8](&v27, "Normal");
    v29[2] = v27;
    v27 = 0;
    v29[3] = (uint64_t *)CFSTR("Normal");
    MEMORY[0x2276976D8](&v26, "TextureCoordinate");
    v29[4] = v26;
    v26 = 0;
    v29[5] = (uint64_t *)CFSTR("TextureCoordinate");
    MEMORY[0x2276976D8](&v25, "Point");
    v29[6] = v25;
    v25 = 0;
    v29[7] = (uint64_t *)CFSTR("Point");
    MEMORY[0x2276976D8](&v24, "Vector");
    v29[8] = v24;
    v24 = 0;
    v29[9] = (uint64_t *)CFSTR("Vector");
    sub_2263D4908(v7, (uint64_t *)v29, 5);
    v9 = (uint64_t **)&v30;
    do
    {

      v11 = (uint64_t)*(v9 - 2);
      v9 -= 2;
      v10 = v11;
      if ((v11 & 7) != 0)
      {
        v12 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFF8);
        do
          v13 = __ldxr(v12);
        while (__stlxr(v13 - 2, v12));
      }
    }
    while (v9 != v29);
    if ((v24 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v24 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 2, v14));
    }
    if ((v25 & 7) != 0)
    {
      v16 = (unsigned int *)((unint64_t)v25 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    if ((v26 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v26 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    if ((v27 & 7) != 0)
    {
      v20 = (unsigned int *)((unint64_t)v27 & 0xFFFFFFFFFFFFFFF8);
      do
        v21 = __ldxr(v20);
      while (__stlxr(v21 - 2, v20));
    }
    if ((v28 & 7) != 0)
    {
      v22 = (unsigned int *)((unint64_t)v28 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    qword_25583D008 = v7;
    __cxa_guard_release(&qword_25583D010);
  }
  if ((_QWORD *)(qword_25583D008 + 8) == sub_2263D4DD4(qword_25583D008, (uint64_t *)a3._rep._ptrAndBits))
  {
    v5 = (id *)&USKRoleTypeNone;
  }
  else
  {
    v29[0] = (uint64_t *)a3._rep._ptrAndBits;
    v5 = (id *)(sub_2263D4E60((uint64_t **)qword_25583D008, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_22640BC0C, v29)
              + 5);
  }
  return *v5;
}

+ (id)dataTypeWithTfToken:(TfToken)a3
{
  unsigned __int8 v4;
  id *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int *v50;
  unsigned int v51;
  unsigned int *v52;
  unsigned int v53;
  unsigned int *v54;
  unsigned int v55;
  unsigned int *v56;
  unsigned int v57;
  unsigned int *v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  unsigned int *v62;
  unsigned int v63;
  unsigned int *v64;
  unsigned int v65;
  unsigned int *v66;
  unsigned int v67;
  unsigned int *v68;
  unsigned int v69;
  unsigned int *v70;
  unsigned int v71;
  unsigned int *v72;
  unsigned int v73;
  unsigned int *v74;
  unsigned int v75;
  unsigned int *v76;
  unsigned int v77;
  unsigned int *v78;
  unsigned int v79;
  unsigned int *v80;
  unsigned int v81;
  unsigned int *v82;
  unsigned int v83;
  unsigned int *v84;
  unsigned int v85;
  unsigned int *v86;
  unsigned int v87;
  unsigned int *v88;
  unsigned int v89;
  unsigned int *v90;
  unsigned int v91;
  unsigned int *v92;
  unsigned int v93;
  unsigned int *v94;
  unsigned int v95;
  unsigned int *v96;
  unsigned int v97;
  unsigned int *v98;
  unsigned int v99;
  unsigned int *v100;
  unsigned int v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t *v115;
  uint64_t *v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t *v122;
  uint64_t *v123;
  uint64_t *v124;
  uint64_t *v125;
  uint64_t *v126;
  uint64_t *v127;
  uint64_t *v128;
  uint64_t *v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t *v132;
  uint64_t *v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t *v140;
  uint64_t *v141;
  uint64_t *v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t *v145;
  uint64_t *v146[88];
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  sub_2263F8F84();
  v4 = atomic_load((unsigned __int8 *)&qword_25583D020);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_25583D020))
  {
    v7 = operator new();
    MEMORY[0x2276976D8](&v145, "double");
    v8 = v145;
    v145 = 0;
    v146[0] = v8;
    v146[1] = (uint64_t *)CFSTR("double");
    MEMORY[0x2276976D8](&v144, "double2");
    v146[2] = v144;
    v144 = 0;
    v146[3] = (uint64_t *)CFSTR("double2");
    MEMORY[0x2276976D8](&v143, "double3");
    v146[4] = v143;
    v143 = 0;
    v146[5] = (uint64_t *)CFSTR("double3");
    MEMORY[0x2276976D8](&v142, "double4");
    v146[6] = v142;
    v142 = 0;
    v146[7] = (uint64_t *)CFSTR("double4");
    MEMORY[0x2276976D8](&v141, "matrix4d");
    v146[8] = v141;
    v141 = 0;
    v146[9] = (uint64_t *)CFSTR("double4x4");
    MEMORY[0x2276976D8](&v140, "double[]");
    v146[10] = v140;
    v140 = 0;
    v146[11] = (uint64_t *)CFSTR("double[]");
    MEMORY[0x2276976D8](&v139, "double2[]");
    v146[12] = v139;
    v139 = 0;
    v146[13] = (uint64_t *)CFSTR("double2[]");
    MEMORY[0x2276976D8](&v138, "double3[]");
    v146[14] = v138;
    v138 = 0;
    v146[15] = (uint64_t *)CFSTR("double3[]");
    MEMORY[0x2276976D8](&v137, "double4[]");
    v146[16] = v137;
    v137 = 0;
    v146[17] = (uint64_t *)CFSTR("double4[]");
    MEMORY[0x2276976D8](&v136, "matrix4d[]");
    v146[18] = v136;
    v136 = 0;
    v146[19] = (uint64_t *)CFSTR("double4x4[]");
    MEMORY[0x2276976D8](&v135, "half");
    v146[20] = v135;
    v135 = 0;
    v146[21] = (uint64_t *)CFSTR("half");
    MEMORY[0x2276976D8](&v134, "half2");
    v146[22] = v134;
    v134 = 0;
    v146[23] = (uint64_t *)CFSTR("half2");
    MEMORY[0x2276976D8](&v133, "half3");
    v146[24] = v133;
    v133 = 0;
    v146[25] = (uint64_t *)CFSTR("half3");
    MEMORY[0x2276976D8](&v132, "half4");
    v146[26] = v132;
    v132 = 0;
    v146[27] = (uint64_t *)CFSTR("half4");
    MEMORY[0x2276976D8](&v131, "half[]");
    v146[28] = v131;
    v131 = 0;
    v146[29] = (uint64_t *)CFSTR("half[]");
    MEMORY[0x2276976D8](&v130, "half2[]");
    v146[30] = v130;
    v130 = 0;
    v146[31] = (uint64_t *)CFSTR("half2[]");
    MEMORY[0x2276976D8](&v129, "half3[]");
    v146[32] = v129;
    v129 = 0;
    v146[33] = (uint64_t *)CFSTR("half3[]");
    MEMORY[0x2276976D8](&v128, "half4[]");
    v146[34] = v128;
    v128 = 0;
    v146[35] = (uint64_t *)CFSTR("half4[]");
    MEMORY[0x2276976D8](&v127, "float");
    v146[36] = v127;
    v127 = 0;
    v146[37] = (uint64_t *)CFSTR("float");
    MEMORY[0x2276976D8](&v126, "float2");
    v146[38] = v126;
    v126 = 0;
    v146[39] = (uint64_t *)CFSTR("float2");
    MEMORY[0x2276976D8](&v125, "float3");
    v146[40] = v125;
    v125 = 0;
    v146[41] = (uint64_t *)CFSTR("float3");
    MEMORY[0x2276976D8](&v124, "float4");
    v146[42] = v124;
    v124 = 0;
    v146[43] = (uint64_t *)CFSTR("float4");
    MEMORY[0x2276976D8](&v123, "matrix4f");
    v146[44] = v123;
    v123 = 0;
    v146[45] = (uint64_t *)CFSTR("float4x4");
    MEMORY[0x2276976D8](&v122, "float[]");
    v146[46] = v122;
    v122 = 0;
    v146[47] = (uint64_t *)CFSTR("float[]");
    MEMORY[0x2276976D8](&v121, "float2[]");
    v146[48] = v121;
    v121 = 0;
    v146[49] = (uint64_t *)CFSTR("float2[]");
    MEMORY[0x2276976D8](&v120, "float3[]");
    v146[50] = v120;
    v120 = 0;
    v146[51] = (uint64_t *)CFSTR("float3[]");
    MEMORY[0x2276976D8](&v119, "float4[]");
    v146[52] = v119;
    v119 = 0;
    v146[53] = (uint64_t *)CFSTR("float4[]");
    MEMORY[0x2276976D8](&v118, "matrix4f[]");
    v146[54] = v118;
    v118 = 0;
    v146[55] = (uint64_t *)CFSTR("float4x4[]");
    MEMORY[0x2276976D8](&v117, "int");
    v146[56] = v117;
    v117 = 0;
    v146[57] = (uint64_t *)CFSTR("int");
    MEMORY[0x2276976D8](&v116, "int[]");
    v146[58] = v116;
    v116 = 0;
    v146[59] = (uint64_t *)CFSTR("int[]");
    MEMORY[0x2276976D8](&v115, "BOOL");
    v146[60] = v115;
    v115 = 0;
    v146[61] = (uint64_t *)CFSTR("BOOL");
    MEMORY[0x2276976D8](&v114, "BOOL[]");
    v146[62] = v114;
    v114 = 0;
    v146[63] = (uint64_t *)CFSTR("BOOL[]");
    MEMORY[0x2276976D8](&v113, "uint");
    v146[64] = v113;
    v113 = 0;
    v146[65] = (uint64_t *)CFSTR("uint");
    MEMORY[0x2276976D8](&v112, "uint[]");
    v146[66] = v112;
    v112 = 0;
    v146[67] = (uint64_t *)CFSTR("uint[]");
    MEMORY[0x2276976D8](&v111, "timecode");
    v146[68] = v111;
    v111 = 0;
    v146[69] = (uint64_t *)CFSTR("timecode");
    MEMORY[0x2276976D8](&v110, "token");
    v146[70] = v110;
    v110 = 0;
    v146[71] = (uint64_t *)CFSTR("token");
    MEMORY[0x2276976D8](&v109, "token[]");
    v146[72] = v109;
    v109 = 0;
    v146[73] = (uint64_t *)CFSTR("token[]");
    MEMORY[0x2276976D8](&v108, "string");
    v146[74] = v108;
    v108 = 0;
    v146[75] = (uint64_t *)CFSTR("string");
    MEMORY[0x2276976D8](&v107, "string[]");
    v146[76] = v107;
    v107 = 0;
    v146[77] = (uint64_t *)CFSTR("string[]");
    MEMORY[0x2276976D8](&v106, "quatf");
    v146[78] = v106;
    v106 = 0;
    v146[79] = (uint64_t *)CFSTR("quatf");
    MEMORY[0x2276976D8](&v105, "quatf[]");
    v146[80] = v105;
    v105 = 0;
    v146[81] = (uint64_t *)CFSTR("quatf[]");
    MEMORY[0x2276976D8](&v104, "rel");
    v146[82] = v104;
    v104 = 0;
    v146[83] = (uint64_t *)CFSTR("rel");
    MEMORY[0x2276976D8](&v103, "asset");
    v146[84] = v103;
    v103 = 0;
    v146[85] = (uint64_t *)CFSTR("asset");
    MEMORY[0x2276976D8](&v102, "asset[]");
    v146[86] = v102;
    v102 = 0;
    v146[87] = (uint64_t *)CFSTR("asset[]");
    sub_2263D4908(v7, (uint64_t *)v146, 44);
    v9 = (uint64_t **)&v147;
    do
    {

      v11 = (uint64_t)*(v9 - 2);
      v9 -= 2;
      v10 = v11;
      if ((v11 & 7) != 0)
      {
        v12 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFFFF8);
        do
          v13 = __ldxr(v12);
        while (__stlxr(v13 - 2, v12));
      }
    }
    while (v9 != v146);
    if ((v102 & 7) != 0)
    {
      v14 = (unsigned int *)((unint64_t)v102 & 0xFFFFFFFFFFFFFFF8);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 2, v14));
    }
    if ((v103 & 7) != 0)
    {
      v16 = (unsigned int *)((unint64_t)v103 & 0xFFFFFFFFFFFFFFF8);
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 2, v16));
    }
    if ((v104 & 7) != 0)
    {
      v18 = (unsigned int *)((unint64_t)v104 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    if ((v105 & 7) != 0)
    {
      v20 = (unsigned int *)((unint64_t)v105 & 0xFFFFFFFFFFFFFFF8);
      do
        v21 = __ldxr(v20);
      while (__stlxr(v21 - 2, v20));
    }
    if ((v106 & 7) != 0)
    {
      v22 = (unsigned int *)((unint64_t)v106 & 0xFFFFFFFFFFFFFFF8);
      do
        v23 = __ldxr(v22);
      while (__stlxr(v23 - 2, v22));
    }
    if ((v107 & 7) != 0)
    {
      v24 = (unsigned int *)((unint64_t)v107 & 0xFFFFFFFFFFFFFFF8);
      do
        v25 = __ldxr(v24);
      while (__stlxr(v25 - 2, v24));
    }
    if ((v108 & 7) != 0)
    {
      v26 = (unsigned int *)((unint64_t)v108 & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    if ((v109 & 7) != 0)
    {
      v28 = (unsigned int *)((unint64_t)v109 & 0xFFFFFFFFFFFFFFF8);
      do
        v29 = __ldxr(v28);
      while (__stlxr(v29 - 2, v28));
    }
    if ((v110 & 7) != 0)
    {
      v30 = (unsigned int *)((unint64_t)v110 & 0xFFFFFFFFFFFFFFF8);
      do
        v31 = __ldxr(v30);
      while (__stlxr(v31 - 2, v30));
    }
    if ((v111 & 7) != 0)
    {
      v32 = (unsigned int *)((unint64_t)v111 & 0xFFFFFFFFFFFFFFF8);
      do
        v33 = __ldxr(v32);
      while (__stlxr(v33 - 2, v32));
    }
    if ((v112 & 7) != 0)
    {
      v34 = (unsigned int *)((unint64_t)v112 & 0xFFFFFFFFFFFFFFF8);
      do
        v35 = __ldxr(v34);
      while (__stlxr(v35 - 2, v34));
    }
    if ((v113 & 7) != 0)
    {
      v36 = (unsigned int *)((unint64_t)v113 & 0xFFFFFFFFFFFFFFF8);
      do
        v37 = __ldxr(v36);
      while (__stlxr(v37 - 2, v36));
    }
    if ((v114 & 7) != 0)
    {
      v38 = (unsigned int *)((unint64_t)v114 & 0xFFFFFFFFFFFFFFF8);
      do
        v39 = __ldxr(v38);
      while (__stlxr(v39 - 2, v38));
    }
    if ((v115 & 7) != 0)
    {
      v40 = (unsigned int *)((unint64_t)v115 & 0xFFFFFFFFFFFFFFF8);
      do
        v41 = __ldxr(v40);
      while (__stlxr(v41 - 2, v40));
    }
    if ((v116 & 7) != 0)
    {
      v42 = (unsigned int *)((unint64_t)v116 & 0xFFFFFFFFFFFFFFF8);
      do
        v43 = __ldxr(v42);
      while (__stlxr(v43 - 2, v42));
    }
    if ((v117 & 7) != 0)
    {
      v44 = (unsigned int *)((unint64_t)v117 & 0xFFFFFFFFFFFFFFF8);
      do
        v45 = __ldxr(v44);
      while (__stlxr(v45 - 2, v44));
    }
    if ((v118 & 7) != 0)
    {
      v46 = (unsigned int *)((unint64_t)v118 & 0xFFFFFFFFFFFFFFF8);
      do
        v47 = __ldxr(v46);
      while (__stlxr(v47 - 2, v46));
    }
    if ((v119 & 7) != 0)
    {
      v48 = (unsigned int *)((unint64_t)v119 & 0xFFFFFFFFFFFFFFF8);
      do
        v49 = __ldxr(v48);
      while (__stlxr(v49 - 2, v48));
    }
    if ((v120 & 7) != 0)
    {
      v50 = (unsigned int *)((unint64_t)v120 & 0xFFFFFFFFFFFFFFF8);
      do
        v51 = __ldxr(v50);
      while (__stlxr(v51 - 2, v50));
    }
    if ((v121 & 7) != 0)
    {
      v52 = (unsigned int *)((unint64_t)v121 & 0xFFFFFFFFFFFFFFF8);
      do
        v53 = __ldxr(v52);
      while (__stlxr(v53 - 2, v52));
    }
    if ((v122 & 7) != 0)
    {
      v54 = (unsigned int *)((unint64_t)v122 & 0xFFFFFFFFFFFFFFF8);
      do
        v55 = __ldxr(v54);
      while (__stlxr(v55 - 2, v54));
    }
    if ((v123 & 7) != 0)
    {
      v56 = (unsigned int *)((unint64_t)v123 & 0xFFFFFFFFFFFFFFF8);
      do
        v57 = __ldxr(v56);
      while (__stlxr(v57 - 2, v56));
    }
    if ((v124 & 7) != 0)
    {
      v58 = (unsigned int *)((unint64_t)v124 & 0xFFFFFFFFFFFFFFF8);
      do
        v59 = __ldxr(v58);
      while (__stlxr(v59 - 2, v58));
    }
    if ((v125 & 7) != 0)
    {
      v60 = (unsigned int *)((unint64_t)v125 & 0xFFFFFFFFFFFFFFF8);
      do
        v61 = __ldxr(v60);
      while (__stlxr(v61 - 2, v60));
    }
    if ((v126 & 7) != 0)
    {
      v62 = (unsigned int *)((unint64_t)v126 & 0xFFFFFFFFFFFFFFF8);
      do
        v63 = __ldxr(v62);
      while (__stlxr(v63 - 2, v62));
    }
    if ((v127 & 7) != 0)
    {
      v64 = (unsigned int *)((unint64_t)v127 & 0xFFFFFFFFFFFFFFF8);
      do
        v65 = __ldxr(v64);
      while (__stlxr(v65 - 2, v64));
    }
    if ((v128 & 7) != 0)
    {
      v66 = (unsigned int *)((unint64_t)v128 & 0xFFFFFFFFFFFFFFF8);
      do
        v67 = __ldxr(v66);
      while (__stlxr(v67 - 2, v66));
    }
    if ((v129 & 7) != 0)
    {
      v68 = (unsigned int *)((unint64_t)v129 & 0xFFFFFFFFFFFFFFF8);
      do
        v69 = __ldxr(v68);
      while (__stlxr(v69 - 2, v68));
    }
    if ((v130 & 7) != 0)
    {
      v70 = (unsigned int *)((unint64_t)v130 & 0xFFFFFFFFFFFFFFF8);
      do
        v71 = __ldxr(v70);
      while (__stlxr(v71 - 2, v70));
    }
    if ((v131 & 7) != 0)
    {
      v72 = (unsigned int *)((unint64_t)v131 & 0xFFFFFFFFFFFFFFF8);
      do
        v73 = __ldxr(v72);
      while (__stlxr(v73 - 2, v72));
    }
    if ((v132 & 7) != 0)
    {
      v74 = (unsigned int *)((unint64_t)v132 & 0xFFFFFFFFFFFFFFF8);
      do
        v75 = __ldxr(v74);
      while (__stlxr(v75 - 2, v74));
    }
    if ((v133 & 7) != 0)
    {
      v76 = (unsigned int *)((unint64_t)v133 & 0xFFFFFFFFFFFFFFF8);
      do
        v77 = __ldxr(v76);
      while (__stlxr(v77 - 2, v76));
    }
    if ((v134 & 7) != 0)
    {
      v78 = (unsigned int *)((unint64_t)v134 & 0xFFFFFFFFFFFFFFF8);
      do
        v79 = __ldxr(v78);
      while (__stlxr(v79 - 2, v78));
    }
    if ((v135 & 7) != 0)
    {
      v80 = (unsigned int *)((unint64_t)v135 & 0xFFFFFFFFFFFFFFF8);
      do
        v81 = __ldxr(v80);
      while (__stlxr(v81 - 2, v80));
    }
    if ((v136 & 7) != 0)
    {
      v82 = (unsigned int *)((unint64_t)v136 & 0xFFFFFFFFFFFFFFF8);
      do
        v83 = __ldxr(v82);
      while (__stlxr(v83 - 2, v82));
    }
    if ((v137 & 7) != 0)
    {
      v84 = (unsigned int *)((unint64_t)v137 & 0xFFFFFFFFFFFFFFF8);
      do
        v85 = __ldxr(v84);
      while (__stlxr(v85 - 2, v84));
    }
    if ((v138 & 7) != 0)
    {
      v86 = (unsigned int *)((unint64_t)v138 & 0xFFFFFFFFFFFFFFF8);
      do
        v87 = __ldxr(v86);
      while (__stlxr(v87 - 2, v86));
    }
    if ((v139 & 7) != 0)
    {
      v88 = (unsigned int *)((unint64_t)v139 & 0xFFFFFFFFFFFFFFF8);
      do
        v89 = __ldxr(v88);
      while (__stlxr(v89 - 2, v88));
    }
    if ((v140 & 7) != 0)
    {
      v90 = (unsigned int *)((unint64_t)v140 & 0xFFFFFFFFFFFFFFF8);
      do
        v91 = __ldxr(v90);
      while (__stlxr(v91 - 2, v90));
    }
    if ((v141 & 7) != 0)
    {
      v92 = (unsigned int *)((unint64_t)v141 & 0xFFFFFFFFFFFFFFF8);
      do
        v93 = __ldxr(v92);
      while (__stlxr(v93 - 2, v92));
    }
    if ((v142 & 7) != 0)
    {
      v94 = (unsigned int *)((unint64_t)v142 & 0xFFFFFFFFFFFFFFF8);
      do
        v95 = __ldxr(v94);
      while (__stlxr(v95 - 2, v94));
    }
    if ((v143 & 7) != 0)
    {
      v96 = (unsigned int *)((unint64_t)v143 & 0xFFFFFFFFFFFFFFF8);
      do
        v97 = __ldxr(v96);
      while (__stlxr(v97 - 2, v96));
    }
    if ((v144 & 7) != 0)
    {
      v98 = (unsigned int *)((unint64_t)v144 & 0xFFFFFFFFFFFFFFF8);
      do
        v99 = __ldxr(v98);
      while (__stlxr(v99 - 2, v98));
    }
    if ((v145 & 7) != 0)
    {
      v100 = (unsigned int *)((unint64_t)v145 & 0xFFFFFFFFFFFFFFF8);
      do
        v101 = __ldxr(v100);
      while (__stlxr(v101 - 2, v100));
    }
    qword_25583D018 = v7;
    __cxa_guard_release(&qword_25583D020);
  }
  if ((_QWORD *)(qword_25583D018 + 8) == sub_2263D4DD4(qword_25583D018, (uint64_t *)a3._rep._ptrAndBits))
  {
    v5 = (id *)&USKDataTypeUnknown;
  }
  else
  {
    v146[0] = (uint64_t *)a3._rep._ptrAndBits;
    v5 = (id *)(sub_2263D4E60((uint64_t **)qword_25583D018, (uint64_t *)a3._rep._ptrAndBits, (uint64_t)&unk_22640BC0C, v146)+ 5);
  }
  return *v5;
}

+ (USKToken)tokenWithNodeType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  USKToken *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;

  v3 = a3;
  sub_2263F8F84();
  v6 = atomic_load((unsigned __int8 *)&qword_25583D038);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25583D038))
  {
    qword_25583D030 = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
    __cxa_guard_release(&qword_25583D038);
  }
  if (qword_25583D028 != -1)
    dispatch_once(&qword_25583D028, &unk_24EDD8780);
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D030, v4, (uint64_t)v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = [USKToken alloc];
      v11 = objc_retainAutorelease(v3);
      v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
      MEMORY[0x2276976D8](&v22, v15);
      v9 = (id)objc_msgSend_initWithTfToken_(v10, v16, (uint64_t)&v22, v17);
      if ((v22 & 7) != 0)
      {
        v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
        do
          v20 = __ldxr(v19);
        while (__stlxr(v20 - 2, v19));
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_25583D030, v18, (uint64_t)v9, (uint64_t)v11);
    }

  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D030, v4, (uint64_t)CFSTR("Unknown"), v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v9;
}

+ (USKToken)tokenWithRoleType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  USKToken *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;

  v3 = a3;
  sub_2263F8F84();
  v6 = atomic_load((unsigned __int8 *)&qword_25583D050);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25583D050))
  {
    qword_25583D048 = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
    __cxa_guard_release(&qword_25583D050);
  }
  if (qword_25583D040 != -1)
    dispatch_once(&qword_25583D040, &unk_24EDD87A0);
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D048, v4, (uint64_t)v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = [USKToken alloc];
      v11 = objc_retainAutorelease(v3);
      v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
      MEMORY[0x2276976D8](&v22, v15);
      v9 = (id)objc_msgSend_initWithTfToken_(v10, v16, (uint64_t)&v22, v17);
      if ((v22 & 7) != 0)
      {
        v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
        do
          v20 = __ldxr(v19);
        while (__stlxr(v20 - 2, v19));
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_25583D048, v18, (uint64_t)v9, (uint64_t)v11);
    }

  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D048, v4, (uint64_t)CFSTR("None"), v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v9;
}

+ (USKToken)tokenWithDataType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  USKToken *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;

  v3 = a3;
  sub_2263F8F84();
  v6 = atomic_load((unsigned __int8 *)&qword_25583D068);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25583D068))
  {
    qword_25583D060 = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
    __cxa_guard_release(&qword_25583D068);
  }
  if (qword_25583D058 != -1)
    dispatch_once(&qword_25583D058, &unk_24EDD87C0);
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D060, v4, (uint64_t)v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = [USKToken alloc];
      v11 = objc_retainAutorelease(v3);
      v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
      MEMORY[0x2276976D8](&v22, v15);
      v9 = (id)objc_msgSend_initWithTfToken_(v10, v16, (uint64_t)&v22, v17);
      if ((v22 & 7) != 0)
      {
        v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
        do
          v20 = __ldxr(v19);
        while (__stlxr(v20 - 2, v19));
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_25583D060, v18, (uint64_t)v9, (uint64_t)v11);
    }

  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D060, v4, (uint64_t)CFSTR("unknown"), v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v9;
}

+ (USKToken)tokenWithSchemaType:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  USKToken *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;

  v3 = a3;
  sub_2263F8F84();
  v6 = atomic_load((unsigned __int8 *)&qword_25583D080);
  if ((v6 & 1) == 0 && __cxa_guard_acquire(&qword_25583D080))
  {
    qword_25583D078 = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
    __cxa_guard_release(&qword_25583D080);
  }
  if (qword_25583D070 != -1)
    dispatch_once(&qword_25583D070, &unk_24EDD87E0);
  if (v3)
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D078, v4, (uint64_t)v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = [USKToken alloc];
      v11 = objc_retainAutorelease(v3);
      v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
      MEMORY[0x2276976D8](&v22, v15);
      v9 = (id)objc_msgSend_initWithTfToken_(v10, v16, (uint64_t)&v22, v17);
      if ((v22 & 7) != 0)
      {
        v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
        do
          v20 = __ldxr(v19);
        while (__stlxr(v20 - 2, v19));
      }
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_25583D078, v18, (uint64_t)v9, (uint64_t)v11);
    }

  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_((void *)qword_25583D078, v4, (uint64_t)CFSTR("Unknown"), v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (USKToken *)v9;
}

- (id)stringValue
{
  uint64_t v2;
  _Rep *ptrAndBits;
  void *v4;
  unint64_t v5;
  uint64_t EmptyString;
  void *v7;

  ptrAndBits = self->_token._rep._ptrAndBits;
  if (ptrAndBits)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = (unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8;
    if (v5)
      EmptyString = v5 + 16;
    else
      EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)self);
    if (*(char *)(EmptyString + 23) < 0)
      EmptyString = *(_QWORD *)EmptyString;
    objc_msgSend_stringWithUTF8String_(v4, a2, EmptyString, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  USKToken *v4;
  USKToken *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  BOOL v10;
  unsigned int v11;
  uint64_t v13;

  v4 = (USKToken *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_token(v5, v6, v7, v8);
    v9 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFFFF8);
    v10 = ((unint64_t)self->_token._rep._ptrAndBits & 0xFFFFFFFFFFFFFFF8) == (v13 & 0xFFFFFFFFFFFFFFF8);
    if ((v13 & 7) != 0)
    {
      do
        v11 = __ldxr(v9);
      while (__stlxr(v11 - 2, v9));
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return bswap64(0x9E3779B97F4A7C55 * ((unint64_t)self->_token._rep._ptrAndBits & 0xFFFFFFFFFFFFFFF8));
}

- (void).cxx_destruct
{
  _Rep *ptrAndBits;
  unsigned int *v3;
  unsigned int v4;

  ptrAndBits = self->_token._rep._ptrAndBits;
  if ((ptrAndBits & 7) != 0)
  {
    v3 = (unsigned int *)((unint64_t)ptrAndBits & 0xFFFFFFFFFFFFFFF8);
    do
      v4 = __ldxr(v3);
    while (__stlxr(v4 - 2, v3));
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
