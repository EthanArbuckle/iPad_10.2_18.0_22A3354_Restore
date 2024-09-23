@implementation PFTimeZoneLookup

- (id)timeZoneNameForCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  PFTimeZoneLookup *v5;
  const char *v6;
  void *v7;
  BOOL v8;
  _QWORD *rtree;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  char *v14;
  unsigned __int16 *v15;
  double *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  _QWORD *v56;
  float *v57;
  float *v58;
  unint64_t *v59;
  double *v60;
  unint64_t v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  double *v68;
  double *v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  double *v76;
  double *v77;
  uint64_t v78;
  uint64_t v79;
  int64_t v81;
  int64_t v82;
  int64_t v83;
  uint64_t v84;
  double *v85;
  double *v86;
  double v87;
  double v88;
  uint64_t v89;
  double *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  double *v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  int64_t v98;
  int64_t v99;
  uint64_t v100;
  uint64_t v101;
  double *v102;
  double *v103;
  uint64_t v104;
  uint64_t v105;
  int64_t v106;
  double v107;
  char *v108;
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  char *v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  int v129;
  boost::container *v130;
  unint64_t v131;
  _QWORD *timezones;
  unint64_t v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint8_t *v142;
  PFTimeZoneLookup *v143;
  double *v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  __int128 v149;
  _QWORD v150[2];
  uint8_t buf[16];
  unint64_t *v152;
  void *__p;
  char *v154;
  char *v155;
  double *v156;
  double *v157;
  double *v158;
  uint64_t v159;
  CLLocationCoordinate2D v160;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = self;
  v159 = *MEMORY[0x1E0C80C00];
  if (!-[PFTimeZoneLookup loadOrCreateIndex](self, "loadOrCreateIndex"))
    goto LABEL_8;
  v160.latitude = latitude;
  v160.longitude = longitude;
  if (!CLLocationCoordinate2DIsValid(v160))
    goto LABEL_8;
  v7 = 0;
  v8 = latitude == 0.0;
  if (longitude != 0.0)
    v8 = 0;
  if (!v8)
  {
    if (latitude == 40.0 && longitude == -100.0)
    {
LABEL_8:
      v7 = 0;
      return v7;
    }
    rtree = v5->_rtree;
    *(float *)&v11 = latitude;
    *(float *)&v12 = longitude;
    v145 = v11 | ((unint64_t)v12 << 32);
    v146 = 1;
    v14 = (char *)(rtree + 3);
    v13 = rtree[3];
    if (v13 == 1)
    {
      v15 = 0;
    }
    else
    {
      *(_QWORD *)buf = rtree;
      v152 = &v145;
      __p = 0;
      v154 = 0;
      v155 = 0;
      v156 = 0;
      v157 = 0;
      v158 = 0;
      if (rtree[1])
      {
        v16 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*>>>(1uLL);
        v156 = v16;
        v157 = v16;
        v158 = &v16[2 * (_QWORD)v6];
        v13 = *(_QWORD *)v14;
        v17 = v146;
      }
      else
      {
        v16 = 0;
        v17 = 1;
      }
      v18 = v14 - (char *)&v147;
      if (v13 == 1)
        v18 = 0;
      v19 = v18 + v13;
      v147 = v19;
      if (v17)
      {
        v143 = v5;
        v20 = 0;
        v21 = rtree[2];
        while (1)
        {
          v22 = v19 == 1 ? 0 : (char *)&v147 + v19;
          if (v21)
          {
            v23 = boost::variant<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::apply_visitor<boost::detail::variant::get_visitor<boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>>(v22);
            if (!v23)
            {
              *(_QWORD *)&v149 = &off_1E45A1430;
              boost::throw_exception<boost::bad_get>();
            }
            v24 = v23 + 1;
            v16 = v157;
            if (*v23)
            {
              v25 = &v24[3 * *v23];
              v26 = v21 - 1;
              v27 = v152;
              v144 = v156;
              v28 = ((char *)v157 - (char *)v156) >> 4;
              do
              {
                v30 = *(float *)v27;
                v29 = *((float *)v27 + 1);
                v32 = *((float *)v24 + 2);
                v31 = *((float *)v24 + 3);
                v34 = *(float *)v24;
                v33 = *((float *)v24 + 1);
                v35 = (v33 - v29) * (v33 - v29) + 0.0;
                if (v29 >= v33)
                  v35 = 0.0;
                if (v29 <= v31)
                  v36 = v35;
                else
                  v36 = v35 + (v29 - v31) * (v29 - v31);
                if (v30 < v34)
                  v36 = v36 + (v34 - v30) * (v34 - v30);
                if (v30 > v32)
                  v36 = v36 + (v30 - v32) * (v30 - v32);
                if (v28 != v27[1] || *v144 > v36)
                {
                  v37 = v24[2];
                  v38 = (char *)(v24 + 2) - (char *)&v148;
                  if (v37 == 1)
                    v38 = 0;
                  v39 = v38 + v37;
                  v148 = v39;
                  *(double *)&v149 = v36;
                  v40 = (char *)&v148 - (char *)v150;
                  if (v39 == 1)
                    v40 = 0;
                  v41 = v40 + v39;
                  *((_QWORD *)&v149 + 1) = v26;
                  v150[0] = v40 + v39;
                  if (v20 >= v155)
                  {
                    v44 = (char *)__p;
                    v45 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (_BYTE *)__p) >> 3);
                    v46 = v45 + 1;
                    if (v45 + 1 > 0xAAAAAAAAAAAAAAALL)
                      std::vector<pf::SceneTaxonomyNode const*>::__throw_length_error[abi:ne180100]();
                    if (0x5555555555555556 * ((v155 - (_BYTE *)__p) >> 3) > v46)
                      v46 = 0x5555555555555556 * ((v155 - (_BYTE *)__p) >> 3);
                    if (0xAAAAAAAAAAAAAAABLL * ((v155 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                      v47 = 0xAAAAAAAAAAAAAAALL;
                    else
                      v47 = v46;
                    if (v47 > 0xAAAAAAAAAAAAAAALL)
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    v48 = (char *)operator new(24 * v47);
                    v49 = &v48[24 * v45];
                    *(_OWORD *)v49 = v149;
                    v50 = (char *)((char *)v150 - (v49 + 16));
                    if (v41 == 1)
                      v50 = 0;
                    *((_QWORD *)v49 + 2) = &v50[v41];
                    v43 = v49;
                    if (v20 != v44)
                    {
                      v51 = (char *)(v20 - v49);
                      v52 = v49;
                      do
                      {
                        v43 = v52 - 24;
                        *(_OWORD *)(v52 - 24) = *(_OWORD *)(v20 - 24);
                        v53 = *((_QWORD *)v20 - 1);
                        v54 = v20 - 24;
                        if (v53 == 1)
                          v55 = 0;
                        else
                          v55 = v51;
                        *((_QWORD *)v52 - 1) = &v55[v53];
                        v20 -= 24;
                        v52 -= 24;
                      }
                      while (v54 != v44);
                    }
                    __p = v43;
                    v155 = &v48[24 * v47];
                    if (v44)
                      operator delete(v44);
                    v20 = v49;
                  }
                  else
                  {
                    *(_OWORD *)v20 = v149;
                    v42 = (char *)((char *)v150 - (v20 + 16));
                    if (v150[0] == 1)
                      v42 = 0;
                    *((_QWORD *)v20 + 2) = &v42[v150[0]];
                    v43 = (char *)__p;
                  }
                  v20 += 24;
                  v154 = v20;
                  std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::branch_data_comp &,std::__wrap_iter<boost::geometry::index::detail::rtree::visitors::distance_query<boost::geometry::index::rtree<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::members_holder,boost::geometry::index::detail::predicates::nearest<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>>::branch_data *>>((uint64_t)v43, (uint64_t)v20, 0xAAAAAAAAAAAAAAABLL * ((v20 - v43) >> 3));
                }
                v24 += 3;
              }
              while (v24 != v25);
              v16 = v157;
            }
          }
          else
          {
            v56 = boost::variant<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::apply_visitor<boost::detail::variant::get_visitor<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>>(v22);
            if (!v56)
            {
              *(_QWORD *)&v149 = &off_1E45A1430;
              boost::throw_exception<boost::bad_get>();
            }
            v57 = (float *)(v56 + 1);
            v16 = v157;
            if (*v56)
            {
              v58 = &v57[3 * *v56];
              v59 = v152;
              v60 = v156;
              v61 = (unint64_t)v157;
              do
              {
                v62 = *((float *)v59 + 1) - v57[1];
                v63 = (*(float *)v59 - *v57) * (*(float *)v59 - *v57) + 0.0 + v62 * v62;
                v64 = (uint64_t)(v61 - (_QWORD)v60) >> 4;
                if (v64 >= v59[1])
                {
                  v65 = *v60;
                  if (*v60 > v63)
                  {
                    if ((uint64_t)(v61 - (_QWORD)v60) >= 17)
                    {
                      v66 = 0;
                      v67 = *((_QWORD *)v60 + 1);
                      v68 = v60;
                      do
                      {
                        v69 = v68;
                        v68 += 2 * v66 + 2;
                        v70 = 2 * v66;
                        v66 = (2 * v66) | 1;
                        v71 = v70 + 2;
                        if (v71 < v64 && *v68 < v68[2])
                        {
                          v68 += 2;
                          v66 = v71;
                        }
                        *v69 = *v68;
                        v69[1] = v68[1];
                      }
                      while (v66 <= (uint64_t)((unint64_t)(v64 - 2) >> 1));
                      if (v68 == (double *)(v61 - 16))
                      {
                        *v68 = v65;
                        *((_QWORD *)v68 + 1) = v67;
                      }
                      else
                      {
                        *v68 = *(double *)(v61 - 16);
                        v68[1] = *(double *)(v61 - 8);
                        *(double *)(v61 - 16) = v65;
                        *(_QWORD *)(v61 - 8) = v67;
                        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::pair_first_less &,std::__wrap_iter<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*> *>>((uint64_t)v60, (uint64_t)(v68 + 2), ((char *)(v68 + 2) - (char *)v60) >> 4);
                        v64 = ((char *)v16 - (char *)v60) >> 4;
                        v61 = (unint64_t)v16;
                      }
                    }
                    *(double *)(v61 - 16) = v63;
                    *(_QWORD *)(v61 - 8) = v57;
                    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::pair_first_less &,std::__wrap_iter<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*> *>>((uint64_t)v60, v61, v64);
                  }
                }
                else
                {
                  if (v61 >= (unint64_t)v158)
                  {
                    v72 = v64 + 1;
                    if ((unint64_t)(v64 + 1) >> 60)
                      std::vector<pf::SceneTaxonomyNode const*>::__throw_length_error[abi:ne180100]();
                    v73 = (char *)v158 - (char *)v60;
                    if (v158 - v60 > v72)
                      v72 = v73 >> 3;
                    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0)
                      v74 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v74 = v72;
                    if (v74)
                      v74 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*>>>(v74);
                    else
                      v6 = 0;
                    v75 = v74 + 16 * v64;
                    *(double *)v75 = v63;
                    *(_QWORD *)(v75 + 8) = v57;
                    v76 = v156;
                    v77 = (double *)v75;
                    if (v16 != v156)
                    {
                      do
                      {
                        *((_OWORD *)v77 - 1) = *((_OWORD *)v16 - 1);
                        v77 -= 2;
                        v16 -= 2;
                      }
                      while (v16 != v76);
                      v16 = v156;
                    }
                    v61 = v75 + 16;
                    v156 = v77;
                    v157 = (double *)(v75 + 16);
                    v158 = (double *)(v74 + 16 * (_QWORD)v6);
                    if (v16)
                      operator delete(v16);
                  }
                  else
                  {
                    *(double *)v61 = v63;
                    *(_QWORD *)(v61 + 8) = v57;
                    v61 += 16;
                  }
                  v157 = (double *)v61;
                  v60 = v156;
                  v59 = v152;
                  v78 = v61 - (_QWORD)v156;
                  v79 = (uint64_t)(v61 - (_QWORD)v156) >> 4;
                  if (v79 == v152[1] && v78 >= 17)
                  {
                    v81 = (unint64_t)(v79 - 2) >> 1;
                    v82 = v81;
                    do
                    {
                      v83 = v82;
                      if (v78 >= 32 && v81 >= v82)
                      {
                        v84 = (2 * v82) | 1;
                        v85 = &v60[2 * v84];
                        if (2 * v83 + 2 < v79 && *v85 < v85[2])
                        {
                          v85 += 2;
                          v84 = 2 * v83 + 2;
                        }
                        v86 = &v60[2 * v83];
                        v87 = *v85;
                        v88 = *v86;
                        if (*v85 >= *v86)
                        {
                          v89 = *((_QWORD *)v86 + 1);
                          do
                          {
                            v90 = v86;
                            v86 = v85;
                            *v90 = v87;
                            v90[1] = v85[1];
                            if (v81 < v84)
                              break;
                            v91 = 2 * v84;
                            v84 = (2 * v84) | 1;
                            v85 = &v60[2 * v84];
                            v92 = v91 + 2;
                            if (v92 < v79 && *v85 < v85[2])
                            {
                              v85 += 2;
                              v84 = v92;
                            }
                            v87 = *v85;
                          }
                          while (*v85 >= v88);
                          *v86 = v88;
                          *((_QWORD *)v86 + 1) = v89;
                        }
                      }
                      v82 = v83 - 1;
                    }
                    while (v83);
                  }
                  v16 = (double *)v61;
                }
                v57 += 3;
              }
              while (v57 != v58);
              v20 = v154;
            }
          }
          v93 = __p;
          v94 = v156;
          if (__p == v20 || v152[1] == ((char *)v16 - (char *)v156) >> 4 && *v156 <= *(double *)__p)
            break;
          v95 = *((_QWORD *)__p + 2);
          v96 = (_BYTE *)__p + 16 - (_BYTE *)&v147;
          if (v95 == 1)
            v96 = 0;
          v19 = v96 + v95;
          v147 = v19;
          v21 = *((_QWORD *)__p + 1);
          if (v20 - (_BYTE *)__p >= 25)
          {
            v97 = 0;
            v98 = (v20 - (_BYTE *)__p) / 0x18uLL;
            v149 = *(_OWORD *)__p;
            v99 = (_BYTE *)__p + 16 - (_BYTE *)v150;
            if (v95 == 1)
              v99 = 0;
            v150[0] = v99 + v95;
            v100 = v98 - 2;
            if (v98 < 2)
              v100 = v98 - 1;
            v101 = v100 >> 1;
            v102 = (double *)__p;
            do
            {
              v103 = v102;
              v104 = v97 + 1;
              v102 += 3 * v97 + 3;
              v105 = 2 * v97;
              v97 = (2 * v97) | 1;
              v106 = v105 + 2;
              if (v106 < v98)
              {
                v107 = v102[3];
                if (*v102 > v107 || *v102 == v107 && *(_QWORD *)&v103[3 * v104 + 1] > *((_QWORD *)v102 + 4))
                {
                  v102 += 3;
                  v97 = v106;
                }
              }
              *(_OWORD *)v103 = *(_OWORD *)v102;
              v108 = (char *)(v102 + 2);
              v109 = *((_QWORD *)v102 + 2);
              v110 = (char *)((char *)v102 - (char *)v103);
              if (v109 == 1)
                v110 = 0;
              *((_QWORD *)v103 + 2) = &v110[v109];
            }
            while (v97 <= v101);
            v111 = v20 - 24;
            if (v20 - 24 == (char *)v102)
            {
              *(_OWORD *)v102 = v149;
              v118 = (char *)((char *)v150 - v108);
              if (v150[0] == 1)
                v118 = 0;
              *((_QWORD *)v102 + 2) = &v118[v150[0]];
            }
            else
            {
              *(_OWORD *)v102 = *(_OWORD *)v111;
              v114 = *((_QWORD *)v20 - 1);
              v113 = v20 - 8;
              v112 = v114;
              v115 = (char *)(v113 - v108);
              if (v114 == 1)
                v115 = 0;
              *((_QWORD *)v102 + 2) = &v115[v112];
              v116 = (uint64_t)(v102 + 3);
              *(_OWORD *)v111 = v149;
              v117 = (char *)((char *)v150 - v113);
              if (v150[0] == 1)
                v117 = 0;
              *(_QWORD *)v113 = &v117[v150[0]];
              std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::branch_data_comp &,std::__wrap_iter<boost::geometry::index::detail::rtree::visitors::distance_query<boost::geometry::index::rtree<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::members_holder,boost::geometry::index::detail::predicates::nearest<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>>::branch_data *>>((uint64_t)v93, v116, 0xAAAAAAAAAAAAAAABLL * ((v116 - (uint64_t)v93) >> 3));
              v19 = v147;
            }
            v20 = v154;
          }
          v20 -= 24;
          v154 = v20;
        }
        if (v156 == v16)
        {
          v119 = 0;
          v15 = 0;
        }
        else
        {
          v119 = 0;
          v15 = 0;
          v120 = 0;
          do
          {
            v121 = (uint64_t *)*((_QWORD *)v94 + 1);
            if (v119 >= v120)
            {
              v123 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v119 - (_QWORD)v15) >> 2) + 1;
              if (v123 > 0x1555555555555555)
                std::vector<pf::SceneTaxonomyNode const*>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)(v120 - (_QWORD)v15) >> 2) > v123)
                v123 = 0x5555555555555556 * ((uint64_t)(v120 - (_QWORD)v15) >> 2);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v120 - (_QWORD)v15) >> 2) >= 0xAAAAAAAAAAAAAAALL)
                v124 = 0x1555555555555555;
              else
                v124 = v123;
              if (v124)
                v124 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>(v124);
              else
                v6 = 0;
              v125 = *v121;
              v126 = v124 + 4 * ((uint64_t)(v119 - (_QWORD)v15) >> 2);
              *(_DWORD *)(v126 + 8) = *((_DWORD *)v121 + 2);
              *(_QWORD *)v126 = v125;
              v127 = v126;
              while ((unsigned __int16 *)v119 != v15)
              {
                v128 = *(_QWORD *)(v119 - 12);
                v119 -= 12;
                v129 = *(_DWORD *)(v119 + 8);
                *(_QWORD *)(v127 - 12) = v128;
                v127 -= 12;
                *(_DWORD *)(v127 + 8) = v129;
              }
              v120 = v124 + 12 * (_QWORD)v6;
              v119 = v126 + 12;
              if (v15)
                operator delete(v15);
              v15 = (unsigned __int16 *)v127;
            }
            else
            {
              v122 = *v121;
              *(_DWORD *)(v119 + 8) = *((_DWORD *)v121 + 2);
              *(_QWORD *)v119 = v122;
              v119 += 12;
            }
            v94 += 2;
          }
          while (v94 != v16);
          v16 = v156;
        }
        v5 = v143;
      }
      else
      {
        v119 = 0;
        v15 = 0;
      }
      if (v16)
      {
        v157 = v16;
        operator delete(v16);
      }
      v130 = (boost::container *)__p;
      if (__p)
        operator delete(__p);
      if ((unsigned __int16 *)v119 != v15)
      {
        v131 = v15[4];
        timezones = v5->_timezones;
        v133 = timezones[2];
        if (v133 >= v131)
        {
          if (v133 <= v131)
            boost::container::throw_out_of_range(v130, v6);
          v136 = timezones[1];
          v137 = (char *)timezones + v136 + 8;
          if (v136 == 1)
            v137 = 0;
          v138 = &v137[32 * v131];
          if ((v138[8] & 1) != 0)
          {
            v141 = v138 - (char *)buf + 9;
          }
          else
          {
            v139 = *((_QWORD *)v138 + 3);
            v140 = v138 + 24 - (char *)buf;
            if (v139 == 1)
              v140 = 0;
            v141 = v140 + v139;
          }
          if (v141 == 1)
            v142 = 0;
          else
            v142 = &buf[v141];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v142);
          v135 = objc_claimAutoreleasedReturnValue();
          goto LABEL_197;
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("timezone index out of bounds: %ld"), v15[4]);
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.8f, %.8f}"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v134;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Timezone name for %{private}@ not found.", buf, 0xCu);

    }
    v135 = 0;
    v7 = 0;
    if (!v15)
      return v7;
LABEL_197:
    operator delete(v15);
    v7 = (void *)v135;
  }
  return v7;
}

- (CLLocationCoordinate2D)anyCoordinateForTimeZoneName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  _QWORD *timezones;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint8_t *v19;
  uint8_t *v20;
  int64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  size_t v28;
  uint64_t v29;
  int v30;
  uint8_t *v31;
  uint64_t v32;
  void **p_s1;
  int v34;
  int v35;
  int v36;
  int v37;
  BOOL v39;
  BOOL v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  BOOL v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  char *v55;
  uint8_t *v56;
  uint64_t v57;
  double v58;
  double v59;
  _QWORD *rtree;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint8_t *v67;
  __CFString *v68;
  float64x2_t v69;
  uint64_t v70;
  void *__s1;
  size_t __n;
  unsigned __int8 v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t buf[32];
  float32x2_t *v77;
  uint64_t v78;
  CLLocationCoordinate2D result;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if (!-[PFTimeZoneLookup loadOrCreateIndex](self, "loadOrCreateIndex"))
  {
    v69 = *(float64x2_t *)MEMORY[0x1E0C9E500];
    goto LABEL_95;
  }
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("US/Pacific")) & 1) != 0)
  {
    v5 = CFSTR("America/Los_Angeles");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("GMT")))
    {
      v5 = v4;
      goto LABEL_11;
    }
    v5 = CFSTR("Europe/London");
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Overriding input timeZone %@ with %@", buf, 0x16u);
  }

LABEL_11:
  v68 = objc_retainAutorelease(v5);
  std::string::basic_string[abi:ne180100]<0>(&__s1, (char *)-[__CFString UTF8String](v68, "UTF8String"));
  timezones = self->_timezones;
  v9 = timezones[1];
  v8 = (char *)(timezones + 1);
  v7 = v9;
  v10 = v8 - (char *)buf;
  if (v9 == 1)
    v10 = 0;
  v11 = v10 + v7;
  if (v11 == 1)
    v12 = 0;
  else
    v12 = buf - (uint8_t *)&v74;
  v13 = v12 + v11;
  *(_QWORD *)buf = v11;
  if (v11 == 1)
    v14 = 0;
  else
    v14 = buf - (uint8_t *)&v75;
  v15 = v14 + v11;
  v74 = v13;
  v75 = v15;
  v16 = *((_QWORD *)v8 + 1);
  if (v16)
    v17 = v15 == 1;
  else
    v17 = 0;
  if (v17)
LABEL_110:
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  while (1)
  {
    v18 = v15 + 32 * v16;
    v19 = (uint8_t *)&v74 + v13;
    if (v13 == 1)
      v19 = 0;
    if (v18 == 1)
      v20 = 0;
    else
      v20 = &buf[v18 - 8];
    if (v19 == v20)
      goto LABEL_92;
    if (v13 == 1)
      v21 = 0;
    else
      v21 = (char *)&v74 - (char *)&v70;
    v22 = v21 + v13;
    v70 = v22;
    if (v22 == 1)
      v23 = 0;
    else
      v23 = (char *)&v70 + v22;
    if ((v23[8] & 1) != 0)
    {
      v26 = v23 - (char *)&v75 + 9;
    }
    else
    {
      v24 = *((_QWORD *)v23 + 3);
      v25 = v23 + 24 - (char *)&v75;
      if (v24 == 1)
        v25 = 0;
      v26 = v25 + v24;
    }
    if (v26 == 1)
      v27 = 0;
    else
      v27 = (char *)&buf[v26 - 8];
    std::string::basic_string[abi:ne180100]<0>(buf, v27);
    if ((v73 & 0x80u) == 0)
      v28 = v73;
    else
      v28 = __n;
    v29 = buf[23];
    v30 = (char)buf[23];
    if ((buf[23] & 0x80u) != 0)
      v29 = *(_QWORD *)&buf[8];
    if (v28 != v29)
    {
      v40 = 0;
      if (((char)buf[23] & 0x80000000) == 0)
        goto LABEL_66;
LABEL_65:
      operator delete(*(void **)buf);
      goto LABEL_66;
    }
    if ((buf[23] & 0x80u) == 0)
      v31 = buf;
    else
      v31 = *(uint8_t **)buf;
    if ((v73 & 0x80) != 0)
    {
      v40 = memcmp(__s1, v31, __n) == 0;
      goto LABEL_64;
    }
    if (v73)
    {
      v32 = v73 - 1;
      p_s1 = &__s1;
      do
      {
        v35 = *(unsigned __int8 *)p_s1;
        p_s1 = (void **)((char *)p_s1 + 1);
        v34 = v35;
        v37 = *v31++;
        v36 = v37;
        v39 = v32-- != 0;
        v40 = v34 == v36;
      }
      while (v34 == v36 && v39);
LABEL_64:
      if ((v30 & 0x80000000) == 0)
        goto LABEL_66;
      goto LABEL_65;
    }
    v40 = 1;
    if ((char)buf[23] < 0)
      goto LABEL_65;
LABEL_66:
    if (v40)
      break;
    if (v74 == 1)
      __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
    v13 = v74 + 32;
    v41 = self->_timezones;
    v44 = v41[1];
    v43 = (char *)(v41 + 1);
    v42 = v44;
    v45 = v43 - (char *)buf;
    if (v44 == 1)
      v45 = 0;
    v46 = v45 + v42;
    *(_QWORD *)buf = v46;
    if (v46 == 1)
      v47 = 0;
    else
      v47 = buf - (uint8_t *)&v75;
    v15 = v47 + v46;
    v74 += 32;
    v75 = v15;
    v16 = *((_QWORD *)v43 + 1);
    if (v16)
      v48 = v15 == 1;
    else
      v48 = 0;
    if (v48)
      goto LABEL_110;
  }
  v49 = self->_timezones;
  v50 = v49[1];
  v51 = (char *)(v49 + 1) - (char *)buf;
  if (v50 == 1)
    v51 = 0;
  v52 = v51 + v50;
  v53 = buf - (uint8_t *)&v75;
  if (v52 == 1)
    v53 = 0;
  v54 = v53 + v52;
  if (v74 == 1)
    v55 = 0;
  else
    v55 = (char *)&v74 + v74;
  if (v54 == 1)
    v56 = 0;
  else
    v56 = &buf[v54 - 8];
  v57 = v55 - (char *)v56;
  if (v55 - (char *)v56 == -32)
  {
LABEL_92:
    v69 = *(float64x2_t *)MEMORY[0x1E0C9E500];
    v4 = v68;
    goto LABEL_93;
  }
  v69 = *(float64x2_t *)MEMORY[0x1E0C9E500];
  rtree = self->_rtree;
  v63 = rtree[3];
  v61 = (char *)(rtree + 3);
  v62 = v63;
  v4 = v68;
  if (v63 == 1)
  {
    v77 = 0;
    memset(buf, 0, sizeof(buf));
  }
  else
  {
    v64 = v61 - (char *)&v74 + v62;
    v74 = v64;
    memset(buf, 0, sizeof(buf));
    v77 = 0;
    v65 = (char *)&v74 - (char *)&v75;
    if (v64 == 1)
      v65 = 0;
    v66 = v65 + v64;
    v75 = v66;
    if (v66 == 1)
      v67 = 0;
    else
      v67 = &buf[v66 - 8];
    boost::variant<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::apply_visitor<boost::geometry::index::detail::rtree::visitors::iterator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::detail::rtree::options<boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::detail::rtree::insert_default_tag,boost::geometry::index::detail::rtree::choose_by_content_diff_tag,boost::geometry::index::detail::rtree::split_default_tag,boost::geometry::index::detail::rtree::quadratic_tag,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::translator<boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>>>(v67, (char **)buf);
    boost::geometry::index::detail::rtree::visitors::iterator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::detail::rtree::options<boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::detail::rtree::insert_default_tag,boost::geometry::index::detail::rtree::choose_by_content_diff_tag,boost::geometry::index::detail::rtree::split_default_tag,boost::geometry::index::detail::rtree::quadratic_tag,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::translator<boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::search_value((uint64_t)buf);
  }
  while (*(_QWORD *)&buf[24])
  {
    if (v57 >> 5 == v77[1].u16[0])
    {
      v69 = vcvtq_f64_f32(*v77);
      break;
    }
    v77 = (float32x2_t *)((char *)v77 + 12);
    boost::geometry::index::detail::rtree::visitors::iterator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::detail::rtree::options<boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::detail::rtree::insert_default_tag,boost::geometry::index::detail::rtree::choose_by_content_diff_tag,boost::geometry::index::detail::rtree::split_default_tag,boost::geometry::index::detail::rtree::quadratic_tag,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::translator<boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::search_value((uint64_t)buf);
  }
  if (*(_QWORD *)buf)
    operator delete(*(void **)buf);
LABEL_93:
  if ((char)v73 < 0)
    operator delete(__s1);
LABEL_95:

  v59 = v69.f64[1];
  v58 = v69.f64[0];
  result.longitude = v59;
  result.latitude = v58;
  return result;
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  pf::TimezoneArchiveLineParser **v3;
  pf::TimezoneArchiveLineParser **v5;
  id v6;
  pf::TimezoneArchiveLineParser *v7;
  const char *v8;
  char *v9;
  size_t v10;
  unique_ptr<pf::ArchiveLineParser, std::default_delete<pf::ArchiveLineParser>> v11;
  id v12;

  v5 = v3;
  v6 = a3;
  v7 = (pf::TimezoneArchiveLineParser *)operator new();
  v12 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  v9 = -[PFTimeZoneLookup magic](self);
  if (self)
    v10 = 23;
  else
    v10 = 0;
  pf::TimezoneArchiveLineParser::TimezoneArchiveLineParser(v7, v8, v9, v10);
  *v5 = v7;

  return v11;
}

- (const)indexLabel
{
  return "timezone";
}

- (id)indexName
{
  return CFSTR("PFTimeZoneData");
}

- (unint64_t)indexFileVersion
{
  return 4;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v19;
  NSObject *v20;
  const char *v21;
  const void *v22;
  uint64_t v23;
  const void *v24;
  int v25;
  uint32_t v26;
  char *v27;
  unint64_t v28;
  void *value;
  _BYTE buf[24];
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (_QWORD *)operator new();
  boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_mapped_file(v7, a3);
  value = v7;
  v8 = *v7;
  v9 = *(_QWORD *)(*v7 + 48) + 8;
  if (v9 != a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a4;
    v20 = MEMORY[0x1E0C81028];
    v21 = "PFTimeZoneLookup cache corruption/truncation: stored size %lld != actual file size %lld.";
    goto LABEL_28;
  }
  v27 = 0;
  v10 = -[PFTimeZoneLookup magic](self);
  if (!PFArchiveFileMagicFound((const char *)(v8 - 8), "PFTimeZone", v10, 0x400uLL, (const char **)&v27))
    goto LABEL_10;
  if (self)
    v11 = 23;
  else
    v11 = 0;
  v12 = PFChecksumArchiveData((char *)(*v7 - 8), *(_QWORD *)(*v7 + 48) + 8, v27, v11);
  v13 = *(_QWORD *)&v27[v11];
  if (v12 != v13)
  {
    v19 = v12;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v19;
    v20 = MEMORY[0x1E0C81028];
    v21 = "PFTimeZoneLookup checksum fail, found %016llx expected %016llx";
LABEL_28:
    v26 = 22;
    goto LABEL_29;
  }
  v14 = (int *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_find_impl<int>(*v7, "version");
  v15 = *v7;
  *(_OWORD *)&buf[8] = xmmword_1A17B6C50;
  v31 = 0x80000001A17B8193 & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)buf = off_1E45A1160;
  v28 = 0;
  if ("timezones" == (char *)-1)
    v16 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v15, (char *)(0x80000001A17B8193 & 0x7FFFFFFFFFFFFFFFLL), v15 + 88, (uint64_t)buf, &v28);
  else
    v16 = boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v15, "timezones", v15 + 56, (uint64_t)buf, &v28);
  v22 = (const void *)v16;
  v23 = *v7;
  *(_OWORD *)&buf[8] = xmmword_1A17B6C50;
  v31 = 0x80000001A17B8556 & 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)buf = off_1E45A1100;
  v28 = 0;
  if ("rtree" == (char *)-1)
    v24 = (const void *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v23, (char *)(0x80000001A17B8556 & 0x7FFFFFFFFFFFFFFFLL), v23 + 88, (uint64_t)buf, &v28);
  else
    v24 = (const void *)boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::priv_generic_find<char>(v23, "rtree", v23 + 56, (uint64_t)buf, &v28);
  if (!v14 || !v22 || !v24)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E0C81028];
    v21 = "Timezone index missing one or more required region.";
    v26 = 2;
LABEL_29:
    _os_log_error_impl(&dword_1A16EE000, v20, OS_LOG_TYPE_ERROR, v21, buf, v26);
    goto LABEL_10;
  }
  v25 = *v14;
  if (v25 == 4)
  {
    v17 = 0;
    value = self->_backingFile.__ptr_.__value_;
    self->_backingFile.__ptr_.__value_ = v7;
    self->_timezones = v22;
    self->_rtree = v24;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v25;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported timezone index version: %d.", buf, 8u);
  }
LABEL_10:
  v17 = 1;
LABEL_11:
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&value);
  return v17 == 0;
}

- (BOOL)loadOrCreateIndex
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFTimeZoneLookup;
  -[PFCachingArchiveIndex loadOrCreateIndex](&v4, sel_loadOrCreateIndex);
  return self->_rtree != 0;
}

- (BOOL)indexSupported
{
  return 1;
}

- (void).cxx_destruct
{
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&self->_backingFile);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (char)magic
{
  char *v1;

  if (!a1)
    return 0;
  v1 = -[PFTimeZoneLookup magic]::buffer;
  snprintf(-[PFTimeZoneLookup magic]::buffer, 0x50uLL, "%s%s%02x%08x", "PFTimeZone", "01", 4, objc_msgSend(a1, "architectureHash"));
  return v1;
}

@end
