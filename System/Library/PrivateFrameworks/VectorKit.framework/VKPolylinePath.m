@implementation VKPolylinePath

- (VKPolylinePath)initWithOverlay:(id)a3 section:(id)a4 matchedPathSegments:(id)a5
{
  id v8;
  id v9;
  id v10;
  VKPolylinePath *v11;
  VKPolylinePath *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VKPolylinePath;
  v11 = -[VKPolylinePath init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_gradientTraffic.blend = 0.0;
    *(_WORD *)&v11->_gradientTraffic.start = 771;
    objc_storeWeak((id *)&v11->_overlay, v8);
    objc_storeWeak((id *)&v12->_section, v9);
    v12->_startDistance = -1.0;
    objc_storeStrong((id *)&v12->_matchedPathSegments, a5);
  }

  return v12;
}

- (VKPolylinePath)initWithOverlay:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6 matchedPathSegments:(id)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9
{
  id v14;
  id v15;
  VKPolylinePath *v16;
  VKPolylinePath *v17;
  id WeakRetained;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  char *begin;
  char *end;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  int v31;
  char *v32;
  PolylineCoordinate *v33;
  char *v34;
  uint64_t v35;
  PolylineCoordinate *v36;
  char *v37;
  int v38;
  unint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  int v46;
  PolylineCoordinate *v47;
  PolylineCoordinate *v48;
  char *v49;
  uint64_t v50;
  PolylineCoordinate *v51;
  char *v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  PolylineCoordinate *v56;
  uint64_t v57;
  __int128 v58;
  PolylineCoordinate v59;
  uint64_t v60;
  BOOL v61;
  int v62;
  unint64_t v63;
  void *v64;
  PolylineCoordinate *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  float v89;
  float v90;
  unint64_t value;
  float *v92;
  float *v93;
  float *v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  char *v98;
  float *v99;
  float *v100;
  uint64_t v101;
  int v102;
  unint64_t v103;
  int v104;
  unint64_t v105;
  float v106;
  unint64_t v107;
  float *v108;
  float *v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  float *v115;
  unint64_t v116;
  float *v117;
  uint64_t v118;
  char *v119;
  float *v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  char *v126;
  PolylineCoordinate *v127;
  uint64_t v128;
  __int128 v129;
  PolylineCoordinate v130;
  uint64_t v131;
  int v132;
  BOOL v133;
  int v134;
  PolylineCoordinate *v135;
  unint64_t v136;
  uint64_t v137;
  int v138;
  int v139;
  float v140;
  double v141;
  double v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  float v146;
  double v147;
  double v148;
  unint64_t v149;
  _DWORD *v150;
  _DWORD *v151;
  _DWORD *v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  char *v156;
  char *v157;
  char *v158;
  uint64_t v159;
  int v160;
  unsigned int v161;
  unint64_t v162;
  char *v163;
  char *v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  unint64_t v168;
  _BYTE *v169;
  PolylineCoordinate *v170;
  int64_t v171;
  unint64_t v172;
  PolylineCoordinate *v173;
  uint64_t v174;
  _OWORD *v175;
  char *v176;
  uint64_t v177;
  __int128 v178;
  PolylineCoordinate v179;
  double v180;
  double v181;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  id obj;
  uint64_t v188;
  uint64_t v189;
  double v191;
  double v192;
  int v193;
  int v194;
  uint64_t v195;
  unsigned int v196;
  void *v197;
  double v198;
  double v199;
  _QWORD v200[3];
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD v204[3];
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v185 = v14;
  v186 = a7;
  v16 = -[VKPolylinePath initWithOverlay:section:matchedPathSegments:](self, "initWithOverlay:section:matchedPathSegments:", v14, v15);
  v17 = v16;
  if (!v16)
    goto LABEL_175;
  WeakRetained = objc_loadWeakRetained((id *)&v16->_section);
  objc_msgSend(WeakRetained, "composedRouteSegment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v183 = v19;
  objc_msgSend(v19, "composedRoute");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v17->_routeStart.index = a5;
  v17->_routeStart.offset = 0.0;
  v17->_routeEnd.index = a6;
  v17->_routeEnd.offset = 0.0;
  v197 = v15;
  if (v186)
  {
    v214 = 0u;
    v215 = 0u;
    v212 = 0u;
    v213 = 0u;
    v20 = v186;
    v21 = 0;
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v212, v217, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v213;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v213 != v23)
            objc_enumerationMutation(v20);
          v21 += objc_msgSend(*(id *)(*((_QWORD *)&v212 + 1) + 8 * i), "pointCount");
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v212, v217, 16);
      }
      while (v22);
    }

    begin = (char *)v17->_points.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v17->_points.__end_cap_.__value_ - (char *)begin) >> 2) < v21)
    {
      if (v21 > 0x1555555555555555)
        goto LABEL_181;
      end = (char *)v17->_points.__end_;
      v27 = (char *)operator new(12 * v21);
      v28 = &v27[12 * ((end - begin) / 12)];
      v29 = v28;
      if (end != begin)
      {
        v29 = &v27[12 * ((end - begin) / 12)];
        do
        {
          v30 = *(_QWORD *)(end - 12);
          end -= 12;
          v31 = *((_DWORD *)end + 2);
          *(_QWORD *)(v29 - 12) = v30;
          v29 -= 12;
          *((_DWORD *)v29 + 2) = v31;
        }
        while (end != begin);
      }
      v17->_points.__begin_ = v29;
      v17->_points.__end_ = v28;
      v17->_points.__end_cap_.__value_ = &v27[12 * v21];
      if (begin)
        operator delete(begin);
    }
    v32 = (char *)v17->_polylineCoordinates.__begin_;
    if (v21 <= ((char *)v17->_polylineCoordinates.__end_cap_.__value_ - v32) >> 3)
    {
LABEL_39:
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      obj = v20;
      v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v216, 16);
      if (!v60)
        goto LABEL_105;
      v188 = *(_QWORD *)v209;
      if (a8)
        v61 = a9 == 0;
      else
        v61 = 1;
      v62 = !v61;
      v193 = v62;
      while (1)
      {
        v189 = 0;
        v195 = v60;
        do
        {
          if (*(_QWORD *)v209 != v188)
            objc_enumerationMutation(obj);
          v63 = 0;
          v64 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * v189);
          while (v63 < objc_msgSend(v64, "pointCount"))
          {
            objc_msgSend(v64, "locationCoordinateAt:", v63);
            v67 = v66;
            v69 = v68;
            v71 = v70;
            GEOMapPoint3DForCoordinate();
            v73 = v72;
            v75 = v74;
            v77 = v76;
            if (v15)
            {
              objc_msgSend(v15, "bounds");
              v78 = *((double *)&v205 + 1);
              v79 = *(double *)&v205;
              v81 = *((double *)&v206 + 1);
              v80 = *(double *)&v206;
              v82 = *((double *)&v207 + 1);
              v83 = *(double *)&v207;
            }
            else
            {
              v206 = 0u;
              v207 = 0u;
              v82 = 0.0;
              v80 = 0.0;
              v78 = 0.0;
              v83 = 0.0;
              v205 = 0u;
              v81 = 0.0;
              v79 = 0.0;
            }
            v84 = (v77 - v80) / v82;
            if (v193)
            {
              v191 = v81;
              v192 = v73;
              v85 = v75;
              v86 = v83;
              v87 = v78;
              v204[0] = v67;
              v204[1] = v69;
              v204[2] = v71;
              v88 = (*(uint64_t (**)(void *, _QWORD *, void *))(*(_QWORD *)a8 + 16))(a8, v204, a9);
              if ((v88 & 0xFF00000000) != 0)
                v84 = *(float *)&v88;
              v78 = v87;
              v83 = v86;
              v75 = v85;
              v81 = v191;
              v73 = v192;
            }
            v89 = (v73 - v79) / v81;
            v90 = (v83 - v75 + v78) / v83;
            v92 = (float *)v17->_points.__end_;
            value = (unint64_t)v17->_points.__end_cap_.__value_;
            if ((unint64_t)v92 >= value)
            {
              v94 = (float *)v17->_points.__begin_;
              v95 = 0xAAAAAAAAAAAAAAABLL * (v92 - v94) + 1;
              if (v95 > 0x1555555555555555)
                abort();
              v96 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value - (_QWORD)v94) >> 2);
              if (2 * v96 > v95)
                v95 = 2 * v96;
              if (v96 >= 0xAAAAAAAAAAAAAAALL)
                v97 = 0x1555555555555555;
              else
                v97 = v95;
              if (v97)
              {
                if (v97 > 0x1555555555555555)
                  goto LABEL_176;
                v98 = (char *)operator new(12 * v97);
              }
              else
              {
                v98 = 0;
              }
              v99 = (float *)&v98[4 * (v92 - v94)];
              *v99 = v89;
              v99[1] = v90;
              v99[2] = v84;
              v100 = v99;
              if (v92 != v94)
              {
                do
                {
                  v101 = *(_QWORD *)(v92 - 3);
                  v92 -= 3;
                  v102 = *((_DWORD *)v92 + 2);
                  *(_QWORD *)(v100 - 3) = v101;
                  v100 -= 3;
                  *((_DWORD *)v100 + 2) = v102;
                }
                while (v92 != v94);
                v92 = (float *)v17->_points.__begin_;
              }
              v93 = v99 + 3;
              v17->_points.__begin_ = v100;
              v17->_points.__end_ = v99 + 3;
              v17->_points.__end_cap_.__value_ = &v98[12 * v97];
              if (v92)
                operator delete(v92);
            }
            else
            {
              *v92 = v89;
              v92[1] = v90;
              v93 = v92 + 3;
              v92[2] = v84;
            }
            v17->_points.__end_ = v93;
            v103 = objc_msgSend(v64, "routeCoordinateAt:", v63);
            v104 = v103;
            v105 = HIDWORD(v103);
            v106 = *((float *)&v103 + 1);
            v108 = (float *)v17->_polylineCoordinates.__end_;
            v107 = (unint64_t)v17->_polylineCoordinates.__end_cap_.__value_;
            if ((unint64_t)v108 < v107)
            {
              *(_QWORD *)v108 = v103;
              v60 = v195;
              if (*((float *)&v103 + 1) >= 1.0)
              {
                *(_DWORD *)v108 = vcvtms_u32_f32(*((float *)&v103 + 1)) + v103;
                v108[1] = *((float *)&v103 + 1) - floorf(*((float *)&v103 + 1));
              }
              v65 = (PolylineCoordinate *)(v108 + 2);
              v15 = v197;
              goto LABEL_53;
            }
            v109 = (float *)v17->_polylineCoordinates.__begin_;
            v110 = ((char *)v108 - (char *)v109) >> 3;
            v111 = v110 + 1;
            if ((unint64_t)(v110 + 1) >> 61)
              abort();
            v112 = v107 - (_QWORD)v109;
            if (v112 >> 2 > v111)
              v111 = v112 >> 2;
            if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFF8)
              v113 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v113 = v111;
            if (v113 >> 61)
              goto LABEL_176;
            v114 = (char *)operator new(8 * v113);
            v115 = (float *)&v114[8 * v110];
            *(_DWORD *)v115 = v104;
            *((_DWORD *)v115 + 1) = v105;
            if (v106 >= 1.0)
            {
              *(_DWORD *)v115 = vcvtms_u32_f32(v106) + v104;
              v115[1] = v106 - floorf(v106);
            }
            if (v108 != v109)
            {
              v116 = (char *)(v108 - 2) - (char *)v109;
              if (v116 < 0x58)
              {
                v117 = (float *)&v114[8 * v110];
                goto LABEL_99;
              }
              v117 = (float *)&v114[8 * v110];
              if ((unint64_t)((char *)v109 - v114) < 0x20)
                goto LABEL_184;
              v118 = (v116 >> 3) + 1;
              v119 = &v114[8 * v110 - 16];
              v120 = v108 - 4;
              v121 = v118 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v122 = *(_OWORD *)v120;
                *((_OWORD *)v119 - 1) = *((_OWORD *)v120 - 1);
                *(_OWORD *)v119 = v122;
                v119 -= 32;
                v120 -= 8;
                v121 -= 4;
              }
              while (v121);
              v117 = &v115[-2 * (v118 & 0x3FFFFFFFFFFFFFFCLL)];
              v108 -= 2 * (v118 & 0x3FFFFFFFFFFFFFFCLL);
              if (v118 != (v118 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_184:
                do
                {
LABEL_99:
                  v123 = *((_QWORD *)v108 - 1);
                  v108 -= 2;
                  *((_QWORD *)v117 - 1) = v123;
                  v117 -= 2;
                }
                while (v108 != v109);
              }
              v108 = v109;
              v15 = v197;
              goto LABEL_101;
            }
            v117 = (float *)&v114[8 * v110];
            v15 = v197;
LABEL_101:
            v65 = (PolylineCoordinate *)(v115 + 2);
            v17->_polylineCoordinates.__begin_ = (PolylineCoordinate *)v117;
            v17->_polylineCoordinates.__end_ = (PolylineCoordinate *)(v115 + 2);
            v17->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v114[8 * v113];
            if (v108)
              operator delete(v108);
            v60 = v195;
LABEL_53:
            v17->_polylineCoordinates.__end_ = v65;
            ++v63;
          }
          ++v189;
        }
        while (v189 != v60);
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v208, v216, 16);
        if (!v60)
        {
LABEL_105:

          goto LABEL_174;
        }
      }
    }
    if (!(v21 >> 61))
    {
      v33 = v17->_polylineCoordinates.__end_;
      v34 = (char *)operator new(8 * v21);
      v35 = (char *)v33 - v32;
      v36 = (PolylineCoordinate *)&v34[((char *)v33 - v32) & 0xFFFFFFFFFFFFFFF8];
      v37 = (char *)v36;
      if (v33 == (PolylineCoordinate *)v32)
        goto LABEL_37;
      if ((unint64_t)(v35 - 8) >= 0x58)
      {
        v37 = &v34[((char *)v33 - v32) & 0xFFFFFFFFFFFFFFF8];
        if ((char *)v33 - v34 - (v35 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
        {
          v53 = v35 >> 3;
          v54 = ((unint64_t)(v35 - 8) >> 3) + 1;
          v55 = &v34[8 * v53 - 16];
          v56 = v33 - 2;
          v57 = v54 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v58 = *(_OWORD *)&v56->index;
            *((_OWORD *)v55 - 1) = *(_OWORD *)&v56[-2].index;
            *(_OWORD *)v55 = v58;
            v55 -= 32;
            v56 -= 4;
            v57 -= 4;
          }
          while (v57);
          v37 = (char *)&v36[-(v54 & 0x3FFFFFFFFFFFFFFCLL)];
          v33 -= v54 & 0x3FFFFFFFFFFFFFFCLL;
          if (v54 == (v54 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_37:
            v17->_polylineCoordinates.__begin_ = (PolylineCoordinate *)v37;
            v17->_polylineCoordinates.__end_ = v36;
            v17->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v34[8 * v21];
            if (v32)
              operator delete(v32);
            goto LABEL_39;
          }
        }
      }
      else
      {
        v37 = &v34[((char *)v33 - v32) & 0xFFFFFFFFFFFFFFF8];
      }
      do
      {
        v59 = v33[-1];
        --v33;
        *((PolylineCoordinate *)v37 - 1) = v59;
        v37 -= 8;
      }
      while (v33 != (PolylineCoordinate *)v32);
      goto LABEL_37;
    }
LABEL_181:
    abort();
  }
  v38 = objc_msgSend(v15, "startPointIndex");
  v39 = a6 - a5 + 1;
  v40 = (char *)v17->_points.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v17->_points.__end_cap_.__value_ - (char *)v40) >> 2) < v39)
  {
    v41 = (char *)v17->_points.__end_;
    v42 = (char *)operator new(12 * v39);
    v43 = &v42[12 * ((v41 - v40) / 12)];
    v44 = v43;
    if (v41 != v40)
    {
      v44 = &v42[12 * ((v41 - v40) / 12)];
      do
      {
        v45 = *(_QWORD *)(v41 - 12);
        v41 -= 12;
        v46 = *((_DWORD *)v41 + 2);
        *(_QWORD *)(v44 - 12) = v45;
        v44 -= 12;
        *((_DWORD *)v44 + 2) = v46;
      }
      while (v41 != v40);
    }
    v17->_points.__begin_ = v44;
    v17->_points.__end_ = v43;
    v17->_points.__end_cap_.__value_ = &v42[12 * v39];
    if (v40)
      operator delete(v40);
  }
  v47 = v17->_polylineCoordinates.__begin_;
  if (v39 > v17->_polylineCoordinates.__end_cap_.__value_ - v47)
  {
    v48 = v17->_polylineCoordinates.__end_;
    v49 = (char *)operator new(8 * v39);
    v50 = (char *)v48 - (char *)v47;
    v51 = (PolylineCoordinate *)&v49[((char *)v48 - (char *)v47) & 0xFFFFFFFFFFFFFFF8];
    v52 = (char *)v51;
    if (v48 == v47)
      goto LABEL_111;
    if ((unint64_t)(v50 - 8) >= 0x58)
    {
      v52 = &v49[((char *)v48 - (char *)v47) & 0xFFFFFFFFFFFFFFF8];
      if ((char *)v48 - v49 - (v50 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        v124 = v50 >> 3;
        v125 = ((unint64_t)(v50 - 8) >> 3) + 1;
        v126 = &v49[8 * v124 - 16];
        v127 = v48 - 2;
        v128 = v125 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v129 = *(_OWORD *)&v127->index;
          *((_OWORD *)v126 - 1) = *(_OWORD *)&v127[-2].index;
          *(_OWORD *)v126 = v129;
          v126 -= 32;
          v127 -= 4;
          v128 -= 4;
        }
        while (v128);
        v52 = (char *)&v51[-(v125 & 0x3FFFFFFFFFFFFFFCLL)];
        v48 -= v125 & 0x3FFFFFFFFFFFFFFCLL;
        if (v125 == (v125 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_111:
          v17->_polylineCoordinates.__begin_ = (PolylineCoordinate *)v52;
          v17->_polylineCoordinates.__end_ = v51;
          v17->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v49[8 * v39];
          if (v47)
            operator delete(v47);
          goto LABEL_113;
        }
      }
    }
    else
    {
      v52 = &v49[((char *)v48 - (char *)v47) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v130 = v48[-1];
      --v48;
      *((PolylineCoordinate *)v52 - 1) = v130;
      v52 -= 8;
    }
    while (v48 != v47);
    goto LABEL_111;
  }
LABEL_113:
  v196 = a5;
  if ((_DWORD)v39)
  {
    v131 = 0;
    v132 = a5 - v38;
    if (a8)
      v133 = a9 == 0;
    else
      v133 = 1;
    v134 = !v133;
    v194 = v134;
    while (1)
    {
      v137 = objc_msgSend(v15, "points") + 12 * (v132 + v131);
      v139 = *(_DWORD *)v137;
      v138 = *(_DWORD *)(v137 + 4);
      v140 = *(float *)(v137 + 8);
      if (v194)
      {
        v15 = v197;
        if (v197)
        {
          objc_msgSend(v197, "bounds");
        }
        else
        {
          v202 = 0u;
          v203 = 0u;
          v201 = 0u;
        }
        GEOCoordinate3DForMapPoint();
        v142 = v141;
        v200[0] = v143;
        v200[1] = v144;
        *(double *)&v200[2] = v141;
        v145 = (*(uint64_t (**)(void *, _QWORD *, void *))(*(_QWORD *)a8 + 16))(a8, v200, a9);
        v146 = (v145 & 0xFF00000000) != 0 ? *(float *)&v145 : v142;
        if (v197)
        {
          objc_msgSend(v197, "bounds");
          v147 = v199;
          objc_msgSend(v197, "bounds");
          v148 = v198;
        }
        else
        {
          v148 = 0.0;
          v147 = 0.0;
        }
        v140 = (v146 - v147) / v148;
      }
      else
      {
        v15 = v197;
      }
      v150 = v17->_points.__end_;
      v149 = (unint64_t)v17->_points.__end_cap_.__value_;
      if ((unint64_t)v150 >= v149)
      {
        v152 = v17->_points.__begin_;
        v153 = 0xAAAAAAAAAAAAAAABLL * (v150 - v152) + 1;
        if (v153 > 0x1555555555555555)
          abort();
        v154 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v149 - (_QWORD)v152) >> 2);
        if (2 * v154 > v153)
          v153 = 2 * v154;
        v155 = v154 >= 0xAAAAAAAAAAAAAAALL ? 0x1555555555555555 : v153;
        if (v155)
        {
          if (v155 > 0x1555555555555555)
            goto LABEL_176;
          v156 = (char *)operator new(12 * v155);
        }
        else
        {
          v156 = 0;
        }
        v157 = &v156[4 * (v150 - v152)];
        *(_DWORD *)v157 = v139;
        *((_DWORD *)v157 + 1) = v138;
        *((float *)v157 + 2) = v140;
        v158 = v157;
        if (v150 != v152)
        {
          do
          {
            v159 = *(_QWORD *)(v150 - 3);
            v150 -= 3;
            v160 = v150[2];
            *(_QWORD *)(v158 - 12) = v159;
            v158 -= 12;
            *((_DWORD *)v158 + 2) = v160;
          }
          while (v150 != v152);
          v150 = v17->_points.__begin_;
        }
        v151 = v157 + 12;
        v17->_points.__begin_ = v158;
        v17->_points.__end_ = v157 + 12;
        v17->_points.__end_cap_.__value_ = &v156[12 * v155];
        if (v150)
          operator delete(v150);
        v15 = v197;
      }
      else
      {
        *v150 = v139;
        v150[1] = v138;
        v151 = v150 + 3;
        *((float *)v150 + 2) = v140;
      }
      v17->_points.__end_ = v151;
      v161 = v131 + v196;
      v163 = (char *)v17->_polylineCoordinates.__end_;
      v162 = (unint64_t)v17->_polylineCoordinates.__end_cap_.__value_;
      if ((unint64_t)v163 >= v162)
        break;
      *(_DWORD *)v163 = v161;
      *((_DWORD *)v163 + 1) = 0;
      v135 = (PolylineCoordinate *)(v163 + 8);
      v136 = v39;
LABEL_122:
      v17->_polylineCoordinates.__end_ = v135;
      if (++v131 == v136)
        goto LABEL_174;
    }
    v164 = (char *)v17->_polylineCoordinates.__begin_;
    v165 = (v163 - v164) >> 3;
    v166 = v165 + 1;
    if ((unint64_t)(v165 + 1) >> 61)
      abort();
    v167 = v162 - (_QWORD)v164;
    if (v167 >> 2 > v166)
      v166 = v167 >> 2;
    if ((unint64_t)v167 >= 0x7FFFFFFFFFFFFFF8)
      v168 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v168 = v166;
    if (v168 >> 61)
LABEL_176:
      std::__throw_bad_array_new_length[abi:nn180100]();
    v169 = operator new(8 * v168);
    v170 = (PolylineCoordinate *)&v169[8 * v165];
    v170->index = v161;
    v170->offset = 0.0;
    v171 = v163 - v164;
    if (v163 == v164)
    {
      v164 = v163;
      v173 = (PolylineCoordinate *)&v169[8 * v165];
      v136 = v39;
    }
    else
    {
      v172 = v171 - 8;
      v136 = v39;
      if ((unint64_t)(v171 - 8) < 0x58)
      {
        v173 = (PolylineCoordinate *)&v169[8 * v165];
        goto LABEL_169;
      }
      v173 = (PolylineCoordinate *)&v169[8 * v165];
      if ((unint64_t)(v164 - v169) < 0x20)
        goto LABEL_185;
      v174 = (v172 >> 3) + 1;
      v175 = &v169[8 * v165 - 16];
      v176 = v163 - 16;
      v177 = v174 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v178 = *(_OWORD *)v176;
        *(v175 - 1) = *((_OWORD *)v176 - 1);
        *v175 = v178;
        v175 -= 2;
        v176 -= 32;
        v177 -= 4;
      }
      while (v177);
      v173 = &v170[-(v174 & 0x3FFFFFFFFFFFFFFCLL)];
      v163 -= 8 * (v174 & 0x3FFFFFFFFFFFFFFCLL);
      if (v174 != (v174 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_185:
        do
        {
LABEL_169:
          v179 = (PolylineCoordinate)*((_QWORD *)v163 - 1);
          v163 -= 8;
          v173[-1] = v179;
          --v173;
        }
        while (v163 != v164);
        v164 = (char *)v17->_polylineCoordinates.__begin_;
      }
    }
    v135 = v170 + 1;
    v17->_polylineCoordinates.__begin_ = v173;
    v17->_polylineCoordinates.__end_ = v170 + 1;
    v17->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v169[8 * v168];
    if (v164)
      operator delete(v164);
    v15 = v197;
    goto LABEL_122;
  }
LABEL_174:
  objc_msgSend(v15, "lengthScaleFactor");
  v17->_sectionLengthScaleFactor = v180;
  objc_msgSend(v184, "stepDistanceFromPoint:toPoint:", 0, *(_QWORD *)&v17->_routeStart);
  v17->_startDistance = v181;

LABEL_175:
  return v17;
}

- (const)gradientTrafficAtIndex:(unsigned int)a3
{
  return &self->_gradientTraffic;
}

- (unsigned)pointCount
{
  return -1431655765 * ((unint64_t)((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 2);
}

- (void)points
{
  return self->_points.__begin_;
}

- (const)polylineCoordinates
{
  return &self->_polylineCoordinates;
}

- (float)laneHalfWidthAtIndex:(unsigned int)a3
{
  return 1.85;
}

- (BOOL)hasCompletedMapMatching
{
  return self->_matchedPathSegments != 0;
}

- (BOOL)isMapMatched
{
  return self->_matchedPathSegments != 0;
}

- (Matrix<float,)convertCoordinateToTile:(id *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  Matrix<float, 3, 1> result;

  GEOMapPoint3DForCoordinate();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bounds");
    v12 = v25;
    v13 = v24;
    v15 = v27;
    v14 = v26;
    v16 = v29;
    v17 = v28;
  }
  else
  {
    v16 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    v13 = 0.0;
  }
  v18 = (v5 - v13) / v15;
  v19 = (v17 - v7 + v12) / v17;
  v20 = (v9 - v14) / v16;

  v21 = v18;
  v22 = v19;
  v23 = v20;
  result._e[2] = v23;
  result._e[1] = v22;
  result._e[0] = v21;
  return result;
}

- (id)description
{
  const char *v2;

  if (self->_matchedPathSegments)
    v2 = "yes";
  else
    v2 = "no";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<VKPolylinePath %p>: %f - %f, snappedPath:%s"), self, (float)(self->_routeStart.offset + (float)self->_routeStart.index), (float)(self->_routeEnd.offset + (float)self->_routeEnd.index), v2);
}

- (PolylineCoordinate)routeStart
{
  return self->_routeStart;
}

- (void)setRouteStart:(PolylineCoordinate)a3
{
  self->_routeStart = a3;
}

- (PolylineCoordinate)routeEnd
{
  return self->_routeEnd;
}

- (void)setRouteEnd:(PolylineCoordinate)a3
{
  self->_routeEnd = a3;
}

- (GEOComposedRouteSection)section
{
  return (GEOComposedRouteSection *)objc_loadWeakRetained((id *)&self->_section);
}

- (NSArray)matchedPathSegments
{
  return self->_matchedPathSegments;
}

- (double)startDistance
{
  return self->_startDistance;
}

- (void)setStartDistance:(double)a3
{
  self->_startDistance = a3;
}

- (void).cxx_destruct
{
  PolylineCoordinate *begin;
  void *v4;

  begin = self->_polylineCoordinates.__begin_;
  if (begin)
  {
    self->_polylineCoordinates.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_points.__begin_;
  if (v4)
  {
    self->_points.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_matchedPathSegments, 0);
  objc_destroyWeak((id *)&self->_section);
  objc_destroyWeak((id *)&self->_overlay);
}

- (id).cxx_construct
{
  *(_QWORD *)((char *)self + 84) = 0xBF80000000000000;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *(_QWORD *)((char *)self + 92) = 0xBF80000000000000;
  return self;
}

@end
