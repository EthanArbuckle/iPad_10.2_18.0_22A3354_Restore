@implementation VKRouteEtaDescription

- (VKRouteEtaDescription)initWithEtaText:(id)a3 glyphType:(unsigned __int8)a4
{
  int v4;
  id v6;
  VKRouteEtaDescription *v7;
  void *v8;
  VKRouteEtaDescription *v9;

  v4 = a4;
  v6 = a3;
  v7 = -[VKRouteEtaDescription initWithEtaText:](self, "initWithEtaText:", v6);
  v7->_glyphType = v4;
  if (v4 == 1)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 65618, 3, 0);
  else
    v8 = 0;
  v9 = -[VKRouteEtaDescription _initWithEtaText:styleAttributes:routeEtaType:](v7, "_initWithEtaText:styleAttributes:routeEtaType:", v6, v8, 0);

  return v9;
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3
{
  return (VKRouteEtaDescription *)-[VKRouteEtaDescription _initWithEtaText:styleAttributes:routeEtaType:](self, "_initWithEtaText:styleAttributes:routeEtaType:", a3, 0, 0);
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryStyleAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VKRouteEtaDescription *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithGEOStyleAttributes:", v7);
  v9 = -[VKRouteEtaDescription _initWithEtaText:styleAttributes:routeEtaType:](self, "_initWithEtaText:styleAttributes:routeEtaType:", v6, v8, 0);

  return v9;
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryFeatureStyleAttributes:(id)a4
{
  return (VKRouteEtaDescription *)-[VKRouteEtaDescription _initWithEtaText:styleAttributes:routeEtaType:](self, "_initWithEtaText:styleAttributes:routeEtaType:", a3, a4, 0);
}

- (VKRouteEtaDescription)initWithEtaText:(id)a3 etaAdvisoryStyleAttributes:(id)a4 routeEtaType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  VKRouteEtaDescription *v11;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithGEOStyleAttributes:", v9);
  v11 = -[VKRouteEtaDescription _initWithEtaText:styleAttributes:routeEtaType:](self, "_initWithEtaText:styleAttributes:routeEtaType:", v8, v10, a5);

  return v11;
}

- (id)_initWithEtaText:(id)a3 styleAttributes:(id)a4 routeEtaType:(int64_t)a5
{
  id v8;
  id v9;
  VKRouteEtaDescription *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *obj;
  VKRouteEtaDescription *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VKRouteEtaDescription;
  v10 = -[VKRouteEtaDescription init](&v17, sel_init);
  if (v10)
  {
    v11 = (NSString *)v8;
    v12 = v11;
    if (v11)
      v13 = v11;
    obj = v10->_etaText._obj;
    v10->_etaText._obj = v12;

    objc_storeStrong((id *)&v10->_styleAttributes, a4);
    v10->_routeEtaType = a5;
    v15 = v10;
  }

  return v10;
}

- (NSString)etaText
{
  return self->_etaText._obj;
}

- (BOOL)isEqual:(id)a3
{
  VKRouteEtaDescription *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (VKRouteEtaDescription *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && -[VKRouteEtaDescription compare:](self, "compare:", v4) == 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  GEOFeatureStyleAttributes *styleAttributes;

  v3 = -[NSString hash](self->_etaText._obj, "hash");
  v4 = ((v3 << 6) + (v3 >> 2) + self->_glyphType - 0x61C8864680B583EBLL) ^ v3;
  styleAttributes = self->_styleAttributes;
  if (styleAttributes)
  {
    -[GEOFeatureStyleAttributes featureStyleAttributes](styleAttributes, "featureStyleAttributes");
    v4 ^= (v4 << 6) - 0x61C8864680B583EBLL + (v4 >> 2) + featureStyleAttributesHash();
  }
  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  GEOFeatureStyleAttributes *styleAttributes;
  GEOFeatureStyleAttributes *v8;
  void *v9;
  GEOFeatureStyleAttributes *v10;
  __int128 v11;
  void *v12;
  void *v13;
  __int128 v14;
  int v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v4 = a3;
  if (objc_msgSend(v4, "routeEtaType") != self->_routeEtaType)
  {
    if (objc_msgSend(v4, "routeEtaType") < self->_routeEtaType)
      v6 = -1;
    else
      v6 = 1;
    goto LABEL_46;
  }
  if (objc_msgSend(v4, "glyphType") != self->_glyphType)
  {
    if (objc_msgSend(v4, "glyphType") < self->_glyphType)
      v6 = -1;
    else
      v6 = 1;
    goto LABEL_46;
  }
  if (!self->_styleAttributes)
  {
    styleAttributes = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "styleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    styleAttributes = self->_styleAttributes;
LABEL_14:
    objc_msgSend(v4, "styleAttributes");
    v8 = (GEOFeatureStyleAttributes *)objc_claimAutoreleasedReturnValue();

    if (styleAttributes != v8)
    {
      if (self->_styleAttributes)
        v6 = 1;
      else
        v6 = -1;
      goto LABEL_46;
    }
    goto LABEL_18;
  }

LABEL_18:
  if (!self->_styleAttributes)
    goto LABEL_45;
  objc_msgSend(v4, "styleAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_45;
  v10 = self->_styleAttributes;
  if (v10)
  {
    -[GEOFeatureStyleAttributes featureStyleAttributesPtr](v10, "featureStyleAttributesPtr");
    v11 = v29;
  }
  else
  {
    v11 = 0uLL;
  }
  v30 = v11;
  v29 = 0uLL;
  objc_msgSend(v4, "styleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "featureStyleAttributesPtr");
    v14 = v27;
  }
  else
  {
    v14 = 0uLL;
  }
  v28 = v14;
  v15 = geo::codec::featureStyleAttributesCompare((uint64_t *)&v30, (uint64_t *)&v28);
  v16 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
  if (*((_QWORD *)&v28 + 1))
  {
    v17 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  v19 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
  if (*((_QWORD *)&v30 + 1))
  {
    v20 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
  if (*((_QWORD *)&v29 + 1))
  {
    v23 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v6 = v15 > 0 ? -1 : 1;
  if (!v15)
  {
LABEL_45:
    objc_msgSend(v4, "etaText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v25, "compare:", self->_etaText._obj);

  }
LABEL_46:

  return v6;
}

- (unsigned)glyphType
{
  return self->_glyphType;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (int64_t)routeEtaType
{
  return self->_routeEtaType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  self->_etaText._vptr$_retain_ptr = (void **)&off_1E42B5490;

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = &off_1E42B5490;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
