@implementation CALayer

+ (id)springAnimationWithDuration:(double)a3 dampingRatio:(double)a4 velocity:(double)a5
{
  double v6;
  double v7;
  float v8;
  double v9;
  id *v10;
  void ***v11;
  void ***v12;
  void ***v13;
  void ***v14;
  void ***v15;
  double v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void **v25;
  uint64_t v26;
  double (*v27)(uint64_t, double);
  void *v28;
  void ***v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  void **v35;
  uint64_t v36;
  double (*v37)(uint64_t, double);
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  void **v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];

  v6 = fmin(fmax(a4, 0.00000011920929), 1.0);
  v7 = fmin(fmax(a3, 0.01), 10.0);
  if (v6 >= 1.0)
  {
    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_10005FDAC;
    v38 = &unk_10053F170;
    v39 = 0x3FF0000000000000;
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_10005FDB8;
    v28 = &unk_10053F198;
    v10 = (id *)&v29;
    v29 = objc_retainBlock(&v35);
    v30 = 0.00100000005;
    v31 = *(_QWORD *)&v7;
    v11 = v29;
    v13 = objc_retainBlock(&v25);
    v42 = _NSConcreteStackBlock;
    v43 = 3221225472;
    v44 = sub_10005FE24;
    v45 = &unk_10053F1E0;
    v46 = v7 * v7;
    v47 = 0x3FF0000000000000;
    v48 = *(_QWORD *)&v7;
    v15 = objc_retainBlock(&v42);
  }
  else
  {
    v8 = 1.0 - v6 * v6;
    v9 = sqrtf(v8);
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10005FC78;
    v49[3] = &unk_10053F170;
    *(double *)&v49[4] = v9;
    v42 = _NSConcreteStackBlock;
    v43 = 3221225472;
    v44 = sub_10005FC84;
    v45 = &unk_10053F198;
    v47 = *(_QWORD *)&v6;
    v48 = 0x3FF0000000000000;
    v10 = (id *)&v46;
    v46 = COERCE_DOUBLE(objc_retainBlock(v49));
    v11 = (void ***)*(id *)&v46;
    v35 = _NSConcreteStackBlock;
    v36 = 3221225472;
    v37 = sub_10005FCB4;
    v38 = &unk_10053F198;
    v40 = 0x3F50624DE0000000;
    v41 = v7 * v6;
    v12 = objc_retainBlock(&v42);
    v39 = (uint64_t)v12;
    v13 = objc_retainBlock(&v35);
    v25 = _NSConcreteStackBlock;
    v26 = 3221225472;
    v27 = sub_10005FD14;
    v28 = &unk_10053F1C0;
    v30 = v7 * v6;
    v29 = v12;
    v31 = 0x3FF0000000000000;
    v32 = v7 * v6;
    v33 = v7 * (v6 * v6);
    v34 = v9;
    v14 = v12;
    v15 = objc_retainBlock(&v25);

  }
  v16 = 1.0 / v7 * 5.0;
  v17 = 12;
  do
  {
    v18 = ((double (*)(void ***, double))v13[2])(v13, v16);
    v16 = v16 - v18 / ((double (*)(void ***, double))v15[2])(v15, v16);
    --v17;
  }
  while (v17);
  v19 = v16 * v16;
  v20 = sqrt(v19);
  v21 = v6 * (v20 + v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animation](CASpringAnimation, "animation"));
  objc_msgSend(v22, "setMass:", 1.0);
  objc_msgSend(v22, "setVelocity:", 1.0);
  objc_msgSend(v22, "setStiffness:", v19);
  objc_msgSend(v22, "setDamping:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear));
  objc_msgSend(v22, "setTimingFunction:", v23);

  objc_msgSend(v22, "setDuration:", a3);
  return v22;
}

@end
