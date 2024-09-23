@implementation PAEOffsetColorCurveChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEOffsetColorCurveChannelData)init
{
  PAEOffsetColorCurveChannelData *v2;
  _anonymous_namespace_::_Private *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEOffsetColorCurveChannelData;
  v2 = -[PAEOffsetColorCurveChannelData init](&v5, sel_init);
  if (v2)
  {
    v3 = (_anonymous_namespace_::_Private *)operator new();
    v2->_curve_private = v3;
  }
  return v2;
}

- (PAEOffsetColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  PAEOffsetColorCurveChannelData *v8;
  _anonymous_namespace_::_Private *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEOffsetColorCurveChannelData;
  v8 = -[PAEOffsetColorCurveChannelData init](&v11, sel_init);
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

- (PAEOffsetColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6
{
  PAEOffsetColorCurveChannelData *v10;
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
  uint64_t v23;
  void (***v24)(_QWORD);
  void (***v25)(_QWORD);
  void (***v26)(_QWORD);
  void (**v27)(_QWORD);
  void (***v28)(_QWORD);
  uint64_t v29;
  void (***v30)(_QWORD);
  void (***v31)(_QWORD);
  void (**v32)(_QWORD);
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PAEOffsetColorCurveChannelData;
  v10 = -[PAEOffsetColorCurveChannelData init](&v34, sel_init);
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
    v18 = *(void (****)(_QWORD))(v11 + 80);
    *(_OWORD *)(v11 + 40) = *(_OWORD *)((char *)a6 + 40);
    *(_OWORD *)(v11 + 56) = *(_OWORD *)((char *)a6 + 56);
    v19 = *(_QWORD *)(v11 + 88);
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
      v19 = *(_QWORD *)(v11 + 80);
    }
    *(_QWORD *)(v11 + 88) = v18;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)(v11 + 80), v19, *((_QWORD *)a6 + 10), *((_QWORD *)a6 + 11), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 11) - *((_QWORD *)a6 + 10)) >> 3));
    v24 = *(void (****)(_QWORD))(v11 + 136);
    v23 = *(_QWORD *)(v11 + 144);
    if ((void (***)(_QWORD))v23 != v24)
    {
      v25 = (void (***)(_QWORD))(v23 - 24);
      v26 = (void (***)(_QWORD))(v23 - 24);
      do
      {
        v27 = *v26;
        v26 -= 3;
        (*v27)(v25);
        v17 = v25 == v24;
        v25 = v26;
      }
      while (!v17);
      v23 = *(_QWORD *)(v11 + 136);
    }
    *(_QWORD *)(v11 + 144) = v24;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)(v11 + 136), v23, *((_QWORD *)a6 + 1), *((_QWORD *)a6 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 2) - *((_QWORD *)a6 + 1)) >> 3));
    v28 = *(void (****)(_QWORD))(v11 + 208);
    *(_OWORD *)(v11 + 168) = *(_OWORD *)((char *)a6 + 40);
    *(_OWORD *)(v11 + 184) = *(_OWORD *)((char *)a6 + 56);
    v29 = *(_QWORD *)(v11 + 216);
    if ((void (***)(_QWORD))v29 != v28)
    {
      v30 = (void (***)(_QWORD))(v29 - 24);
      v31 = (void (***)(_QWORD))(v29 - 24);
      do
      {
        v32 = *v31;
        v31 -= 3;
        (*v32)(v30);
        v17 = v30 == v28;
        v30 = v31;
      }
      while (!v17);
      v29 = *(_QWORD *)(v11 + 208);
    }
    *(_QWORD *)(v11 + 216) = v28;
    std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)(v11 + 208), v29, *((_QWORD *)a6 + 10), *((_QWORD *)a6 + 11), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 11) - *((_QWORD *)a6 + 10)) >> 3));
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
    *((_QWORD *)curve_private + 16) = &unk_1E64E3AC8;
    *((_QWORD *)curve_private + 20) = &unk_1E64E3B08;
    v5 = (void **)(curve_private + 208);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 136);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(_QWORD *)curve_private = &unk_1E64E3AC8;
    *((_QWORD *)curve_private + 4) = &unk_1E64E3B08;
    v5 = (void **)(curve_private + 80);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 8);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1B5E29170](curve_private, 0x10A0C40A88C75BALL);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEOffsetColorCurveChannelData;
  -[PAEOffsetColorCurveChannelData dealloc](&v4, sel_dealloc);
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
  if (curve_private[5] == curve_private[21]
    && curve_private[6] == curve_private[22]
    && curve_private[7] == curve_private[23]
    && curve_private[8] == curve_private[24]
    && (v4 = *((_QWORD *)curve_private + 10),
        v3 = *((_QWORD *)curve_private + 11),
        v6 = (char *)(curve_private + 26),
        v5 = *((_QWORD *)curve_private + 26),
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
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v3, v5, *((_QWORD *)curve_private + 17), *((_QWORD *)curve_private + 18), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 18) - *((_QWORD *)curve_private + 17)) >> 3));
  v10 = (void (***)(_QWORD))*((_QWORD *)curve_private + 10);
  *(_OWORD *)(curve_private + 40) = *(_OWORD *)(curve_private + 168);
  *(_OWORD *)(curve_private + 56) = *(_OWORD *)(curve_private + 184);
  v11 = *((_QWORD *)curve_private + 11);
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
    v11 = *((_QWORD *)curve_private + 10);
  }
  *((_QWORD *)curve_private + 11) = v10;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)curve_private + 10, v11, *((_QWORD *)curve_private + 26), *((_QWORD *)curve_private + 27), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 27) - *((_QWORD *)curve_private + 26)) >> 3));
}

- (double)evaluate:(double)a3
{
  double result;
  double v4;

  v4 = a3;
  (*(void (**)(void *, double *))(*(_QWORD *)self->_curve_private + 24))(self->_curve_private, &v4);
  return result;
}

- (BOOL)conformFromColorCurve:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  void (***v7)(_QWORD);
  uint64_t v8;
  void (***v9)(_QWORD);
  void (***v10)(_QWORD);
  void (**v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double *v15;
  unint64_t v16;
  _QWORD *v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  BOOL v50;
  uint64_t v51;
  double *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t i;

  v4 = -[PAEOffsetColorCurveChannelData curveRef](self, "curveRef");
  v5 = objc_msgSend(a3, "curveRef");
  v6 = (uint64_t *)(v4 + 8);
  v7 = (void (***)(_QWORD))*((_QWORD *)v4 + 1);
  v8 = *((_QWORD *)v4 + 2);
  if ((void (***)(_QWORD))v8 != v7)
  {
    v9 = (void (***)(_QWORD))(v8 - 24);
    v10 = (void (***)(_QWORD))(v8 - 24);
    do
    {
      v11 = *v10;
      v10 -= 3;
      (*v11)(v9);
      v50 = v9 == v7;
      v9 = v10;
    }
    while (!v50);
    v8 = *v6;
  }
  *((_QWORD *)v4 + 2) = v7;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)v4 + 1, v8, *(_QWORD *)(v5 + 8), *(_QWORD *)(v5 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v5 + 16) - *(_QWORD *)(v5 + 8)) >> 3));
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(v5 + 40);
  *((_QWORD *)v4 + 7) = *(_QWORD *)(v5 + 56);
  *((_QWORD *)v4 + 8) = 0;
  v12 = *((_QWORD *)v4 + 1);
  v13 = *((_QWORD *)v4 + 2);
  v14 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v12) >> 3);
  if (v14 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v4 + 80), 4uLL);
    v13 = *((_QWORD *)v4 + 2);
    goto LABEL_61;
  }
  if (v14 > 0x5555555555555554)
    goto LABEL_61;
  v15 = (double *)(v13 - 24);
  if (v13 - 24 == v12)
    v16 = v13 - 24;
  else
    v16 = v13 - 48;
  v17 = v4 + 80;
  std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v4 + 80), ((v13 - v12) >> 3) - 2);
  v18 = (double *)*((_QWORD *)v4 + 1);
  if (v18 != v15)
  {
    v19 = 0;
    v20 = *v17 + 32;
    v21 = (double *)*((_QWORD *)v4 + 1);
    while (1)
    {
      v22 = v21[4];
      v23 = v21[5];
      v24 = v21[1];
      v25 = v21[2];
      v26 = v22 - v24;
      if (v22 - v24 < 0.0)
        v26 = -(v22 - v24);
      if (v26 < 0.0)
        v26 = -v26;
      v27 = v26 * 0.3334;
      v28 = v20 + v19;
      *(double *)(v28 - 24) = v24;
      *(double *)(v28 - 16) = v25;
      if (v19)
        break;
      if ((unint64_t)v21 < v16)
        goto LABEL_29;
      v33 = v22 - v21[1];
      v34 = v23 - v21[2];
LABEL_31:
      v41 = -v33;
      if (v33 >= 0.0)
        v41 = v33;
      v42 = v34 / v33;
      if (v41 < 0.00000011920929)
        v42 = 0.0;
      v43 = v22 - v27;
      v44 = v23 - v27 * v42;
      v45 = (double *)(v20 + v19);
      v45[3] = v43;
      v45[4] = v44;
      if (!v19)
      {
        v46 = v43 - v21[1];
        v47 = v44 - v21[2];
        v48 = -v46;
        if (v46 >= 0.0)
          v48 = v46;
        v49 = v47 / v46;
        if (v48 < 0.00000011920929)
          v49 = 0.0;
        *v45 = v27 + v24;
        v45[1] = v25 + v27 * v49;
      }
      v21 += 3;
      v19 += 72;
      if (v21 == v15)
        goto LABEL_42;
    }
    v29 = *(v21 - 1);
    v30 = v21[2];
    if (v23 - v30 < 0.0 != v29 - v30 >= 0.0)
    {
      v31 = v21[1];
      v32 = v27 * 0.0 + v30;
      *(double *)(v20 + v19 - 40) = v32;
    }
    else
    {
      v35 = v22 - *(v21 - 2);
      v36 = -v35;
      if (v35 >= 0.0)
        v36 = v22 - *(v21 - 2);
      v37 = (v23 - v29) / v35;
      if (v36 < 0.00000011920929)
        v37 = 0.0;
      v38 = v27 * v37;
      v31 = v21[1];
      v32 = v30 + v38;
    }
    v39 = v27 + v31;
    v40 = (double *)(v20 + v19);
    *v40 = v39;
    v40[1] = v32;
    if ((unint64_t)v21 >= v16)
    {
      v33 = v22 - v39;
      v34 = v23 - v32;
      goto LABEL_31;
    }
LABEL_29:
    v33 = v21[7] - v21[1];
    v34 = v21[8] - v21[2];
    goto LABEL_31;
  }
LABEL_42:
  *(_OWORD *)(*((_QWORD *)v4 + 11) - 16) = *(_OWORD *)(v13 - 16);
  v13 = *((_QWORD *)v4 + 2);
  v50 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (uint64_t)v18) >> 3) < 3 || v18 == v15;
  if (!v50)
  {
    v51 = 0;
    v52 = (double *)(*v17 + 64);
    do
    {
      v53 = v18[v51 + 5];
      v54 = v18[v51 + 2];
      v55 = v18[v51 + 4] - v18[v51 + 1];
      v56 = -v55;
      if (v55 >= 0.0)
        v56 = v18[v51 + 4] - v18[v51 + 1];
      v57 = v53 - v54;
      v58 = -(v53 - v54);
      if (v57 >= 0.0)
        v58 = v57;
      v59 = 1.0;
      if (v58 > 0.00000011920929)
      {
        v59 = 0.0;
        if (v56 > 0.00000011920929)
        {
          v60 = v58 / v56 * -3.0 + 1.0;
          if (v60 >= 0.0)
          {
            v59 = 1.0;
            if (v60 <= 1.0)
              v59 = v60;
          }
        }
      }
      v61 = v59 * *(v52 - 6);
      v62 = 1.0 - v59;
      *(v52 - 3) = v61 + (1.0 - v59) * *(v52 - 3);
      v63 = v59 * v52[3];
      *v52 = v63 + v62 * *v52;
      if (&v18[v51] != (double *)v16)
        v52[6] = v63 + v62 * v52[6];
      if (v51 * 8)
        *(v52 - 9) = v61 + v62 * *(v52 - 9);
      v51 += 3;
      v52 += 9;
    }
    while (&v18[v51] != v15);
  }
LABEL_61:
  for (i = *v6; i != v13; i += 24)
    *(double *)(i + 16) = *(double *)(i + 16) - *(double *)(i + 8);
  return 1;
}

- (PAEOffsetColorCurveChannelData)initWithCoder:(id)a3
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
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  double *v47;
  unint64_t v48;
  _QWORD *v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
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
  double *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  BOOL v82;
  uint64_t v83;
  double *v84;
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
  PAEOffsetColorCurveChannelData *v97;
  _QWORD *v98;
  id obj;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  objc_super v104;
  _QWORD v105[5];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v104.receiver = self;
  v104.super_class = (Class)PAEOffsetColorCurveChannelData;
  v97 = -[PAEOffsetColorCurveChannelData init](&v104, sel_init);
  if (v97)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("defaultRed"));
    v5 = v4;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("defaultGreen"));
    v7 = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("defaultBlue"));
    v9 = v8;
    v10 = (_QWORD *)operator new();
    v97->_curve_private = v10;
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
    v98 = v10 + 1;
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
        v82 = v18 == v15;
        v18 = v19;
      }
      while (!v82);
    }
    v10[2] = v15;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("offset"));
    v10[8] = v21;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v101 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v100 + 1) + 8 * i), "CGPointValue");
          v27 = v25;
          v28 = v26;
          v30 = (_QWORD *)v10[2];
          v29 = v10[3];
          if ((unint64_t)v30 >= v29)
          {
            v32 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v30 - *v98) >> 3);
            v33 = v32 + 1;
            if (v32 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v29 - *v98) >> 3);
            if (2 * v34 > v33)
              v33 = 2 * v34;
            if (v34 >= 0x555555555555555)
              v35 = 0xAAAAAAAAAAAAAAALL;
            else
              v35 = v33;
            v105[4] = v10 + 3;
            v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)(v10 + 3), v35);
            v38 = &v36[24 * v32];
            *(_QWORD *)v38 = &unk_1E64DA950;
            *((_QWORD *)v38 + 1) = v27;
            *((_QWORD *)v38 + 2) = v28;
            v40 = v10[1];
            v39 = v10[2];
            if (v39 == v40)
            {
              v42 = &v36[24 * v32];
            }
            else
            {
              v41 = v10[2];
              v42 = &v36[24 * v32];
              do
              {
                *((_QWORD *)v42 - 3) = &unk_1E64DA950;
                v42 -= 24;
                *(_OWORD *)(v42 + 8) = *(_OWORD *)(v41 - 16);
                v41 -= 24;
              }
              while (v41 != v40);
            }
            v31 = v38 + 24;
            v10[1] = v42;
            v10[2] = v38 + 24;
            v43 = v10[3];
            v10[3] = &v36[24 * v37];
            v105[2] = v39;
            v105[3] = v43;
            v105[0] = v40;
            v105[1] = v40;
            std::__split_buffer<cc::point_t<double,false,false>>::~__split_buffer((uint64_t)v105);
          }
          else
          {
            *v30 = &unk_1E64DA950;
            v31 = v30 + 3;
            v30[1] = v25;
            v30[2] = v26;
          }
          v10[2] = v31;
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v106, 16);
      }
      while (v22);
    }
    v44 = v10[1];
    v45 = v10[2];
    v46 = 0xAAAAAAAAAAAAAAABLL * ((v45 - v44) >> 3);
    if (v46 <= 1)
    {
      std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v10 + 10), 4uLL);
      return v97;
    }
    if (v46 > 0x5555555555555554)
      return v97;
    v47 = (double *)(v45 - 24);
    if (v45 - 24 == v44)
      v48 = v45 - 24;
    else
      v48 = v45 - 48;
    v49 = v10 + 10;
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)(v10 + 10), ((v45 - v44) >> 3) - 2);
    v50 = (double *)v10[1];
    if (v50 != v47)
    {
      v51 = 0;
      v52 = *v49 + 32;
      v53 = (double *)v10[1];
      while (1)
      {
        v54 = v53[4];
        v55 = v53[5];
        v56 = v53[1];
        v57 = v53[2];
        v58 = v54 - v56;
        if (v54 - v56 < 0.0)
          v58 = -(v54 - v56);
        if (v58 < 0.0)
          v58 = -v58;
        v59 = v58 * 0.3334;
        v60 = v52 + v51;
        *(double *)(v60 - 24) = v56;
        *(double *)(v60 - 16) = v57;
        if (v51)
          break;
        if ((unint64_t)v53 < v48)
          goto LABEL_50;
        v65 = v54 - v53[1];
        v66 = v55 - v53[2];
LABEL_52:
        v73 = -v65;
        if (v65 >= 0.0)
          v73 = v65;
        v74 = v66 / v65;
        if (v73 < 0.00000011920929)
          v74 = 0.0;
        v75 = v54 - v59;
        v76 = v55 - v59 * v74;
        v77 = (double *)(v52 + v51);
        v77[3] = v75;
        v77[4] = v76;
        if (!v51)
        {
          v78 = v75 - v53[1];
          v79 = v76 - v53[2];
          v80 = -v78;
          if (v78 >= 0.0)
            v80 = v78;
          v81 = v79 / v78;
          if (v80 < 0.00000011920929)
            v81 = 0.0;
          *v77 = v59 + v56;
          v77[1] = v57 + v59 * v81;
        }
        v53 += 3;
        v51 += 72;
        if (v53 == v47)
          goto LABEL_63;
      }
      v61 = *(v53 - 1);
      v62 = v53[2];
      if (v55 - v62 < 0.0 != v61 - v62 >= 0.0)
      {
        v63 = v53[1];
        v64 = v59 * 0.0 + v62;
        *(double *)(v52 + v51 - 40) = v64;
      }
      else
      {
        v67 = v54 - *(v53 - 2);
        v68 = -v67;
        if (v67 >= 0.0)
          v68 = v54 - *(v53 - 2);
        v69 = (v55 - v61) / v67;
        if (v68 < 0.00000011920929)
          v69 = 0.0;
        v70 = v59 * v69;
        v63 = v53[1];
        v64 = v62 + v70;
      }
      v71 = v59 + v63;
      v72 = (double *)(v52 + v51);
      *v72 = v71;
      v72[1] = v64;
      if ((unint64_t)v53 >= v48)
      {
        v65 = v54 - v71;
        v66 = v55 - v64;
        goto LABEL_52;
      }
LABEL_50:
      v65 = v53[7] - v53[1];
      v66 = v53[8] - v53[2];
      goto LABEL_52;
    }
LABEL_63:
    *(_OWORD *)(v10[11] - 16) = *(_OWORD *)(v45 - 16);
    v82 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10[2] - (_QWORD)v50) >> 3) < 3 || v50 == v47;
    if (!v82)
    {
      v83 = 0;
      v84 = (double *)(*v49 + 64);
      do
      {
        v85 = v50[v83 + 5];
        v86 = v50[v83 + 2];
        v87 = v50[v83 + 4] - v50[v83 + 1];
        v88 = -v87;
        if (v87 >= 0.0)
          v88 = v50[v83 + 4] - v50[v83 + 1];
        v89 = v85 - v86;
        v90 = -(v85 - v86);
        if (v89 >= 0.0)
          v90 = v89;
        v91 = 1.0;
        if (v90 > 0.00000011920929)
        {
          v91 = 0.0;
          if (v88 > 0.00000011920929)
          {
            v92 = v90 / v88 * -3.0 + 1.0;
            if (v92 >= 0.0)
            {
              v91 = 1.0;
              if (v92 <= 1.0)
                v91 = v92;
            }
          }
        }
        v93 = v91 * *(v84 - 6);
        v94 = 1.0 - v91;
        *(v84 - 3) = v93 + (1.0 - v91) * *(v84 - 3);
        v95 = v91 * v84[3];
        *v84 = v95 + v94 * *v84;
        if (&v50[v83] != (double *)v48)
          v84[6] = v95 + v94 * v84[6];
        if (v83 * 8)
          *(v84 - 9) = v93 + v94 * *(v84 - 9);
        v83 += 3;
        v84 += 9;
      }
      while (&v50[v83] != v47);
    }
  }
  return v97;
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
  if (curve_private[21] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("defaultRed"));
  if (curve_private[22] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("defaultGreen"));
  if (curve_private[23] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("defaultBlue"));
  if (curve_private[8] != 0.0)
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("offset"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)curve_private + 2) - *((_QWORD *)curve_private + 1)) >> 3));
  for (i = *((_QWORD *)curve_private + 1); i != *((_QWORD *)curve_private + 2); i += 24)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(i + 8), *(double *)(i + 16)));
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("points"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRed:green:blue:curve:", self->_curve_private, *((double *)self->_curve_private + 21), *((double *)self->_curve_private + 22), *((double *)self->_curve_private + 23));
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
  v6 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p>  red=%.3f, green=%.3f, blue=%.3f, offset=%.3f, pts={\n"), NSStringFromClass(v5), self, curve_private[5], curve_private[6], curve_private[7], curve_private[8]);
  for (i = curve_private[1]; i != curve_private[2]; i += 24)
    v6 = (void *)objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("  %.3f, %.3f\n"), *(_QWORD *)(i + 8), *(_QWORD *)(i + 16));
  return (id)objc_msgSend(v6, "stringByAppendingString:", CFSTR("}"));
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  double *curve_private;
  char *v7;
  double v8;
  uint64_t v9;
  void **v10;
  double v11;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  double v22;
  double v23;
  float64x2_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  void **v31;
  void **v32;
  void **v33;
  char *v34;
  void **v35;
  double v36;
  unint64_t v37;
  double *v38;
  unint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v73;
  double *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  PAEOffsetColorCurveChannelData *v86;
  float64x2_t v88;
  float64x2_t v89;
  float64x2_t v90;
  void *v91;
  void **v92;
  void **v93;
  void **v94;
  void *v95;
  float64x2_t v96;
  __int128 v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  double (*v103)(uint64_t, uint64_t);
  uint64_t v104;
  void **v105[7];

  curve_private = (double *)self->_curve_private;
  v7 = -[PAEOffsetColorCurveChannelData curveRef](self, "curveRef");
  v8 = *((double *)v7 + 8);
  v9 = objc_msgSend(a3, "curveRef");
  v10 = 0;
  v11 = *(double *)(v9 + 64);
  v93 = 0;
  v94 = 0;
  v91 = &unk_1E64E3AC8;
  v92 = 0;
  v95 = &unk_1E64E3B08;
  __asm { FMOV            V1.2D, #0.5 }
  v96 = _Q1;
  v97 = xmmword_1B304F7A0;
  v100 = 0;
  v101 = 0;
  v98 = &unk_1E64E2650;
  v99 = 0;
  v102 = &unk_1E64E2678;
  v103 = cc::curve::aspline::bezier_t<double,false>::evalNonPeriodic;
  v104 = 0;
  v16 = *((double *)v7 + 7);
  v88 = *(float64x2_t *)(v9 + 40);
  v89 = *(float64x2_t *)(v7 + 40);
  v17 = *(double *)(v9 + 56);
  v19 = *((_QWORD *)v7 + 1);
  v18 = *((_QWORD *)v7 + 2);
  v20 = *(_QWORD *)(v9 + 8);
  v21 = 0;
  if (v18 - v19 == *(_QWORD *)(v9 + 16) - v20 && v19 != v18)
  {
    v21 = 0;
    v22 = a4;
    v23 = (float)(1.0 - a4);
    do
    {
      v24 = vaddq_f64(vmulq_n_f64(*(float64x2_t *)(v20 + 8), v22), vmulq_n_f64(*(float64x2_t *)(v19 + 8), v23));
      if (v21 >= (char *)v94)
      {
        v90 = v24;
        v25 = 0xAAAAAAAAAAAAAAABLL * ((v21 - (char *)v92) >> 3);
        v26 = v25 + 1;
        if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (v94 - v92) > v26)
          v26 = 0x5555555555555556 * (v94 - v92);
        if (0xAAAAAAAAAAAAAAABLL * (v94 - v92) >= 0x555555555555555)
          v27 = 0xAAAAAAAAAAAAAAALL;
        else
          v27 = v26;
        v105[4] = (void **)&v94;
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cc::point_t<double,false,false>>>((uint64_t)&v94, v27);
        v30 = &v28[24 * v25];
        *(_QWORD *)v30 = &unk_1E64DA950;
        *(float64x2_t *)(v30 + 8) = v90;
        v32 = v92;
        v31 = v93;
        if (v93 == v92)
        {
          v34 = &v28[24 * v25];
        }
        else
        {
          v33 = v93;
          v34 = &v28[24 * v25];
          do
          {
            *((_QWORD *)v34 - 3) = &unk_1E64DA950;
            v34 -= 24;
            *(_OWORD *)(v34 + 8) = *((_OWORD *)v33 - 1);
            v33 -= 3;
          }
          while (v33 != v32);
        }
        v21 = v30 + 24;
        v92 = (void **)v34;
        v93 = (void **)(v30 + 24);
        v35 = v94;
        v94 = (void **)&v28[24 * v29];
        v105[2] = v31;
        v105[3] = v35;
        v105[0] = v32;
        v105[1] = v32;
        std::__split_buffer<cc::point_t<double,false,false>>::~__split_buffer((uint64_t)v105);
        v18 = *((_QWORD *)v7 + 2);
        v23 = (float)(1.0 - a4);
        v22 = a4;
      }
      else
      {
        *(_QWORD *)v21 = &unk_1E64DA950;
        *(float64x2_t *)(v21 + 8) = v24;
        v21 += 24;
      }
      v93 = (void **)v21;
      v19 += 24;
      v20 += 24;
    }
    while (v19 != v18);
    v10 = v92;
  }
  v36 = (float)(1.0 - a4);
  v96 = vaddq_f64(vmulq_n_f64(v89, v36), vmulq_n_f64(v88, a4));
  *(double *)&v97 = v16 * v36 + v17 * a4;
  *((double *)&v97 + 1) = v8 * v36 + v11 * a4;
  v37 = 0xAAAAAAAAAAAAAAABLL * ((v21 - (char *)v10) >> 3);
  if (v37 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t)&v99, 4uLL);
    goto LABEL_75;
  }
  if (v37 > 0x5555555555555554)
    goto LABEL_75;
  v38 = (double *)(v21 - 24);
  if (v21 - 24 == (char *)v10)
    v39 = (unint64_t)(v21 - 24);
  else
    v39 = (unint64_t)(v21 - 48);
  std::vector<cc::point_t<double,false,false>>::resize((uint64_t)&v99, ((v21 - (char *)v10) >> 3) - 2);
  v40 = (double *)v92;
  if (v92 != (void **)v38)
  {
    v41 = 0;
    v42 = v99 + 32;
    v43 = (double *)v92;
    while (1)
    {
      v44 = v43[4];
      v45 = v43[5];
      v46 = v43[1];
      v47 = v43[2];
      v48 = v44 - v46;
      if (v44 - v46 < 0.0)
        v48 = -(v44 - v46);
      if (v48 < 0.0)
        v48 = -v48;
      v49 = v48 * 0.3334;
      v50 = v42 + v41;
      *(double *)(v50 - 24) = v46;
      *(double *)(v50 - 16) = v47;
      if (v41)
        break;
      if ((unint64_t)v43 < v39)
        goto LABEL_43;
      v55 = v44 - v43[1];
      v56 = v45 - v43[2];
LABEL_45:
      v63 = -v55;
      if (v55 >= 0.0)
        v63 = v55;
      v64 = v56 / v55;
      if (v63 < 0.00000011920929)
        v64 = 0.0;
      v65 = v44 - v49;
      v66 = v45 - v49 * v64;
      v67 = (double *)(v42 + v41);
      v67[3] = v65;
      v67[4] = v66;
      if (!v41)
      {
        v68 = v65 - v43[1];
        v69 = v66 - v43[2];
        v70 = -v68;
        if (v68 >= 0.0)
          v70 = v68;
        v71 = v69 / v68;
        if (v70 < 0.00000011920929)
          v71 = 0.0;
        *v67 = v49 + v46;
        v67[1] = v47 + v49 * v71;
      }
      v43 += 3;
      v41 += 72;
      if (v43 == v38)
        goto LABEL_56;
    }
    v51 = *(v43 - 1);
    v52 = v43[2];
    if (v45 - v52 < 0.0 != v51 - v52 >= 0.0)
    {
      v53 = v43[1];
      v54 = v49 * 0.0 + v52;
      *(double *)(v42 + v41 - 40) = v54;
    }
    else
    {
      v57 = v44 - *(v43 - 2);
      v58 = -v57;
      if (v57 >= 0.0)
        v58 = v44 - *(v43 - 2);
      v59 = (v45 - v51) / v57;
      if (v58 < 0.00000011920929)
        v59 = 0.0;
      v60 = v49 * v59;
      v53 = v43[1];
      v54 = v52 + v60;
    }
    v61 = v49 + v53;
    v62 = (double *)(v42 + v41);
    *v62 = v61;
    v62[1] = v54;
    if ((unint64_t)v43 >= v39)
    {
      v55 = v44 - v61;
      v56 = v45 - v54;
      goto LABEL_45;
    }
LABEL_43:
    v55 = v43[7] - v43[1];
    v56 = v43[8] - v43[2];
    goto LABEL_45;
  }
LABEL_56:
  *(_OWORD *)(v100 - 16) = *((_OWORD *)v21 - 1);
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v93 - (char *)v40) >> 3) >= 3 && v40 != v38)
  {
    v73 = 0;
    v74 = (double *)(v99 + 64);
    do
    {
      v75 = v40[v73 + 5];
      v76 = v40[v73 + 2];
      v77 = v40[v73 + 4] - v40[v73 + 1];
      v78 = -v77;
      if (v77 >= 0.0)
        v78 = v40[v73 + 4] - v40[v73 + 1];
      v79 = v75 - v76;
      v80 = -(v75 - v76);
      if (v79 >= 0.0)
        v80 = v79;
      v81 = 1.0;
      if (v80 > 0.00000011920929)
      {
        v81 = 0.0;
        if (v78 > 0.00000011920929)
        {
          v82 = v80 / v78 * -3.0 + 1.0;
          if (v82 >= 0.0)
          {
            v81 = 1.0;
            if (v82 <= 1.0)
              v81 = v82;
          }
        }
      }
      v83 = v81 * *(v74 - 6);
      v84 = 1.0 - v81;
      *(v74 - 3) = v83 + (1.0 - v81) * *(v74 - 3);
      v85 = v81 * v74[3];
      *v74 = v85 + v84 * *v74;
      if (&v40[v73] != (double *)v39)
        v74[6] = v85 + v84 * v74[6];
      if (v73 * 8)
        *(v74 - 9) = v83 + v84 * *(v74 - 9);
      v73 += 3;
      v74 += 9;
    }
    while (&v40[v73] != v38);
  }
LABEL_75:
  v86 = +[PAEOffsetColorCurveChannelData channelDataWithRed:green:blue:curve:](PAEOffsetColorCurveChannelData, "channelDataWithRed:green:blue:curve:", &v91, curve_private[21], curve_private[22], curve_private[23]);
  v91 = &unk_1E64E3AC8;
  v95 = &unk_1E64E3B08;
  v105[0] = (void **)&v99;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](v105);
  v105[0] = (void **)&v92;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](v105);
  return v86;
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

  v4 = -[PAEOffsetColorCurveChannelData curveRef](self, "curveRef");
  v5 = v4[8];
  v6 = objc_msgSend(a3, "curveRef");
  if (v5 == *(double *)(v6 + 64)
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
