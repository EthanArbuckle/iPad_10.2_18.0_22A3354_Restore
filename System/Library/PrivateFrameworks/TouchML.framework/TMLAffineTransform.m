@implementation TMLAffineTransform

- (TMLAffineTransform)initWithAffineTransform:(CGAffineTransform *)a3
{
  TMLAffineTransform *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TMLAffineTransform;
  result = -[TMLAffineTransform init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->a;
    v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)&a3->tx;
    *(_OWORD *)&result->_transform.c = v6;
    *(_OWORD *)&result->_transform.a = v5;
  }
  return result;
}

- (id)CGAffineTransformValue
{
  __int128 v2;
  _OWORD v4[2];
  __int128 v5;

  v2 = *(_OWORD *)&self->_transform.c;
  v4[0] = *(_OWORD *)&self->_transform.a;
  v4[1] = v2;
  v5 = *(_OWORD *)&self->_transform.tx;
  objc_msgSend_valueWithCGAffineTransform_(MEMORY[0x24BDD1968], a2, *(double *)&v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)initializeJSContext:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  const char *v7;
  void *v8;
  const char *v9;
  double v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _OWORD v52[2];
  __int128 v53;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v52[0] = *MEMORY[0x24BDBD8B8];
  v52[1] = v6;
  v53 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v8 = (void *)objc_msgSend_initWithAffineTransform_(v5, v7, *(double *)&v53, v52);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, v10, v8, CFSTR("CGAffineTransformIdentity"));

  v11 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = sub_22AD2B914;
  v51[3] = &unk_24F4FDFB0;
  v51[4] = a1;
  v12 = (void *)MEMORY[0x22E2E7E44](v51);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v12, CFSTR("affinetransform"));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, v12, CFSTR("CGAffineTransformMake"));

  v50[0] = v11;
  v50[1] = 3221225472;
  v50[2] = sub_22AD2B978;
  v50[3] = &unk_24F4FDFD0;
  v50[4] = a1;
  v17 = (void *)MEMORY[0x22E2E7E44](v50);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v18, v19, v17, CFSTR("CGAffineTransformMakeTranslation"));

  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = sub_22AD2B9D0;
  v49[3] = &unk_24F4FDFD0;
  v49[4] = a1;
  v20 = (void *)MEMORY[0x22E2E7E44](v49);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, v22, v20, CFSTR("CGAffineTransformMakeScale"));

  v48[0] = v11;
  v48[1] = 3221225472;
  v48[2] = sub_22AD2BA28;
  v48[3] = &unk_24F4FDFF0;
  v48[4] = a1;
  v23 = (void *)MEMORY[0x22E2E7E44](v48);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v24, v25, v23, CFSTR("CGAffineTransformMakeRotation"));

  v47[0] = v11;
  v47[1] = 3221225472;
  v47[2] = sub_22AD2BA78;
  v47[3] = &unk_24F4FE010;
  v47[4] = a1;
  v26 = (void *)MEMORY[0x22E2E7E44](v47);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, v28, v26, CFSTR("CGAffineTransformConcat"));

  v46[0] = v11;
  v46[1] = 3221225472;
  v46[2] = sub_22AD2BB30;
  v46[3] = &unk_24F4FE030;
  v46[4] = a1;
  v29 = (void *)MEMORY[0x22E2E7E44](v46);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v30, v31, v29, CFSTR("CGAffineTransformTranslate"));

  v45[0] = v11;
  v45[1] = 3221225472;
  v45[2] = sub_22AD2BBC4;
  v45[3] = &unk_24F4FE030;
  v45[4] = a1;
  v32 = (void *)MEMORY[0x22E2E7E44](v45);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v33, v34, v32, CFSTR("CGAffineTransformScale"));

  v44[0] = v11;
  v44[1] = 3221225472;
  v44[2] = sub_22AD2BC58;
  v44[3] = &unk_24F4FE050;
  v44[4] = a1;
  v35 = (void *)MEMORY[0x22E2E7E44](v44);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v36, v37, v35, CFSTR("CGAffineTransformRotate"));

  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = sub_22AD2BCE4;
  v43[3] = &unk_24F4FE070;
  v43[4] = a1;
  v38 = (void *)MEMORY[0x22E2E7E44](v43);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v39, v40, v38, CFSTR("CGAffineTransformInvert"));

  objc_msgSend_setObject_forKeyedSubscript_(v4, v41, v42, &unk_24F4FE0B0, CFSTR("CGAffineTransformEqualToTransform"));
}

- (double)a
{
  return self->_transform.a;
}

- (double)b
{
  return self->_transform.b;
}

- (double)c
{
  return self->_transform.c;
}

- (double)d
{
  return self->_transform.d;
}

- (double)tx
{
  return self->_transform.tx;
}

- (double)ty
{
  return self->_transform.ty;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

@end
