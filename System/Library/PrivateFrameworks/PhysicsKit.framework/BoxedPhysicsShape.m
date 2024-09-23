@implementation BoxedPhysicsShape

+ (id)boxPhysicsShape:(PKPhysicsShape *)a3
{
  BoxedPhysicsShape *v4;
  b2Shape *var0;
  int v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  _BYTE **v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  uint64_t v26;
  int v27;
  float *Vertex;
  float v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  float v39;
  _QWORD v41[3];
  _QWORD *v42;
  uint64_t v43;
  CGPoint v44;
  CGPoint v45;
  CGPoint v46;
  CGPoint v47;
  CGPoint v48;
  CGPoint v49;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(BoxedPhysicsShape);
  var0 = a3->var0.var0;
  v6 = *((_DWORD *)a3->var0.var0 + 2);
  v4->shapeType = v6;
  switch(v6)
  {
    case 0:
    case 1:
      LODWORD(v7) = 2;
      break;
    case 2:
    case 3:
      v7 = (*((_QWORD *)var0 + 3) - *((_QWORD *)var0 + 2)) >> 3;
      break;
    case 4:
      LODWORD(v7) = QuadTree::leafCount(*((QuadTree **)var0 + 2));
      break;
    default:
      LODWORD(v7) = 1;
      break;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (int)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v4->points, v8);
  switch(v6)
  {
    case 0:
      v9 = *((float *)var0 + 4);
      v10 = PKGet_PTM_RATIO();
      v11 = *((float *)var0 + 5);
      v44.y = (float)(v11 * PKGet_PTM_RATIO());
      v44.x = (float)(v9 * v10);
      valueWithCGPoint(v44);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v12);

      v13 = *((float *)var0 + 3);
      v45.x = (float)(v13 * PKGet_PTM_RATIO());
      v45.y = 0.0;
      valueWithCGPoint(v45);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);
      goto LABEL_21;
    case 1:
      v33 = *((float *)var0 + 4);
      v34 = PKGet_PTM_RATIO();
      v35 = *((float *)var0 + 5);
      v48.y = (float)(v35 * PKGet_PTM_RATIO());
      v48.x = (float)(v33 * v34);
      valueWithCGPoint(v48);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v36);

      v37 = *((float *)var0 + 6);
      v38 = PKGet_PTM_RATIO();
      v39 = *((float *)var0 + 7);
      v49.y = (float)(v39 * PKGet_PTM_RATIO());
      v49.x = (float)(v37 * v38);
      valueWithCGPoint(v49);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v14);
LABEL_21:

      goto LABEL_24;
    case 2:
      v18 = *((_QWORD *)var0 + 2);
      v19 = *((_QWORD *)var0 + 3) - v18;
      if ((int)((unint64_t)v19 >> 3) >= 1)
      {
        v20 = 0;
        v21 = 0;
        do
        {
          if (v21 >= v19 >> 3)
            __assert_rtn("GetVertex", "b2PolygonShape.h", 97, "0 <= index && index < m_vertices.size()");
          v22 = *(float *)(v18 + v20);
          v23 = PKGet_PTM_RATIO();
          v24 = *(float *)(v18 + v20 + 4);
          v46.y = (float)(v24 * PKGet_PTM_RATIO());
          v46.x = (float)(v22 * v23);
          valueWithCGPoint(v46);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v25);

          ++v21;
          v18 = *((_QWORD *)var0 + 2);
          v19 = *((_QWORD *)var0 + 3) - v18;
          v20 += 8;
        }
        while ((uint64_t)v21 < (int)((unint64_t)v19 >> 3));
      }
      goto LABEL_24;
    case 3:
      v26 = (*((_QWORD *)var0 + 3) - *((_QWORD *)var0 + 2)) >> 3;
      if ((int)v26 >= 1)
      {
        v27 = 0;
        do
        {
          Vertex = (float *)b2ChainShape::GetVertex((b2ChainShape *)var0, v27);
          v29 = *Vertex;
          v30 = PKGet_PTM_RATIO();
          v31 = Vertex[1];
          v47.y = (float)(v31 * PKGet_PTM_RATIO());
          v47.x = (float)(v29 * v30);
          valueWithCGPoint(v47);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v32);

          ++v27;
        }
        while ((_DWORD)v26 != v27);
      }
      goto LABEL_24;
    case 4:
      v15 = (_BYTE **)*((_QWORD *)var0 + 2);
      v41[0] = &off_24C0E8A08;
      v41[1] = v8;
      v42 = v41;
      QuadTree::visitLeaves(v15, (uint64_t)v41);
      v16 = v42;
      if (v42 == v41)
      {
        v17 = 4;
        v16 = v41;
      }
      else
      {
        if (!v42)
          goto LABEL_24;
        v17 = 5;
      }
      (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_24:

      return v4;
    default:
      goto LABEL_24;
  }
}

- (PKPhysicsShape)unboxShape
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->points, 0);
}

+ (uint64_t)boxPhysicsShape:
{
    return a1 + 8;
  else
    return 0;
}

+ (void)boxPhysicsShape:
{
}

+ (_QWORD)boxPhysicsShape:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_24C0E8A08;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

+ (id)boxPhysicsShape:
{
  id result;

  *a2 = &off_24C0E8A08;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

@end
