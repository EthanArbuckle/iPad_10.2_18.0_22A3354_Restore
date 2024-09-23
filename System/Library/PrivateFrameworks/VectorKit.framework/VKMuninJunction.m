@implementation VKMuninJunction

- (VKMuninJunction)initWithMuninJunction:(const void *)a3 localize:(BOOL)a4
{
  _BOOL4 v4;
  VKMuninJunction *v6;
  NSMutableArray *v7;
  NSMutableArray *roads;
  uint64_t ***v9;
  uint64_t ***i;
  uint64_t v11;
  char v12;
  VKMuninRoad *v13;
  _QWORD *v14;
  VKMuninRoad *v15;
  NSString *name;
  unsigned __int8 v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  id v24;
  __int128 *v25;
  uint64_t v26;
  NSString *v27;
  VKMuninJunction *v28;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;
  __int128 v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a4;
  v35.receiver = self;
  v35.super_class = (Class)VKMuninJunction;
  v6 = -[VKMuninJunction init](&v35, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    roads = v6->_roads;
    v6->_roads = v7;

    v9 = (uint64_t ***)*((_QWORD *)a3 + 5);
    for (i = (uint64_t ***)*((_QWORD *)a3 + 6); v9 != i; ++v9)
    {
      md::MuninRoadEdge::localizedName((md::MuninRoadEdge *)&v38, *v9, v4);
      v11 = HIBYTE(v40);
      v12 = HIBYTE(v40);
      if (v40 < 0)
        v11 = v39;
      if (v11)
      {
        v13 = [VKMuninRoad alloc];
        if (v40 >= 0)
          v14 = &v38;
        else
          v14 = v38;
        v15 = -[VKMuninRoad initWithLocalizedName:](v13, "initWithLocalizedName:", v14);
        if ((-[NSMutableArray containsObject:](v6->_roads, "containsObject:", v15) & 1) == 0)
          -[NSMutableArray addObject:](v6->_roads, "addObject:", v15);

        v12 = HIBYTE(v40);
      }
      if (v12 < 0)
        (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v41 + 40))(v41, v38, v40 & 0x7FFFFFFFFFFFFFFFLL);
    }
    name = v6->_name;
    v6->_name = 0;

    v32 = 0uLL;
    v33 = 0;
    {
      v30 = operator new();
      mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v30, "VectorKitLabels", 0x5ED09DD50000000FLL);
    }
    v34 = mdm::Allocator::instance(void)::alloc;
    v18 = *((_QWORD *)a3 + 1);
    if (v18 && *(_QWORD *)(v18 + 8))
    {
      v38 = 0;
      v39 = 0;
      v40 = 0;
      {
        v31 = operator new();
        mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v31, "VectorKitLabels", 0x5ED09DD50000000FLL);
      }
      v41 = mdm::Allocator::instance(void)::alloc;
      v20 = *((_QWORD *)a3 + 1);
      if (v20)
        v21 = *(uint64_t **)(v20 + 8);
      else
        v21 = 0;
      md::LabelFeature::textFromFeature(&v36, v21, v4, (uint64_t)&v38, 0);
      v32 = v36;
      v33 = v37;
      if (SHIBYTE(v40) < 0)
        (*(void (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)v41 + 40))(v41, v38, v40 & 0x7FFFFFFFFFFFFFFFLL);
    }
    v22 = HIBYTE(v33);
    v23 = HIBYTE(v33);
    if (v33 < 0)
      v22 = *((_QWORD *)&v32 + 1);
    if (v22)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v33 >= 0)
        v25 = &v32;
      else
        v25 = (__int128 *)v32;
      v26 = objc_msgSend(v24, "initWithUTF8String:", v25, (_QWORD)v32);
      v27 = v6->_name;
      v6->_name = (NSString *)v26;

      v23 = HIBYTE(v33);
    }
    v28 = v6;
    if (v23 < 0)
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v34 + 40))(v34, v32, v33 & 0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (id)description
{
  NSString *name;

  name = self->_name;
  if (name)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), name);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), self->_roads);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)roads
{
  return &self->_roads->super;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_roads, 0);
}

@end
