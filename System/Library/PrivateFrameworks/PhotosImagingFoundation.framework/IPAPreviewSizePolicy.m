@implementation IPAPreviewSizePolicy

- (IPAPreviewSizePolicy)initWithName:(id)a3 style:(id)a4 sizePolicy:(id)a5 styleNeededThreshold:(id)a6 styleProducedThreshold:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  IPAPreviewSizePolicy *v18;
  IPAPreviewSizePolicy *v19;
  uint64_t v20;
  id styleNeededThreshold;
  uint64_t v22;
  id styleProducedThreshold;
  IPAPreviewSizePolicy *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)IPAPreviewSizePolicy;
  v18 = -[IPAPreviewSizePolicy init](&v33, sel_init);
  if (!v14)
  {
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _PFAssertFailHandler();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    v25 = (IPAPreviewSizePolicy *)_PFAssertFailHandler();
    return -[IPAPreviewSizePolicy initWithName:suffix:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:](v25, v26, v27, v28, v29, v30, v31, v32);
  }
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong(&v19->_style, a4);
    objc_storeStrong((id *)&v19->_sizePolicy, a5);
    v20 = MEMORY[0x1D8266B30](v16);
    styleNeededThreshold = v19->_styleNeededThreshold;
    v19->_styleNeededThreshold = (id)v20;

    v22 = MEMORY[0x1D8266B30](v17);
    styleProducedThreshold = v19->_styleProducedThreshold;
    v19->_styleProducedThreshold = (id)v22;

  }
  return v19;
}

- (IPAPreviewSizePolicy)initWithName:(id)a3 suffix:(id)a4 style:(id)a5 sizePolicy:(id)a6 styleNeededThreshold:(id)a7 styleProducedThreshold:(id)a8
{
  id v15;
  IPAPreviewSizePolicy *v16;
  IPAPreviewSizePolicy *v17;

  v15 = a4;
  v16 = -[IPAPreviewSizePolicy initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:](self, "initWithName:style:sizePolicy:styleNeededThreshold:styleProducedThreshold:", a3, a5, a6, a7, a8);
  v17 = v16;
  if (v16)
    objc_storeStrong((id *)&v16->_suffix, a4);

  return v17;
}

- (id)style
{
  return self->_style;
}

- (CGSize)transformSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[IPAImageSizePolicy transformSize:](self->_sizePolicy, "transformSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PFIntSize_st)integralTransformSize:(CGSize)a3
{
  unint64_t v3;
  unint64_t v4;
  PFIntSize_st result;

  v3 = -[IPAImageSizePolicy integralTransformSize:](self->_sizePolicy, "integralTransformSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)sizeTransformationPolicy
{
  return self->_sizePolicy;
}

- (BOOL)styleIsNeededForFullSize:(CGSize)a3
{
  return (*((uint64_t (**)(__n128, __n128))self->_styleNeededThreshold + 2))((__n128)a3, *(__n128 *)&a3.height);
}

- (BOOL)styleCanBeProducedFromSize:(CGSize)a3
{
  return (*((uint64_t (**)(__n128, __n128))self->_styleProducedThreshold + 2))((__n128)a3, *(__n128 *)&a3.height);
}

- (id)styleShouldBeProducedFrom:(id)a3
{
  void (**v4)(id, _QWORD, double *);
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  double v14;
  double v15;

  v4 = (void (**)(id, _QWORD, double *))a3;
  v14 = 0.0;
  v15 = 0.0;
  v4[2](v4, 0, &v14);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = -1;
    v9 = 1;
    do
    {
      if (-[IPAPreviewSizePolicy styleCanBeProducedFromSize:](self, "styleCanBeProducedFromSize:", v14, v15))
      {
        v10 = (unint64_t)(v14 * v15);
        if (v8 > v10)
        {
          v11 = v6;

          v7 = v11;
          v8 = v10;
        }
      }
      v4[2](v4, v9, &v14);
      v12 = objc_claimAutoreleasedReturnValue();

      ++v9;
      v6 = (void *)v12;
    }
    while (v12);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> %@ (%@) %@"), objc_opt_class(), self, self->_style, self->_name, self->_sizePolicy);
}

- (NSString)suffix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSuffix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong(&self->_styleProducedThreshold, 0);
  objc_storeStrong(&self->_styleNeededThreshold, 0);
  objc_storeStrong((id *)&self->_sizePolicy, 0);
  objc_storeStrong(&self->_style, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
