@implementation TSDGPUVoronoiTriangleData

- (void)p_setupDataWithPointCount:(unint64_t)a3 clippedToRect:(CGRect)a4 percentOfCellsToSplit:(double)a5 randomGenerator:(id)a6
{
  double height;
  double width;
  void *v11;
  uint64_t v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MidX;
  CGFloat MidY;
  void **v29;
  void **v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  void **v36;
  void **v37;
  void *v38;
  uint64_t v39;
  double MinX;
  double v41;
  double v42;
  double MinY;
  double v44;
  void **v45;
  void **v46;
  void **v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  void **v53;
  void **v54;
  void *v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  id v60;
  _QWORD *v61;
  _QWORD *v62;
  char *v63;
  _QWORD *v64;
  __int128 v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  __int128 v71;
  char *v72;
  char *v73;
  char *v74;
  __int128 v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  double v89;
  double v90;
  unint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  BOOL v96;
  double v97;
  double v98;
  void *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  unint64_t v104;
  CGFloat v105;
  double v106;
  double *v107;
  TSDGPUVoronoiTriangleDataCell *v108;
  TSDGPUVoronoiTriangleDataCell *v109;
  double v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i;
  void *v116;
  uint64_t v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  void *v122;
  uint64_t v123;
  unint64_t v124;
  id v125;
  void *v126;
  void *v127;
  unint64_t j;
  void *v129;
  uint64_t v130;
  NSArray *v132;
  double v133;
  CGFloat v134;
  CGFloat rect;
  CGFloat x;
  CGFloat y;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  void *v142;
  void *v143;
  uint64_t v144;
  double *v145;
  double *v146;
  uint64_t v147;
  void *v148;
  char *v149;
  unint64_t v150;
  double v151;
  void *v152;
  char *v153;
  uint64_t v154;
  char *v155;
  char *v156;
  unint64_t v157;
  CGPoint v158;
  double v159;
  double v160;
  char *v161;
  char *v162;
  unint64_t v163;
  void *v164;
  char *v165;
  char *v166;
  void *v167[2];
  void *v168[2];
  __int128 v169;
  void *v170[2];
  uint64_t v171;
  uint64_t *v172;
  _QWORD *v173[2];
  void *__p;
  void **v175;
  char *v176;
  _BYTE v177[128];
  _QWORD v178[3];
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;

  height = a4.size.height;
  width = a4.size.width;
  x = a4.origin.x;
  y = a4.origin.y;
  v178[1] = *MEMORY[0x24BDAC8D0];
  if (!a6)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 507, CFSTR("invalid nil value for '%s'"), "randGen");
  }
  v13 = 0;
  __p = 0;
  v175 = 0;
  v176 = 0;
  v173[0] = 0;
  v173[1] = 0;
  v172 = (uint64_t *)v173;
  v134 = height;
  rect = width;
  if (width <= height)
    v14 = height;
  else
    v14 = width;
  v133 = v14;
  v15 = -1.0;
  v16 = 0.25;
  do
  {
    v17 = fabs(v15);
    if (v17 <= 0.5)
      v18 = rect;
    else
      v18 = v133;
    v19 = -1.0;
    do
    {
      v20 = fabs(v19);
      if (v17 > 0.5 || v20 > 0.5)
      {
        v22 = v134;
        if (v20 <= 0.5)
          v23 = v134;
        else
          v23 = v133;
        v24 = x;
        v25 = y;
        v26 = rect;
        MidX = CGRectGetMidX(*(CGRect *)(&v22 - 3));
        v179.origin.x = x;
        v179.origin.y = y;
        v179.size.height = v134;
        v179.size.width = rect;
        MidY = CGRectGetMidY(v179);
        v167[0] = COERCE_VOID_(round(MidX + v15 * v18));
        v167[1] = COERCE_VOID_(round(MidY + v19 * v23));
        std::__tree<boost::polygon::point_data<double>>::__emplace_unique_key_args<boost::polygon::point_data<double>,boost::polygon::point_data<double> const&>(&v172, (double *)v167, v167);
        v29 = v175;
        if (v175 >= (void **)v176)
        {
          v30 = (void **)__p;
          v31 = ((char *)v175 - (_BYTE *)__p) >> 4;
          v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 60)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          v33 = v176 - (_BYTE *)__p;
          if ((v176 - (_BYTE *)__p) >> 3 > v32)
            v32 = v33 >> 3;
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0)
            v34 = 0xFFFFFFFFFFFFFFFLL;
          else
            v34 = v32;
          if (v34)
          {
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v176, v34);
            v30 = (void **)__p;
            v29 = v175;
          }
          else
          {
            v35 = 0;
          }
          v36 = (void **)&v35[16 * v31];
          *v36 = v167[0];
          v36[1] = v167[1];
          v37 = v36;
          while (v29 != v30)
          {
            v38 = *(v29 - 2);
            v29 -= 2;
            *(v37 - 2) = v38;
            v37 -= 2;
            v37[1] = v29[1];
          }
          v13 = (double *)(v36 + 2);
          __p = v37;
          v175 = v36 + 2;
          v176 = &v35[16 * v34];
          if (v30)
            operator delete(v30);
        }
        else
        {
          *v175 = v167[0];
          v29[1] = v167[1];
          v13 = (double *)(v29 + 2);
        }
        v16 = 0.25;
        v175 = (void **)v13;
      }
      v19 = v19 + v16;
    }
    while (v19 <= 1.0);
    v15 = v15 + v16;
  }
  while (v15 <= 1.0);
  if (a3)
  {
    v39 = 0;
    do
    {
      v180.origin.x = x;
      v180.origin.y = y;
      v180.size.width = rect;
      v180.size.height = v134;
      MinX = CGRectGetMinX(v180);
      v181.origin.x = x;
      v181.origin.y = y;
      v181.size.width = rect;
      v181.size.height = v134;
      objc_msgSend(a6, "doubleBetween::", MinX, CGRectGetMaxX(v181));
      v42 = v41;
      v182.origin.x = x;
      v182.origin.y = y;
      v182.size.width = rect;
      v182.size.height = v134;
      MinY = CGRectGetMinY(v182);
      v183.origin.x = x;
      v183.origin.y = y;
      v183.size.width = rect;
      v183.size.height = v134;
      objc_msgSend(a6, "doubleBetween::", MinY, CGRectGetMaxY(v183));
      v167[0] = COERCE_VOID_(round(v42));
      v167[1] = COERCE_VOID_(round(v44));
      if (v173 == (_QWORD **)std::__tree<boost::polygon::point_data<double>>::find<boost::polygon::point_data<double>>((uint64_t)&v172, (double *)v167))
      {
        std::__tree<boost::polygon::point_data<double>>::__emplace_unique_key_args<boost::polygon::point_data<double>,boost::polygon::point_data<double> const&>(&v172, (double *)v167, v167);
        v45 = v175;
        if (v175 >= (void **)v176)
        {
          v47 = (void **)__p;
          v48 = ((char *)v175 - (_BYTE *)__p) >> 4;
          v49 = v48 + 1;
          if ((unint64_t)(v48 + 1) >> 60)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          v50 = v176 - (_BYTE *)__p;
          if ((v176 - (_BYTE *)__p) >> 3 > v49)
            v49 = v50 >> 3;
          if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
            v51 = 0xFFFFFFFFFFFFFFFLL;
          else
            v51 = v49;
          if (v51)
          {
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)&v176, v51);
            v47 = (void **)__p;
            v45 = v175;
          }
          else
          {
            v52 = 0;
          }
          v53 = (void **)&v52[16 * v48];
          *v53 = v167[0];
          v53[1] = v167[1];
          v54 = v53;
          while (v45 != v47)
          {
            v55 = *(v45 - 2);
            v45 -= 2;
            *(v54 - 2) = v55;
            v54 -= 2;
            v54[1] = v45[1];
          }
          v46 = v53 + 2;
          __p = v54;
          v175 = v53 + 2;
          v176 = &v52[16 * v51];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *v175 = v167[0];
          v45[1] = v167[1];
          v46 = v45 + 2;
        }
        v175 = v46;
      }
      ++v39;
    }
    while (v39 != a3);
    v13 = (double *)v175;
  }
  v171 = 0;
  v169 = 0u;
  *(_OWORD *)v170 = 0u;
  *(_OWORD *)v167 = 0u;
  *(_OWORD *)v168 = 0u;
  boost::polygon::construct_voronoi<std::__wrap_iter<boost::polygon::point_data<double> *>,std::__wrap_iter<boost::polygon::segment_data<double> *>,boost::polygon::voronoi_diagram<double,boost::polygon::voronoi_diagram_traits<double>>>((uint64_t)__p, v13, 0, 0, v167);
  v56 = *MEMORY[0x24BDBF070];
  v57 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v59 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v58 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v60 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v132 = (NSArray *)objc_msgSend(v60, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (((char *)v167[1] - (char *)v167[0]) >> 3));
  v164 = 0;
  v165 = 0;
  v166 = 0;
  v62 = v167[0];
  v61 = v167[1];
  if (v167[0] == v167[1])
  {
    v161 = 0;
    v162 = 0;
    v163 = 0;
LABEL_151:
    v104 = 0;
    v155 = 0;
    v156 = 0;
    v157 = 0;
    goto LABEL_153;
  }
  v63 = 0;
  do
  {
    v64 = (_QWORD *)v62[1];
    while (v64[1] && *(_QWORD *)(v64[2] + 8))
    {
      v64 = (_QWORD *)v64[3];
      if (v64 == (_QWORD *)v62[1])
      {
        if (v63 >= v166)
        {
          v66 = 0xAAAAAAAAAAAAAAABLL * ((v63 - (_BYTE *)v164) >> 3);
          v67 = v66 + 1;
          if (v66 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((v166 - (_BYTE *)v164) >> 3) > v67)
            v67 = 0x5555555555555556 * ((v166 - (_BYTE *)v164) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * ((v166 - (_BYTE *)v164) >> 3) >= 0x555555555555555)
            v68 = 0xAAAAAAAAAAAAAAALL;
          else
            v68 = v67;
          if (v68)
            v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<boost::polygon::voronoi_cell<double>>>((uint64_t)&v166, v68);
          else
            v69 = 0;
          v70 = &v69[8 * ((v63 - (_BYTE *)v164) >> 3)];
          v71 = *(_OWORD *)v62;
          *((_QWORD *)v70 + 2) = v62[2];
          *(_OWORD *)v70 = v71;
          v73 = (char *)v164;
          v72 = v165;
          v74 = &v69[24 * v66];
          if (v165 != v164)
          {
            do
            {
              v75 = *(_OWORD *)(v72 - 24);
              *((_QWORD *)v74 - 1) = *((_QWORD *)v72 - 1);
              *(_OWORD *)(v74 - 24) = v75;
              v74 -= 24;
              v72 -= 24;
            }
            while (v72 != v73);
            v72 = (char *)v164;
          }
          v63 = v70 + 24;
          v164 = v74;
          v165 = v70 + 24;
          v166 = &v69[24 * v68];
          if (v72)
            operator delete(v72);
        }
        else
        {
          v65 = *(_OWORD *)v62;
          *((_QWORD *)v63 + 2) = v62[2];
          *(_OWORD *)v63 = v65;
          v63 += 24;
        }
        v165 = v63;
        v61 = v167[1];
        break;
      }
    }
    v62 += 3;
  }
  while (v62 != v61);
  v76 = (char *)v164;
  v161 = 0;
  v162 = 0;
  v163 = 0;
  if (v164 == v63)
    goto LABEL_151;
  do
  {
    v149 = 0;
    v150 = 0;
    v148 = 0;
    v77 = *((_QWORD *)v76 + 1);
    v78 = v77;
    do
    {
      if (TSDLineIntersectsRect(**(CGFloat **)(v78 + 8), *(CGFloat *)(*(_QWORD *)(v78 + 8) + 8), **(double **)(*(_QWORD *)(v78 + 16) + 8), *(double *)(*(_QWORD *)(*(_QWORD *)(v78 + 16) + 8) + 8), x, y, rect, v134))
      {
        segment_from_edge_clipped_to_rect(v78, &v158, x, y, rect, v134);
        v79 = v149;
        if ((unint64_t)v149 >= v150)
        {
          v80 = (char *)std::vector<boost::polygon::segment_data<double>>::__push_back_slow_path<boost::polygon::segment_data<double> const&>((uint64_t *)&v148, &v158);
        }
        else
        {
          *(_OWORD *)v149 = 0u;
          *((_OWORD *)v79 + 1) = 0u;
          *(CGPoint *)v79 = v158;
          *((double *)v79 + 2) = v159;
          *((double *)v79 + 3) = v160;
          v80 = v79 + 32;
        }
        v149 = v80;
        v77 = *((_QWORD *)v76 + 1);
      }
      v78 = *(_QWORD *)(v78 + 24);
    }
    while (v78 != v77);
    v81 = v162;
    if ((unint64_t)v162 >= v163)
    {
      v82 = std::vector<std::vector<boost::polygon::segment_data<double>>>::__push_back_slow_path<std::vector<boost::polygon::segment_data<double>> const&>((uint64_t *)&v161, (_QWORD **)&v148);
    }
    else
    {
      *(_QWORD *)v162 = 0;
      *((_QWORD *)v81 + 1) = 0;
      *((_QWORD *)v81 + 2) = 0;
      std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>(v81, v148, v149, (v149 - (_BYTE *)v148) >> 5);
      v82 = (uint64_t)(v81 + 24);
    }
    v162 = (char *)v82;
    if (v148)
    {
      v149 = (char *)v148;
      operator delete(v148);
    }
    v76 += 24;
  }
  while (v76 != v165);
  v83 = v161;
  v155 = 0;
  v156 = 0;
  v157 = 0;
  if (v161 == v162)
    goto LABEL_152;
  do
  {
    v152 = 0;
    v153 = 0;
    v154 = 0;
    std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v152, *(_QWORD **)v83, *((_QWORD **)v83 + 1), (uint64_t)(*((_QWORD *)v83 + 1) - *(_QWORD *)v83) >> 5);
    v84 = (char *)v152;
    if (v153 != v152)
    {
      v85 = 0;
      v86 = 0;
      v87 = (v153 - (_BYTE *)v152) >> 5;
      do
      {
        v88 = v86;
        v90 = *(double *)&v84[v85 + 16];
        v89 = *(double *)&v84[v85 + 24];
        if (++v86 == v87)
          v91 = 0;
        else
          v91 = v88 + 1;
        v92 = (uint64_t)&v84[32 * v91];
        v94 = *(double *)v92;
        v93 = *(double *)(v92 + 8);
        if (v90 != *(double *)v92 || v89 != v93)
        {
          if (vabdd_f64(v90, v94) >= 0.00999999978 && vabdd_f64(v89, v93) >= 0.00999999978)
          {
            v184.origin.x = x;
            v184.origin.y = y;
            v184.size.height = v134;
            v184.size.width = rect;
            v96 = vabdd_f64(v90, CGRectGetMinX(v184)) < 0.00999999978;
            v97 = v93;
            v98 = v90;
            if (!v96)
            {
              v185.origin.x = x;
              v185.origin.y = y;
              v185.size.height = v134;
              v185.size.width = rect;
              v96 = vabdd_f64(v90, CGRectGetMaxX(v185)) < 0.00999999978;
              v97 = v93;
              v98 = v90;
              if (!v96)
              {
                v186.origin.x = x;
                v186.origin.y = y;
                v186.size.height = v134;
                v186.size.width = rect;
                v96 = vabdd_f64(v94, CGRectGetMinX(v186)) < 0.00999999978;
                v97 = v89;
                v98 = v94;
                if (!v96)
                {
                  v187.origin.x = x;
                  v187.origin.y = y;
                  v187.size.height = v134;
                  v187.size.width = rect;
                  v96 = vabdd_f64(v94, CGRectGetMaxX(v187)) < 0.00999999978;
                  v97 = v89;
                  v98 = v94;
                  if (!v96)
                  {
                    v99 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v89, v94);
                    v100 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:]");
                    objc_msgSend(v99, "handleFailureInFunction:file:lineNumber:description:", v100, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 710, CFSTR("Couldn't find corner!"));
                    v97 = v89;
                    v98 = v94;
                  }
                }
              }
            }
            v158.x = v90;
            v158.y = v89;
            v159 = v98;
            v160 = v97;
            v148 = *(void **)&v98;
            v149 = *(char **)&v97;
            v150 = *(_QWORD *)&v94;
            v151 = v93;
            std::vector<boost::polygon::segment_data<double>>::insert(&v152, (uint64_t)v152 + 32 * v91, &v158);
            std::vector<boost::polygon::segment_data<double>>::insert(&v152, (uint64_t)v152 + 32 * v91 + 32, &v148);
          }
          else
          {
            v158.x = *(CGFloat *)&v84[v85 + 16];
            v158.y = v89;
            v159 = v94;
            v160 = v93;
            std::vector<boost::polygon::segment_data<double>>::insert(&v152, v92, &v158);
          }
        }
        v84 = (char *)v152;
        v87 = (v153 - (_BYTE *)v152) >> 5;
        v85 += 32;
      }
      while (v86 < v87);
    }
    v101 = v156;
    if ((unint64_t)v156 >= v157)
    {
      v102 = std::vector<std::vector<boost::polygon::segment_data<double>>>::__push_back_slow_path<std::vector<boost::polygon::segment_data<double>> const&>((uint64_t *)&v155, (_QWORD **)&v152);
    }
    else
    {
      *(_QWORD *)v156 = 0;
      *((_QWORD *)v101 + 1) = 0;
      *((_QWORD *)v101 + 2) = 0;
      std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>(v101, v152, v153, (v153 - (_BYTE *)v152) >> 5);
      v102 = (uint64_t)(v101 + 24);
    }
    v156 = (char *)v102;
    if (v152)
    {
      v153 = (char *)v152;
      operator delete(v152);
    }
    v83 += 24;
  }
  while (v83 != v162);
  v103 = v155;
  if (v155 == v156)
  {
LABEL_152:
    v104 = 0;
  }
  else
  {
    v104 = 0;
    do
    {
      v158.x = 0.0;
      v158.y = 0.0;
      v159 = 0.0;
      std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v158, *(_QWORD **)v103, *((_QWORD **)v103 + 1), (uint64_t)(*((_QWORD *)v103 + 1) - *(_QWORD *)v103) >> 5);
      v105 = v158.x;
      if (*(_QWORD *)&v158.y - *(_QWORD *)&v158.x >= 0x41uLL)
      {
        v145 = 0;
        v146 = 0;
        v147 = 0;
        std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v145, *(_QWORD **)&v158.x, *(_QWORD **)&v158.y, (uint64_t)(*(_QWORD *)&v158.y - *(_QWORD *)&v158.x) >> 5);
        v106 = 0.0;
        if (v145 != v146)
        {
          v107 = v145;
          do
          {
            v106 = v106 + (v107[2] - *v107) * ((v107[1] + v107[3]) * 0.5);
            v107 += 4;
          }
          while (v107 != v146);
        }
        if (v145)
        {
          v146 = v145;
          operator delete(v145);
        }
        if (fabs(v106) > 1.0)
        {
          v108 = [TSDGPUVoronoiTriangleDataCell alloc];
          v142 = 0;
          v143 = 0;
          v144 = 0;
          std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&v142, *(_QWORD **)&v158.x, *(_QWORD **)&v158.y, (uint64_t)(*(_QWORD *)&v158.y - *(_QWORD *)&v158.x) >> 5);
          v109 = -[TSDGPUVoronoiTriangleDataCell initWithEdges:](v108, "initWithEdges:", &v142);
          if (v142)
          {
            v143 = v142;
            operator delete(v142);
          }
          v110 = a5;
          if (a5 <= 0.0 || (objc_msgSend(a6, "randomDouble", a5), v110 >= a5))
          {
            v178[0] = v109;
            v111 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v178, 1, v110);
          }
          else
          {
            v111 = -[TSDGPUVoronoiTriangleDataCell cellsBySplittingCellIntoTriangles](v109, "cellsBySplittingCellIntoTriangles");
          }
          v112 = (void *)v111;

          -[NSArray addObjectsFromArray:](v132, "addObjectsFromArray:", v112);
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v138, v177, 16);
          if (v113)
          {
            v114 = *(_QWORD *)v139;
            do
            {
              for (i = 0; i != v113; ++i)
              {
                if (*(_QWORD *)v139 != v114)
                  objc_enumerationMutation(v112);
                v116 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
                v117 = objc_msgSend(v116, "triangleCount");
                objc_msgSend(v116, "bounds");
                v190.origin.x = v118;
                v190.origin.y = v119;
                v190.size.width = v120;
                v190.size.height = v121;
                v188.origin.x = v56;
                v188.origin.y = v57;
                v188.size.width = v59;
                v188.size.height = v58;
                v189 = CGRectUnion(v188, v190);
                v56 = v189.origin.x;
                v57 = v189.origin.y;
                v59 = v189.size.width;
                v58 = v189.size.height;
                v104 += v117;
              }
              v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v138, v177, 16);
            }
            while (v113);
          }
        }
        v105 = v158.x;
      }
      if (v105 != 0.0)
      {
        v158.y = v105;
        operator delete(*(void **)&v105);
      }
      v103 += 24;
    }
    while (v103 != v156);
  }
LABEL_153:
  self->_triangleCount = v104;
  self->_bounds.origin.x = v56;
  self->_bounds.origin.y = v57;
  self->_bounds.size.width = v59;
  self->_bounds.size.height = v58;

  self->_cells = v132;
  v122 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  free(self->_triangleIndexToCellIndexMappingTable);
  free(self->_triangleIndexToCellTriangleIndexMappingTable);
  self->_triangleIndexToCellMappingTableCount = v104;
  if (v104)
  {
    self->_triangleIndexToCellIndexMappingTable = (unint64_t *)malloc_type_calloc(8uLL, v104, 0xE3D11462uLL);
    v123 = 0;
    v124 = 0;
    self->_triangleIndexToCellTriangleIndexMappingTable = (unint64_t *)malloc_type_calloc(8uLL, self->_triangleIndexToCellMappingTableCount, 0x5B0BA89BuLL);
    while (v124 < -[NSArray count](self->_cells, "count"))
    {
      v125 = -[NSArray objectAtIndex:](self->_cells, "objectAtIndex:", v124);
      v126 = (void *)objc_msgSend(v122, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v125, "triangleCount")));
      if (v126)
        v127 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v126, "integerValue") + 1);
      else
        v127 = &unk_24D8FAC98;
      objc_msgSend(v122, "setObject:forKeyedSubscript:", v127, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v125, "triangleCount")));
      for (j = 0; j < objc_msgSend(v125, "triangleCount"); ++j)
      {
        self->_triangleIndexToCellIndexMappingTable[v123] = v124;
        self->_triangleIndexToCellTriangleIndexMappingTable[v123++] = j;
      }
      ++v124;
    }
  }
  else
  {
    v129 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v130 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:]");
    objc_msgSend(v129, "handleFailureInFunction:file:lineNumber:description:", v130, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 807, CFSTR("No triangles created!"));
  }
  *(_QWORD *)&v158.x = &v155;
  std::vector<std::vector<boost::polygon::segment_data<double>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v158);
  *(_QWORD *)&v158.x = &v161;
  std::vector<std::vector<boost::polygon::segment_data<double>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v158);
  if (v164)
  {
    v165 = (char *)v164;
    operator delete(v164);
  }
  if (v170[0])
  {
    v170[1] = v170[0];
    operator delete(v170[0]);
  }
  if (v168[1])
  {
    *(void **)&v169 = v168[1];
    operator delete(v168[1]);
  }
  if (v167[0])
  {
    v167[1] = v167[0];
    operator delete(v167[0]);
  }
  std::__tree<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::__map_value_compare<std::pair<unsigned short,EQKit::Config::Operator::Form>,std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>,std::less<std::pair<unsigned short,EQKit::Config::Operator::Form>>,true>,std::allocator<std::__value_type<std::pair<unsigned short,EQKit::Config::Operator::Form>,EQKit::Config::Operator::Dictionary::Entry>>>::destroy((uint64_t)&v172, v173[0]);
  if (__p)
  {
    v175 = (void **)__p;
    operator delete(__p);
  }
}

- (TSDGPUVoronoiTriangleData)initWithPoints:(unint64_t)a3 clippedToRect:(CGRect)a4 percentOfCellsToSplit:(double)a5 randomGenerator:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  TSDGPUVoronoiTriangleData *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDGPUVoronoiTriangleData;
  v13 = -[TSDGPUVoronoiTriangleData init](&v17, sel_init);
  if (v13)
  {
    if (!a6)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleData initWithPoints:clippedToRect:percentOfCellsToSplit:randomGenerator:]");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 855, CFSTR("invalid nil value for '%s'"), "randomGenerator");
    }
    -[TSDGPUVoronoiTriangleData p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:](v13, "p_setupDataWithPointCount:clippedToRect:percentOfCellsToSplit:randomGenerator:", a3, a6, x, y, width, height, a5);
  }
  return v13;
}

- (void)dealloc
{
  unint64_t *triangleIndexToCellIndexMappingTable;
  unint64_t *triangleIndexToCellTriangleIndexMappingTable;
  objc_super v5;

  triangleIndexToCellIndexMappingTable = self->_triangleIndexToCellIndexMappingTable;
  if (triangleIndexToCellIndexMappingTable)
  {
    free(triangleIndexToCellIndexMappingTable);
    self->_triangleIndexToCellIndexMappingTable = 0;
  }
  triangleIndexToCellTriangleIndexMappingTable = self->_triangleIndexToCellTriangleIndexMappingTable;
  if (triangleIndexToCellTriangleIndexMappingTable)
  {
    free(triangleIndexToCellTriangleIndexMappingTable);
    self->_triangleIndexToCellTriangleIndexMappingTable = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)TSDGPUVoronoiTriangleData;
  -[TSDGPUVoronoiTriangleData dealloc](&v5, sel_dealloc);
}

- (unint64_t)cellCount
{
  return -[NSArray count](self->_cells, "count");
}

- (id)cellFromTriangleIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:", -[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:](self, "cellIndexFromTriangleIndex:", a3));
}

- (unint64_t)cellIndexFromTriangleIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->_triangleIndexToCellMappingTableCount <= a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleData cellIndexFromTriangleIndex:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 883, CFSTR("%d is out of bounds(%d)!"), a3, self->_triangleIndexToCellMappingTableCount);
  }
  return self->_triangleIndexToCellIndexMappingTable[a3];
}

- (unint64_t)triangleIndexInCellFromGlobalTriangleIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;

  if (self->_triangleIndexToCellMappingTableCount <= a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGPUVoronoiTriangleData triangleIndexInCellFromGlobalTriangleIndex:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 891, CFSTR("%d is out of bounds(%d)!"), a3, self->_triangleIndexToCellMappingTableCount);
  }
  return self->_triangleIndexToCellTriangleIndexMappingTable[a3];
}

- (unint64_t)triangleCount
{
  return self->_triangleCount;
}

- (NSArray)cells
{
  return self->_cells;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
