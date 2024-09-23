@implementation PFSceneGeography

- (id)dataArchivePath
{
  NSString *dataArchivePath;

  dataArchivePath = self->_dataArchivePath;
  if (dataArchivePath)
    return dataArchivePath;
  else
    return CFSTR("/System/Library/Photos/Resources/PhotosAtlas/SceneGeography_v1.bz2");
}

- (double)scoreForPOI:(id)a3 scenes:(id)a4 maxScenesCount:(int64_t)a5 popularityWeight:(double)a6
{
  id v9;
  id v10;
  BOOL v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double *v17;
  size_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  BOOL v30;
  unsigned __int8 *v31;
  char *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *floatMap;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  _QWORD *scenes;
  unint64_t v42;
  double v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  int64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  BOOL v62;
  unsigned int *v63;
  unsigned int *v64;
  char *v65;
  void *v66;
  int v67;
  unint64_t v68;
  double v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  double v75;
  double v77;
  _QWORD v78[2];
  id v79;
  uint64_t v80;
  uint64_t v81;
  PFSceneGeography *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[2];
  uint64_t vars0;

  v83 = a5;
  v89[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v82 = self;
  v79 = v9;
  -[PFSceneGeography findPOIHash:](self, "findPOIHash:", v9);
  v11 = v88 == 1 || v88 == 136 - (_QWORD)&vars0;
  if (v11)
  {
    v12 = *(double *)&PFSceneGeographyPOINotFound;
  }
  else
  {
    v13 = objc_msgSend(v10, "count");
    v14 = v83;
    if (v13 < v83)
      v14 = v13;
    if (v14 >= 0xFA)
      v15 = 250;
    else
      v15 = v14;
    MEMORY[0x1E0C80A78]();
    v17 = (double *)((char *)v78 - v16);
    bzero((char *)v78 - v16, v18);
    if (v88 == 1)
      v19 = 0;
    else
      v19 = (char *)&v89[-1] + v88;
    v20 = *((_QWORD *)v19 + 7);
    v21 = v19 + 56 - (char *)v89;
    if (v20 == 1)
      v21 = 0;
    v22 = v21 + v20;
    if (v22 == 1)
      v23 = 0;
    else
      v23 = 16;
    v24 = v23 + v22;
    v89[0] = v22;
    v25 = (char *)v89 - (char *)&v86;
    if (v22 == 1)
      v25 = 0;
    v26 = v25 + v22;
    v86 = v26;
    v87 = v24;
    v27 = *((_QWORD *)v19 + 8);
    if (v26 == 1 && v27 != 0)
      __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
    v29 = v26 + 2 * v27;
    v86 = v29;
    v30 = v24 == 1;
    v31 = (unsigned __int8 *)&v87 + v24;
    if (v24 == 1)
      v32 = 0;
    else
      v32 = (char *)&v87 + v24;
    v33 = (char *)&v86 + v29;
    if (v29 == 1)
      v33 = 0;
    if (v32 == v33)
      goto LABEL_99;
    v78[0] = v19;
    v78[1] = v78;
    v34 = 0;
    v35 = 0;
    v80 = 40;
    v81 = 32;
    v12 = 0.0;
    do
    {
      if (v30)
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      floatMap = v82->_floatMap;
      v37 = v31[1];
      if (floatMap[2] <= v37)
        __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
      v38 = floatMap[1];
      v39 = (char *)floatMap + v38 + 8;
      if (v38 == 1)
        v40 = 0;
      else
        v40 = v39;
      scenes = v82->_scenes;
      v42 = *v31;
      if (scenes[2] <= v42)
        __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
      v43 = *(double *)&v40[8 * v37];
      v44 = scenes[1];
      v45 = (char *)scenes + v44 + 8;
      if (v44 == 1)
        v46 = 0;
      else
        v46 = v45;
      v47 = &v46[32 * v42];
      v50 = *((_QWORD *)v47 + 1);
      v49 = v47 + 8;
      v48 = v50;
      v51 = v49 - (char *)v89;
      if (v50 == 1)
        v52 = 0;
      else
        v52 = v49 - (char *)v89;
      v53 = v52 + v48;
      v54 = v81;
      if (v53 == 1)
        v54 = 0;
      v55 = v54 + v53;
      v85 = v55;
      if (*(_QWORD *)v49 == 1)
        v51 = 0;
      v56 = v51 + *(_QWORD *)v49;
      v89[0] = v56;
      v57 = v80;
      if (v56 == 1)
        v57 = 0;
      v58 = v57 + v56;
      v84 = v58;
      v59 = *((_QWORD *)v49 + 1);
      if (v59)
        v60 = v58 == 1;
      else
        v60 = 0;
      if (v60)
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      v61 = v58 + 4 * v59;
      v84 = v61;
      v11 = v55 == 1;
      v62 = v55 == 1;
      v63 = (unsigned int *)((char *)&v85 + v55);
      if (v11)
        v64 = 0;
      else
        v64 = v63;
      if (v61 == 1)
        v65 = 0;
      else
        v65 = (char *)&v84 + v61;
      if (v64 != (unsigned int *)v65)
      {
        do
        {
          if (v62)
            __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v63);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v10, "containsObject:", v66);

          if (v67)
          {
            v12 = v43 + v12;
            if (v83 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v34 >= v15)
              {
                if (v43 > v17[v35])
                {
                  v17[v35] = v43;
                  if (v15)
                  {
                    v68 = 0;
                    v69 = v43;
                    do
                    {
                      if (v17[v68] < v69)
                      {
                        v35 = v68;
                        v69 = v17[v68];
                      }
                      ++v68;
                    }
                    while (v15 != v68);
                  }
                }
              }
              else
              {
                v17[v34] = v43;
                if (v43 < v17[v35])
                  v35 = v34;
              }
            }
            ++v34;
          }
          if (v85 == 1)
            __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
          v70 = v85 + 4;
          v85 = v70;
          v62 = v70 == 1;
          v63 = (unsigned int *)((char *)&v85 + v70);
          if (v70 == 1)
            v71 = 0;
          else
            v71 = (char *)&v85 + v70;
          if (v84 == 1)
            v72 = 0;
          else
            v72 = (char *)&v84 + v84;
        }
        while (v71 != v72);
        v24 = v87;
      }
      if (v24 == 1)
        __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
      v24 += 2;
      v87 = v24;
      v30 = v24 == 1;
      v31 = (unsigned __int8 *)&v87 + v24;
      if (v24 == 1)
        v73 = 0;
      else
        v73 = (char *)&v87 + v24;
      if (v86 == 1)
        v74 = 0;
      else
        v74 = (char *)&v86 + v86;
    }
    while (v73 != v74);
    if (v34 > v15)
    {
      if (!v15)
      {
LABEL_99:
        v12 = *(double *)&PFSceneGeographyNoRelevantScenes;
        goto LABEL_100;
      }
      v12 = 0.0;
      do
      {
        v75 = *v17++;
        v12 = v12 + v75;
        --v15;
      }
      while (v15);
    }
    if (v12 == 0.0)
      goto LABEL_99;
    if (a6 != 0.0)
    {
      if (*(double *)&PFSceneGeographyClipTFIDF >= v12)
        v77 = v12;
      else
        v77 = *(double *)&PFSceneGeographyClipTFIDF;
      v12 = (*(double *)(v78[0] + 40) * a6 + (1.0 - a6) * v77)
          / (a6 + (1.0 - a6) * *(double *)&PFSceneGeographyClipTFIDF);
    }
  }
LABEL_100:

  return v12;
}

- (double)popularityForPOI:(id)a3 popularity:(unsigned __int16)a4
{
  double v4;
  int v5;
  id v7;
  char *v8;
  uint64_t *v10;
  uint64_t v12;

  v5 = a4;
  v7 = a3;
  -[PFSceneGeography findPOIHash:](self, "findPOIHash:", v7);
  v8 = (char *)&v12 + v12;
  if (v12 == 1 || v8 == 0)
  {
    v10 = &PFSceneGeographyPOINotFound;
LABEL_11:
    v4 = *(double *)v10;
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    v10 = (uint64_t *)(v8 + 32);
    goto LABEL_11;
  }
  if (!v5)
  {
    v10 = (uint64_t *)(v8 + 40);
    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

- (id)scenesByScoreForPOIHash:(id)a3
{
  id v4;
  void *v5;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  BOOL v21;
  unsigned __int8 *v22;
  char *v23;
  char *v24;
  _QWORD *floatMap;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  _QWORD *scenes;
  unint64_t v31;
  double v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;
  int64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  BOOL v51;
  unsigned int *v52;
  char *v53;
  char *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;

  v4 = a3;
  -[PFSceneGeography findPOIHash:](self, "findPOIHash:", v4);
  v5 = 0;
  if (v68 != 1 && v68 != -(uint64_t)&v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v68 == 1)
      v8 = 0;
    else
      v8 = (char *)&v68 + v68;
    v11 = *((_QWORD *)v8 + 7);
    v10 = v8 + 56;
    v9 = v11;
    v12 = v10 - (char *)&v69;
    if (v11 == 1)
      v12 = 0;
    v13 = v12 + v9;
    if (v12 + v9 == 1)
      v14 = 0;
    else
      v14 = (char *)&v69 - (char *)&v67;
    v15 = v14 + v13;
    v69 = v13;
    v16 = (char *)&v69 - (char *)&v66;
    if (v13 == 1)
      v16 = 0;
    v17 = v16 + v13;
    v66 = v17;
    v67 = v15;
    v18 = *((_QWORD *)v10 + 1);
    if (v17 == 1 && v18 != 0)
      __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
    v5 = (void *)v7;
    v63 = v4;
    v20 = v17 + 2 * v18;
    v66 = v20;
    v21 = v15 == 1;
    v22 = (unsigned __int8 *)&v67 + v15;
    if (v15 == 1)
      v23 = 0;
    else
      v23 = (char *)&v67 + v15;
    v24 = (char *)&v66 + v20;
    if (v20 == 1)
      v24 = 0;
    if (v23 != v24)
    {
      do
      {
        if (v21)
          __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
        floatMap = self->_floatMap;
        v26 = v22[1];
        if (floatMap[2] <= v26)
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        v27 = floatMap[1];
        v28 = (char *)floatMap + v27 + 8;
        if (v27 == 1)
          v29 = 0;
        else
          v29 = v28;
        scenes = self->_scenes;
        v31 = *v22;
        if (scenes[2] <= v31)
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        v32 = *(double *)&v29[8 * v26];
        v33 = scenes[1];
        v34 = (char *)scenes + v33 + 8;
        if (v33 == 1)
          v35 = 0;
        else
          v35 = v34;
        v36 = &v35[32 * v31];
        v39 = *((_QWORD *)v36 + 1);
        v38 = v36 + 8;
        v37 = v39;
        v40 = v38 - (char *)&v69;
        if (v39 == 1)
          v41 = 0;
        else
          v41 = v38 - (char *)&v69;
        v42 = v41 + v37;
        if (v42 == 1)
          v43 = 0;
        else
          v43 = (char *)&v69 - (char *)&v65;
        v44 = v43 + v42;
        v65 = v44;
        if (*(_QWORD *)v38 == 1)
          v40 = 0;
        v45 = v40 + *(_QWORD *)v38;
        v69 = v45;
        if (v45 == 1)
          v46 = 0;
        else
          v46 = (char *)&v69 - (char *)&v64;
        v47 = v46 + v45;
        v64 = v47;
        v48 = *((_QWORD *)v38 + 1);
        if (v48)
          v49 = v47 == 1;
        else
          v49 = 0;
        if (v49)
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        v50 = v47 + 4 * v48;
        v64 = v50;
        v51 = v44 == 1;
        v52 = (unsigned int *)((char *)&v65 + v44);
        if (v44 == 1)
          v53 = 0;
        else
          v53 = (char *)&v65 + v44;
        if (v50 == 1)
          v54 = 0;
        else
          v54 = (char *)&v64 + v50;
        if (v53 != v54)
        {
          do
          {
            if (v51)
              __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v52);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, v56);

            if (v65 == 1)
              __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
            v57 = v65 + 4;
            v65 = v57;
            v51 = v57 == 1;
            v52 = (unsigned int *)((char *)&v65 + v57);
            if (v57 == 1)
              v58 = 0;
            else
              v58 = (char *)&v65 + v57;
            if (v64 == 1)
              v59 = 0;
            else
              v59 = (char *)&v64 + v64;
          }
          while (v58 != v59);
          v15 = v67;
        }
        if (v15 == 1)
          __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
        v15 += 2;
        v67 = v15;
        v21 = v15 == 1;
        v22 = (unsigned __int8 *)&v67 + v15;
        if (v15 == 1)
          v60 = 0;
        else
          v60 = (char *)&v67 + v15;
        if (v66 == 1)
          v61 = 0;
        else
          v61 = (char *)&v66 + v66;
      }
      while (v60 != v61);
    }
    v4 = v63;
  }

  return v5;
}

- (c_iterator<boost::unordered::detail::node<boost::interprocess::allocator<pf::SceneGeographyNode,)findPOIHash:(id)a3
{
  char *v3;
  char *v5;
  id v6;
  BOOL v7;
  BOOL v8;
  const void *poi;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  c_iterator<boost::unordered::detail::node<boost::interprocess::allocator<pf::SceneGeographyNode, boost::interprocess::segment_manager<char, boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family>, boost::interprocess::iset_index>>, std::pair<const boost::container::basic_string<char, std::char_traits<char>, boost::interprocess::allocator<char, boost::interprocess::segment_manager<char, boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family>, boost::interprocess::iset_index>>>, pf::SceneGeographyNode>>> v15;
  uint64_t v16;
  uint64_t v17[4];
  uint64_t v18;
  _BYTE v19[32];
  uint64_t v20;

  v5 = v3;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PFSceneGeography loadOrCreateIndex](self, "loadOrCreateIndex");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8)
  {
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_heap_memory((uint64_t)v17);
    poi = self->_poi;
    v10 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    if (v17[0])
      v11 = v17[0] - (_QWORD)&v16;
    else
      v11 = 1;
    v16 = v11;
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::basic_string((uint64_t)v19, v10, &v16);
    v12 = boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>::operator()((uint64_t)v19);
    v13 = 265 * ((~v12 + (v12 << 21)) ^ ((~v12 + (v12 << 21)) >> 24));
    boost::unordered::detail::table<boost::unordered::detail::map<boost::interprocess::allocator<pf::SceneGeographyNode,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,pf::SceneGeographyNode,boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>>::find_node_impl<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>(&v18, (uint64_t)poi, 2147483649u * ((21 * (v13 ^ (v13 >> 14))) ^ ((21 * (v13 ^ (v13 >> 14))) >> 28)), (uint64_t)v19);
    v14 = (_BYTE *)((char *)&v18 - v5);
    if (v18 == 1)
      v14 = 0;
    *(_QWORD *)v5 = &v14[v18];
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::~basic_string((uint64_t)v19);
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::~basic_managed_heap_memory(v17);
  }
  else
  {
    *(_QWORD *)v5 = 1;
  }

  return v15;
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  pf::SceneGeographyLineParser **v3;
  pf::SceneGeographyLineParser **v5;
  id v6;
  pf::SceneGeographyLineParser *v7;
  const char *v8;
  char *v9;
  size_t v10;
  unique_ptr<pf::ArchiveLineParser, std::default_delete<pf::ArchiveLineParser>> v11;
  id v12;

  v5 = v3;
  v6 = a3;
  v7 = (pf::SceneGeographyLineParser *)operator new();
  v12 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  v9 = -[PFSceneGeography magic](self);
  if (self)
    v10 = 37;
  else
    v10 = 0;
  pf::SceneGeographyLineParser::SceneGeographyLineParser(v7, v8, v9, v10);
  *v5 = v7;

  return v11;
}

- (const)indexLabel
{
  return "scenegeography";
}

- (id)indexName
{
  NSString *dataArchivePath;
  void *v3;
  __CFString *v4;

  dataArchivePath = self->_dataArchivePath;
  if (dataArchivePath)
  {
    -[NSString lastPathComponent](dataArchivePath, "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("PFSceneGeographyData");
  }
  return v4;
}

- (unint64_t)indexFileVersion
{
  return 2;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned __int8 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  const char *v17;
  int v18;
  uint64_t *v20;
  int *v21;
  uint64_t v22;
  unint64_t v23;
  const void *v24;
  uint64_t v25;
  unint64_t v26;
  const void *v27;
  uint64_t v28;
  const void *v29;
  int v30;
  uint32_t v31;
  char *v32;
  unint64_t v33;
  uint64_t *value;
  _BYTE buf[24];
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t *)operator new();
  boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_mapped_file(v7, a3);
  value = v7;
  v8 = *v7;
  v9 = *(_QWORD *)(*v7 + 48) + 8;
  if (v9 == a4)
  {
    v32 = 0;
    v10 = -[PFSceneGeography magic](self);
    if (!PFArchiveFileMagicFound((const char *)(v8 - 8), "PFSceneGeography", v10, 0x400uLL, (const char **)&v32))
      goto LABEL_11;
    v11 = atomic_load(s_skipChecksumValidation);
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "PFChecksum PFSceneGeography SKIPPED", buf, 2u);
      }
    }
    else
    {
      if (self)
        v12 = 37;
      else
        v12 = 0;
      v13 = PFChecksumArchiveData((char *)(*value - 8), *(_QWORD *)(*value + 48) + 8, v32, v12);
      v14 = *(_QWORD *)&v32[v12];
      if (v13 != v14)
      {
        v15 = v13;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v15;
          v16 = MEMORY[0x1E0C81028];
          v17 = "PFTimeZoneLookup checksum fail, found %016llx expected %016llx";
LABEL_35:
          v31 = 22;
          goto LABEL_36;
        }
        goto LABEL_11;
      }
    }
    v20 = value;
    v21 = (int *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_find_impl<int>(*value, "version");
    v22 = *v20;
    *(_OWORD *)&buf[8] = xmmword_1A17B6C50;
    v36 = 0x80000001A17B89D4 & 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)buf = off_1E45A11C0;
    v33 = 0;
    if ("floatmap" == (char *)-1)
      v23 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v22, (char *)(0x80000001A17B89D4 & 0x7FFFFFFFFFFFFFFFLL), v22 + 88, (uint64_t)buf, &v33);
    else
      v23 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v22, "floatmap", v22 + 56, (uint64_t)buf, &v33);
    v24 = (const void *)v23;
    v25 = *v20;
    *(_OWORD *)&buf[8] = xmmword_1A17B6C50;
    v36 = 0x80000001A17B8C67 & 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)buf = off_1E45A1190;
    v33 = 0;
    if ("scenes" == (char *)-1)
      v26 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v25, (char *)(0x80000001A17B8C67 & 0x7FFFFFFFFFFFFFFFLL), v25 + 88, (uint64_t)buf, &v33);
    else
      v26 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v25, "scenes", v25 + 56, (uint64_t)buf, &v33);
    v27 = (const void *)v26;
    v28 = *v20;
    *(_OWORD *)&buf[8] = xmmword_1A17B6C60;
    v36 = 0x80000001A17B8FEDLL & 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)buf = off_1E45A1220;
    v33 = 0;
    if ("POI" == (char *)-1)
      v29 = (const void *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v28, (char *)(0x80000001A17B8FEDLL & 0x7FFFFFFFFFFFFFFFLL), v28 + 88, (uint64_t)buf, &v33);
    else
      v29 = (const void *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v28, "POI", v28 + 56, (uint64_t)buf, &v33);
    if (v21 && v24 && v27 && v29)
    {
      v30 = *v21;
      if (v30 == 2)
      {
        v18 = 0;
        value = (uint64_t *)self->_backingFile.__ptr_.__value_;
        self->_backingFile.__ptr_.__value_ = v20;
        self->_floatMap = v24;
        self->_scenes = v27;
        self->_poi = v29;
        goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v30;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported scene geography index version: %d.", buf, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Scene geography index missing one or more required region.";
      v31 = 2;
LABEL_36:
      _os_log_error_impl(&dword_1A16EE000, v16, OS_LOG_TYPE_ERROR, v17, buf, v31);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    v16 = MEMORY[0x1E0C81028];
    v17 = "PFTimeZoneLookup cache corruption/truncation: stored size %lld != actual file size %lld.";
    goto LABEL_35;
  }
LABEL_11:
  v18 = 1;
LABEL_12:
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&value);
  return v18 == 0;
}

- (BOOL)loadOrCreateIndex
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFSceneGeography;
  -[PFCachingArchiveIndex loadOrCreateIndex](&v4, sel_loadOrCreateIndex);
  return self->_floatMap && self->_scenes && self->_poi != 0;
}

- (BOOL)indexSupported
{
  return 1;
}

- (void).cxx_destruct
{
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&self->_backingFile);
  objc_storeStrong((id *)&self->_dataArchivePath, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (char)magic
{
  int v2;
  id v3;
  BOOL v4;
  int v5;
  int v6;
  char *v7;
  void *v9;
  int v10;
  int v11;
  stat v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = objc_msgSend(a1, "architectureHash");
  objc_msgSend(a1, "dataArchivePath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v12))
    v4 = 0;
  else
    v4 = (v12.st_mode & 0x8000u) != 0;
  v5 = v4;

  if (v5)
  {
    v6 = ((unint64_t)(v12.st_mtimespec.tv_sec ^ v12.st_size) >> 32) ^ LODWORD(v12.st_mtimespec.tv_sec) ^ LODWORD(v12.st_size);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "dataArchivePath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *__error();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 1024;
      v16 = v10;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to get file metadata from dataArchivePath %{public}@: %d.", buf, 0x12u);

    }
    v6 = 0;
  }
  v11 = v2;
  v7 = -[PFSceneGeography magic]::buffer;
  snprintf(-[PFSceneGeography magic]::buffer, 0x50uLL, "%s%s%02x%08x%08x", "PFSceneGeography", "02", 2, v11, v6);
  return v7;
}

@end
