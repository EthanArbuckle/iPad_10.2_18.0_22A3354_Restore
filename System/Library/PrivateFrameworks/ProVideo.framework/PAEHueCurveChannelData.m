@implementation PAEHueCurveChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEHueCurveChannelData)init
{
  PAEHueCurveChannelData *v2;
  _anonymous_namespace_::_Private *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEHueCurveChannelData;
  v2 = -[PAEHueCurveChannelData init](&v5, sel_init);
  if (v2)
  {
    v3 = (_anonymous_namespace_::_Private *)operator new();
    v2->_curve_private = v3;
  }
  return v2;
}

- (PAEHueCurveChannelData)initWithCurve:(const void *)a3
{
  PAEHueCurveChannelData *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void (***v8)(_QWORD);
  void (***v9)(_QWORD);
  void (**v10)(_QWORD);
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  void (***v14)(_QWORD);
  void (***v15)(_QWORD);
  void (**v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  void (***v19)(_QWORD);
  void (***v20)(_QWORD);
  void (**v21)(_QWORD);
  uint64_t v22;
  uint64_t v23;
  void (***v24)(_QWORD);
  void (***v25)(_QWORD);
  void (**v26)(_QWORD);
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PAEHueCurveChannelData;
  v4 = -[PAEHueCurveChannelData init](&v28, sel_init);
  if (v4)
  {
    v5 = (uint64_t *)operator new();
    v4->_curve_private = v5;
    v7 = v5[1];
    v6 = v5[2];
    if (v6 != v7)
    {
      v8 = (void (***)(_QWORD))(v6 - 24);
      v9 = (void (***)(_QWORD))(v6 - 24);
      do
      {
        v10 = *v9;
        v9 -= 3;
        (*v10)(v8);
        v11 = v8 == (void (***)(_QWORD))v7;
        v8 = v9;
      }
      while (!v11);
      v6 = v5[1];
    }
    v5[2] = v7;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v5 + 1, v6, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 3));
    v12 = v5[7];
    v5[5] = *((_QWORD *)a3 + 5);
    v13 = v5[8];
    if (v13 != v12)
    {
      v14 = (void (***)(_QWORD))(v13 - 24);
      v15 = (void (***)(_QWORD))(v13 - 24);
      do
      {
        v16 = *v15;
        v15 -= 3;
        (*v16)(v14);
        v11 = v14 == (void (***)(_QWORD))v12;
        v14 = v15;
      }
      while (!v11);
      v13 = v5[7];
    }
    v5[8] = v12;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v5 + 7, v13, *((_QWORD *)a3 + 7), *((_QWORD *)a3 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3));
    v18 = v5[14];
    v17 = v5[15];
    if (v17 != v18)
    {
      v19 = (void (***)(_QWORD))(v17 - 24);
      v20 = (void (***)(_QWORD))(v17 - 24);
      do
      {
        v21 = *v20;
        v20 -= 3;
        (*v21)(v19);
        v11 = v19 == (void (***)(_QWORD))v18;
        v19 = v20;
      }
      while (!v11);
      v17 = v5[14];
    }
    v5[15] = v18;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v5 + 14, v17, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 3));
    v22 = v5[20];
    v5[18] = *((_QWORD *)a3 + 5);
    v23 = v5[21];
    if (v23 != v22)
    {
      v24 = (void (***)(_QWORD))(v23 - 24);
      v25 = (void (***)(_QWORD))(v23 - 24);
      do
      {
        v26 = *v25;
        v25 -= 3;
        (*v26)(v24);
        v11 = v24 == (void (***)(_QWORD))v22;
        v24 = v25;
      }
      while (!v11);
      v23 = v5[20];
    }
    v5[21] = v22;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v5 + 20, v23, *((_QWORD *)a3 + 7), *((_QWORD *)a3 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 8) - *((_QWORD *)a3 + 7)) >> 3));
  }
  return v4;
}

+ (id)channelDataWithCurve:(const void *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCurve:", a3);
}

- (void)dealloc
{
  char *curve_private;
  objc_super v4;
  void **v5;

  curve_private = (char *)self->_curve_private;
  if (curve_private)
  {
    *((_QWORD *)curve_private + 13) = &unk_1E64DA980;
    *((_QWORD *)curve_private + 17) = &unk_1E64DA9C0;
    v5 = (void **)(curve_private + 160);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 112);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(_QWORD *)curve_private = &unk_1E64DA980;
    *((_QWORD *)curve_private + 4) = &unk_1E64DA9C0;
    v5 = (void **)(curve_private + 56);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 8);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1B5E29170](curve_private, 0x10A0C405284425BLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEHueCurveChannelData;
  -[PAEHueCurveChannelData dealloc](&v4, sel_dealloc);
}

- (void)curveRef
{
  return self->_curve_private;
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
  if (curve_private[5] == curve_private[18]
    && (v4 = *((_QWORD *)curve_private + 7),
        v3 = *((_QWORD *)curve_private + 8),
        v6 = (char *)(curve_private + 20),
        v5 = *((_QWORD *)curve_private + 20),
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
  _QWORD *curve_private;
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

  curve_private = self->_curve_private;
  v3 = curve_private + 1;
  v4 = (void (***)(_QWORD))curve_private[1];
  v5 = curve_private[2];
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
  curve_private[2] = v4;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v3, v5, curve_private[14], curve_private[15], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(curve_private[15] - curve_private[14]) >> 3));
  v10 = (void (***)(_QWORD))curve_private[7];
  curve_private[5] = curve_private[18];
  v11 = curve_private[8];
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
    v11 = curve_private[7];
  }
  curve_private[8] = v10;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(curve_private + 7, v11, curve_private[20], curve_private[21], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(curve_private[21] - curve_private[20]) >> 3));
}

- (double)evaluate:(double)a3
{
  double result;
  double v4;

  v4 = a3;
  (*(void (**)(void *, double *))(*(_QWORD *)self->_curve_private + 24))(self->_curve_private, &v4);
  return result;
}

- (PAEHueCurveChannelData)initWithCoder:(id)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void (***v7)(_QWORD);
  void (***v8)(_QWORD);
  void (***v9)(_QWORD);
  void (***v10)(_QWORD);
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  double *v35;
  double *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  double *v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  double *v47;
  double *v48;
  double *v49;
  double *v50;
  double *v51;
  double *v52;
  double v53;
  double *v54;
  double v55;
  double *v56;
  double *v57;
  __int128 v58;
  double v59;
  double v60;
  double *v61;
  double *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  int v67;
  int v68;
  double v69;
  int v70;
  double v71;
  _BOOL4 v73;
  BOOL v74;
  double *v75;
  double *v76;
  double v77;
  double *v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  double *v84;
  double *v85;
  double *v86;
  double v87;
  double *v88;
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
  _QWORD *v100;
  PAEHueCurveChannelData *v102;
  _QWORD *v103;
  id obj;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  objc_super v109;
  _QWORD v110[5];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v109.receiver = self;
  v109.super_class = (Class)PAEHueCurveChannelData;
  v102 = -[PAEHueCurveChannelData init](&v109, sel_init);
  if (!v102)
    return v102;
  v4 = (_QWORD *)operator new();
  v102->_curve_private = v4;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  obj = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("points"));
  v7 = (void (***)(_QWORD))v4[1];
  v103 = v4 + 1;
  v8 = (void (***)(_QWORD))v4[2];
  if (v8 != v7)
  {
    v9 = v8 - 3;
    v10 = v8 - 3;
    do
    {
      v11 = *v10;
      v10 -= 3;
      (*v11)(v9);
      v74 = v9 == v7;
      v9 = v10;
    }
    while (!v74);
  }
  v4[2] = v7;
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("offset"));
  v4[5] = v12;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v106 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "CGPointValue");
        v18 = v16;
        v19 = v17;
        v21 = (_QWORD *)v4[2];
        v20 = v4[3];
        if ((unint64_t)v21 >= v20)
        {
          v23 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v21 - *v103) >> 3);
          v24 = v23 + 1;
          if (v23 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<double>::__throw_length_error[abi:ne180100]();
          v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - *v103) >> 3);
          if (2 * v25 > v24)
            v24 = 2 * v25;
          if (v25 >= 0x555555555555555)
            v26 = 0xAAAAAAAAAAAAAAALL;
          else
            v26 = v24;
          v110[4] = v4 + 3;
          v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)(v4 + 3), v26);
          v29 = &v27[24 * v23];
          *(_QWORD *)v29 = &unk_1E64DA950;
          *((_QWORD *)v29 + 1) = v18;
          *((_QWORD *)v29 + 2) = v19;
          v31 = v4[1];
          v30 = v4[2];
          if (v30 == v31)
          {
            v33 = &v27[24 * v23];
          }
          else
          {
            v32 = v4[2];
            v33 = &v27[24 * v23];
            do
            {
              *((_QWORD *)v33 - 3) = &unk_1E64DA950;
              v33 -= 24;
              *(_OWORD *)(v33 + 8) = *(_OWORD *)(v32 - 16);
              v32 -= 24;
            }
            while (v32 != v31);
          }
          v22 = v29 + 24;
          v4[1] = v33;
          v4[2] = v29 + 24;
          v34 = v4[3];
          v4[3] = &v27[24 * v28];
          v110[2] = v30;
          v110[3] = v34;
          v110[0] = v31;
          v110[1] = v31;
          std::__split_buffer<cc::point_t<double,false,false>>::~__split_buffer((uint64_t)v110);
        }
        else
        {
          *v21 = &unk_1E64DA950;
          v22 = v21 + 3;
          v21[1] = v16;
          v21[2] = v17;
        }
        v4[2] = v22;
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v111, 16);
    }
    while (v13);
  }
  v35 = (double *)v4[1];
  v36 = (double *)v4[2];
  v37 = (char *)v36 - (char *)v35;
  v38 = 0xAAAAAAAAAAAAAAABLL * (v36 - v35);
  if (v38 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v4 + 7), 4uLL);
    v39 = v4[1];
    if (v39 == v4[2])
      v40 = 0;
    else
      v40 = *(_QWORD *)(v39 + 16);
    v100 = (_QWORD *)v4[7];
    v100[1] = 0;
    v100[2] = v40;
    v100[4] = 0x3FD5566CF41F212DLL;
    v100[5] = v40;
    v100[7] = 0x3FE554C985F06F6ALL;
    v100[8] = v40;
    v100[10] = 0x3FF0000000000000;
    v100[11] = v40;
    return v102;
  }
  if (v38 > 0x5555555555555554)
    return v102;
  if (v36 == v35)
    v41 = 0;
  else
    v41 = -1;
  v42 = v4 + 7;
  std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v4 + 7), v36 - v35 + 1);
  v43 = &v36[3 * v41];
  v44 = (double *)v4[1];
  if (v44 != v36)
  {
    v45 = 0;
    v46 = 0;
    v47 = &v36[3 * v41];
    v48 = v47 + 1;
    v49 = v47 + 2;
    v50 = (double *)(*v42 + 32);
    while (1)
    {
      v51 = &v44[v46];
      if (&v44[v46] == v43)
      {
        v53 = v44[1] + 1.0;
        v54 = v44 + 2;
        v52 = v44;
      }
      else
      {
        v52 = v51 + 3;
        v53 = v51[4];
        v54 = v51 + 5;
      }
      v55 = *v54;
      v56 = &v44[v46];
      v57 = &v44[v46 + 1];
      v58 = *(_OWORD *)v57;
      v59 = v53 - *v57;
      if (v59 < 0.0)
        v59 = -(v53 - *(double *)&v58);
      if (v59 < 0.0)
        v59 = -v59;
      *(_OWORD *)(v50 - 3) = v58;
      if (v46 * 8)
      {
        v60 = *(v56 - 2);
        v61 = v56 - 1;
      }
      else
      {
        v60 = *v48 + -1.0;
        v61 = v49;
      }
      v62 = &v44[v46 + 2];
      v63 = v59 * 0.3334;
      v64 = v53 - v60;
      v65 = v55 - *v61;
      v66 = -v64;
      if (v64 >= 0.0)
        v66 = v64;
      v67 = *v61 - *v62 >= 0.0;
      v68 = v55 - *v62 < 0.0;
      v69 = v65 / v64;
      v70 = v68 ^ v67;
      if (v66 < 0.00000011920929)
        v70 = 1;
      if (v70)
        v69 = 0.0;
      v71 = *v62 + v63 * v69;
      *v50 = v63 + *v57;
      v50[1] = v71;
      v73 = v45-- != 0;
      v74 = v68 == v67 || !v73;
      if (!v74)
        *(v50 - 5) = v71;
      if (v51 == v43)
        break;
      v75 = &v44[v46 + 2];
      v76 = &v44[v46 + 1];
      if (v37 == 48)
        goto LABEL_65;
      if (v51 == v43 - 3)
        break;
      v77 = v52[4];
      v75 = v52 + 5;
LABEL_66:
      v79 = v77 - *v57;
      v80 = -v79;
      if (v79 >= 0.0)
        v80 = v79;
      v81 = (*v75 - *v62) / v79;
      if (v80 < 0.00000011920929)
        v81 = 0.0;
      v50[3] = v53 - v63;
      v50[4] = v55 - v63 * v81;
      v50 += 9;
      v46 += 3;
      if (&v44[v46] == v36)
        goto LABEL_71;
    }
    v78 = &v44[3 * (v51 == v43)];
    v76 = v78 + 1;
    v75 = v78 + 2;
LABEL_65:
    v77 = *v76 + 1.0;
    goto LABEL_66;
  }
LABEL_71:
  v82 = v4[8];
  v83 = *((_QWORD *)v44 + 2);
  *(double *)(v82 - 16) = v44[1] + 1.0;
  *(_QWORD *)(v82 - 8) = v83;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4[2] - (_QWORD)v44) >> 3) >= 3 && v44 != v36)
  {
    v84 = v44 + 5;
    v85 = (double *)(*v42 + 64);
    do
    {
      v86 = v84 - 5;
      if (v84 - 5 == v43)
      {
        v87 = v44[1] + 1.0;
        v88 = v44 + 2;
      }
      else
      {
        v87 = *(v84 - 1);
        v88 = v84;
      }
      v89 = *v88;
      v90 = *(v84 - 3);
      v91 = v87 - *(v84 - 4);
      v92 = -v91;
      if (v91 >= 0.0)
        v92 = v91;
      v93 = v89 - v90;
      v94 = -(v89 - v90);
      if (v93 >= 0.0)
        v94 = v93;
      v95 = 1.0;
      if (v94 > 0.00000011920929)
      {
        v95 = 0.0;
        if (v92 > 0.00000011920929)
        {
          v96 = v94 / v92 * -3.0 + 1.0;
          if (v96 >= 0.0)
          {
            v95 = 1.0;
            if (v96 <= 1.0)
              v95 = v96;
          }
        }
      }
      v97 = v95 * *(v85 - 6);
      v98 = 1.0 - v95;
      *(v85 - 3) = v97 + (1.0 - v95) * *(v85 - 3);
      v99 = v95 * v85[3];
      *v85 = v99 + v98 * *v85;
      if (v86 != v43)
        v85[6] = v99 + v98 * v85[6];
      if (v86 != v44)
        *(v85 - 9) = v97 + v98 * *(v85 - 9);
      v84 += 3;
      v85 += 9;
    }
    while (v86 + 3 != v36);
  }
  return v102;
}

- (void)encodeWithCoder:(id)a3
{
  double *curve_private;
  uint64_t i;
  id v6;

  curve_private = (double *)self->_curve_private;
  if (curve_private[5] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("offset"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 2) - *((_QWORD *)curve_private + 1)) >> 3));
  for (i = *((_QWORD *)curve_private + 1); i != *((_QWORD *)curve_private + 2); i += 24)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(i + 8), *(double *)(i + 16)));
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("points"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCurve:", self->_curve_private);
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
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> offset=%.3f, pts={\n"), NSStringFromClass(v5), self, curve_private[5]);
  for (i = curve_private[1]; i != curve_private[2]; i += 24)
    v6 = (void *)objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("  %.3f, %.3f\n"), *(_QWORD *)(i + 8), *(_QWORD *)(i + 16));
  return (id)objc_msgSend(v6, "stringByAppendingString:", CFSTR("}"));
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  double *v6;
  double v7;
  uint64_t v8;
  char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  double v15;
  double v16;
  float64x2_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void **v24;
  void **v25;
  void **v26;
  char *v27;
  void **v28;
  double v29;
  double v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  double *v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  double *v39;
  double *v40;
  double *v41;
  double *v42;
  double *v43;
  double v44;
  double *v45;
  double v46;
  double *v47;
  double *v48;
  __int128 v49;
  double v50;
  double v51;
  double *v52;
  double *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  int v58;
  int v59;
  double v60;
  int v61;
  double v62;
  _BOOL4 v64;
  double *v66;
  double *v67;
  double v68;
  double *v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  double *v74;
  double *v75;
  double *v76;
  double v77;
  double *v78;
  double v79;
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
  uint64_t v90;
  PAEHueCurveChannelData *v91;
  uint64_t *v93;
  float64x2_t v94;
  void *v95;
  void **v96;
  void **v97;
  void **v98;
  void *v99;
  double v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  double (*v106)(uint64_t, double *);
  uint64_t v107;
  void **v108[7];

  v6 = -[PAEHueCurveChannelData curveRef](self, "curveRef");
  v7 = v6[5];
  v8 = objc_msgSend(a3, "curveRef");
  v9 = 0;
  v10 = *(double *)(v8 + 40);
  v97 = 0;
  v98 = 0;
  v95 = &unk_1E64DA980;
  v96 = 0;
  v99 = &unk_1E64DA9C0;
  v100 = 0.0;
  v103 = 0;
  v104 = 0;
  v101 = &unk_1E64DAAA8;
  v102 = 0;
  v105 = &unk_1E64DAAD0;
  v106 = cc::curve::aspline::bezier_t<double,true>::evalPeriodic;
  v107 = 0;
  v12 = *((_QWORD *)v6 + 1);
  v11 = *((_QWORD *)v6 + 2);
  v13 = *(_QWORD *)(v8 + 8);
  v14 = 0;
  if (v11 - v12 == *(_QWORD *)(v8 + 16) - v13 && v12 != v11)
  {
    v93 = &v102;
    v14 = 0;
    v15 = a4;
    v16 = (float)(1.0 - a4);
    do
    {
      v17 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(v13 + 8), v15), vmulq_n_f64(*(float64x2_t *)(v12 + 8), v16));
      if (v14 >= (char *)v98)
      {
        v94 = v17;
        v18 = 0xAAAAAAAAAAAAAAABLL * ((v14 - (char *)v96) >> 3);
        v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (v98 - v96) > v19)
          v19 = 0x5555555555555556 * (v98 - v96);
        if (0xAAAAAAAAAAAAAAABLL * (v98 - v96) >= 0x555555555555555)
          v20 = 0xAAAAAAAAAAAAAAALL;
        else
          v20 = v19;
        v108[4] = (void **)&v98;
        v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)&v98, v20);
        v23 = &v21[24 * v18];
        *(_QWORD *)v23 = &unk_1E64DA950;
        *(float64x2_t *)(v23 + 8) = v94;
        v25 = v96;
        v24 = v97;
        if (v97 == v96)
        {
          v27 = &v21[24 * v18];
        }
        else
        {
          v26 = v97;
          v27 = &v21[24 * v18];
          do
          {
            *((_QWORD *)v27 - 3) = &unk_1E64DA950;
            v27 -= 24;
            *(_OWORD *)(v27 + 8) = *((_OWORD *)v26 - 1);
            v26 -= 3;
          }
          while (v26 != v25);
        }
        v14 = v23 + 24;
        v96 = (void **)v27;
        v97 = (void **)(v23 + 24);
        v28 = v98;
        v98 = (void **)&v21[24 * v22];
        v108[2] = v24;
        v108[3] = v28;
        v108[0] = v25;
        v108[1] = v25;
        std::__split_buffer<cc::point_t<double,false,false>>::~__split_buffer((uint64_t)v108);
        v11 = *((_QWORD *)v6 + 2);
        v16 = (float)(1.0 - a4);
        v15 = a4;
      }
      else
      {
        *(_QWORD *)v14 = &unk_1E64DA950;
        *(float64x2_t *)(v14 + 8) = v17;
        v14 += 24;
      }
      v97 = (void **)v14;
      v12 += 24;
      v13 += 24;
    }
    while (v12 != v11);
    v9 = (char *)v96;
  }
  v29 = v7 * (float)(1.0 - a4);
  v30 = v29 + v10 * a4;
  v100 = v30;
  v31 = (char *)(v14 - v9);
  v32 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v9) >> 3);
  if (v32 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)&v102, 4uLL);
    if (v96 == v97)
      v30 = 0.0;
    else
      v30 = *((double *)v96 + 2);
    v90 = v102;
    *(_QWORD *)(v102 + 8) = 0;
    *(double *)(v90 + 16) = v30;
    *(_QWORD *)(v90 + 32) = 0x3FD5566CF41F212DLL;
    *(double *)(v90 + 40) = v30;
    *(_QWORD *)(v90 + 56) = 0x3FE554C985F06F6ALL;
    *(double *)(v90 + 64) = v30;
    *(_QWORD *)(v90 + 80) = 0x3FF0000000000000;
    *(double *)(v90 + 88) = v30;
    goto LABEL_87;
  }
  if (v32 > 0x5555555555555554)
    goto LABEL_87;
  if (v14 == v9)
    v33 = 0;
  else
    v33 = -1;
  std::vector<cc::point_t<double,false,false>>::resize((uint64_t)&v102, ((v14 - v9) >> 3) + 1);
  v34 = (double *)&v14[24 * v33];
  v35 = (double *)v96;
  if (v96 != (void **)v14)
  {
    v36 = 0;
    v37 = 0;
    v38 = &v14[24 * v33];
    v39 = (double *)(v38 + 8);
    v40 = (double *)(v38 + 16);
    v41 = (double *)(v102 + 32);
    while (1)
    {
      v42 = &v35[v37];
      if (&v35[v37] == v34)
      {
        v44 = v35[1] + 1.0;
        v45 = v35 + 2;
        v43 = v35;
      }
      else
      {
        v43 = v42 + 3;
        v44 = v42[4];
        v45 = v42 + 5;
      }
      v46 = *v45;
      v47 = &v35[v37];
      v48 = &v35[v37 + 1];
      v49 = *(_OWORD *)v48;
      v50 = v44 - *v48;
      if (v50 < 0.0)
        v50 = -(v44 - *(double *)&v49);
      if (v50 < 0.0)
        v50 = -v50;
      *(_OWORD *)(v41 - 3) = v49;
      if (v37 * 8)
      {
        v51 = *(v47 - 2);
        v52 = v47 - 1;
      }
      else
      {
        v51 = *v39 + -1.0;
        v52 = v40;
      }
      v53 = &v35[v37 + 2];
      v54 = v50 * 0.3334;
      v55 = v44 - v51;
      v56 = v46 - *v52;
      v57 = -v55;
      if (v55 >= 0.0)
        v57 = v55;
      v58 = *v52 - *v53 >= 0.0;
      v59 = v46 - *v53 < 0.0;
      v60 = v56 / v55;
      v61 = v59 ^ v58;
      if (v57 < 0.00000011920929)
        v61 = 1;
      if (v61)
        v60 = 0.0;
      v62 = *v53 + v54 * v60;
      *v41 = v54 + *v48;
      v41[1] = v62;
      v64 = v36-- != 0;
      if (v59 != v58 && v64)
        *(v41 - 5) = v62;
      if (v42 == v34)
        break;
      v66 = &v35[v37 + 2];
      v67 = &v35[v37 + 1];
      if (v31 == (char *)48)
        goto LABEL_58;
      if (v42 == v34 - 3)
        break;
      v68 = v43[4];
      v66 = v43 + 5;
LABEL_59:
      v70 = v68 - *v48;
      v71 = -v70;
      if (v70 >= 0.0)
        v71 = v70;
      v72 = (*v66 - *v53) / v70;
      if (v71 < 0.00000011920929)
        v72 = 0.0;
      v41[3] = v44 - v54;
      v41[4] = v46 - v54 * v72;
      v41 += 9;
      v37 += 3;
      if (&v35[v37] == (double *)v14)
        goto LABEL_64;
    }
    v69 = &v35[3 * (v42 == v34)];
    v67 = v69 + 1;
    v66 = v69 + 2;
LABEL_58:
    v68 = *v67 + 1.0;
    goto LABEL_59;
  }
LABEL_64:
  v73 = v103;
  v29 = v35[2];
  v30 = v35[1] + 1.0;
  *(double *)(v103 - 16) = v30;
  *(double *)(v73 - 8) = v29;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v97 - (char *)v35) >> 3) >= 3 && v35 != (double *)v14)
  {
    v74 = v35 + 5;
    v75 = (double *)(v102 + 64);
    v30 = 1.0;
    v29 = -3.0;
    do
    {
      v76 = v74 - 5;
      if (v74 - 5 == v34)
      {
        v77 = v35[1] + 1.0;
        v78 = v35 + 2;
      }
      else
      {
        v77 = *(v74 - 1);
        v78 = v74;
      }
      v79 = *v78;
      v80 = *(v74 - 3);
      v81 = v77 - *(v74 - 4);
      v82 = -v81;
      if (v81 >= 0.0)
        v82 = v81;
      v83 = v79 - v80;
      v84 = -(v79 - v80);
      if (v83 >= 0.0)
        v84 = v83;
      v85 = 1.0;
      if (v84 > 0.00000011920929)
      {
        v85 = 0.0;
        if (v82 > 0.00000011920929)
        {
          v86 = v84 / v82 * -3.0 + 1.0;
          if (v86 >= 0.0)
          {
            v85 = 1.0;
            if (v86 <= 1.0)
              v85 = v86;
          }
        }
      }
      v87 = v85 * *(v75 - 6);
      v88 = 1.0 - v85;
      *(v75 - 3) = v87 + (1.0 - v85) * *(v75 - 3);
      v89 = v85 * v75[3];
      *v75 = v89 + v88 * *v75;
      if (v76 != v34)
        v75[6] = v89 + v88 * v75[6];
      if (v76 != v35)
        *(v75 - 9) = v87 + v88 * *(v75 - 9);
      v74 += 3;
      v75 += 9;
    }
    while (v76 + 3 != (double *)v14);
  }
LABEL_87:
  v91 = +[PAEHueCurveChannelData channelDataWithCurve:](PAEHueCurveChannelData, "channelDataWithCurve:", &v95, v30, v29, v93);
  v95 = &unk_1E64DA980;
  v99 = &unk_1E64DA9C0;
  v108[0] = (void **)&v102;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](v108);
  v108[0] = (void **)&v96;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](v108);
  return v91;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  _BOOL4 v12;
  double v13;
  _BOOL4 v14;
  BOOL v15;

  v4 = -[PAEHueCurveChannelData curveRef](self, "curveRef");
  v5 = v4[5];
  v6 = objc_msgSend(a3, "curveRef");
  if (v5 == *(double *)(v6 + 40)
    && (v8 = *((_QWORD *)v4 + 1),
        v7 = *((_QWORD *)v4 + 2),
        v9 = *(_QWORD *)(v6 + 8),
        v7 - v8 == *(_QWORD *)(v6 + 16) - v9))
  {
    if (v8 == v7)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      v10 = v8 + 24;
      v11 = (double *)(v9 + 16);
      do
      {
        v12 = *(double *)(v10 - 16) == *(v11 - 1);
        v13 = *v11;
        v11 += 3;
        v14 = *(double *)(v10 - 8) == v13 && v12;
        v15 = !v14 || v10 == v7;
        v10 += 24;
      }
      while (!v15);
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

@end
