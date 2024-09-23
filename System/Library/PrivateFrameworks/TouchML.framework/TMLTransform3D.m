@implementation TMLTransform3D

- (TMLTransform3D)initWithTransform3D:(CATransform3D *)a3
{
  TMLTransform3D *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TMLTransform3D;
  result = -[TMLTransform3D init](&v11, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->m11;
    v6 = *(_OWORD *)&a3->m13;
    v7 = *(_OWORD *)&a3->m21;
    *(_OWORD *)&result->_transform.m23 = *(_OWORD *)&a3->m23;
    *(_OWORD *)&result->_transform.m21 = v7;
    *(_OWORD *)&result->_transform.m13 = v6;
    *(_OWORD *)&result->_transform.m11 = v5;
    v8 = *(_OWORD *)&a3->m31;
    v9 = *(_OWORD *)&a3->m33;
    v10 = *(_OWORD *)&a3->m41;
    *(_OWORD *)&result->_transform.m43 = *(_OWORD *)&a3->m43;
    *(_OWORD *)&result->_transform.m41 = v10;
    *(_OWORD *)&result->_transform.m33 = v9;
    *(_OWORD *)&result->_transform.m31 = v8;
  }
  return result;
}

- (id)CATransform3DValue
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v2 = *(_OWORD *)&self->_transform.m33;
  v10 = *(_OWORD *)&self->_transform.m31;
  v11 = v2;
  v3 = *(_OWORD *)&self->_transform.m43;
  v12 = *(_OWORD *)&self->_transform.m41;
  v13 = v3;
  v4 = *(_OWORD *)&self->_transform.m13;
  v7[0] = *(_OWORD *)&self->_transform.m11;
  v7[1] = v4;
  v5 = *(_OWORD *)&self->_transform.m23;
  v8 = *(_OWORD *)&self->_transform.m21;
  v9 = v5;
  objc_msgSend_valueWithCATransform3D_(MEMORY[0x24BDD1968], a2, *(double *)&v8, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)initializeJSContext:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  const char *v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _OWORD v51[2];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v54 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v55 = v6;
  v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v56 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v57 = v7;
  v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v51[0] = *MEMORY[0x24BDE5598];
  v51[1] = v8;
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v52 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v53 = v9;
  v11 = (void *)objc_msgSend_initWithTransform3D_(v5, v10, *(double *)&v52, v51);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, v13, v11, CFSTR("CATransform3DIdentity"));

  v14 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = sub_22AD3B254;
  v50[3] = &unk_24F4FE638;
  v50[4] = a1;
  v15 = (void *)MEMORY[0x22E2E7E44](v50);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, v17, v15, CFSTR("CATransform3DMakeTranslation"));

  v49[0] = v14;
  v49[1] = 3221225472;
  v49[2] = sub_22AD3B2BC;
  v49[3] = &unk_24F4FE638;
  v49[4] = a1;
  v18 = (void *)MEMORY[0x22E2E7E44](v49);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v19, v20, v18, CFSTR("CATransform3DMakeScale"));

  v48[0] = v14;
  v48[1] = 3221225472;
  v48[2] = sub_22AD3B324;
  v48[3] = &unk_24F4FE658;
  v48[4] = a1;
  v21 = (void *)MEMORY[0x22E2E7E44](v48);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v22, v23, v21, CFSTR("CATransform3DMakeRotation"));

  v47[0] = v14;
  v47[1] = 3221225472;
  v47[2] = sub_22AD3B394;
  v47[3] = &unk_24F4FE678;
  v47[4] = a1;
  v24 = (void *)MEMORY[0x22E2E7E44](v47);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v25, v26, v24, CFSTR("CATransform3DConcat"));

  v46[0] = v14;
  v46[1] = 3221225472;
  v46[2] = sub_22AD3B45C;
  v46[3] = &unk_24F4FE698;
  v46[4] = a1;
  v27 = (void *)MEMORY[0x22E2E7E44](v46);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v28, v29, v27, CFSTR("CATransform3DTranslate"));

  v45[0] = v14;
  v45[1] = 3221225472;
  v45[2] = sub_22AD3B510;
  v45[3] = &unk_24F4FE698;
  v45[4] = a1;
  v30 = (void *)MEMORY[0x22E2E7E44](v45);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v31, v32, v30, CFSTR("CATransform3DScale"));

  v44[0] = v14;
  v44[1] = 3221225472;
  v44[2] = sub_22AD3B5C4;
  v44[3] = &unk_24F4FE6B8;
  v44[4] = a1;
  v33 = (void *)MEMORY[0x22E2E7E44](v44);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v34, v35, v33, CFSTR("CATransform3DRotate"));

  v43[0] = v14;
  v43[1] = 3221225472;
  v43[2] = sub_22AD3B680;
  v43[3] = &unk_24F4FE6D8;
  v43[4] = a1;
  v36 = (void *)MEMORY[0x22E2E7E44](v43);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v37, v38, v36, CFSTR("CATransform3DInvert"));

  v42[0] = v14;
  v42[1] = 3221225472;
  v42[2] = sub_22AD3B70C;
  v42[3] = &unk_24F4FE6F8;
  v42[4] = a1;
  v39 = (void *)MEMORY[0x22E2E7E44](v42);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v40, v41, v39, CFSTR("CATransform3DMakeAffineTransform"));

}

- (TMLAffineTransform)affineTransform
{
  TMLAffineTransform *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  const char *v8;
  double v9;
  CATransform3D v11;
  CGAffineTransform v12;

  v3 = [TMLAffineTransform alloc];
  v4 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&v11.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&v11.m33 = v4;
  v5 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&v11.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&v11.m43 = v5;
  v6 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&v11.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&v11.m13 = v6;
  v7 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&v11.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&v11.m23 = v7;
  CATransform3DGetAffineTransform(&v12, &v11);
  return (TMLAffineTransform *)(id)objc_msgSend_initWithAffineTransform_(v3, v8, v9, &v12);
}

- (void)setM11:(double)a3
{
  self->_transform.m11 = a3;
}

- (double)m11
{
  return self->_transform.m11;
}

- (void)setM12:(double)a3
{
  self->_transform.m12 = a3;
}

- (double)m12
{
  return self->_transform.m12;
}

- (void)setM13:(double)a3
{
  self->_transform.m13 = a3;
}

- (double)m13
{
  return self->_transform.m13;
}

- (void)setM14:(double)a3
{
  self->_transform.m14 = a3;
}

- (double)m14
{
  return self->_transform.m14;
}

- (void)setM21:(double)a3
{
  self->_transform.m21 = a3;
}

- (double)m21
{
  return self->_transform.m21;
}

- (void)setM22:(double)a3
{
  self->_transform.m22 = a3;
}

- (double)m22
{
  return self->_transform.m22;
}

- (void)setM23:(double)a3
{
  self->_transform.m23 = a3;
}

- (double)m23
{
  return self->_transform.m23;
}

- (void)setM24:(double)a3
{
  self->_transform.m24 = a3;
}

- (double)m24
{
  return self->_transform.m24;
}

- (void)setM31:(double)a3
{
  self->_transform.m31 = a3;
}

- (double)m31
{
  return self->_transform.m31;
}

- (void)setM32:(double)a3
{
  self->_transform.m32 = a3;
}

- (double)m32
{
  return self->_transform.m32;
}

- (void)setM33:(double)a3
{
  self->_transform.m33 = a3;
}

- (double)m33
{
  return self->_transform.m33;
}

- (void)setM34:(double)a3
{
  self->_transform.m34 = a3;
}

- (double)m34
{
  return self->_transform.m34;
}

- (void)setM41:(double)a3
{
  self->_transform.m41 = a3;
}

- (double)m41
{
  return self->_transform.m41;
}

- (void)setM42:(double)a3
{
  self->_transform.m42 = a3;
}

- (double)m42
{
  return self->_transform.m42;
}

- (void)setM43:(double)a3
{
  self->_transform.m43 = a3;
}

- (double)m43
{
  return self->_transform.m43;
}

- (void)setM44:(double)a3
{
  self->_transform.m44 = a3;
}

- (double)m44
{
  return self->_transform.m44;
}

- (CATransform3D)transform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

@end
