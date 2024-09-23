@implementation PAEColorCurveChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEColorCurveChannelData)init
{
  PAEColorCurveChannelData *v2;
  _anonymous_namespace_::_Private *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEColorCurveChannelData;
  v2 = -[PAEColorCurveChannelData init](&v5, sel_init);
  if (v2)
  {
    v3 = (_anonymous_namespace_::_Private *)operator new();
    v2->_curve_private = v3;
  }
  return v2;
}

- (PAEColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  PAEColorCurveChannelData *v8;
  _anonymous_namespace_::_Private *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEColorCurveChannelData;
  v8 = -[PAEColorCurveChannelData init](&v11, sel_init);
  if (v8)
  {
    v9 = (_anonymous_namespace_::_Private *)operator new();
    v8->_curve_private = v9;
  }
  return v8;
}

+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:", a3, a4, a5);
}

- (PAEColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6
{
  PAEColorCurveChannelData *v10;
  uint64_t v11;
  uint64_t v12;
  void (***v13)(_QWORD);
  void (***v14)(_QWORD);
  void (***v15)(_QWORD);
  void (**v16)(_QWORD);
  BOOL v17;
  void (***v18)(_QWORD);
  uint64_t v19;
  void (***v20)(_QWORD);
  void (***v21)(_QWORD);
  void (**v22)(_QWORD);
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PAEColorCurveChannelData;
  v10 = -[PAEColorCurveChannelData init](&v24, sel_init);
  if (v10)
  {
    v11 = operator new();
    v10->_curve_private = (void *)v11;
    v13 = *(void (****)(_QWORD))(v11 + 8);
    v12 = *(_QWORD *)(v11 + 16);
    if ((void (***)(_QWORD))v12 != v13)
    {
      v14 = (void (***)(_QWORD))(v12 - 24);
      v15 = (void (***)(_QWORD))(v12 - 24);
      do
      {
        v16 = *v15;
        v15 -= 3;
        (*v16)(v14);
        v17 = v14 == v13;
        v14 = v15;
      }
      while (!v17);
      v12 = *(_QWORD *)(v11 + 8);
    }
    *(_QWORD *)(v11 + 16) = v13;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)(v11 + 8), v12, *((_QWORD *)a6 + 1), *((_QWORD *)a6 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 2) - *((_QWORD *)a6 + 1)) >> 3));
    v18 = *(void (****)(_QWORD))(v11 + 72);
    *(_OWORD *)(v11 + 40) = *(_OWORD *)((char *)a6 + 40);
    *(_QWORD *)(v11 + 56) = *((_QWORD *)a6 + 7);
    v19 = *(_QWORD *)(v11 + 80);
    if ((void (***)(_QWORD))v19 != v18)
    {
      v20 = (void (***)(_QWORD))(v19 - 24);
      v21 = (void (***)(_QWORD))(v19 - 24);
      do
      {
        v22 = *v21;
        v21 -= 3;
        (*v22)(v20);
        v17 = v20 == v18;
        v20 = v21;
      }
      while (!v17);
      v19 = *(_QWORD *)(v11 + 72);
    }
    *(_QWORD *)(v11 + 80) = v18;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)(v11 + 72), v19, *((_QWORD *)a6 + 9), *((_QWORD *)a6 + 10), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 10) - *((_QWORD *)a6 + 9)) >> 3));
  }
  return v10;
}

+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:curve:", a6, a3, a4, a5);
}

- (void)dealloc
{
  char *curve_private;
  objc_super v4;
  void **v5;

  curve_private = (char *)self->_curve_private;
  if (curve_private)
  {
    *((_QWORD *)curve_private + 15) = &unk_1E64E25A0;
    *((_QWORD *)curve_private + 19) = &unk_1E64E25E0;
    v5 = (void **)(curve_private + 192);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 128);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(_QWORD *)curve_private = &unk_1E64E25A0;
    *((_QWORD *)curve_private + 4) = &unk_1E64E25E0;
    v5 = (void **)(curve_private + 72);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 8);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1B5E29170](curve_private, 0x10A0C4009AD4094);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEColorCurveChannelData;
  -[PAEColorCurveChannelData dealloc](&v4, sel_dealloc);
}

- (void)curveRef
{
  return self->_curve_private;
}

- (double)red
{
  return *((double *)self->_curve_private + 5);
}

- (double)green
{
  return *((double *)self->_curve_private + 6);
}

- (double)blue
{
  return *((double *)self->_curve_private + 7);
}

- (BOOL)isAtDefaults
{
  double *curve_private;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  double *v7;
  uint64_t v8;
  _BOOL4 v9;
  double v10;
  _BOOL4 v11;
  BOOL v12;

  curve_private = (double *)self->_curve_private;
  if (curve_private[5] == curve_private[20]
    && curve_private[6] == curve_private[21]
    && curve_private[7] == curve_private[22]
    && (v4 = *((_QWORD *)curve_private + 9),
        v3 = *((_QWORD *)curve_private + 10),
        v6 = (char *)(curve_private + 24),
        v5 = *((_QWORD *)curve_private + 24),
        v3 - v4 == *((_QWORD *)v6 + 1) - v5))
  {
    if (v4 == v3)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      v7 = (double *)(v5 + 16);
      v8 = v4 + 24;
      do
      {
        v9 = *(double *)(v8 - 16) == *(v7 - 1);
        v10 = *v7;
        v7 += 3;
        v11 = *(double *)(v8 - 8) == v10 && v9;
        v12 = !v11 || v8 == v3;
        v8 += 24;
      }
      while (!v12);
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void)reset
{
  char *curve_private;
  uint64_t *v3;
  void (***v4)(_QWORD);
  uint64_t v5;
  void (***v6)(_QWORD);
  void (***v7)(_QWORD);
  void (**v8)(_QWORD);
  BOOL v9;
  void (***v10)(_QWORD);
  uint64_t v11;
  void (***v12)(_QWORD);
  void (***v13)(_QWORD);
  void (**v14)(_QWORD);

  curve_private = (char *)self->_curve_private;
  v3 = (uint64_t *)(curve_private + 8);
  v4 = (void (***)(_QWORD))*((_QWORD *)curve_private + 1);
  v5 = *((_QWORD *)curve_private + 2);
  if ((void (***)(_QWORD))v5 != v4)
  {
    v6 = (void (***)(_QWORD))(v5 - 24);
    v7 = (void (***)(_QWORD))(v5 - 24);
    do
    {
      v8 = *v7;
      v7 -= 3;
      (*v8)(v6);
      v9 = v6 == v4;
      v6 = v7;
    }
    while (!v9);
    v5 = *v3;
  }
  *((_QWORD *)curve_private + 2) = v4;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v3, v5, *((_QWORD *)curve_private + 16), *((_QWORD *)curve_private + 17), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 17) - *((_QWORD *)curve_private + 16)) >> 3));
  v10 = (void (***)(_QWORD))*((_QWORD *)curve_private + 9);
  *(_OWORD *)(curve_private + 40) = *((_OWORD *)curve_private + 10);
  *((_QWORD *)curve_private + 7) = *((_QWORD *)curve_private + 22);
  v11 = *((_QWORD *)curve_private + 10);
  if ((void (***)(_QWORD))v11 != v10)
  {
    v12 = (void (***)(_QWORD))(v11 - 24);
    v13 = (void (***)(_QWORD))(v11 - 24);
    do
    {
      v14 = *v13;
      v13 -= 3;
      (*v14)(v12);
      v9 = v12 == v10;
      v12 = v13;
    }
    while (!v9);
    v11 = *((_QWORD *)curve_private + 9);
  }
  *((_QWORD *)curve_private + 10) = v10;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)curve_private + 9, v11, *((_QWORD *)curve_private + 24), *((_QWORD *)curve_private + 25), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 25) - *((_QWORD *)curve_private + 24)) >> 3));
}

- (double)evaluate:(double)a3
{
  double result;
  double v4;

  v4 = a3;
  (*(void (**)(void *, double *))(*(_QWORD *)self->_curve_private + 24))(self->_curve_private, &v4);
  return result;
}

- (PAEColorCurveChannelData)initWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (***v15)(_QWORD);
  uint64_t v16;
  void (***v17)(_QWORD);
  void (***v18)(_QWORD);
  void (***v19)(_QWORD);
  void (**v20)(_QWORD);
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  double *v46;
  unint64_t v47;
  _QWORD *v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  double *j;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  BOOL v77;
  uint64_t v78;
  double *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  double *v92;
  unint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  PAEColorCurveChannelData *v115;
  _QWORD *v116;
  id obj;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  objc_super v122;
  _QWORD v123[5];
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v122.receiver = self;
  v122.super_class = (Class)PAEColorCurveChannelData;
  v115 = -[PAEColorCurveChannelData init](&v122, sel_init);
  if (v115)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("defaultRed"));
    v5 = v4;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("defaultGreen"));
    v7 = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("defaultBlue"));
    v9 = v8;
    v10 = (_QWORD *)operator new();
    v115->_curve_private = v10;
    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    obj = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), CFSTR("points"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("red"));
    v10[5] = v13;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("green"));
    v10[6] = v14;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("blue"));
    v15 = (void (***)(_QWORD))v10[1];
    v10[7] = v16;
    v116 = v10 + 1;
    v17 = (void (***)(_QWORD))v10[2];
    if (v17 != v15)
    {
      v18 = v17 - 3;
      v19 = v17 - 3;
      do
      {
        v20 = *v19;
        v19 -= 3;
        (*v20)(v18);
        v77 = v18 == v15;
        v18 = v19;
      }
      while (!v77);
    }
    v10[2] = v15;
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v119;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v119 != v22)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * i), "CGPointValue");
          v26 = v24;
          v27 = v25;
          v29 = (_QWORD *)v10[2];
          v28 = v10[3];
          if ((unint64_t)v29 >= v28)
          {
            v31 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v29 - *v116) >> 3);
            v32 = v31 + 1;
            if (v31 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - *v116) >> 3);
            if (2 * v33 > v32)
              v32 = 2 * v33;
            if (v33 >= 0x555555555555555)
              v34 = 0xAAAAAAAAAAAAAAALL;
            else
              v34 = v32;
            v123[4] = v10 + 3;
            v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)(v10 + 3), v34);
            v37 = &v35[24 * v31];
            *(_QWORD *)v37 = &unk_1E64DA950;
            *((_QWORD *)v37 + 1) = v26;
            *((_QWORD *)v37 + 2) = v27;
            v39 = v10[1];
            v38 = v10[2];
            if (v38 == v39)
            {
              v41 = &v35[24 * v31];
            }
            else
            {
              v40 = v10[2];
              v41 = &v35[24 * v31];
              do
              {
                *((_QWORD *)v41 - 3) = &unk_1E64DA950;
                v41 -= 24;
                *(_OWORD *)(v41 + 8) = *(_OWORD *)(v40 - 16);
                v40 -= 24;
              }
              while (v40 != v39);
            }
            v30 = v37 + 24;
            v10[1] = v41;
            v10[2] = v37 + 24;
            v42 = v10[3];
            v10[3] = &v35[24 * v36];
            v123[2] = v38;
            v123[3] = v42;
            v123[0] = v39;
            v123[1] = v39;
            std::__split_buffer<cc::point_t<double,false,false>>::~__split_buffer((uint64_t)v123);
          }
          else
          {
            *v29 = &unk_1E64DA950;
            v30 = v29 + 3;
            v29[1] = v24;
            v29[2] = v25;
          }
          v10[2] = v30;
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
      }
      while (v21);
    }
    v43 = v10[1];
    v44 = v10[2];
    v45 = 0xAAAAAAAAAAAAAAABLL * ((v44 - v43) >> 3);
    if (v45 <= 1)
    {
      std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v10 + 9), 4uLL);
      return v115;
    }
    if (v45 > 0x5555555555555554)
      return v115;
    v46 = (double *)(v44 - 24);
    if (v44 - 24 == v43)
      v47 = v44 - 24;
    else
      v47 = v44 - 48;
    v48 = v10 + 9;
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v10 + 9), ((v44 - v43) >> 3) - 2);
    v49 = (double *)v10[1];
    if (v49 != v46)
    {
      v50 = 0;
      v51 = *v48 + 32;
      for (j = (double *)v10[1]; j != v46; j += 3)
      {
        v53 = j[4];
        v54 = j[5];
        v55 = j[1];
        v56 = j[2];
        v57 = v53 - v55;
        if (v53 - v55 < 0.0)
          v57 = -(v53 - v55);
        if (v57 < 0.0)
          v57 = -v57;
        v58 = v57 * 0.3334;
        v59 = (double *)(v51 + v50);
        *(v59 - 3) = v55;
        *(v59 - 2) = v56;
        if (v50)
        {
          v60 = v53 - *(j - 2);
          v61 = -v60;
          if (v60 >= 0.0)
            v61 = v53 - *(j - 2);
          v62 = (v54 - *(j - 1)) / v60;
          if (v61 < 0.00000011920929)
            v62 = 0.0;
          v63 = v58 * v62;
          v64 = v58 + j[1];
          v65 = j[2] + v63;
          *v59 = v64;
          v59[1] = v65;
          if ((unint64_t)j >= v47)
            goto LABEL_49;
        }
        else if ((unint64_t)j >= v47)
        {
          v64 = j[1];
          v65 = j[2];
LABEL_49:
          v66 = v53 - v64;
          v67 = v54 - v65;
          goto LABEL_50;
        }
        v66 = j[7] - j[1];
        v67 = j[8] - j[2];
LABEL_50:
        v68 = -v66;
        if (v66 >= 0.0)
          v68 = v66;
        v69 = v67 / v66;
        if (v68 < 0.00000011920929)
          v69 = 0.0;
        v70 = v53 - v58;
        v71 = v54 - v58 * v69;
        v72 = (double *)(v51 + v50);
        v72[3] = v70;
        v72[4] = v71;
        if (!v50)
        {
          v73 = v70 - j[1];
          v74 = v71 - j[2];
          v75 = -v73;
          if (v73 >= 0.0)
            v75 = v73;
          v76 = v74 / v73;
          if (v75 < 0.00000011920929)
            v76 = 0.0;
          *v72 = v58 + v55;
          v72[1] = v56 + v58 * v76;
        }
        v50 += 72;
      }
    }
    *(_OWORD *)(v10[10] - 16) = *(_OWORD *)(v44 - 16);
    v77 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10[2] - (_QWORD)v49) >> 3) < 3 || v49 == v46;
    if (!v77)
    {
      v78 = 0;
      v79 = (double *)(*v48 + 64);
      do
      {
        v80 = v49[v78 + 5];
        v81 = v49[v78 + 2];
        v82 = v49[v78 + 4] - v49[v78 + 1];
        v83 = -v82;
        if (v82 >= 0.0)
          v83 = v49[v78 + 4] - v49[v78 + 1];
        v84 = v80 - v81;
        v85 = -(v80 - v81);
        if (v84 >= 0.0)
          v85 = v84;
        v86 = 1.0;
        if (v85 > 0.00000011920929)
        {
          v86 = 0.0;
          if (v83 > 0.00000011920929)
          {
            v87 = v85 / v83 * -3.0 + 1.0;
            if (v87 >= 0.0)
            {
              v86 = 1.0;
              if (v87 <= 1.0)
                v86 = v87;
            }
          }
        }
        v88 = v86 * *(v79 - 6);
        v89 = 1.0 - v86;
        *(v79 - 3) = v88 + (1.0 - v86) * *(v79 - 3);
        v90 = v86 * v79[3];
        *v79 = v90 + v89 * *v79;
        if (&v49[v78] != (double *)v47)
          v79[6] = v90 + v89 * v79[6];
        if (v78 * 8)
          *(v79 - 9) = v88 + v89 * *(v79 - 9);
        v78 += 3;
        v79 += 9;
      }
      while (&v49[v78] != v46);
      v91 = 0;
      v92 = (double *)(*v48 + 56);
      do
      {
        v93 = (unint64_t)&v49[v91];
        v94 = v49[v91 + 5];
        v95 = v49[v91 + 2];
        v96 = v49[v91 + 4] - v49[v91 + 1];
        if (v96 < 0.0)
          v96 = -v96;
        v97 = v94 - v95;
        if (v94 - v95 < 0.0)
          v97 = -(v94 - v95);
        v98 = 1.0;
        if (v96 > 0.00000011920929)
        {
          v98 = 0.0;
          if (v97 > 0.00000011920929)
            v98 = v96 / v97 * -3.0 + 1.0;
        }
        if (v98 * 0.25 <= 1.0)
          v99 = v98 * 0.25;
        else
          v99 = 1.0;
        if (v98 * 0.25 >= 0.0)
          v100 = v99;
        else
          v100 = 0.0;
        v101 = *(v92 - 6) * v100;
        v102 = 1.0 - v100;
        *(v92 - 3) = v101 + *(v92 - 3) * (1.0 - v100);
        v103 = v100 * v92[3];
        *v92 = v103 + (1.0 - v100) * *v92;
        if (v93 < v47)
          v92[6] = v103 + v102 * v92[6];
        if (v91 * 8)
          *(v92 - 9) = v101 + v102 * *(v92 - 9);
        if (v94 < v95)
        {
          if (v93 < v47)
          {
            v104 = v92[4];
            v105 = v92[1];
            v106 = v104 - v105;
            if (v104 - v105 < 0.0)
              v106 = -(v104 - v105);
            v92[1] = v102 * v105 + v100 * (v104 + v106);
            v107 = v92[7];
            v108 = v104 - v107;
            if (v104 - v107 > 0.0)
              v108 = -(v104 - v107);
            v92[7] = v102 * v107 + v100 * (v104 + v108);
          }
          if (v91 * 8)
          {
            v109 = *(v92 - 5);
            v110 = *(v92 - 8);
            v111 = v109 - v110;
            if (v109 - v110 < 0.0)
              v111 = -(v109 - v110);
            *(v92 - 8) = v102 * v110 + v100 * (v109 + v111);
            v112 = *(v92 - 2);
            v113 = v109 - v112;
            if (v109 - v112 > 0.0)
              v113 = -(v109 - v112);
            *(v92 - 2) = v102 * v112 + v100 * (v109 + v113);
          }
        }
        v91 += 3;
        v92 += 9;
      }
      while (&v49[v91] != v46);
    }
  }
  return v115;
}

- (void)encodeWithCoder:(id)a3
{
  double *curve_private;
  uint64_t i;
  id v6;

  curve_private = (double *)self->_curve_private;
  if (curve_private[5] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("red"));
  if (curve_private[6] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("green"));
  if (curve_private[7] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("blue"));
  if (curve_private[20] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("defaultRed"));
  if (curve_private[21] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("defaultGreen"));
  if (curve_private[22] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("defaultBlue"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 2) - *((_QWORD *)curve_private + 1)) >> 3));
  for (i = *((_QWORD *)curve_private + 1); i != *((_QWORD *)curve_private + 2); i += 24)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(i + 8), *(double *)(i + 16)));
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("points"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:curve:", self->_curve_private, *((double *)self->_curve_private + 20), *((double *)self->_curve_private + 21), *((double *)self->_curve_private + 22));
}

- (id)description
{
  _QWORD *curve_private;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t i;

  curve_private = self->_curve_private;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> red=%.3f, green=%.3f, blue=%.3f, pts={\n"), NSStringFromClass(v5), self, curve_private[5], curve_private[6], curve_private[7]);
  for (i = curve_private[1]; i != curve_private[2]; i += 24)
    v6 = (void *)objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("  %.3f, %.3f\n"), *(_QWORD *)(i + 8), *(_QWORD *)(i + 16));
  return (id)objc_msgSend(v6, "stringByAppendingString:", CFSTR("}"));
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  char *curve_private;
  double v6;
  uint64_t v7;
  void **v8;
  double v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  double v18;
  double v19;
  float64x2_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void **v27;
  void **v28;
  void **v29;
  char *v30;
  void **v31;
  double v32;
  unint64_t v33;
  double *v34;
  unint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  double *i;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v65;
  double *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  double *v79;
  unint64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  PAEColorCurveChannelData *v101;
  uint64_t *v103;
  float64x2_t v104;
  float64x2_t v105;
  double *v106;
  float64x2_t v107;
  void *v108;
  void **v109;
  void **v110;
  void **v111;
  void *v112;
  float64x2_t v113;
  double v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  double (*v120)(uint64_t, uint64_t);
  uint64_t v121;
  void **v122[7];

  curve_private = (char *)self->_curve_private;
  v6 = *((double *)curve_private + 7);
  v105 = *(float64x2_t *)(curve_private + 40);
  v7 = objc_msgSend(a3, "curveRef");
  v8 = 0;
  v104 = *(float64x2_t *)(v7 + 40);
  v9 = *(double *)(v7 + 56);
  v110 = 0;
  v111 = 0;
  v108 = &unk_1E64E25A0;
  v109 = 0;
  v112 = &unk_1E64E25E0;
  __asm { FMOV            V0.2D, #1.0 }
  v113 = _Q0;
  v116 = 0;
  v117 = 0;
  v114 = 1.0;
  v115 = &unk_1E64E2650;
  v118 = 0;
  v119 = &unk_1E64E2678;
  v120 = cc::curve::aspline::bezier_t<double,false>::evalNonPeriodic;
  v121 = 0;
  v15 = *((_QWORD *)curve_private + 1);
  v14 = *((_QWORD *)curve_private + 2);
  v106 = (double *)curve_private;
  v16 = *(_QWORD *)(v7 + 8);
  v17 = 0;
  if (v14 - v15 == *(_QWORD *)(v7 + 16) - v16 && v15 != v14)
  {
    v103 = &v116;
    v17 = 0;
    v18 = a4;
    v19 = (float)(1.0 - a4);
    do
    {
      v20 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(v16 + 8), v18), vmulq_n_f64(*(float64x2_t *)(v15 + 8), v19));
      if (v17 >= (char *)v111)
      {
        v107 = v20;
        v21 = 0xAAAAAAAAAAAAAAABLL * ((v17 - (char *)v109) >> 3);
        v22 = v21 + 1;
        if (v21 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (v111 - v109) > v22)
          v22 = 0x5555555555555556 * (v111 - v109);
        if (0xAAAAAAAAAAAAAAABLL * (v111 - v109) >= 0x555555555555555)
          v23 = 0xAAAAAAAAAAAAAAALL;
        else
          v23 = v22;
        v122[4] = (void **)&v111;
        v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)&v111, v23);
        v26 = &v24[24 * v21];
        *(_QWORD *)v26 = &unk_1E64DA950;
        *(float64x2_t *)(v26 + 8) = v107;
        v28 = v109;
        v27 = v110;
        if (v110 == v109)
        {
          v30 = &v24[24 * v21];
        }
        else
        {
          v29 = v110;
          v30 = &v24[24 * v21];
          do
          {
            *((_QWORD *)v30 - 3) = &unk_1E64DA950;
            v30 -= 24;
            *(_OWORD *)(v30 + 8) = *((_OWORD *)v29 - 1);
            v29 -= 3;
          }
          while (v29 != v28);
        }
        v17 = v26 + 24;
        v109 = (void **)v30;
        v110 = (void **)(v26 + 24);
        v31 = v111;
        v111 = (void **)&v24[24 * v25];
        v122[2] = v27;
        v122[3] = v31;
        v122[0] = v28;
        v122[1] = v28;
        std::__split_buffer<cc::point_t<double,false,false>>::~__split_buffer((uint64_t)v122);
        v14 = *((_QWORD *)curve_private + 2);
        v19 = (float)(1.0 - a4);
        v18 = a4;
      }
      else
      {
        *(_QWORD *)v17 = &unk_1E64DA950;
        *(float64x2_t *)(v17 + 8) = v20;
        v17 += 24;
      }
      v110 = (void **)v17;
      v15 += 24;
      v16 += 24;
    }
    while (v15 != v14);
    v8 = v109;
  }
  v32 = (float)(1.0 - a4);
  v113 = vaddq_f64(vmulq_n_f64(v105, v32), vmulq_n_f64(v104, a4));
  v114 = v6 * v32 + v9 * a4;
  v33 = 0xAAAAAAAAAAAAAAABLL * ((v17 - (char *)v8) >> 3);
  if (v33 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)&v116, 4uLL);
    goto LABEL_105;
  }
  if (v33 > 0x5555555555555554)
    goto LABEL_105;
  v34 = (double *)(v17 - 24);
  if (v17 - 24 == (char *)v8)
    v35 = (unint64_t)(v17 - 24);
  else
    v35 = (unint64_t)(v17 - 48);
  std::vector<cc::point_t<double,false,false>>::resize((uint64_t)&v116, ((v17 - (char *)v8) >> 3) - 2);
  v36 = (double *)v109;
  if (v109 != (void **)v34)
  {
    v37 = 0;
    v38 = v116 + 32;
    for (i = (double *)v109; i != v34; i += 3)
    {
      v40 = i[4];
      v41 = i[5];
      v42 = i[1];
      v43 = i[2];
      v44 = v40 - v42;
      if (v40 - v42 < 0.0)
        v44 = -(v40 - v42);
      if (v44 < 0.0)
        v44 = -v44;
      v45 = v44 * 0.3334;
      v46 = (double *)(v38 + v37);
      *(v46 - 3) = v42;
      *(v46 - 2) = v43;
      if (v37)
      {
        v47 = v40 - *(i - 2);
        v48 = -v47;
        if (v47 >= 0.0)
          v48 = v40 - *(i - 2);
        v49 = (v41 - *(i - 1)) / v47;
        if (v48 < 0.00000011920929)
          v49 = 0.0;
        v50 = v45 * v49;
        v51 = v45 + i[1];
        v52 = i[2] + v50;
        *v46 = v51;
        v46[1] = v52;
        if ((unint64_t)i >= v35)
          goto LABEL_42;
      }
      else if ((unint64_t)i >= v35)
      {
        v51 = i[1];
        v52 = i[2];
LABEL_42:
        v53 = v40 - v51;
        v54 = v41 - v52;
        goto LABEL_43;
      }
      v53 = i[7] - i[1];
      v54 = i[8] - i[2];
LABEL_43:
      v55 = -v53;
      if (v53 >= 0.0)
        v55 = v53;
      v56 = v54 / v53;
      if (v55 < 0.00000011920929)
        v56 = 0.0;
      v57 = v40 - v45;
      v58 = v41 - v45 * v56;
      v59 = (double *)(v38 + v37);
      v59[3] = v57;
      v59[4] = v58;
      if (!v37)
      {
        v60 = v57 - i[1];
        v61 = v58 - i[2];
        v62 = -v60;
        if (v60 >= 0.0)
          v62 = v60;
        v63 = v61 / v60;
        if (v62 < 0.00000011920929)
          v63 = 0.0;
        *v59 = v45 + v42;
        v59[1] = v43 + v45 * v63;
      }
      v37 += 72;
    }
  }
  *(_OWORD *)(v117 - 16) = *((_OWORD *)v17 - 1);
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v110 - (char *)v36) >> 3) >= 3 && v36 != v34)
  {
    v65 = 0;
    v66 = (double *)(v116 + 64);
    do
    {
      v67 = v36[v65 + 5];
      v68 = v36[v65 + 2];
      v69 = v36[v65 + 4] - v36[v65 + 1];
      v70 = -v69;
      if (v69 >= 0.0)
        v70 = v36[v65 + 4] - v36[v65 + 1];
      v71 = v67 - v68;
      v72 = -(v67 - v68);
      if (v71 >= 0.0)
        v72 = v71;
      v73 = 1.0;
      if (v72 > 0.00000011920929)
      {
        v73 = 0.0;
        if (v70 > 0.00000011920929)
        {
          v74 = v72 / v70 * -3.0 + 1.0;
          if (v74 >= 0.0)
          {
            v73 = 1.0;
            if (v74 <= 1.0)
              v73 = v74;
          }
        }
      }
      v75 = v73 * *(v66 - 6);
      v76 = 1.0 - v73;
      *(v66 - 3) = v75 + (1.0 - v73) * *(v66 - 3);
      v77 = v73 * v66[3];
      *v66 = v77 + v76 * *v66;
      if (&v36[v65] != (double *)v35)
        v66[6] = v77 + v76 * v66[6];
      if (v65 * 8)
        *(v66 - 9) = v75 + v76 * *(v66 - 9);
      v65 += 3;
      v66 += 9;
    }
    while (&v36[v65] != v34);
    v78 = 0;
    v79 = (double *)(v116 + 56);
    do
    {
      v80 = (unint64_t)&v36[v78];
      v81 = v36[v78 + 5];
      v82 = v36[v78 + 2];
      v83 = v36[v78 + 4] - v36[v78 + 1];
      if (v83 < 0.0)
        v83 = -v83;
      v84 = v81 - v82;
      if (v81 - v82 < 0.0)
        v84 = -(v81 - v82);
      v85 = 1.0;
      if (v83 > 0.00000011920929)
      {
        v85 = 0.0;
        if (v84 > 0.00000011920929)
          v85 = v83 / v84 * -3.0 + 1.0;
      }
      if (v85 * 0.25 <= 1.0)
        v86 = v85 * 0.25;
      else
        v86 = 1.0;
      if (v85 * 0.25 >= 0.0)
        v87 = v86;
      else
        v87 = 0.0;
      v88 = *(v79 - 6) * v87;
      v89 = 1.0 - v87;
      *(v79 - 3) = v88 + *(v79 - 3) * (1.0 - v87);
      v90 = v87 * v79[3];
      *v79 = v90 + (1.0 - v87) * *v79;
      if (v80 < v35)
        v79[6] = v90 + v89 * v79[6];
      if (v78 * 8)
        *(v79 - 9) = v88 + v89 * *(v79 - 9);
      if (v81 < v82)
      {
        if (v80 < v35)
        {
          v91 = v79[4];
          v92 = v79[1];
          v93 = v91 - v92;
          if (v91 - v92 < 0.0)
            v93 = -(v91 - v92);
          v79[1] = v89 * v92 + v87 * (v91 + v93);
          v94 = v79[7];
          v95 = v91 - v94;
          if (v91 - v94 > 0.0)
            v95 = -(v91 - v94);
          v79[7] = v89 * v94 + v87 * (v91 + v95);
        }
        if (v78 * 8)
        {
          v96 = *(v79 - 5);
          v97 = *(v79 - 8);
          v98 = v96 - v97;
          if (v96 - v97 < 0.0)
            v98 = -(v96 - v97);
          *(v79 - 8) = v89 * v97 + v87 * (v96 + v98);
          v99 = *(v79 - 2);
          v100 = v96 - v99;
          if (v96 - v99 > 0.0)
            v100 = -(v96 - v99);
          *(v79 - 2) = v89 * v99 + v87 * (v96 + v100);
        }
      }
      v78 += 3;
      v79 += 9;
    }
    while (&v36[v78] != v34);
  }
LABEL_105:
  v101 = +[PAEColorCurveChannelData channelDataWithRed:green:blue:curve:](PAEColorCurveChannelData, "channelDataWithRed:green:blue:curve:", &v108, v106[20], v106[21], v106[22], v103);
  v108 = &unk_1E64E25A0;
  v112 = &unk_1E64E25E0;
  v122[0] = (void **)&v116;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](v122);
  v122[0] = (void **)&v109;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](v122);
  return v101;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  _BOOL4 v16;
  double v17;
  _BOOL4 v18;
  BOOL v19;

  v4 = -[PAEColorCurveChannelData curveRef](self, "curveRef");
  v5 = v4[5];
  v6 = v4[6];
  v7 = v4[7];
  v8 = objc_msgSend(a3, "curveRef");
  v10 = v5 == *(double *)(v8 + 40) && v6 == *(double *)(v8 + 48) && v7 == *(double *)(v8 + 56);
  if (v10
    && (v12 = *((_QWORD *)v4 + 1),
        v11 = *((_QWORD *)v4 + 2),
        v13 = *(_QWORD *)(v8 + 8),
        v11 - v12 == *(_QWORD *)(v8 + 16) - v13))
  {
    if (v12 == v11)
    {
      LOBYTE(v18) = 1;
    }
    else
    {
      v14 = v12 + 24;
      v15 = (double *)(v13 + 16);
      do
      {
        v16 = *(double *)(v14 - 16) == *(v15 - 1);
        v17 = *v15;
        v15 += 3;
        v18 = *(double *)(v14 - 8) == v17 && v16;
        v19 = !v18 || v14 == v11;
        v14 += 24;
      }
      while (!v19);
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  return v18;
}

@end
