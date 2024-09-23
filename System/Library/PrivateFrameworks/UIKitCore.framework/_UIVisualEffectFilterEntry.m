@implementation _UIVisualEffectFilterEntry

- (NSString)filterType
{
  return self->_filterType;
}

- (CAFilter)filter
{
  CAFilter *filter;
  CAFilter *v4;
  CAFilter *v5;
  NSDictionary *configurationValues;
  _QWORD v8[5];

  filter = self->_filter;
  if (!filter)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", self->_filterType);
    v4 = (CAFilter *)objc_claimAutoreleasedReturnValue();
    v5 = self->_filter;
    self->_filter = v4;

    -[CAFilter setName:](self->_filter, "setName:", self->_filterName);
    configurationValues = self->_configurationValues;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36___UIVisualEffectFilterEntry_filter__block_invoke;
    v8[3] = &unk_1E16B4FF0;
    v8[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configurationValues, "enumerateKeysAndObjectsUsingBlock:", v8);
    filter = self->_filter;
  }
  return filter;
}

- (double)scaleHintAsRequested:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (a3)
    v3 = 56;
  return *(double *)((char *)&self->super.isa + v3);
}

- (void)forceUniqueName
{
  NSString *v3;
  NSString *filterName;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%p]"), self->_filterType, self);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  filterName = self->_filterName;
  self->_filterName = v3;

}

- (id)valueAsRequested:(BOOL)a3
{
  uint64_t v3;

  v3 = 48;
  if (a3)
    v3 = 40;
  return *(id *)((char *)&self->super.isa + v3);
}

- (NSString)filterName
{
  return self->_filterName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_identityValues, 0);
  objc_storeStrong((id *)&self->_requestedValues, 0);
  objc_storeStrong((id *)&self->_configurationValues, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFilterType:configurationValues:requestedValues:identityValues:", self->_filterType, self->_configurationValues, self->_requestedValues, self->_identityValues);
  objc_msgSend(v4, "setRequestedScaleHint:", self->_requestedScaleHint);
  objc_msgSend(v4, "setIdentityScaleHint:", self->_identityScaleHint);
  return v4;
}

- (_UIVisualEffectFilterEntry)initWithFilterType:(id)a3 configurationValues:(id)a4 requestedValues:(id)a5 identityValues:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _UIVisualEffectFilterEntry *v14;
  uint64_t v15;
  NSString *filterType;
  uint64_t v17;
  NSDictionary *configurationValues;
  uint64_t v19;
  NSDictionary *requestedValues;
  uint64_t v21;
  NSDictionary *identityValues;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UIVisualEffectFilterEntry;
  v14 = -[_UIVisualEffectFilterEntry init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    filterType = v14->_filterType;
    v14->_filterType = (NSString *)v15;

    objc_storeStrong((id *)&v14->_filterName, v14->_filterType);
    v17 = objc_msgSend(v11, "copy");
    configurationValues = v14->_configurationValues;
    v14->_configurationValues = (NSDictionary *)v17;

    v19 = objc_msgSend(v12, "copy");
    requestedValues = v14->_requestedValues;
    v14->_requestedValues = (NSDictionary *)v19;

    v21 = objc_msgSend(v13, "copy");
    identityValues = v14->_identityValues;
    v14->_identityValues = (NSDictionary *)v21;

  }
  return v14;
}

- (void)setRequestedScaleHint:(double)a3
{
  self->_requestedScaleHint = a3;
}

- (void)setIdentityScaleHint:(double)a3
{
  self->_identityScaleHint = a3;
}

- (void)setUseRelaxedDiffingRule:(BOOL)a3
{
  self->_useRelaxedDiffingRule = a3;
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  id *v4;
  NSString *v5;
  NSString *v6;
  NSDictionary *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  char v12;

  v4 = (id *)a3;
  if (v4)
  {
    v5 = self->_filterType;
    v6 = (NSString *)v4[3];
    if (self->_useRelaxedDiffingRule && *((_BYTE *)v4 + 16))
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v7 = self->_configurationValues;
      v8 = v4[4];
    }
    v9 = (NSDictionary *)v8;
    v10 = v9;
    if (v5 == v6 && v7 == v9)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v5 && v6 && v7 && v9)
      {
        if (-[NSString isEqualToString:](v5, "isEqualToString:", v6))
          v12 = -[NSDictionary isEqualToDictionary:](v7, "isEqualToDictionary:", v10);
        else
          v12 = 0;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (id)copyForTransitionToEffect:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFilterType:configurationValues:requestedValues:identityValues:", self->_filterType, self->_configurationValues, v4[5], self->_requestedValues);
  v6 = v4[7];

  *(_QWORD *)(v5 + 56) = v6;
  *(double *)(v5 + 64) = self->_requestedScaleHint;
  return (id)v5;
}

- (id)copyForTransitionOut
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = -[_UIVisualEffectFilterEntry copy](self, "copy");
  v3 = *(id *)(v2 + 40);
  objc_storeStrong((id *)(v2 + 40), *(id *)(v2 + 48));
  v4 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = v3;
  v5 = v3;

  *(int8x16_t *)(v2 + 56) = vextq_s8(*(int8x16_t *)(v2 + 56), *(int8x16_t *)(v2 + 56), 8uLL);
  return (id)v2;
}

- (void)convertToIdentity
{
  objc_storeStrong((id *)&self->_requestedValues, self->_identityValues);
  self->_requestedScaleHint = self->_identityScaleHint;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  NSDictionary *configurationValues;
  id v10;
  NSDictionary *requestedValues;
  id v12;
  double requestedScaleHint;
  _QWORD v15[4];
  id v16;
  _UIVisualEffectFilterEntry *v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p>: filter=%@"), v5, self, self->_filterType);

  v7 = -[NSDictionary count](self->_configurationValues, "count");
  if (v7 + -[NSDictionary count](self->_requestedValues, "count"))
  {
    objc_msgSend(v6, "appendString:", CFSTR(" parameters={("));
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v8 = MEMORY[0x1E0C809B0];
    configurationValues = self->_configurationValues;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41___UIVisualEffectFilterEntry_description__block_invoke;
    v19[3] = &unk_1E16B54D8;
    v21 = v22;
    v10 = v6;
    v20 = v10;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configurationValues, "enumerateKeysAndObjectsUsingBlock:", v19);
    requestedValues = self->_requestedValues;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __41___UIVisualEffectFilterEntry_description__block_invoke_2;
    v15[3] = &unk_1E16B5500;
    v18 = v22;
    v12 = v10;
    v16 = v12;
    v17 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](requestedValues, "enumerateKeysAndObjectsUsingBlock:", v15);
    objc_msgSend(v12, "appendString:", CFSTR(")}"));

    _Block_object_dispose(v22, 8);
  }
  requestedScaleHint = self->_requestedScaleHint;
  if (requestedScaleHint > 0.0)
    objc_msgSend(v6, "appendFormat:", CFSTR(" scale=[%f][%f]"), *(_QWORD *)&self->_identityScaleHint, *(_QWORD *)&requestedScaleHint);
  return (NSString *)v6;
}

- (void)setFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)configurationValues
{
  return self->_configurationValues;
}

- (void)setConfigurationValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)requestedValues
{
  return self->_requestedValues;
}

- (void)setRequestedValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)identityValues
{
  return self->_identityValues;
}

- (void)setIdentityValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)requestedScaleHint
{
  return self->_requestedScaleHint;
}

- (double)identityScaleHint
{
  return self->_identityScaleHint;
}

- (BOOL)useRelaxedDiffingRule
{
  return self->_useRelaxedDiffingRule;
}

@end
